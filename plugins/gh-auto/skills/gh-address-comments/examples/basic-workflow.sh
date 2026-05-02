#!/bin/bash
set -euo pipefail

# Complete workflow for addressing PR comments with resolution tracking
# This example demonstrates the full end-to-end process

SCRIPT_DIR="$HOME/.claude/skills/gh-address-comments/scripts"

echo "=== Addressing PR Comments with Resolution Tracking ==="

# 1. Check authentication
if ! gh auth status &>/dev/null; then
    echo "Not authenticated. Please run: gh auth login --scopes repo,workflow"
    exit 1
fi

# 2. Fetch PR info
echo "Fetching PR information..."
PR_NUM=$(gh pr view --json number --jq '.number')
PR_TITLE=$(gh pr view --json title --jq '.title')
echo "PR #$PR_NUM: $PR_TITLE"

# 3. Fetch and save comments
echo -e "\nFetching comments..."
COMMENTS_FILE="/tmp/pr_${PR_NUM}_comments.json"
python3 "$SCRIPT_DIR/fetch_comments.py" > "$COMMENTS_FILE"

# 4. Display unresolved threads
echo -e "\nUnresolved review threads:"
cat "$COMMENTS_FILE" | jq -r '.review_threads[] | select(.isResolved == false and .isOutdated == false) |
    "\(.id)\t\(.path):\(.line)\t\(.comments.nodes[0].author.login)\t\(.comments.nodes[0].body[:80])"' |
    nl -w2 -s'. ' || echo "No unresolved threads found"

# 5. User selects comments to address
read -p "Which comment numbers to address? (e.g., 1,3,5 or 'all'): " SELECTED

if [ "$SELECTED" = "all" ]; then
    # Get all unresolved thread IDs
    THREAD_IDS=$(cat "$COMMENTS_FILE" | jq -r '.review_threads[] | select(.isResolved == false and .isOutdated == false) | .id')
else
    # Extract thread IDs for selected comments
    THREAD_IDS=()
    for num in ${SELECTED//,/ }; do
        THREAD_ID=$(cat "$COMMENTS_FILE" | jq -r ".review_threads[$((num-1))].id")
        THREAD_IDS+=("$THREAD_ID")
    done
fi

# 6. Apply fixes (manual step - user implements code changes)
echo -e "\nNow apply code changes to address the selected comments."
echo "For each fix:"
echo "  1. Make code changes"
echo "  2. Commit with format: 'fix: address PR comment #N - description'"
echo "  3. Include 'Resolves review thread <THREAD_ID>' in commit body"
echo ""
read -p "Press Enter when all fixes are committed..."

# 7. Mark threads as resolved
echo -e "\nMarking threads as resolved..."
if [ ${#THREAD_IDS[@]} -gt 0 ]; then
    python3 "$SCRIPT_DIR/mark_resolved.py" "${THREAD_IDS[@]}"
else
    echo "No threads to mark as resolved"
fi

# 8. Verify complete resolution (MANDATORY)
echo -e "\nVerifying resolution..."
if python3 "$SCRIPT_DIR/fetch_comments.py" | python3 "$SCRIPT_DIR/verify_resolution.py"; then
    echo -e "\n✓ All threads resolved!"

    # 9. Push changes
    read -p "Push changes to remote? [Y/n] " PUSH_CONFIRM
    if [ "${PUSH_CONFIRM:-Y}" = "Y" ] || [ "${PUSH_CONFIRM:-Y}" = "y" ]; then
        git push
        echo "✅ Comments addressed, verified, and pushed successfully!"
    else
        echo "✅ Comments addressed and verified. Remember to push when ready."
    fi
else
    echo -e "\n✗ Unresolved threads remain - fix before pushing"
    exit 1
fi
