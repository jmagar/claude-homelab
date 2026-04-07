#!/usr/bin/env python3
"""Language-agnostic monolith size checker.

For Rust files, delegates to the global enforcer (~/.claude/hooks/enforce_monoliths.py)
or a repo-local fallback which also checks
function sizes against the project policy.

For all other languages, checks file line counts only (no AST parsing).

Usage:
  python3 skills/monolith-check/check.py [--staged] [--all] [--file PATH]
                                         [--file-max-lines N]
"""

from __future__ import annotations

import argparse
import fnmatch
import importlib.util
import subprocess
import sys
from pathlib import Path


def _find_repo_root() -> Path:
    try:
        root = subprocess.check_output(
            ["git", "rev-parse", "--show-toplevel"],
            cwd=Path.cwd(),
            text=True,
            stderr=subprocess.DEVNULL,
        ).strip()
        return Path(root)
    except (subprocess.CalledProcessError, FileNotFoundError):
        return Path.cwd()


REPO_ROOT = _find_repo_root()
ENFORCER_CANDIDATES = [
    Path.home() / ".claude" / "hooks" / "enforce_monoliths.py",
    REPO_ROOT / "scripts" / "enforce_monoliths.py",
]
ALLOWLIST_FILE = REPO_ROOT / ".monolith-allowlist"

DEFAULT_FILE_MAX_LINES = 500

# Extensions with known function parsers in the monolith enforcer.
RUST_EXTENSIONS = {".rs"}

# Extensions to check for file size (everything reasonable)
CHECKABLE_EXTENSIONS = {
    ".rs", ".py", ".ts", ".tsx", ".js", ".jsx",
    ".go", ".java", ".kt", ".swift", ".cpp", ".c", ".h",
    ".sh", ".bash", ".zsh",
}

EXCLUDED_GLOBS = [
    "config/**", "**/config/**", "**/config.rs",
    "tests/**", "**/tests/**",
    "**/*_test.*", "**/*_tests.*",
    "**/*.test.*", "**/*.spec.*",
    "benches/**",
    "target/**", "node_modules/**", ".venv/**",
    "*.lock", "**/*.lock", "*.toml",
]


def load_allowlist() -> set[str]:
    if not ALLOWLIST_FILE.exists():
        return set()
    allowed: set[str] = set()
    for raw in ALLOWLIST_FILE.read_text(encoding="utf-8").splitlines():
        line = raw.strip()
        if line and not line.startswith("#"):
            allowed.add(line)
    return allowed


def is_excluded(path: str, allowlist: set[str]) -> bool:
    if path in allowlist:
        return True
    return any(fnmatch.fnmatch(path, p) for p in EXCLUDED_GLOBS)


def run_git(args: list[str]) -> str:
    result = subprocess.run(
        ["git", *args], cwd=REPO_ROOT, capture_output=True, text=True, check=False
    )
    if result.returncode != 0:
        raise RuntimeError(result.stderr.strip() or f"git {' '.join(args)} failed")
    return result.stdout


def staged_files() -> list[str]:
    out = run_git(["diff", "--cached", "--name-only"])
    return [
        p.strip() for p in out.splitlines()
        if p.strip() and (REPO_ROOT / p.strip()).is_file()
    ]


def all_tracked_files() -> list[str]:
    out = run_git(["ls-files"])
    return [
        p.strip() for p in out.splitlines()
        if p.strip() and (REPO_ROOT / p.strip()).is_file()
    ]


def count_lines(path: Path) -> int:
    try:
        return len(path.read_text(encoding="utf-8", errors="ignore").splitlines())
    except OSError:
        return 0


def check_non_rust_files(
    files: list[str], allowlist: set[str], file_max: int
) -> tuple[list[str], list[str]]:
    """Check non-Rust files for file-level size violations only."""
    violations: list[str] = []
    skipped: list[str] = []

    for path in files:
        full = REPO_ROOT / path
        if full.suffix not in CHECKABLE_EXTENSIONS:
            continue
        if full.suffix in RUST_EXTENSIONS:
            continue  # Rust handled separately
        if is_excluded(path, allowlist):
            skipped.append(path)
            continue

        n = count_lines(full)
        if n > file_max:
            violations.append(f"FILE {path}: {n} lines (limit {file_max})")

    return violations, skipped


def run_rust_enforcer(mode: str, file_max: int, extra: list[str] | None = None) -> int:
    """Delegate Rust checking to the existing enforcer.

    stdout/stderr are intentionally inherited so users see full details directly.
    """
    enforcer = resolve_enforcer_path()
    if enforcer is None:
        print("[monolith-check] Rust enforcer not found in known locations", file=sys.stderr)
        return 2

    cmd = [
        sys.executable, str(enforcer),
        f"--file-max-lines={file_max}",
    ]
    if mode == "--staged":
        cmd.append("--staged")
    elif mode == "--all":
        # pass HEAD~1..HEAD as a proxy for "everything" — enforcer needs base+head
        cmd += ["--base", "HEAD~1", "--head", "HEAD"]
    if extra:
        cmd.extend(extra)

    result = subprocess.run(cmd, cwd=REPO_ROOT)
    return result.returncode


def load_rust_enforcer_module():
    enforcer = resolve_enforcer_path()
    if enforcer is None:
        raise RuntimeError("failed to locate Rust enforcer module")
    spec = importlib.util.spec_from_file_location("enforce_monoliths", enforcer)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"failed to load Rust enforcer module from {enforcer}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def resolve_enforcer_path() -> Path | None:
    for candidate in ENFORCER_CANDIDATES:
        if candidate.exists():
            return candidate
    return None


def rust_full_scan(files: list[str], file_max: int) -> tuple[list[str], list[str]]:
    """Run full Rust checks (file + function) across explicit files."""
    em = load_rust_enforcer_module()
    allowlist = em.load_allowlist()
    violations: list[str] = []
    warnings: list[str] = []

    for rel in files:
        full = REPO_ROOT / rel
        if full.suffix not in RUST_EXTENSIONS:
            continue
        if is_excluded(rel, allowlist):
            continue

        line_count = em.file_line_count(full)
        if line_count > file_max:
            violations.append(f"FILE {rel}: {line_count} lines (limit {file_max})")

        for fn in em.parse_rust_functions(full):
            if fn.length > em.DEFAULT_FUNCTION_MAX_LINES:
                violations.append(
                    "FUNCTION "
                    f"{rel}:{fn.start} {fn.name}() is {fn.length} lines "
                    f"(limit {em.DEFAULT_FUNCTION_MAX_LINES})"
                )
            elif fn.length > em.DEFAULT_FUNCTION_WARN_LINES:
                warnings.append(
                    "FUNCTION "
                    f"{rel}:{fn.start} {fn.name}() is {fn.length} lines "
                    f"(warning {em.DEFAULT_FUNCTION_WARN_LINES}, limit {em.DEFAULT_FUNCTION_MAX_LINES})"
                )

    return violations, warnings


def normalize_file_arg(file_arg: str) -> str:
    """Normalize --file input to a repo-relative path with clean errors."""
    path = Path(file_arg)
    if path.is_absolute():
        try:
            return str(path.resolve().relative_to(REPO_ROOT))
        except ValueError:
            raise RuntimeError(f"--file path must be inside repo root: {REPO_ROOT}")
    return file_arg


def main() -> int:
    parser = argparse.ArgumentParser(description="Language-agnostic monolith checker")
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--staged", action="store_true", help="Check staged files only")
    mode.add_argument("--all", action="store_true", help="Check all tracked files")
    mode.add_argument("--file", metavar="PATH", help="Check a single file")
    parser.add_argument("--file-max-lines", type=int, default=DEFAULT_FILE_MAX_LINES)
    args = parser.parse_args()

    # Default: staged
    if not args.staged and not args.all and not args.file:
        args.staged = True

    file_max = args.file_max_lines
    allowlist = load_allowlist()
    rust_violations_accum: list[str] = []
    other_violations_accum: list[str] = []
    rust_rc = 0

    if args.file:
        # Single-file mode
        try:
            rel = normalize_file_arg(args.file)
        except RuntimeError as exc:
            print(str(exc), file=sys.stderr)
            return 2
        path = REPO_ROOT / rel
        files = [rel]

        if path.suffix in RUST_EXTENSIONS:
            rust_violations, rust_warnings = rust_full_scan(files, file_max)
            rust_violations_accum.extend(rust_violations)
            for item in rust_warnings:
                print(f"[warn] {item}")
            if not rust_violations and not rust_warnings:
                n = count_lines(path)
                print(f"FILE {rel}: {n} lines (OK)")
        else:
            violations, _ = check_non_rust_files(files, allowlist, file_max)
            other_violations_accum.extend(violations)
            if not violations:
                n = count_lines(REPO_ROOT / rel)
                print(f"FILE {rel}: {n} lines (OK)")

    elif args.staged:
        files = staged_files()
        if not files:
            print("[monolith-check] No staged files.")
            return 0

        rust_files = [f for f in files if Path(f).suffix in RUST_EXTENSIONS]
        other_files = [f for f in files if Path(f).suffix not in RUST_EXTENSIONS]

        if rust_files:
            print(f"[Rust] checking {len(rust_files)} staged .rs file(s)...")
            rust_rc = run_rust_enforcer("--staged", file_max)

        if other_files:
            print(f"[Other] checking {len(other_files)} staged non-Rust file(s)...")
            violations, _ = check_non_rust_files(other_files, allowlist, file_max)
            other_violations_accum.extend(violations)

    else:  # --all
        files = all_tracked_files()
        rust_files = [f for f in files if Path(f).suffix in RUST_EXTENSIONS]
        other_files = [f for f in files if Path(f).suffix not in RUST_EXTENSIONS]

        if rust_files:
            print(f"[Rust] checking {len(rust_files)} tracked .rs file(s)...")
            rust_violations, rust_warnings = rust_full_scan(rust_files, file_max)
            rust_violations_accum.extend(rust_violations)
            for item in rust_warnings:
                print(f"[warn] {item}")
            rust_rc = 0 if not rust_violations else 1

        if other_files:
            print(f"[Other] checking {len(other_files)} tracked non-Rust file(s)...")
            violations, _ = check_non_rust_files(other_files, allowlist, file_max)
            other_violations_accum.extend(violations)

    all_violations = rust_violations_accum + other_violations_accum
    if rust_violations_accum:
        print("\nMonolith policy violations (Rust):")
        for v in rust_violations_accum:
            print(f"  - {v}")
    if other_violations_accum:
        print("\nMonolith policy violations (non-Rust):")
        for v in other_violations_accum:
            print(f"  - {v}")
    if all_violations:
        print("\nAdd exceptions to .monolith-allowlist if necessary.")

    if rust_rc != 0 or all_violations:
        return 1

    if not all_violations and rust_rc == 0:
        print("Monolith policy check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
