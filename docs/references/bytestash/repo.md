This file is a merged representation of the entire codebase, combined into a single document by Repomix.

# File Summary

## Purpose
This file contains a packed representation of the entire repository's contents.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
.github/
  ISSUE_TEMPLATE/
    bug_report.md
    feature_request.md
  workflows/
    pull-request.yml
    release.yml
  FUNDING.yml
client/
  public/
    docker-mark-white.svg
    github-mark-white.svg
    manifest.json
    reddit-mark-white.svg
    robots.txt
  src/
    components/
      admin/
        common/
          AdminTable.tsx
          FilterInput.tsx
          FilterSelect.tsx
          formatters.ts
          index.ts
          Pagination.tsx
          ResultsCount.tsx
          StatusBadge.tsx
        modals/
          SnippetViewModal.tsx
        tabs/
          ApiKeysTab.tsx
          DashboardTab.tsx
          SharesTab.tsx
          SnippetsTab.tsx
          UsersTab.tsx
        AdminPage.tsx
        AdminSelector.tsx
      auth/
        oidc/
          OIDCCallback.tsx
          OIDCLogoutCallback.tsx
        ApiKeysModal.tsx
        ChangePasswordModal.tsx
        LoginPage.tsx
        RegisterPage.tsx
        UserDropdown.tsx
      categories/
        CategoryList.tsx
        CategorySuggestions.tsx
        CategoryTag.tsx
      common/
        buttons/
          CopyButton.tsx
          DownloadArchiveButton.tsx
          DownloadButton.tsx
          FileUploadButton.tsx
          IconButton.tsx
          RawButton.tsx
        dropdowns/
          BaseDropdown.tsx
        layout/
          AppHeader.tsx
          PageContainer.tsx
        markdown/
          MarkdownRenderer.tsx
          MermaidViewer.tsx
        modals/
          ChangelogModal.tsx
          ConfirmationModal.tsx
          Modal.tsx
        switch/
          Switch.tsx
      editor/
        export/
          CarbonExportPreview.tsx
          ExportImageButton.tsx
          ExportImageModal.tsx
        CodeEditor.tsx
        FullCodeBlock.tsx
        PreviewCodeBlock.tsx
      search/
        SearchAndFilter.tsx
        SearchBar.tsx
      settings/
        SettingsModal.tsx
      snippets/
        edit/
          EditSnippetModal.tsx
          FragmentEditor.tsx
        embed/
          EmbedCodeView.tsx
          EmbedCopyButton.tsx
          EmbedModal.tsx
          EmbedView.tsx
        list/
          SnippetCard.tsx
          SnippetCardMenu.tsx
          SnippetList.tsx
          SnippetRecycleCardMenu.tsx
        share/
          SharedSnippetView.tsx
          ShareMenu.tsx
        view/
          common/
            AuthAwareSnippetPage.tsx
            BaseSnippetStorage.tsx
            SnippetContentArea.tsx
            StorageHeader.tsx
            ViewSwitch.tsx
          public/
            PublicSnippetContentArea.tsx
            PublicSnippetStorage.tsx
          recycle/
            RecycleSnippetContentArea.tsx
            RecycleSnippetStorage.tsx
          FullCodeView.tsx
          SnippetModal.tsx
          SnippetPage.tsx
          SnippetStorage.tsx
      utils/
        Admonition.tsx
    constants/
      api.ts
      events.ts
      routes.ts
      settings.ts
    contexts/
      AuthContext.tsx
      ThemeContext.tsx
      ToastContext.tsx
    hooks/
      queryUtils.ts
      useAuth.ts
      useDebounce.ts
      useKeyboardShortcut.ts
      useOidcErrorHandler.ts
      useOutsideClick.ts
      useSettings.ts
      useSnippetFilters.ts
      useSnippetPagination.ts
      useSnippetsQuery.ts
      useToast.ts
    i18n/
      locales/
        en/
          components/
            admin/
              tabs/
                apiKeys.json
                dashboard.json
                shares.json
                snippets.json
                users.json
              common.json
              modals.json
              selector.json
            common/
              buttons.json
              dropdowns.json
              markdown.json
              modals.json
            snippets/
              list/
                snippetCard.json
                snippetCardMenu.json
                snippetList.json
                snippetRecycleCardMenu.json
              view/
                all.json
                common.json
                public.json
                recycle.json
              edit.json
              embed.json
              share.json
            auth.json
            categories.json
            search.json
            settings.json
            utils.json
          translation.json
        es/
          components/
            admin/
              tabs/
                apiKeys.json
                dashboard.json
                shares.json
                snippets.json
                users.json
              common.json
              modals.json
              selector.json
            common/
              buttons.json
              dropdowns.json
              markdown.json
              modals.json
            snippets/
              list/
                snippetCard.json
                snippetCardMenu.json
                snippetList.json
                snippetRecycleCardMenu.json
              view/
                all.json
                common.json
                public.json
                recycle.json
              edit.json
              embed.json
              share.json
            auth.json
            categories.json
            search.json
            settings.json
            utils.json
          files.txt
          translation.json
        it/
          components/
            admin/
              tabs/
                apiKeys.json
                dashboard.json
                shares.json
                snippets.json
                users.json
              common.json
              modals.json
              selector.json
            common/
              buttons.json
              dropdowns.json
              markdown.json
              modals.json
            snippets/
              list/
                snippetCard.json
                snippetCardMenu.json
                snippetList.json
                snippetRecycleCardMenu.json
              view/
                all.json
                common.json
                public.json
                recycle.json
              edit.json
              embed.json
              share.json
            auth.json
            categories.json
            search.json
            settings.json
            utils.json
          translation.json
        ja/
          components/
            admin/
              tabs/
                apiKeys.json
                dashboard.json
                shares.json
                snippets.json
                users.json
              common.json
              modals.json
              selector.json
            common/
              buttons.json
              dropdowns.json
              markdown.json
              modals.json
            snippets/
              list/
                snippetCard.json
                snippetCardMenu.json
                snippetList.json
                snippetRecycleCardMenu.json
              view/
                all.json
                common.json
                public.json
                recycle.json
              edit.json
              embed.json
              share.json
            auth.json
            categories.json
            search.json
            settings.json
            utils.json
          translation.json
        ru/
          components/
            admin/
              tabs/
                apiKeys.json
                dashboard.json
                shares.json
                snippets.json
                users.json
              common.json
              modals.json
              selector.json
            common/
              buttons.json
              dropdowns.json
              markdown.json
              modals.json
            snippets/
              list/
                snippetCard.json
                snippetCardMenu.json
                snippetList.json
                snippetRecycleCardMenu.json
              view/
                all.json
                common.json
                public.json
                recycle.json
              edit.json
              embed.json
              share.json
            auth.json
            categories.json
            search.json
            settings.json
            utils.json
          translation.json
        zh/
          components/
            admin/
              tabs/
                apiKeys.json
                dashboard.json
                shares.json
                snippets.json
                users.json
              common.json
              modals.json
              selector.json
            common/
              buttons.json
              dropdowns.json
              markdown.json
              modals.json
            snippets/
              list/
                snippetCard.json
                snippetCardMenu.json
                snippetList.json
                snippetRecycleCardMenu.json
              view/
                all.json
                common.json
                public.json
                recycle.json
              edit.json
              embed.json
              share.json
            auth.json
            categories.json
            search.json
            settings.json
            utils.json
          translation.json
      resources/
        en.ts
        es.ts
        index.ts
        it.ts
        ja.ts
        ru.ts
        zh.ts
      config.ts
      constants.ts
      types.ts
    service/
      authService.ts
      index.ts
      shareService.ts
      snippetService.ts
    styles/
      markdown.css
    types/
      apiKey.ts
      auth.ts
      common.ts
      global.d.ts
      snippets.ts
      user.ts
    utils/
      api/
        admin.ts
        apiClient.ts
        apiKeys.ts
        auth.ts
        basePath.ts
        share.ts
        snippets.ts
      helpers/
        apiUtils.ts
        changeCaseUtils.ts
        colourUtils.ts
        debounce.ts
        embedUtils.ts
      language/
        languageUtils.tsx
      downloadUtils.ts
      fileUploadUtils.ts
      getCurrentLocale.ts
      markdownUtils.ts
      paths.ts
    App.tsx
    index.css
    index.tsx
  .gitignore
  .prettierignore
  i18next.config.ts
  index.html
  package.json
  postcss.config.js
  tailwind.config.js
  tsconfig.json
  tsconfig.node.json
  vite.config.ts
helm-charts/
  bytestash/
    templates/
      _helpers.tpl
      deployment.yaml
      ingress.yaml
      NOTES.txt
      pvc.yaml
      service.yaml
      serviceaccount.yaml
    .example.yaml
    .helmignore
    Chart.yaml
    README.md
    values.yaml
server/
  docs/
    swagger.yaml
  src/
    config/
      migrations/
        20241111-migration.js
        20241117-migration.js
        20241119-migration.js
        20241120-migration.js
        20241121-migration.js
        20241122-migration.js
        20250601-migration.js
        20250905-migration.js
        20260123-pagination.js
        20260124-admin-fields.js
        20260124-cascade-delete.js
      schema/
        init.sql
      database.js
    middleware/
      adminAuth.js
      apiKeyAuth.js
      auth.js
    oidc/
      oidcConfig.js
    repositories/
      adminRepository.js
      apiKeyRepository.js
      shareRepository.js
      snippetRepository.js
      userRepository.js
    routes/
      adminRoutes.js
      apiKeyRoutes.js
      authRoutes.js
      embedRoutes.js
      oidcRoutes.js
      publicRoutes.js
      shareRoutes.js
      snippetRoutes.js
    services/
      snippetService.js
      userService.js
    utils/
      badWords.js
    app.js
    logger.js
  .gitignore
  package.json
.gitignore
docker-compose.sh
docker-compose.yaml
Dockerfile
LICENSE
package.json
README.md
```

# Files

## File: .github/ISSUE_TEMPLATE/bug_report.md
````markdown
---
name: Bug report
about: Create a report to help us improve
title: "[BUG]"
labels: 'bug'
assignees: ''

---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Platform**
Which platform are you using?

**Additional context**
Add any other context about the problem here.
````

## File: .github/ISSUE_TEMPLATE/feature_request.md
````markdown
---
name: Feature request
about: Suggest an idea for this project
title: "[FEATURE]"
labels: 'enhancement'
assignees: ''

---

**Is your feature request related to a problem? Please describe.**
A clear and concise description of what the problem is. Ex. I'm always frustrated when [...]

**Describe the solution you'd like**
A clear and concise description of what you want to happen.

**Describe alternatives you've considered**
A clear and concise description of any alternative solutions or features you've considered.

**Additional context**
Add any other context or screenshots about the feature request here.
````

## File: .github/workflows/pull-request.yml
````yaml
name: Build and Push Docker Image for Pull Request Testing

on:
  pull_request:

jobs:
  docker:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Login to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Set ghcr repository name
        id: set-ghcr-repository
        run: |
          ghcr_name=$(echo "${{ github.repository }}" | awk '{ print tolower($0) }')
          echo "ghcr-repository=${ghcr_name}" >> $GITHUB_OUTPUT

      - name: Set Docker image metadata
        id: docker-metadata
        uses: docker/metadata-action@v5
        with:
          images: |
            ghcr.io/${{ steps.set-ghcr-repository.outputs.ghcr-repository }}
          tags: |
            type=ref,event=pr

      - name: Set up QEMU for cross-platform builds
        uses: docker/setup-qemu-action@v3

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          install: true

      - name: Build and Push Docker image for Testing
        uses: docker/build-push-action@v5
        with:
          context: .
          push: ${{ github.event.pull_request.head.repo.full_name == github.repository }}
          platforms: linux/amd64
          tags: ${{ steps.docker-metadata.outputs.tags }}
          labels: ${{ steps.docker-metadata.outputs.labels }}
````

## File: .github/workflows/release.yml
````yaml
name: Build and Push Docker Image on Release

on:
  release:
    types: [published]
  workflow_dispatch:

jobs:
  docker:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Login to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Set ghcr repository name
        id: set-ghcr-repository
        run: |
          ghcr_name=$(echo "${{ github.repository }}" | awk '{ print tolower($0) }')
          echo "ghcr-repository=${ghcr_name}" >> $GITHUB_OUTPUT

      - name: Set Docker image metadata
        id: docker-metadata
        uses: docker/metadata-action@v5
        with:
          images: |
            ghcr.io/${{ steps.set-ghcr-repository.outputs.ghcr-repository }}
            name=docker.io/${{ github.repository }},enable=false
          tags: |
            type=semver,pattern={{version}}
            type=semver,pattern={{major}}.{{minor}}

      - name: Set up QEMU for cross-platform builds
        uses: docker/setup-qemu-action@v3

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          install: true

      - name: Build and Push Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          platforms: linux/amd64,linux/arm64,linux/arm/v7
          tags: ${{ steps.docker-metadata.outputs.tags }}
          labels: ${{ steps.docker-metadata.outputs.labels }}
````

## File: .github/FUNDING.yml
````yaml
github: [jordan-dalby]
custom: ["https://ko-fi.com/zalosath"]
````

## File: client/public/docker-mark-white.svg
````xml
<?xml version="1.0" encoding="UTF-8"?>
<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 756.26 596.9">
  <defs>
    <style>
      .cls-1 {
        fill: #fff;
        stroke-width: 0px;
      }
    </style>
  </defs>
  <path class="cls-1" d="M743.96,245.25c-18.54-12.48-67.26-17.81-102.68-8.27-1.91-35.28-20.1-65.01-53.38-90.95l-12.32-8.27-8.21,12.4c-16.14,24.5-22.94,57.14-20.53,86.81,1.9,18.28,8.26,38.83,20.53,53.74-46.1,26.74-88.59,20.67-276.77,20.67H.06c-.85,42.49,5.98,124.23,57.96,190.77,5.74,7.35,12.04,14.46,18.87,21.31,42.26,42.32,106.11,73.35,201.59,73.44,145.66.13,270.46-78.6,346.37-268.97,24.98.41,90.92,4.48,123.19-57.88.79-1.05,8.21-16.54,8.21-16.54l-12.3-8.27ZM189.67,206.39h-81.7v81.7h81.7v-81.7ZM295.22,206.39h-81.7v81.7h81.7v-81.7ZM400.77,206.39h-81.7v81.7h81.7v-81.7ZM506.32,206.39h-81.7v81.7h81.7v-81.7ZM84.12,206.39H2.42v81.7h81.7v-81.7ZM189.67,103.2h-81.7v81.7h81.7v-81.7ZM295.22,103.2h-81.7v81.7h81.7v-81.7ZM400.77,103.2h-81.7v81.7h81.7v-81.7ZM400.77,0h-81.7v81.7h81.7V0Z"/>
</svg>
````

## File: client/public/github-mark-white.svg
````xml
<svg width="98" height="96" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M48.854 0C21.839 0 0 22 0 49.217c0 21.756 13.993 40.172 33.405 46.69 2.427.49 3.316-1.059 3.316-2.362 0-1.141-.08-5.052-.08-9.127-13.59 2.934-16.42-5.867-16.42-5.867-2.184-5.704-5.42-7.17-5.42-7.17-4.448-3.015.324-3.015.324-3.015 4.934.326 7.523 5.052 7.523 5.052 4.367 7.496 11.404 5.378 14.235 4.074.404-3.178 1.699-5.378 3.074-6.6-10.839-1.141-22.243-5.378-22.243-24.283 0-5.378 1.94-9.778 5.014-13.2-.485-1.222-2.184-6.275.486-13.038 0 0 4.125-1.304 13.426 5.052a46.97 46.97 0 0 1 12.214-1.63c4.125 0 8.33.571 12.213 1.63 9.302-6.356 13.427-5.052 13.427-5.052 2.67 6.763.97 11.816.485 13.038 3.155 3.422 5.015 7.822 5.015 13.2 0 18.905-11.404 23.06-22.324 24.283 1.78 1.548 3.316 4.481 3.316 9.126 0 6.6-.08 11.897-.08 13.526 0 1.304.89 2.853 3.316 2.364 19.412-6.52 33.405-24.935 33.405-46.691C97.707 22 75.788 0 48.854 0z" fill="#fff"/></svg>
````

## File: client/public/manifest.json
````json
{
  "short_name": "ByteStash",
  "name": "ByteStash is a code snippet storage solution",
  "icons": [
    {
      "src": "favicon.ico",
      "sizes": "64x64 32x32 24x24 16x16",
      "type": "image/x-icon"
    },
    {
      "src": "logo192.png",
      "type": "image/png",
      "sizes": "192x192"
    },
    {
      "src": "logo512.png",
      "type": "image/png",
      "sizes": "512x512"
    }
  ],
  "start_url": ".",
  "display": "standalone",
  "theme_color": "#000000",
  "background_color": "#ffffff"
}
````

## File: client/public/reddit-mark-white.svg
````xml
<svg version="1.2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" width="256" height="256">
	<title>Reddit_Icon_2Color-svg</title>
	<defs>
		<image  width="256" height="256" id="img1" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAMAAABrrFhUAAAAAXNSR0IB2cksfwAAAsdQTFRF////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sG+onwAAAO10Uk5TABc1TGB0h5uvwMvV3+jy/96uczQWCDBZf5+92/favJ59Vy4VjbbdtIpTEiFfnNaYWhgJSpTXQwUebvVmGnLI/b9pFHHFYxADT7L7+KYBJInnG0u7/Kw62MpYBA6C7+YG7eFd4NBHRdQsJreZgXjpNsIl/n4KqXwr3GX2PwuoD070LY8RIr4MN+75dYRA+pZRnV6jopNQVSdC5dMNw6S5anZwLzkTdzGXTZrw44Cz6q2QuJWgOJJEq7AZez7rIKcj0eLNAinsB+TEsYuFzMGlupEdx0gzbPHGqlRtSclkKmhh2WfPzvM9a29i0jI7VnwnXwAAEMJJREFUeJzlnXl8FEUWx6tA5TaIG3X97HohyG50CYfAQoIcJuCRsAaQU6PiAYKyKKJGDItE4iqnYogGuUNEQS4VdSHougGvICqHZ2D3H04vRFQUZjPTc/T0dFW9qn7VPR1+f8DMdNV79b7ps/pVFSVui8aLBAL1fw0EGh4NND0caE4Pud4c1zylGgEf4ZdqZpSqcadNxCUALU/Up3vrS1U5O4hhp6b2mKUdQBql3x1WrHt+LYQPUVuTKK0A2lN6eL9DG62/bUHfRWmNvfQB6EIPHcCxlLa1w1FtO4ImABmUfoRpL732YKjENBiVDgDtWtD3NZhNuYS+gW8VHUCf2r9VFbbRsDLogbPXIdtEBpBL6SZcixbR5u1W4RpEtJVzKt2AaI6hLEpfQDSHB6B9ylmvoRnj6ypKl2HZwgIwjNK1SKYg6lfxK5IlHAD5NS1xj0yx8uhBlPMhBoCcVLoCwYysBtIyBCsIAG6nzzs3oqQmuaWObTgGMIqWO26EstI/3xdwaMIhgJZ99//LYQucKa395q2ODDgDcFf1Dkf1MZRf8puT6k4AjN3n1oWfr5vpTPXK6gCy3xr9nLpfVGW0ObRIta4ygCGpyj41qG9A9fZYEcB4+qyiQ03KumiX2n2RGoD76Vylejp15bavVKopAXiQPq1STbN6pj2qUEsBwET6pIIjN3TGHvk68gDGrVDt5davK9Meka0iDWCSk4uuduVdMEmyhiSAoW2mSzpwWRnHJG/N5QBM+XqBnHkPNFzuBC0FoGix0/c8bmgCLZAoLQOgmBbLNsYT/ZYt0T0lAWBI+lT5xniiE6nw1+twAI+r3GZ4pHGvvgctCgbwRJFaW1D18HhCRkD6HwurXgKahAKYMRlYUJe+N39JERbvljUOZhcGIKe37P0Fsr5P+EXEICtzLMgyDMCTD4OK6VJi+EGJEHQC3RKBADw1EVJKl+zDJ0ICI8ohdy0QAHMeAhTSJmb8hDzNv+PJWnVcbB4A4IJvxWX0iRM/Iac04dYtqD9eaF8M4MESYRGN4sYvPArS3jkhciAEUPKll32/gviFBHK7jhIYEAEoXasr3wWiAWL4AgKPjxS8OxMAGHmOp90fwh2ACAk8QW/jbucD6LKjHqAJ2gSJX3g7ML2Sm03CBZC9Q5DarFkgAEICM0bwtnIBzAfeT2sSLH7xg8GsmzkbeQAWwu6mtQkIYNHdggKFqTeyN3IALKnw8gJAwADEu8DxruwUUzaApaM8PQESMnU0sKD44XgY+2aODeA86B9Al8D+xQBIx42sLUwA5XdC/WuQHHsAgIKfWR0aLADLlnp2ApDe86ZNEZfpW3nQfgMDwMQ5TrOvVKVy4AF2AVI6xP53BoDL/qfQDgSpnXcgAMgzg21/tgfQd4tSQ5xK9bQLApC73nZMoi2AwpleXAHVrzogACTzZbtfbQEsv125LepSj/8F/vNeVNfb5RbbASh+TLkt6nJw1wHbAQiZV2yTVGoDIL/S/RSQ5wZYf0khA+cBK0MBkNQvE3+zATBmCdQgmizx3/pi6D+0Z4Go5g5N+CkRQFEj6Twbx7J/74X1OBxT238n/JQIYOUtcINIMkdqCqcBbOSpBADySMITfgKATp9J2MMRI36sHiGzFmyeZvnFCqDzt65nwZjCbHRa3BZAp7Bc/IT8/lPLD1YAdy2WsocgU/wJsSD0CltU+JZlcJsFQGE917vBY0HahCImIBc/IQuvi/9uAdDvTUl7jsWNX0xANn4yomP8pTAewNIHfpA16FCxfi/71JfO/AHj0vETMr9/3Nd4AKvz5Q06k2AHMNKCmFKI33o3FAeg3WC3E+GO/RT5xIyF0zeqFD9Z3M/8LQ7A2huULDpQdAdYNxxQyCK1+Akpv9b0xQxgymmuZ0JGY+MGY0sAlC5nq7gLgRmA+6kgsPiJHQLVP3+t0rNMOU8mAPkpro8DAwMg8dcDB9EHteya2GcTgCxweimaIgDO+sVVt2k3x/qQTAAGuT4OVGYHQNXsm6IfYwBeZXSca5RnAOYNjH6MAVhv32+uU54BIBdXRz5FASxd5v67sAgA1+Mny/tGPkUBuP8c7CWA9II+4U8RADm/gybYI8o7AOTF7PCHCAAPToGeAhhwIDzWOgLAk4RwDwGQFVnG/2EAnXe5N7loVNG3AV4AeHSM8X847kmzXPQdOwVb5CaInseNYyAM4Ll7XPGK38+trvAxYADQfwSUXS9ZQTuF8DFgBC4YeuFUqm9+tTYrfAwYAHj9MQ7lNNlO355gdAwZADb05xZVFk6qoSYGN8wJ/hsCcKajuZhYwky01MHg16PBf0MA7oWmIsC1NAfZID6CEWuC086EAHSXmwM42jnFbJSeLFuhu415Uvb6zycGgMIj4HFRoM5JfUnGIGfgfWVVL2IAKHkQWIMRWQqkEJJAvoAIVl5JDACwF2LMG9g4j/pTzEG+YAhW9zQAND4VUBg0gtGdDHuQLwiC4EmgFkDqn7cJi4Le07s3wADiDJBDHkygpqCSXo+dUJNwJ1jTIwTgjYGigv6MX0wg/Q/lQQBXbRaU82v8YgL/HBkE8FYuv5R/4xcS6LixFkC2YAUPP8cvItB4by2Ah+Zwy/g7fgGBdd1rAfyVu5qP3+PnAyjomknJLO4MOb4HwCfwSgYlg9dzCvg/fj6B4jspqbqavT2WxOVj8QCUDKObr+Jsrws7AJdA6RA6eQZ7MzBhP9nFATCshPLeCdWNHYBHoPX7lHcVrPsARk+lj7Cnia0r8UcGYdnpML2PPUt6nQHA2QXm0nN/ZG48GQBU0Df7sbbVnfg5AFrQLcy+zpMCwCxawJyIuQ4BYBO4g7LhnBQA7j3ZARSd7ACWawKQ4tQAsjlmlO10ADCZxGCAYY4Z5Tp8ABaDyCkyOI2KqSk6AKXxvxLmwDOM8c1ElI8NADldwMYc7y21jB1DzegA5gTUCg23n+cXeX4c6ZRDlqGgsjh3ggoNZ/hRJfDaICRz7N08jXIm4ZF2xPKDPUMUWsOCK0W/xJ5wU9aP9vOpsj22pROcp8GTAkAebc6ZNw9vXkMVArwZstBadjptcooLbtBnCURr2Rr6Th/2Vik38uO/XTPIsXSMvpvN3irlhv8mXp4AP4Mdq2XZ9PzvXHCDe+2WtcezdAF9LwvJT9IC4BraQPkjRl/qjeIGHwDcIH8Zjo5UsIIG2E/SAuDb6U/rN8VxlKwABGYuoSMrBBZwZvXzCoAoU3A1bS9crRdlsJ9HAITZsl34KTIhweb2TEoAwvjzFlDygfBEv+hvzn15AkCcMl/ZgZKB/OnKoN6SEABgyMDSHEra7AW0RuxuBXcpE5WHAad3QpAhE7dOp+SWlZDWOPTn/sOQKAXa0D/GUbL4Llh7RC6TCwBw3NR9EynJ3yMeMQNxig6Aew/roC0mpW0Ojhd49j5gcfVhSthdYhgjpoK6fEMQwNaewOLKu53a2xyOQdGFGQpg0j1BAOD1lJQBqHaLM6cMRDoDkEurgKPGDAlviJDfi6gbhAJ46sYggPbNcM6CxP7aA+9SsJNNKD8KB/tDZ+cLvJIJHzkalMrdF/LrcaxbwJDebGcMnd12BbCC9AMITo6ItEUogEb7DAAXfgOs4JesISiAiqsNAB91B1aoYwDSdx4MzyDxwFxYDe4sz0kkIIC3/0LCAF5JXHrDXv7YBaBHwBl7SBjAJxnAKnULQNWlJAxg86P/gVWpUwBCM2iEJ1JqBR0d5QsCQACNQz1BBoAdXYG2/QAAegQUh5aUNAB02QWs5ASAxCw/jsbrAQEUnh5KwAhPoweeSgm9b88zd7/8HPovDCDzY2A19N5dgRIXIcPy19BYTygMQN8x4Cx+fQ4Ly42l5yIzSWo7BtwGAPUXWWUhAkDbMZCsAFrsNv6PAHh9KlqviGKL3PW25bvwlT86mWrDBsCqsk9EyQkgushEFEAHm9UY7eXmLqDN1xWRJceiAHLOWAOtLNkqFwEsuhtY8J0/RT7F5hM+Bzxdhnu7gDZPf9we+RQDcF0l2I9bBLT5CTSIrkRumlH6087Q+rKjVlwCwE+IM6tH7HA3AZBYbtidXUCbl24NVkU/m+cU39UF7MsNAvp8zDAlc5gBfNYJ7k0/AY0ezqyJfTYDeHvfrXAjugnI2mcMsLLThIdMX+Km1f/8crhDwVKQiZIjoPOp84NWpi9xAPID4JshzQ/GOo1XX2z+Fr+wwoK/S/jU1zeirxckqIq4zNB4APn1ZFYb0kVAb69TZYe4r5alNb5qL+NXS4+dQj6B1OnlptlxXy0AhjaQWnBKgYBldW0Mk1Lxz7SsLW9dXAU80bohlW5yTkoOLC/bIqn4R6yuif8hYXWZ6l5S3jET4NCT6Wy0xDqHcAKAmgnM8fS2Un5VEt9wJDMi5e633r4kri8EflcekZevy2TvL7ddaP0lEUDZ18WSVr0jIBv/munrrD/ZrDC1p61sO7wiIP2EdcrXCT/ZLbEl8VgckRcI5B8wW32Q+JsdgLkvA/MlTHKfgHz8r22yWbrLdpG1Cc9IG3cbAbz7K6ZBdpNn2gIYelxlDWY3Caj0MD1vO4Oy/TJ7Lw9TcOAeAt7cEkzlbv/Q7mfGOoNjlii4IO4gUNn7a9Xb/imHAeDtgOJaYdIdRdJS7GMfzpgvibXSZNFvM9Ucad4JVF8xfNzxoP0G5lKbswsVXSnO9gWS8ku2gt2ljC3stUbhL4pspGM3cLIsZseNrC1sAOMrjqg7xEfgKM2gK3sRCc5qszXdf3DiFJMBbDk4pga0ZK/eyltu18FpIOIZvJAhR+CX/iwVPl3D3shdb5g7xQ5UzvYDpzlWQX1yHmcjF0Dq1ksR/Ct29eEEX6si7uBo/orT9CapTmKu5PYEpOBr1aTHMt5mwZLbm+av5ReQlHjMH8IxH6cdpUXc7aI1x8eudHgpsJfNyy/wAFYp5fUW3D0IF13/ZAw0gzIZ9eox0chw8arztzTHuJZ5o52ZnAugITEAIphsK4nVrPRaYRkAAPiAmiRTwWWiKZIIDAA5tbHTtnihrN3VgFIgAIQ372bS6kLQ2RsE4LRGzprihbqdgHXsQgD4Mf6MWa3EhYICAIBnUSePRo85F1hSDEDpLYnHKquaLS5kSAiAP+dociqvIXA+ACIG4Mf4N06AZ/6LAPgx/oW3M3rAbcUH4Mf4e0hkuxIBAB/GPy4wWa4CDwBuz4QrOn2A7AstDgAfxv98Fb/7x0ZsAODBtMkj9vsftpgA/Pf3P15yo0ItFgD/xf9LIfv1D0cMAL6LP+PoJrWK9gB8F3/1NNbrb5FsAfTc6qAtHmhL4IGEDFCo7AD4Lf7sL23Tn2CyAbC3jbo5D3R2M0jXH1OJAPz197/usXu4r/6ESgDgq/gLyjqXOzRhBeCr+FcFHE3YGpIFgJ/if/2axOR3ecUD2N8awaQ7+uJ7YLevQHEASu9HsemCPm4JSDQAyQxgSrXi7aTLGnHFRZehGTMDGK58O+WmRrf9ZhSiOTOA1vsRDWvS9sPjcNOxTQAKwS8TvFLurvWp2DZNAFoewjaOqmY/Nt+twawJwPgyDfaxtDz/NunuPpDM54B592px4Vgrb2g4TE/0JB5AUt4Gtr18IcYNH1NmAH2q6ut0Ja1uRw58Mdjpw45IcXeCh3J3aHYH1hPdtzee6MYeGf8sMPa/Xt8LlvXIvOP+JctwE3R5sjwNplbV2zjBNechbSnYOb5Xr0GZL3z1U6d6Tae565yQ/wMdjsakapa0eQAAAABJRU5ErkJggg=="/>
	</defs>
	<style>
	</style>
	<use  href="#img1" x="0" y="0"/>
</svg>
````

## File: client/public/robots.txt
````
# https://www.robotstxt.org/robotstxt.html
User-agent: *
Disallow:
````

## File: client/src/components/admin/common/AdminTable.tsx
````typescript
import React from 'react';
import { Loader2 } from 'lucide-react';
import { useTranslation } from 'react-i18next';

export interface TableColumn<T> {
  key: string;
  label: string;
  render: (item: T) => React.ReactNode;
  className?: string;
  width?: string;
}

export interface AdminTableProps<T> {
  columns: TableColumn<T>[];
  data: T[];
  isLoading: boolean;
  emptyMessage?: string;
  loadingMessage?: string;
  getRowKey: (item: T) => string | number;
}

export function AdminTable<T>({
  columns,
  data,
  isLoading,
  getRowKey,
  ...props
}: AdminTableProps<T>) {
  const { t: translate } = useTranslation('components/admin/common');

  const emptyMessage = props.emptyMessage || translate('adminTable.defaultEmptyMessage');
  const loadingMessage = props.loadingMessage || translate('adminTable.defaultLoadingMessage');

  if (isLoading) {
    return (
      <div className="flex flex-col items-center justify-center py-16 bg-light-surface dark:bg-dark-surface rounded-lg border border-light-border dark:border-dark-border">
        <Loader2 className="w-8 h-8 text-light-primary dark:text-dark-primary animate-spin mb-3" />
        <div className="text-light-text-secondary dark:text-dark-text-secondary">
          {loadingMessage}
        </div>
      </div>
    );
  }

  if (data.length === 0) {
    return (
      <div className="text-center py-16 bg-light-surface dark:bg-dark-surface rounded-lg border border-light-border dark:border-dark-border">
        <div className="text-light-text-secondary dark:text-dark-text-secondary text-base">
          {emptyMessage}
        </div>
      </div>
    );
  }

  return (
    <div className="overflow-x-auto rounded-lg border border-light-border dark:border-dark-border shadow-sm">
      <div className="inline-block min-w-full align-middle">
        <table className="min-w-full divide-y divide-light-border dark:divide-dark-border">
          <thead className="bg-light-surface dark:bg-dark-surface sticky top-0 z-10">
            <tr>
              {columns.map((column) => (
                <th
                  key={column.key}
                  className={`px-6 py-4 text-left text-xs font-semibold text-light-text-secondary dark:text-dark-text-secondary uppercase tracking-wider ${
                    column.width || ''
                  } ${column.className || ''}`}
                  style={column.width ? { width: column.width } : undefined}
                >
                  {column.label}
                </th>
              ))}
            </tr>
          </thead>
          <tbody className="bg-light-bg dark:bg-dark-bg divide-y divide-light-border dark:divide-dark-border">
            {data.map((item, index) => (
              <tr
                key={getRowKey(item)}
                className={`
                  transition-colors duration-150
                  hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary
                  ${index % 2 === 0 ? 'bg-light-bg dark:bg-dark-bg' : 'bg-light-surface/50 dark:bg-dark-surface/50'}
                `}
              >
                {columns.map((column) => (
                  <td
                    key={column.key}
                    className={`px-6 py-4 text-sm ${column.className || ''}`}
                  >
                    {column.render(item)}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
````

## File: client/src/components/admin/common/FilterInput.tsx
````typescript
import React from 'react';
import { Search, X } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { IconButton } from '../../common/buttons/IconButton';

export interface FilterInputProps {
  value: string;
  onChange: (value: string) => void;
  onReset?: () => void;
  placeholder?: string;
  type?: 'text' | 'number';
  className?: string;
  showSearchIcon?: boolean;
}

export const FilterInput: React.FC<FilterInputProps> = ({
  value,
  onChange,
  onReset,
  type = 'text',
  className = '',
  showSearchIcon = false,
  ...props
}) => {
  const { t: translate } = useTranslation('components/admin/common');

  const placeholder = props.placeholder || translate('filterInput.defaultPlaceholder');

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const newValue = e.target.value;
    onChange(newValue);
    if (onReset && newValue === '') {
      onReset();
    }
  };

  const handleClear = () => {
    onChange('');
    if (onReset) {
      onReset();
    }
  };

  return (
    <div className={`relative flex-grow ${className}`}>
      <input
        type={type}
        placeholder={placeholder}
        value={value}
        onChange={handleChange}
        className={`block w-full rounded-md bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text p-2 pr-8 text-sm focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary h-10 mt-0`}
      />
      {value && (
        <IconButton
          icon={<X size={20} />}
          onClick={handleClear}
          variant="secondary"
          className="absolute right-3 top-1/2 -translate-y-1/2 mr-4 text-light-text-secondary dark:text-dark-text-secondary"
          label="Clear search"
        />
      )}
      {showSearchIcon && (
        <Search
          className="absolute right-3 top-1/2 -translate-y-1/2 text-light-text-secondary dark:text-dark-text-secondary pointer-events-none"
          size={16}
        />
      )}
    </div>
  );
};
````

## File: client/src/components/admin/common/FilterSelect.tsx
````typescript
import React from 'react';
import { ChevronDown } from 'lucide-react';
import { useTranslation } from 'react-i18next';

export interface FilterSelectProps {
  value: string;
  onChange: (value: string) => void;
  onReset?: () => void;
  options: { value: string; label: string }[];
  placeholder?: string;
  className?: string;
}

export const FilterSelect: React.FC<FilterSelectProps> = ({
  value,
  onChange,
  onReset,
  options,
  className = '',
    ...props
  }) => {
  const { t: translate } = useTranslation('components/admin/common');

  const placeholder = props.placeholder || translate('filterSelect.defaultPlaceholder');

  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const newValue = e.target.value;
    onChange(newValue);
    if (onReset && newValue === '') {
      onReset();
    }
  };

  return (
    <div className={`relative ${className}`}>
      <select
        value={value}
        onChange={handleChange}
        className="block w-full appearance-none rounded-md bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text p-2 pr-8 text-sm focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary h-10 mt-0 cursor-pointer"
      >
        <option value="">{placeholder}</option>
        {options.map((option) => (
          <option key={option.value} value={option.value}>
            {option.label}
          </option>
        ))}
      </select>
      <ChevronDown
        className="absolute right-2 top-1/2 -translate-y-1/2 text-light-text-secondary dark:text-dark-text-secondary pointer-events-none"
        size={16}
      />
    </div>
  );
};
````

## File: client/src/components/admin/common/formatters.ts
````typescript
import { getCurrentLocale } from '../../../utils/getCurrentLocale';

/**
 * Format a date string for display in the admin panel
 */
export const formatDate = (dateString: string | null): string => {
  const { isoCode } = getCurrentLocale();

  if (!dateString) {
    return 'Never';
  }

  return new Date(dateString).toLocaleDateString(isoCode, {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
};

/**
 * Format a date string for display (short version without time)
 */
export const formatDateShort = (dateString: string | null): string => {
  const { isoCode } = getCurrentLocale();

  if (!dateString) {
    return 'Never';
  }

  return new Date(dateString).toLocaleDateString(isoCode, {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  });
};

/**
 * Check if a date has expired
 */
export const isExpired = (expiresAt: string | null): boolean => {
  if (!expiresAt) return false;
  return new Date(expiresAt) < new Date();
};
````

## File: client/src/components/admin/common/index.ts
````typescript
export { FilterSelect } from './FilterSelect';
export type { FilterSelectProps } from './FilterSelect';

export { FilterInput } from './FilterInput';
export type { FilterInputProps } from './FilterInput';

export { StatusBadge } from './StatusBadge';
export type { StatusBadgeProps, StatusVariant } from './StatusBadge';

export { ResultsCount } from './ResultsCount';
export type { ResultsCountProps } from './ResultsCount';

export { Pagination } from './Pagination';
export type { PaginationProps } from './Pagination';

export { AdminTable } from './AdminTable';
export type { AdminTableProps, TableColumn } from './AdminTable';

export * from './formatters';
````

## File: client/src/components/admin/common/Pagination.tsx
````typescript
import React from 'react';
import { ChevronLeft, ChevronRight } from 'lucide-react';
import { useTranslation } from 'react-i18next';

export interface PaginationProps {
  offset: number;
  limit: number;
  total: number;
  onPrevious: () => void;
  onNext: () => void;
}

export const Pagination: React.FC<PaginationProps> = ({
  offset,
  limit,
  total,
  onPrevious,
  onNext,
}) => {
  const { t } = useTranslation();

  const hasMore = offset + limit < total;
  const hasPrevious = offset > 0;
  const currentPage = Math.floor(offset / limit) + 1;
  const totalPages = Math.ceil(total / limit);

  if (totalPages <= 1) {
    return null;
  }

  return (
    <div className="flex items-center justify-between bg-light-surface dark:bg-dark-surface px-6 py-4 rounded-lg border border-light-border dark:border-dark-border">
      <button
        onClick={onPrevious}
        disabled={!hasPrevious}
        className="inline-flex items-center gap-2 px-4 py-2 border border-light-border dark:border-dark-border rounded-lg bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text disabled:opacity-50 disabled:cursor-not-allowed hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary transition-colors font-medium text-sm shadow-sm"
      >
        <ChevronLeft className="w-4 h-4" />
        {t('pagination.previous')}
      </button>
      <div className="flex items-center gap-2">
        <span className="text-sm font-medium text-light-text dark:text-dark-text">
          {t('pagination.pageOf', { currentPage, totalPages })}
        </span>
        <span className="text-xs text-light-text-secondary dark:text-dark-text-secondary">
          ({t('pagination.total', { total })})
        </span>
      </div>
      <button
        onClick={onNext}
        disabled={!hasMore}
        className="inline-flex items-center gap-2 px-4 py-2 border border-light-border dark:border-dark-border rounded-lg bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text disabled:opacity-50 disabled:cursor-not-allowed hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary transition-colors font-medium text-sm shadow-sm"
      >
        {t('pagination.next')}
        <ChevronRight className="w-4 h-4" />
      </button>
    </div>
  );
};
````

## File: client/src/components/admin/common/ResultsCount.tsx
````typescript
import React from 'react';
import { useTranslation } from 'react-i18next';
import { capitalizeFirstLetter } from '../../../utils/helpers/changeCaseUtils';

export interface ResultsCountProps {
  offset: number;
  limit: number;
  total: number;
  entityName: string;
}

export const ResultsCount: React.FC<ResultsCountProps> = ({
  offset,
  limit,
  total,
  entityName,
}) => {
  const { t } = useTranslation();

  return (
    <div className="flex items-center gap-2 px-1">
      <span className="text-sm font-medium text-light-text dark:text-dark-text">
        {total === 0 ? capitalizeFirstLetter(t('no')) : total} {entityName}
      </span>
      {total > 0 && (
        <span className="text-sm text-light-text-secondary dark:text-dark-text-secondary">
          • {t('showing')} {offset + 1}-{Math.min(offset + limit, total)}
        </span>
      )}
    </div>
  );
};
````

## File: client/src/components/admin/common/StatusBadge.tsx
````typescript
import React from 'react';

export type StatusVariant = 'success' | 'danger' | 'warning' | 'info' | 'neutral';

export interface StatusBadgeProps {
  label: string;
  variant: StatusVariant;
  icon?: React.ReactNode;
  className?: string;
}

export const StatusBadge: React.FC<StatusBadgeProps> = ({
  label,
  variant,
  icon,
  className = '',
}) => {
  const variantClasses = {
    success: 'bg-green-100 text-green-700 dark:bg-green-900/50 dark:text-green-300 border border-green-200 dark:border-green-800',
    danger: 'bg-red-100 text-red-700 dark:bg-red-900/50 dark:text-red-300 border border-red-200 dark:border-red-800',
    warning: 'bg-yellow-100 text-yellow-700 dark:bg-yellow-900/50 dark:text-yellow-300 border border-yellow-200 dark:border-yellow-800',
    info: 'bg-blue-100 text-blue-700 dark:bg-blue-900/50 dark:text-blue-300 border border-blue-200 dark:border-blue-800',
    neutral: 'bg-gray-100 text-gray-700 dark:bg-gray-800/50 dark:text-gray-300 border border-gray-200 dark:border-gray-700',
  };

  return (
    <span
      className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md text-xs font-semibold ${variantClasses[variant]} ${className}`}
    >
      {icon}
      {label}
    </span>
  );
};
````

## File: client/src/components/admin/modals/SnippetViewModal.tsx
````typescript
import React from 'react';
import { useQuery } from '@tanstack/react-query';
import { Loader2, AlertCircle } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { adminApi } from '../../../utils/api/admin';
import Modal from '../../common/modals/Modal';
import { FullCodeView } from '../../snippets/view/FullCodeView';

interface SnippetViewModalProps {
  snippetId: number | null;
  onClose: () => void;
}

export const SnippetViewModal: React.FC<SnippetViewModalProps> = ({
  snippetId,
  onClose,
}) => {
  const { t: translate } = useTranslation('components/admin/modals');
  const { data: snippet, isLoading, error } = useQuery({
    queryKey: ['admin', 'snippet', snippetId],
    queryFn: () => adminApi.getSnippetDetails(snippetId!),
    enabled: snippetId !== null,
  });

  return (
    <Modal
      isOpen={snippetId !== null}
      onClose={onClose}
      title={snippet?.title || translate('snippetViewModal.title')}
      width="max-w-5xl"
      expandable
    >
      {isLoading && (
        <div className="flex items-center justify-center py-12">
          <div className="flex items-center gap-3">
            <Loader2 className="w-6 h-6 text-light-text-secondary dark:text-dark-text-secondary animate-spin" />
            <span className="text-light-text dark:text-dark-text">{translate('snippetViewModal.title')}</span>
          </div>
        </div>
      )}

      {error && (
        <div className="flex items-center justify-center py-12">
          <div className="flex items-center gap-3 text-red-600 dark:text-red-400">
            <AlertCircle className="w-6 h-6" />
            <span>{translate('snippetViewModal.error.failedLoad')}</span>
          </div>
        </div>
      )}

      {snippet && !isLoading && !error && (
        <div className="overflow-y-auto max-h-[calc(100vh-200px)]">
          <FullCodeView
            snippet={snippet}
            showTitle={false}
            isModal={true}
            showLineNumbers={true}
          />
        </div>
      )}
    </Modal>
  );
};
````

## File: client/src/components/admin/tabs/ApiKeysTab.tsx
````typescript
import React, { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { Trash2 } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { adminApi } from '../../../utils/api/admin';
import { useToast } from '../../../hooks/useToast';
import { ConfirmationModal } from '../../common/modals/ConfirmationModal';
import {
  FilterInput,
  AdminTable,
  Pagination,
  ResultsCount,
  StatusBadge,
  formatDate,
  type TableColumn,
} from '../common';

export const ApiKeysTab: React.FC = () => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/admin/tabs/apiKeys');
  const [userId, setUserId] = useState('');
  const [offset, setOffset] = useState(0);
  const [deleteKeyId, setDeleteKeyId] = useState<number | null>(null);
  const limit = 50;

  const { addToast } = useToast();
  const queryClient = useQueryClient();

  const { data, isLoading } = useQuery({
    queryKey: ['admin', 'api-keys', offset, userId],
    queryFn: () =>
      adminApi.getApiKeys({
        offset,
        limit,
        userId,
      }),
  });

  const deleteMutation = useMutation({
    mutationFn: (id: number) => adminApi.deleteApiKey(id),
    onSuccess: () => {
      addToast(translate('apiKeyDeletedSuccessfully'), 'success');
      queryClient.invalidateQueries({ queryKey: ['admin', 'api-keys'] });
      queryClient.invalidateQueries({ queryKey: ['admin', 'stats'] });
      setDeleteKeyId(null);
    },
    onError: (error: any) => {
      addToast(error.message || translate('error.default'), 'error');
    },
  });

  const apiKeys = data?.apiKeys || [];
  const total = data?.total || 0;

  const columns: TableColumn<any>[] = [
    {
      key: 'id',
      label: 'ID',
      render: (key) => (
        <span className="whitespace-nowrap text-light-text dark:text-dark-text">
          {key.id}
        </span>
      ),
    },
    {
      key: 'name',
      label: translate('columns.labels.name'),
      render: (key) => (
        <span className="text-light-text dark:text-dark-text">{key.name}</span>
      ),
    },
    {
      key: 'owner',
      label: translate('columns.labels.owner'),
      render: (key) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {key.username || `User #${key.user_id}`}
        </span>
      ),
    },
    {
      key: 'created',
      label: translate('columns.labels.created'),
      render: (key) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {formatDate(key.created_at)}
        </span>
      ),
    },
    {
      key: 'last_used',
      label: translate('columns.labels.lastUsed'),
      render: (key) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {formatDate(key.last_used_at)}
        </span>
      ),
    },
    {
      key: 'status',
      label: translate('columns.labels.status'),
      render: (key) => (
        <span className="whitespace-nowrap">
          <StatusBadge
            label={key.is_active ? translate('status.active') : translate('status.inactive')}
            variant={key.is_active ? 'success' : 'neutral'}
          />
        </span>
      ),
    },
    {
      key: 'actions',
      label: translate('columns.labels.actions'),
      render: (key) => (
        <div className="whitespace-nowrap">
          <button
            onClick={() => setDeleteKeyId(key.id)}
            className="p-1 hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary rounded text-red-600 dark:text-red-400"
            title="Delete API key"
          >
            <Trash2 className="w-4 h-4" />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-4">
      {/* Filters */}
      <div className="flex flex-col sm:flex-row gap-4">
        <FilterInput
          value={userId}
          onChange={(value) => {
            setUserId(value);
            setOffset(0);
          }}
          placeholder={translate('filters.userId')}
          className="w-64"
        />
      </div>

      <ResultsCount offset={offset} limit={limit} total={total} entityName={translate('entityName', { count: total })} />

      <AdminTable
        columns={columns}
        data={apiKeys}
        isLoading={isLoading}
        emptyMessage={translate('table.emptyMessage')}
        loadingMessage={translate('table.loadingMessage')}
        getRowKey={(key) => key.id}
      />

      <Pagination
        offset={offset}
        limit={limit}
        total={total}
        onPrevious={() => setOffset(Math.max(0, offset - limit))}
        onNext={() => setOffset(offset + limit)}
      />

      {/* Delete Confirmation Modal */}
      <ConfirmationModal
        isOpen={deleteKeyId !== null}
        onClose={() => setDeleteKeyId(null)}
        onConfirm={() => deleteKeyId && deleteMutation.mutate(deleteKeyId)}
        title={translate('confirmationModal.title')}
        message={translate('confirmationModal.message')}
        confirmLabel={t('action.delete')}
        cancelLabel={t('action.cancel')}
        variant="danger"
      />
    </div>
  );
};
````

## File: client/src/components/admin/tabs/DashboardTab.tsx
````typescript
import React from 'react';
import { useQuery } from '@tanstack/react-query';
import { Users, FileText, Key, Share2 } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { adminApi } from '../../../utils/api/admin';

export const DashboardTab: React.FC = () => {
  const { t: translate } = useTranslation('components/admin/tabs/dashboard');
  const { data: stats, isLoading } = useQuery({
    queryKey: ['admin', 'stats'],
    queryFn: adminApi.getStats,
  });

  if (isLoading) {
    return (
      <div className="flex items-center justify-center py-12">
        <div className="text-light-text-secondary dark:text-dark-text-secondary">
          {translate('loadingMessage')}
        </div>
      </div>
    );
  }

  const statCards = [
    {
      title: translate('card.users.title'),
      icon: Users,
      total: stats?.users.total || 0,
      details: [
        { label: translate('card.users.authType.internal'), value: stats?.users.internal || 0 },
        { label: translate('card.users.authType.oidc'), value: stats?.users.oidc || 0 },
      ],
    },
    {
      title: translate('card.snippets.title'),
      icon: FileText,
      total: stats?.snippets.total || 0,
      details: [
        { label: translate('card.snippets.viewType.public'), value: stats?.snippets.public || 0 },
        { label: translate('card.snippets.viewType.private'), value: stats?.snippets.private || 0 },
      ],
    },
    {
      title: translate('card.apiKeys.title'),
      icon: Key,
      total: stats?.apiKeys.active || 0,
      details: [{ label: translate('card.snippets.apiKeys.active'), value: stats?.apiKeys.active || 0 }],
    },
    {
      title: translate('card.shares.title'),
      icon: Share2,
      total: stats?.shares.total || 0,
      details: [{ label: translate('card.snippets.shares.total'), value: stats?.shares.total || 0 }],
    },
  ];

  return (
    <div>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {statCards.map((card) => {
          const Icon = card.icon;
          return (
            <div
              key={card.title}
              className="bg-light-bg dark:bg-dark-bg border border-light-border dark:border-dark-border rounded-lg p-6"
            >
              <div className="flex items-center justify-between mb-4">
                <h3 className="text-sm font-medium text-light-text-secondary dark:text-dark-text-secondary">
                  {card.title}
                </h3>
                <Icon className="w-5 h-5 text-light-text-secondary dark:text-dark-text-secondary" />
              </div>
              <div className="text-3xl font-bold text-light-text dark:text-dark-text mb-4">
                {card.total}
              </div>
              <div className="space-y-1">
                {card.details.map((detail) => (
                  <div
                    key={detail.label}
                    className="flex justify-between text-sm text-light-text-secondary dark:text-dark-text-secondary"
                  >
                    <span>{detail.label}:</span>
                    <span className="font-medium">{detail.value}</span>
                  </div>
                ))}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
};
````

## File: client/src/components/admin/tabs/SharesTab.tsx
````typescript
import React, { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { Trash2, Copy, ExternalLink, Lock, Unlock } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { adminApi } from '../../../utils/api/admin';
import { useToast } from '../../../hooks/useToast';
import { ConfirmationModal } from '../../common/modals/ConfirmationModal';
import { useNavigate } from 'react-router-dom';
import { ROUTES } from '../../../constants/routes';
import {
  FilterInput,
  FilterSelect,
  AdminTable,
  Pagination,
  ResultsCount,
  StatusBadge,
  formatDate,
  isExpired,
  type TableColumn,
} from '../common';

export const SharesTab: React.FC = () => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/admin/tabs/shares');
  const [userId, setUserId] = useState('');
  const [requiresAuth, setRequiresAuth] = useState('');
  const [offset, setOffset] = useState(0);
  const [deleteShareId, setDeleteShareId] = useState<string | null>(null);
  const limit = 50;

  const { addToast } = useToast();
  const queryClient = useQueryClient();
  const navigate = useNavigate();

  const { data, isLoading } = useQuery({
    queryKey: ['admin', 'shares', offset, userId, requiresAuth],
    queryFn: () =>
      adminApi.getShares({
        offset,
        limit,
        userId,
        requiresAuth,
      }),
  });

  const deleteMutation = useMutation({
    mutationFn: (id: string) => adminApi.deleteShare(id),
    onSuccess: () => {
      addToast(translate('success.delete.default'), 'success');
      queryClient.invalidateQueries({ queryKey: ['admin', 'shares'] });
      queryClient.invalidateQueries({ queryKey: ['admin', 'stats'] });
      setDeleteShareId(null);
    },
    onError: (error: any) => {
      addToast(error.message || translate('error.delete.default'), 'error');
    },
  });

  const shares = data?.shares || [];
  const total = data?.total || 0;

  const copyShareLink = (shareId: string) => {
    const shareUrl = `${window.location.origin}${window.__BASE_PATH__ || ''}/share/${shareId}`;
    navigator.clipboard.writeText(shareUrl);
    addToast(translate('success.copied.default'), 'success');
  };

  const columns: TableColumn<any>[] = [
    {
      key: 'id',
      label: translate('columns.labels.id'),
      render: (share) => (
        <span className="whitespace-nowrap font-mono text-light-text dark:text-dark-text">
          {share.id.substring(0, 8)}...
        </span>
      ),
    },
    {
      key: 'title',
      label: translate('columns.labels.title'),
      render: (share) => (
        <span className="text-light-text dark:text-dark-text max-w-xs truncate">
          {share.snippet_title || 'Untitled'}
        </span>
      ),
    },
    {
      key: 'owner',
      label: translate('columns.labels.owner'),
      render: (share) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {share.username || `User #${share.user_id}`}
        </span>
      ),
    },
    {
      key: 'auth',
      label: translate('columns.labels.auth'),
      render: (share) => (
        <span className="whitespace-nowrap">
          <StatusBadge
            label={share.requires_auth ? 'Yes' : 'No'}
            variant={share.requires_auth ? 'warning' : 'success'}
            icon={share.requires_auth ? <Lock className="w-3 h-3" /> : <Unlock className="w-3 h-3" />}
          />
        </span>
      ),
    },
    {
      key: 'expires',
      label: translate('columns.labels.expires'),
      render: (share) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {share.expires_at ? (
            <span className={isExpired(share.expires_at) ? 'text-red-600 dark:text-red-400' : ''}>
              {formatDate(share.expires_at)}
              {isExpired(share.expires_at) && ' (Expired)'}
            </span>
          ) : (
            'Never'
          )}
        </span>
      ),
    },
    {
      key: 'created',
      label: translate('columns.labels.created'),
      render: (share) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {formatDate(share.created_at)}
        </span>
      ),
    },
    {
      key: 'actions',
      label: translate('columns.labels.actions'),
      render: (share) => (
        <div className="flex items-center gap-2 whitespace-nowrap">
          <button
            onClick={() => copyShareLink(share.id)}
            className="p-1 hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary rounded text-light-text-secondary dark:text-dark-text-secondary"
            title={translate('action.copyShareLink')}
          >
            <Copy className="w-4 h-4" />
          </button>
          <button
            onClick={() => navigate(`${ROUTES.SNIPPETS}/${share.snippet_id}`)}
            className="p-1 hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary rounded text-light-text-secondary dark:text-dark-text-secondary"
            title={translate('action.viewSnippet')}
          >
            <ExternalLink className="w-4 h-4" />
          </button>
          <button
            onClick={() => setDeleteShareId(share.id)}
            className="p-1 hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary rounded text-red-600 dark:text-red-400"
            title={translate('action.delete')}
          >
            <Trash2 className="w-4 h-4" />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-4">
      {/* Filters */}
      <div className="flex flex-col sm:flex-row gap-4">
        <FilterInput
          value={userId}
          onChange={(value) => {
            setUserId(value);
            setOffset(0);
          }}
          placeholder={translate('filters.userId')}
          className="w-64"
        />
        <FilterSelect
          value={requiresAuth}
          onChange={(value) => {
            setRequiresAuth(value);
            setOffset(0);
          }}
          options={[
            { value: 'true', label: translate('filters.authType.requiresAuth') },
            { value: 'false', label: translate('filters.authType.public') },
          ]}
          placeholder={translate('filters.authType.all')}
        />
      </div>

      <ResultsCount offset={offset} limit={limit} total={total} entityName={translate('entityName', { count: total })} />

      <AdminTable
        columns={columns}
        data={shares}
        isLoading={isLoading}
        emptyMessage={translate('table.emptyMessage')}
        loadingMessage={translate('table.loadingMessage')}
        getRowKey={(share) => share.id}
      />

      <Pagination
        offset={offset}
        limit={limit}
        total={total}
        onPrevious={() => setOffset(Math.max(0, offset - limit))}
        onNext={() => setOffset(offset + limit)}
      />

      {/* Delete Confirmation Modal */}
      <ConfirmationModal
        isOpen={deleteShareId !== null}
        onClose={() => setDeleteShareId(null)}
        onConfirm={() => deleteShareId && deleteMutation.mutate(deleteShareId)}
        title={translate('confirmationModal.title')}
        message={translate('confirmationModal.message')}
        confirmLabel={t('action.delete')}
        cancelLabel={t('action.cancel')}
        variant="danger"
      />
    </div>
  );
};
````

## File: client/src/components/admin/tabs/SnippetsTab.tsx
````typescript
import React, { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { Trash2, Globe, Lock, AlertTriangle, Eye } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { adminApi } from '../../../utils/api/admin';
import { useToast } from '../../../hooks/useToast';
import { ConfirmationModal } from '../../common/modals/ConfirmationModal';
import { useDebounce } from '../../../hooks/useDebounce';
import { IconButton } from '../../common/buttons/IconButton';
import { SnippetViewModal } from '../modals/SnippetViewModal';
import {
  FilterInput,
  FilterSelect,
  AdminTable,
  Pagination,
  ResultsCount,
  StatusBadge,
  formatDateShort,
  type TableColumn,
} from '../common';

export const SnippetsTab: React.FC = () => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/admin/tabs/snippets');
  const [search, setSearch] = useState('');
  const [userId, setUserId] = useState('');
  const [isPublic, setIsPublic] = useState('');
  const [offset, setOffset] = useState(0);
  const [deleteSnippetId, setDeleteSnippetId] = useState<number | null>(null);
  const [viewSnippetId, setViewSnippetId] = useState<number | null>(null);
  const [showOffensiveOnly, setShowOffensiveOnly] = useState(false);
  const limit = 50;

  const debouncedSearch = useDebounce(search, 300);
  const { addToast } = useToast();
  const queryClient = useQueryClient();

  const { data, isLoading } = useQuery({
    queryKey: ['admin', 'snippets', offset, debouncedSearch, userId, isPublic, showOffensiveOnly],
    queryFn: () => {
      if (showOffensiveOnly) {
        return adminApi.scanSnippetsForOffensive();
      }

      return adminApi.getSnippets({
        offset,
        limit,
        search: debouncedSearch,
        userId,
        isPublic,
      });
    },
  });

  const deleteMutation = useMutation({
    mutationFn: (id: number) => adminApi.deleteSnippet(id),
    onSuccess: () => {
      addToast(translate('success.delete.default'), 'success');
      queryClient.invalidateQueries({ queryKey: ['admin', 'snippets'] });
      queryClient.invalidateQueries({ queryKey: ['admin', 'stats'] });
      setDeleteSnippetId(null);
    },
    onError: (error: any) => {
      addToast(error.message || translate('error.delete.default'), 'error');
    },
  });

  const togglePublicMutation = useMutation({
    mutationFn: (id: number) => adminApi.toggleSnippetPublic(id),
    onSuccess: () => {
      addToast(translate('success.update.default'), 'success');
      queryClient.invalidateQueries({ queryKey: ['admin', 'snippets'] });
      queryClient.invalidateQueries({ queryKey: ['admin', 'stats'] });
    },
    onError: (error: any) => {
      addToast(error.message || translate('error.update.default'), 'error');
    },
  });

  const snippets = data?.snippets || [];
  const total = data?.total || 0;

  const handleToggleOffensiveScan = () => {
    setShowOffensiveOnly(!showOffensiveOnly);
    setOffset(0);
  };

  const columns: TableColumn<any>[] = [
    {
      key: 'id',
      label: 'ID',
      render: (snippet) => (
        <span className="whitespace-nowrap text-light-text dark:text-dark-text">
          {snippet.id}
        </span>
      ),
    },
    {
      key: 'title',
      label: translate('columns.labels.title'),
      render: (snippet) => (
        <div className="flex items-center gap-2">
          {snippet.flagged_words && snippet.flagged_words.length > 0 && (
            <span
              className="text-red-600 dark:text-red-400"
              title={translate('containsOffensiveWords', { words: snippet.flagged_words.join(', ') })}
            >
              <AlertTriangle className="w-4 h-4" />
            </span>
          )}
          <button
            onClick={() => setViewSnippetId(snippet.id)}
            className="text-light-text dark:text-dark-text hover:text-light-primary dark:hover:text-dark-primary hover:underline text-left max-w-xs truncate"
          >
            {snippet.title}
          </button>
        </div>
      ),
    },
    {
      key: 'owner',
      label: translate('columns.labels.owner'),
      render: (snippet) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {snippet.username || `User #${snippet.user_id}`}
        </span>
      ),
    },
    {
      key: 'visibility',
      label: translate('columns.labels.visibility'),
      render: (snippet) => (
        <span className="whitespace-nowrap">
          <StatusBadge
            label={snippet.is_public ? translate('filters.visibility.public') : translate('filters.visibility.private')}
            variant={snippet.is_public ? 'success' : 'neutral'}
            icon={snippet.is_public ? <Globe className="w-3 h-3" /> : <Lock className="w-3 h-3" />}
          />
        </span>
      ),
    },
    {
      key: 'fragments',
      label: translate('columns.labels.fragments'),
      render: (snippet) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {snippet.fragment_count}
        </span>
      ),
    },
    {
      key: 'updated',
      label: translate('columns.labels.updated'),
      render: (snippet) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {formatDateShort(snippet.updated_at)}
        </span>
      ),
    },
    {
      key: 'actions',
      label: translate('columns.labels.actions'),
      render: (snippet) => (
        <div className="flex items-center gap-2 whitespace-nowrap">
          <button
            onClick={() => setViewSnippetId(snippet.id)}
            className="p-1 hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary rounded"
            title={translate('action.viewSnippet')}
          >
            <Eye className="w-4 h-4 text-blue-600 dark:text-blue-400" />
          </button>
          <button
            onClick={() => togglePublicMutation.mutate(snippet.id)}
            className="p-1 hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary rounded"
            title={snippet.is_public ? translate('action.makePrivate') : translate('action.makePublic')}
          >
            {snippet.is_public ? (
              <Lock className="w-4 h-4 text-gray-600" />
            ) : (
              <Globe className="w-4 h-4 text-green-600" />
            )}
          </button>
          <button
            onClick={() => setDeleteSnippetId(snippet.id)}
            className="p-1 hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary rounded text-red-600 dark:text-red-400"
            title={translate('action.delete')}
          >
            <Trash2 className="w-4 h-4" />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-4">
      {/* Offensive Content Alert */}
      {showOffensiveOnly && total > 0 && (
        <div className="flex items-center gap-2 text-red-600 dark:text-red-400 font-medium">
          <AlertTriangle className="w-5 h-5" />
          <span>
            {
              translate(
                'offensiveContentMessage',
                {
                  total,
                  entityName: translate('entityName', { count: total })
                }
              )
            }
          </span>
        </div>
      )}

      {/* Filters with Offensive Scan Toggle */}
      <div className="flex flex-col sm:flex-row gap-4">
        {!showOffensiveOnly && (
          <>
            <FilterInput
              value={search}
              onChange={(value) => {
                setSearch(value);
                setOffset(0);
              }}
              placeholder={translate('filters.search')}
              className="flex-1"
              showSearchIcon
            />
            <FilterInput
              value={userId}
              onChange={(value) => {
                setUserId(value);
                setOffset(0);
              }}
              placeholder={translate('filters.userId')}
              className="w-32"
            />
            <FilterSelect
              value={isPublic}
              onChange={(value) => {
                setIsPublic(value);
                setOffset(0);
              }}
              options={[
                { value: 'true', label: translate('filters.visibility.public') },
                { value: 'false', label: translate('filters.visibility.private') },
              ]}
              placeholder={translate('filters.visibility.all')}
            />
          </>
        )}
        <IconButton
          icon={<AlertTriangle className="w-4 h-4" />}
          onClick={handleToggleOffensiveScan}
          label={showOffensiveOnly ? translate('action.showAllSnippets') : translate('action.scanForOffensiveContent')}
          variant={showOffensiveOnly ? 'danger' : 'secondary'}
          showLabel
          size="md"
          className="px-4 whitespace-nowrap"
        />
      </div>

      {!showOffensiveOnly && (
        <ResultsCount offset={offset} limit={limit} total={total} entityName={translate('entityName', { count: total })} />
      )}

      <AdminTable
        columns={columns}
        data={snippets}
        isLoading={isLoading}
        emptyMessage={translate('table.emptyMessage')}
        loadingMessage={translate('table.loadingMessage')}
        getRowKey={(snippet) => snippet.id}
      />

      {!showOffensiveOnly && (
        <Pagination
          offset={offset}
          limit={limit}
          total={total}
          onPrevious={() => setOffset(Math.max(0, offset - limit))}
          onNext={() => setOffset(offset + limit)}
        />
      )}

      {/* Delete Confirmation Modal */}
      <ConfirmationModal
        isOpen={deleteSnippetId !== null}
        onClose={() => setDeleteSnippetId(null)}
        onConfirm={() => deleteSnippetId && deleteMutation.mutate(deleteSnippetId)}
        title={translate('confirmationModal.title')}
        message={translate('confirmationModal.message')}
        confirmLabel={t('action.delete')}
        cancelLabel={t('action.cancel')}
        variant="danger"
      />

      {/* Snippet View Modal */}
      <SnippetViewModal
        snippetId={viewSnippetId}
        onClose={() => setViewSnippetId(null)}
      />
    </div>
  );
};
````

## File: client/src/components/admin/tabs/UsersTab.tsx
````typescript
import React, { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { Trash2, ToggleLeft, ToggleRight } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { adminApi } from '../../../utils/api/admin';
import { useToast } from '../../../hooks/useToast';
import { ConfirmationModal } from '../../common/modals/ConfirmationModal';
import { useDebounce } from '../../../hooks/useDebounce';
import {
  FilterInput,
  FilterSelect,
  AdminTable,
  Pagination,
  ResultsCount,
  StatusBadge,
  formatDate,
  type TableColumn,
} from '../common';

export const UsersTab: React.FC = () => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/admin/tabs/users');
  const [search, setSearch] = useState('');
  const [authType, setAuthType] = useState('');
  const [isActive, setIsActive] = useState('');
  const [offset, setOffset] = useState(0);
  const [deleteUserId, setDeleteUserId] = useState<number | null>(null);
  const limit = 50;

  const debouncedSearch = useDebounce(search, 300);
  const { addToast } = useToast();
  const queryClient = useQueryClient();

  const { data, isLoading } = useQuery({
    queryKey: ['admin', 'users', offset, debouncedSearch, authType, isActive],
    queryFn: () =>
      adminApi.getUsers({
        offset,
        limit,
        search: debouncedSearch,
        authType,
        isActive,
      }),
  });

  const deleteMutation = useMutation({
    mutationFn: (id: number) => adminApi.deleteUser(id),
    onSuccess: () => {
      addToast(translate('success.delete.default'), 'success');
      queryClient.invalidateQueries({ queryKey: ['admin', 'users'] });
      queryClient.invalidateQueries({ queryKey: ['admin', 'stats'] });
      setDeleteUserId(null);
    },
    onError: (error: any) => {
      addToast(error.message || translate('error.delete.default'), 'error');
    },
  });

  const toggleActiveMutation = useMutation({
    mutationFn: (id: number) => adminApi.toggleUserActive(id),
    onSuccess: () => {
      addToast(translate('success.update.default'), 'success');
      queryClient.invalidateQueries({ queryKey: ['admin', 'users'] });
    },
    onError: (error: any) => {
      addToast(error.message || translate('error.update.default'), 'error');
    },
  });

  const users = data?.users || [];
  const total = data?.total || 0;

  const columns: TableColumn<any>[] = [
    {
      key: 'id',
      label: 'ID',
      render: (user) => (
        <span className="whitespace-nowrap text-light-text dark:text-dark-text">
          {user.id}
        </span>
      ),
    },
    {
      key: 'username',
      label: translate('columns.labels.username'),
      render: (user) => (
        <span className="whitespace-nowrap text-light-text dark:text-dark-text">
          {user.username}
          {
            user.is_admin
              ? (
                  <span className="ml-2 px-2 py-0.5 text-xs bg-light-primary dark:bg-dark-primary text-white rounded">
                    Admin
                  </span>
                )
              : null
          }
        </span>
      ),
    },
    {
      key: 'email',
      label: translate('columns.labels.email'),
      render: (user) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {user.email || '-'}
        </span>
      ),
    },
    {
      key: 'auth_type',
      label: translate('columns.labels.authType'),
      render: (user) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {user.oidc_id ? translate('filters.authType.oidc') : translate('filters.authType.internal')}
        </span>
      ),
    },
    {
      key: 'created_at',
      label: translate('columns.labels.created'),
      render: (user) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {formatDate(user.created_at)}
        </span>
      ),
    },
    {
      key: 'last_login_at',
      label: translate('columns.labels.lastLogin'),
      render: (user) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {formatDate(user.last_login_at)}
        </span>
      ),
    },
    {
      key: 'snippet_count',
      label: translate('columns.labels.snippetsCount'),
      render: (user) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {user.snippet_count}
        </span>
      ),
    },
    {
      key: 'api_key_count',
      label: translate('columns.labels.apiKeysCount'),
      render: (user) => (
        <span className="whitespace-nowrap text-light-text-secondary dark:text-dark-text-secondary">
          {user.api_key_count}
        </span>
      ),
    },
    {
      key: 'status',
      label: translate('columns.labels.status'),
      render: (user) => (
        <span className="whitespace-nowrap">
          <StatusBadge
            label={user.is_active ? translate('status.active') : translate('status.inactive')}
            variant={user.is_active ? 'success' : 'danger'}
          />
        </span>
      ),
    },
    {
      key: 'actions',
      label: translate('columns.labels.actions'),
      render: (user) => (
        <div className="flex items-center gap-2 whitespace-nowrap">
          <button
            onClick={() => toggleActiveMutation.mutate(user.id)}
            className="p-1 hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary rounded"
            title={user.is_active ? translate('action.deactivate') : translate('action.activate')}
          >
            {user.is_active ? (
              <ToggleRight className="w-4 h-4 text-green-600" />
            ) : (
              <ToggleLeft className="w-4 h-4 text-gray-400" />
            )}
          </button>
          <button
            onClick={() => setDeleteUserId(user.id)}
            className="p-1 hover:bg-light-bg-secondary dark:hover:bg-dark-bg-secondary rounded text-red-600 dark:text-red-400"
            title={translate('action.delete')}
          >
            <Trash2 className="w-4 h-4" />
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-4">
      {/* Filters */}
      <div className="flex flex-col sm:flex-row gap-4">
        <FilterInput
          value={search}
          onChange={(value) => {
            setSearch(value);
            setOffset(0);
          }}
          placeholder={translate('filters.search')}
          className="flex-1"
          showSearchIcon
        />
        <FilterSelect
          value={authType}
          onChange={(value) => {
            setAuthType(value);
            setOffset(0);
          }}
          options={[
            { value: 'internal', label: translate('filters.authType.internal') },
            { value: 'oidc', label: translate('filters.authType.oidc') },
          ]}
          placeholder={translate('filters.authType.all')}
        />
        <FilterSelect
          value={isActive}
          onChange={(value) => {
            setIsActive(value);
            setOffset(0);
          }}
          options={[
            { value: 'true', label: translate('filters.status.active') },
            { value: 'false', label: translate('filters.status.inactive') },
          ]}
          placeholder={translate('filters.status.all')}
        />
      </div>

      <ResultsCount offset={offset} limit={limit} total={total} entityName={translate('entityName', { count: total })} />

      <AdminTable
        columns={columns}
        data={users}
        isLoading={isLoading}
        emptyMessage={translate('table.emptyMessage')}
        loadingMessage={translate('table.loadingMessage')}
        getRowKey={(user) => user.id}
      />

      <Pagination
        offset={offset}
        limit={limit}
        total={total}
        onPrevious={() => setOffset(Math.max(0, offset - limit))}
        onNext={() => setOffset(offset + limit)}
      />

      {/* Delete Confirmation Modal */}
      <ConfirmationModal
        isOpen={deleteUserId !== null}
        onClose={() => setDeleteUserId(null)}
        onConfirm={() => deleteUserId && deleteMutation.mutate(deleteUserId)}
        title={translate('confirmationModal.title')}
        message={translate('confirmationModal.message')}
        confirmLabel={t('action.delete')}
        cancelLabel={t('action.cancel')}
        variant="danger"
      />
    </div>
  );
};
````

## File: client/src/components/admin/AdminPage.tsx
````typescript
import React from 'react';
import { Navigate, Routes, Route, useLocation } from 'react-router-dom';
import { useAuth } from '../../hooks/useAuth';
import { ROUTES } from '../../constants/routes';
import { DashboardTab } from './tabs/DashboardTab';
import { UsersTab } from './tabs/UsersTab';
import { SnippetsTab } from './tabs/SnippetsTab';
import { ApiKeysTab } from './tabs/ApiKeysTab';
import { SharesTab } from './tabs/SharesTab';
import { AppHeader } from '../common/layout/AppHeader';
import { UserDropdown } from '../auth/UserDropdown';
import AdminSelector from './AdminSelector';

export const AdminPage: React.FC = () => {
  const { user } = useAuth();
  const location = useLocation();

  if (!user?.is_admin) {
    return <Navigate to={ROUTES.HOME} replace />;
  }

  // Derive selected tab from URL
  const getSelectedTab = (): 'dashboard' | 'users' | 'snippets' | 'api-keys' | 'shares' => {
    if (location.pathname.includes('/admin/users')) return 'users';
    if (location.pathname.includes('/admin/snippets')) return 'snippets';
    if (location.pathname.includes('/admin/api-keys')) return 'api-keys';
    if (location.pathname.includes('/admin/shares')) return 'shares';
    return 'dashboard';
  };

  return (
    <div className="min-h-screen p-8 bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text">
      <div className="flex items-start justify-between mb-4">
        <AppHeader>
          <AdminSelector selected={getSelectedTab()} />
        </AppHeader>
        <UserDropdown />
      </div>

      {/* Tab Content */}
      <div>
        <Routes>
          <Route path="dashboard" element={<DashboardTab />} />
          <Route path="users" element={<UsersTab />} />
          <Route path="snippets" element={<SnippetsTab />} />
          <Route path="api-keys" element={<ApiKeysTab />} />
          <Route path="shares" element={<SharesTab />} />
          <Route path="/" element={<Navigate to={ROUTES.ADMIN_DASHBOARD} replace />} />
        </Routes>
      </div>
    </div>
  );
};
````

## File: client/src/components/admin/AdminSelector.tsx
````typescript
import React from 'react';
import { useNavigate } from 'react-router-dom';
import { Home, Users, FileCode, Key, Share2 } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { ROUTES } from '../../constants/routes';

interface AdminSelectorProps {
  selected: 'dashboard' | 'users' | 'snippets' | 'api-keys' | 'shares';
}

const AdminSelector: React.FC<AdminSelectorProps> = ({ selected }) => {
  const navigate = useNavigate();
  const { t: translate } = useTranslation('components/admin/selector');

  const options = [
    { value: 'dashboard' as const, label: translate('dashboard'), icon: Home, route: ROUTES.ADMIN_DASHBOARD },
    { value: 'users' as const, label: translate('users'), icon: Users, route: ROUTES.ADMIN_USERS },
    { value: 'snippets' as const, label: translate('snippets'), icon: FileCode, route: ROUTES.ADMIN_SNIPPETS },
    { value: 'api-keys' as const, label: translate('apiKeys'), icon: Key, route: ROUTES.ADMIN_API_KEYS },
    { value: 'shares' as const, label: translate('shares'), icon: Share2, route: ROUTES.ADMIN_SHARES },
  ];

  return (
    <div className="flex items-center gap-3 text-sm text-light-text dark:text-dark-text">
      <div
        className="flex gap-0.5 rounded-lg bg-light-surface dark:bg-dark-surface px-0.5 py-0.5 min-w-[400px]"
        role="group"
      >
        {options.map(({ value, label, icon: Icon, route }) => (
          <button
            key={value}
            type="button"
            onClick={() => navigate(route)}
            className={`
              flex items-center justify-center gap-1.5 px-3 py-0.5 rounded-md transition-all duration-200 flex-1
              ${selected === value
                ? 'bg-light-hover dark:bg-dark-hover'
                : 'hover:bg-light-hover/50 dark:hover:bg-dark-hover/50'
              }
            `}
          >
            <Icon
              className={`
                stroke-[2] transition-colors duration-200
                ${selected === value ? 'text-light-primary dark:text-dark-primary' : 'text-light-text/50 dark:text-dark-text/50'}
              `}
              size={14}
            />
            <span className="text-xs font-medium">{label}</span>
          </button>
        ))}
      </div>
    </div>
  );
};

export default AdminSelector;
````

## File: client/src/components/auth/oidc/OIDCCallback.tsx
````typescript
import React, { useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../../../hooks/useAuth';
import { Loader2 } from 'lucide-react';
import { PageContainer } from '../../common/layout/PageContainer';
import { useOidcErrorHandler } from '../../../hooks/useOidcErrorHandler';
import { useToast } from '../../../hooks/useToast';

export const OIDCCallback: React.FC = () => {
  const { t: translate } = useTranslation('components/auth');
  const navigate = useNavigate();
  const { login } = useAuth();
  const { addToast } = useToast();
  const handleOIDCError = useOidcErrorHandler();
  const processedRef = useRef(false);

  useEffect(() => {
    if (processedRef.current) return;
    processedRef.current = true;

    const params = new URLSearchParams(window.location.search);
    const token = params.get('token');
    const error = params.get('error');
    const message = params.get('message');

    if (token) {
      login(token, null);
      navigate('/', { replace: true });
    } else if (error) {
      handleOIDCError(error, undefined, message || undefined);
      navigate('/login', { replace: true });
    } else {
      handleOIDCError('auth_failed');
      navigate('/login', { replace: true });
    }
  }, [login, navigate, addToast]);

  return (
    <PageContainer>
      <div className="min-h-screen flex items-center justify-center">
        <div className="flex items-center gap-3">
          <Loader2 className="w-6 h-6 text-light-text-secondary dark:text-dark-text-secondary animate-spin" />
          <span className="text-light-text dark:text-dark-text text-lg">{translate('signIn.completing')}</span>
        </div>
      </div>
    </PageContainer>
  );
};
````

## File: client/src/components/auth/oidc/OIDCLogoutCallback.tsx
````typescript
import React, { useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../../../hooks/useAuth';
import { Loader2 } from 'lucide-react';
import { PageContainer } from '../../common/layout/PageContainer';

export const OIDCLogoutCallback: React.FC = () => {
  const { t: translate } = useTranslation('components/auth');
  const navigate = useNavigate();
  const { logout } = useAuth();
  const processedRef = useRef(false);

  useEffect(() => {
      if (processedRef.current) return;
      processedRef.current = true;

      logout();
      navigate('/', { replace: true });
  }, [logout]);

  return (
    <PageContainer>
      <div className="min-h-screen flex items-center justify-center">
        <div className="flex items-center gap-3">
          <Loader2 className="w-6 h-6 text-light-text-secondary dark:text-dark-text-secondary animate-spin" />
          <span className="text-light-text dark:text-dark-text text-lg">{translate('signOut.completing')}</span>
        </div>
      </div>
    </PageContainer>
  );
};
````

## File: client/src/components/auth/ApiKeysModal.tsx
````typescript
import React, { useEffect, useState } from 'react';
import { Key, Plus, Trash2, X } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import Modal from '../common/modals/Modal';
import { ApiKey } from '../../types/apiKey';
import { getApiKeys, createApiKey, deleteApiKey } from '../../utils/api/apiKeys';
import { PreviewCodeBlock } from '../editor/PreviewCodeBlock';
import { IconButton } from '../common/buttons/IconButton';

interface ApiKeysModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export const ApiKeysModal: React.FC<ApiKeysModalProps> = ({ isOpen, onClose }) => {
  const { t: translate } = useTranslation('components/auth');
  const [apiKeys, setApiKeys] = useState<ApiKey[]>([]);
  const [newKeyName, setNewKeyName] = useState('');
  const [isCreating, setIsCreating] = useState(false);
  const [newKey, setNewKey] = useState<string | null>(null);

  useEffect(() => {
    if (isOpen) {
      setNewKey(null);
      loadApiKeys();
    }
  }, [isOpen]);

  const loadApiKeys = async () => {
    try {
      const keys = await getApiKeys();
      setApiKeys(keys);
    } catch (error) {
      console.error('Failed to load API keys:', error);
    }
  };

  const handleCreateKey = async () => {
    if (!newKeyName.trim()) return;

    try {
      setIsCreating(true);
      const response = await createApiKey({ name: newKeyName.trim() });
      setNewKey(response.key);
      setNewKeyName('');
      await loadApiKeys();
    } catch (error) {
      console.error('Failed to create API key:', error);
    } finally {
      setIsCreating(false);
    }
  };

  const handleDeleteKey = async (id: string) => {
    try {
      await deleteApiKey(id);
      await loadApiKeys();
    } catch (error) {
      console.error('Failed to delete API key:', error);
    }
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} title={translate('apiKeysModal.title')}>
      <div className="space-y-4">
        {/* Create new key section */}
        <div className="space-y-2">
          <div className="flex gap-2">
            <input
              type="text"
              value={newKeyName}
              onChange={(e) => setNewKeyName(e.target.value)}
              placeholder={translate('apiKeysModal.enterKeyName')}
              className="flex-1 px-3 py-2 bg-light-hover dark:bg-dark-hover border border-light-border
                dark:border-dark-border rounded-md text-sm text-light-text dark:text-dark-text
                focus:border-light-primary dark:focus:border-dark-primary outline-none
                transition-colors"
            />
            <IconButton
              icon={<Plus size={20} />}
              label={translate('apiKeysModal.createKey')}
              onClick={handleCreateKey}
              variant="action"
              className="h-10 pl-2 pr-4"
              showLabel={true}
              disabled={isCreating || !newKeyName.trim()}
            />
          </div>

          {/* Display newly created key */}
          {newKey && (
            <div className="p-3 bg-light-hover dark:bg-dark-hover rounded-md space-y-2">
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium text-light-text dark:text-dark-text">
                  {translate('apiKeysModal.newApiKey')}
                </span>
                <button
                  onClick={() => setNewKey(null)}
                  className="text-light-text-secondary dark:text-dark-text-secondary
                    hover:text-light-primary dark:hover:text-dark-primary transition-colors"
                >
                  <X size={16} />
                </button>
              </div>
              <PreviewCodeBlock
                code={newKey}
                language='plaintext'
                showLineNumbers={false}
                previewLines={1}
              />
            </div>
          )}
        </div>

        {/* List of existing keys */}
        <div className="space-y-2">
          <h3 className="text-sm font-medium text-light-text dark:text-dark-text">{translate('apiKeysModal.yourApiKeys')}</h3>
          <div className="space-y-2">
            {apiKeys.map((key) => (
              <div
                key={key.id}
                className="flex items-center justify-between p-3 bg-light-surface dark:bg-dark-surface
                  border border-light-border dark:border-dark-border rounded-md hover:bg-light-hover-more
                  dark:hover:bg-dark-hover-more transition-colors"
              >
                <div className="space-y-1">
                  <div className="flex items-center gap-2">
                    <Key size={16} className="text-light-text dark:text-dark-text" />
                    <span className="text-sm font-medium text-light-text dark:text-dark-text">
                      {key.name}
                    </span>
                  </div>
                  <div className="text-xs text-light-text-secondary dark:text-dark-text-secondary">
                    {translate('apiKeysModal.created')}: {new Date(key.created_at).toLocaleDateString()}
                    {key.last_used && ` • ${translate('apiKeysModal.lastUsed')}: ${new Date(key.last_used).toLocaleDateString()}`}
                  </div>
                </div>
                <button
                  onClick={() => handleDeleteKey(key.id)}
                  className="p-1 text-light-text-secondary dark:text-dark-text-secondary
                    hover:text-red-500 transition-colors"
                  aria-label={translate('apiKeysModal.deleteApiKey')}
                >
                  <Trash2 size={16} />
                </button>
              </div>
            ))}
            {apiKeys.length === 0 && (
              <div className="text-sm text-light-text-secondary dark:text-dark-text-secondary text-center py-4">
                {translate('apiKeysModal.notApiKeys')}
              </div>
            )}
          </div>
        </div>
      </div>
    </Modal>
  );
};
````

## File: client/src/components/auth/ChangePasswordModal.tsx
````typescript
import React, { useState } from 'react';
import { Eye, EyeOff } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import Modal from '../common/modals/Modal';
import { useToast } from '../../hooks/useToast';
import { changePassword } from '../../utils/api/auth';

interface ChangePasswordModalProps {
  isOpen: boolean;
  onClose: () => void;
  onPasswordChanged: () => void;
}

export const ChangePasswordModal: React.FC<ChangePasswordModalProps> = ({
  isOpen,
  onClose,
  onPasswordChanged,
}) => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/auth');
  const [currentPassword, setCurrentPassword] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [showCurrentPassword, setShowCurrentPassword] = useState(false);
  const [showNewPassword, setShowNewPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const { addToast } = useToast();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    if (newPassword !== confirmPassword) {
      addToast(translate('changePasswordModal.error.newPasswordsDoNotMatch'), 'error');
      return;
    }

    if (newPassword.length < 8) {
      addToast(translate('changePasswordModal.error.newPasswordMustBeAtLeastCharacters', { minLength: 8 }), 'error');
      return;
    }

    setIsLoading(true);
    
    try {
      await changePassword(currentPassword, newPassword);
      addToast(translate('changePasswordModal.passwordChangedSuccessfully'), 'success');
      setCurrentPassword('');
      setNewPassword('');
      setConfirmPassword('');
      onClose();
      onPasswordChanged();
    } catch (error: any) {
      const errorMessage = typeof error === 'string'
        ? error
        : (
          typeof error?.error === 'string'
            ? error.error
            : error?.response?.data?.error || translate('changePasswordModal.error.default')
        );

      addToast(errorMessage, 'error');
    } finally {
      setIsLoading(false);
    }
  };

  const handleClose = () => {
    setCurrentPassword('');
    setNewPassword('');
    setConfirmPassword('');
    onClose();
  };

  return (
    <Modal isOpen={isOpen} onClose={handleClose} title={translate('changePasswordModal.title')}>
      <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-light-text dark:text-dark-text mb-1">
              {translate('changePasswordModal.currentPassword')}
            </label>
            <div className="relative">
              <input
                type={showCurrentPassword ? 'text' : 'password'}
                value={currentPassword}
                onChange={(e) => setCurrentPassword(e.target.value)}
                className="w-full px-3 py-2 pr-10 border border-light-border dark:border-dark-border rounded-md 
                  bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text
                  focus:outline-none focus:ring-2 focus:ring-blue-500"
                required
                disabled={isLoading}
              />
              <button
                type="button"
                onClick={() => setShowCurrentPassword(!showCurrentPassword)}
                className="absolute right-2 top-1/2 -translate-y-1/2 text-light-text-secondary dark:text-dark-text-secondary 
                  hover:text-light-text dark:hover:text-dark-text"
              >
                {showCurrentPassword ? <EyeOff size={16} /> : <Eye size={16} />}
              </button>
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-light-text dark:text-dark-text mb-1">
              {translate('changePasswordModal.newPassword')}
            </label>
            <div className="relative">
              <input
                type={showNewPassword ? 'text' : 'password'}
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
                className="w-full px-3 py-2 pr-10 border border-light-border dark:border-dark-border rounded-md 
                  bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text
                  focus:outline-none focus:ring-2 focus:ring-blue-500"
                required
                minLength={8}
                disabled={isLoading}
              />
              <button
                type="button"
                onClick={() => setShowNewPassword(!showNewPassword)}
                className="absolute right-2 top-1/2 -translate-y-1/2 text-light-text-secondary dark:text-dark-text-secondary 
                  hover:text-light-text dark:hover:text-dark-text"
              >
                {showNewPassword ? <EyeOff size={16} /> : <Eye size={16} />}
              </button>
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-light-text dark:text-dark-text mb-1">
              {translate('changePasswordModal.confirmNewPassword')}
            </label>
            <div className="relative">
              <input
                type={showConfirmPassword ? 'text' : 'password'}
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                className="w-full px-3 py-2 pr-10 border border-light-border dark:border-dark-border rounded-md 
                  bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text
                  focus:outline-none focus:ring-2 focus:ring-blue-500"
                required
                minLength={8}
                disabled={isLoading}
              />
              <button
                type="button"
                onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                className="absolute right-2 top-1/2 -translate-y-1/2 text-light-text-secondary dark:text-dark-text-secondary 
                  hover:text-light-text dark:hover:text-dark-text"
              >
                {showConfirmPassword ? <EyeOff size={16} /> : <Eye size={16} />}
              </button>
            </div>
          </div>

          <div className="flex gap-3 pt-4">
            <button
              type="button"
              onClick={handleClose}
              className="flex-1 px-4 py-2 text-sm font-medium text-light-text dark:text-dark-text 
                bg-light-surface dark:bg-dark-surface border border-light-border dark:border-dark-border 
                rounded-md hover:bg-light-hover dark:hover:bg-dark-hover"
              disabled={isLoading}
            >
              {t('action.cancel')}
            </button>
            <button
              type="submit"
              className="flex-1 px-4 py-2 text-sm font-medium text-white bg-blue-600 
                hover:bg-blue-700 rounded-md disabled:opacity-50 disabled:cursor-not-allowed"
              disabled={isLoading}
            >
              {isLoading ? translate('changePasswordModal.process') : t('action.changePassword')}
            </button>
          </div>
        </form>
      </Modal>
    );
};
````

## File: client/src/components/auth/LoginPage.tsx
````typescript
import React, { useState, useEffect } from 'react';
import { Eye, EyeClosed } from 'lucide-react';
import { Link, Navigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../../hooks/useAuth';
import { PageContainer } from '../common/layout/PageContainer';
import { login as loginApi } from '../../utils/api/auth';
import { useToast } from '../../hooks/useToast';
import { useOidcErrorHandler } from '../../hooks/useOidcErrorHandler';
import { ROUTES } from '../../constants/routes';
import { OIDCConfig } from '../../types/auth';
import { apiClient } from '../../utils/api/apiClient';

export const LoginPage: React.FC = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [isPasswordVisible, setIsPasswordVisible] = useState(false);
  const [oidcConfig, setOIDCConfig] = useState<OIDCConfig | null>(null);
  const { login, isAuthenticated, authConfig } = useAuth();
  const { addToast } = useToast();
  const handleOIDCError = useOidcErrorHandler();
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/auth');

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const error = params.get('error');
    const message = params.get('message');
    
    if (error) {
      handleOIDCError(error, oidcConfig?.displayName, message || undefined);
    }
  }, [oidcConfig]);

  useEffect(() => {
    const fetchOIDCConfig = async () => {
      try {
        const response = await apiClient.get<OIDCConfig>('/api/auth/oidc/config');
        setOIDCConfig(response);
      } catch (error) {
        console.error('Failed to fetch OIDC config:', error);
      }
    };
    
    fetchOIDCConfig();
  }, []);

  if (isAuthenticated) {
    return <Navigate to="/" replace />;
  }

  if (authConfig && !authConfig.hasUsers) {
    return <Navigate to="/register" replace />;
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);

    try {
      const { token, user } = await loginApi(username, password);
      login(token, user);
    } catch (err: any) {
      addToast(translate('login.error.invalidUsernameOrPassword'), 'error');
    } finally {
      setIsLoading(false);
    }
  };

  const handleOIDCLogin = () => {
    window.location.href = `${window.__BASE_PATH__ || ''}/api/auth/oidc/auth`;
  };

  const showInternalRegistration = !authConfig?.disableInternalAccounts;

  return (
    <PageContainer className="flex items-center justify-center min-h-screen">
      <div className="max-w-md w-full space-y-8">
        <div>
          <h2 className="mt-6 text-center text-3xl font-bold text-light-text dark:text-dark-text">
            ByteStash
          </h2>
          <p className="mt-2 text-center text-sm text-light-text-secondary dark:text-dark-text-secondary">
            {translate('login.pleaseSignInToContinue')}
            {authConfig?.allowNewAccounts && showInternalRegistration ? (
              <>
                , {translate('login.create')}{' '}
                <Link to="/register" className="text-light-primary dark:text-dark-primary hover:opacity-80">
                  {translate('login.account')}
                </Link>
                {' '}{t('or')}{' '}
              </>
            ) : (
              ` ${t('or')} `
            )}
            <Link to={ROUTES.PUBLIC_SNIPPETS} className="text-light-primary dark:text-dark-primary hover:opacity-80">
              {translate('login.browsePublicSnippets')}
            </Link>
          </p>
        </div>

        {oidcConfig?.enabled && (
          <>
            <button
              onClick={handleOIDCLogin}
              className="w-full flex items-center justify-center gap-2 px-4 py-2 
                bg-light-primary dark:bg-dark-primary text-white rounded-md hover:opacity-90 transition-colors"
            >
              {translate('signIn.with', { displayName: oidcConfig.displayName })}
            </button>
            {showInternalRegistration && (
              <div className="relative my-6">
                <div className="absolute inset-0 flex items-center">
                  <div className="w-full border-t border-light-border dark:border-dark-border"></div>
                </div>
                <div className="relative flex justify-center">
                  <span className="px-2 bg-light-bg dark:bg-dark-bg text-light-text-secondary dark:text-dark-text-secondary text-sm">
                    {translate('login.orContinueWithPassword')}
                  </span>
                </div>
              </div>
            )}
          </>
        )}

        {showInternalRegistration && (
          <form className="mt-8 space-y-6" onSubmit={handleSubmit}>
            <div className="rounded-md shadow-sm -space-y-px">
              <div>
                <input
                  type="text"
                  required
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border 
                    border-light-border dark:border-dark-border placeholder-light-text-secondary dark:placeholder-dark-text-secondary 
                    text-light-text dark:text-dark-text bg-light-surface dark:bg-dark-surface rounded-t-md 
                    focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary focus:border-light-primary dark:focus:border-dark-primary focus:z-10 sm:text-sm"
                  placeholder={t('username')}
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  disabled={isLoading}
                />
              </div>
              <div className="relative">
                <input
                  type={isPasswordVisible ? 'text' : 'password'}
                  required
                  className="appearance-none rounded-none relative block w-full px-3 py-2 pr-10 border 
                    border-light-border dark:border-dark-border placeholder-light-text-secondary dark:placeholder-dark-text-secondary 
                    text-light-text dark:text-dark-text bg-light-surface dark:bg-dark-surface rounded-b-md 
                    focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary 
                    focus:border-light-primary dark:focus:border-dark-primary sm:text-sm"
                  placeholder={t('password')}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  disabled={isLoading}
                />
                <button
                  type="button"
                  onClick={() => setIsPasswordVisible(!isPasswordVisible)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 z-10 text-gray-700 dark:text-gray-500 focus:outline-none"
                  aria-label={
                    isPasswordVisible
                      ? t('action.hidePassword')
                      : t('action.showPassword')
                  }
                >
                  {isPasswordVisible ? <EyeClosed size={18} /> : <Eye size={18} />}
                </button>
              </div>


            </div>

            <div>
              <button
                type="submit"
                className="group relative w-full flex justify-center py-2 px-4 border border-transparent 
                  text-sm font-medium rounded-md text-white bg-light-primary dark:bg-dark-primary hover:opacity-90
                  focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-light-primary dark:focus:ring-dark-primary 
                  disabled:opacity-50 disabled:cursor-not-allowed"
                disabled={isLoading}
              >
                {isLoading ? (
                  <span className="flex items-center">
                    <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    {translate('login.signingIn')}
                  </span>
                ) : (
                  t('action.signIn')
                )}
              </button>
            </div>
          </form>
        )}
      </div>
    </PageContainer>
  );
};
````

## File: client/src/components/auth/RegisterPage.tsx
````typescript
import React, { useEffect, useState } from 'react';
import { Link, Navigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../../hooks/useAuth';
import { register } from '../../utils/api/auth';
import { PageContainer } from '../common/layout/PageContainer';
import { useToast } from '../../hooks/useToast';
import { useOidcErrorHandler } from '../../hooks/useOidcErrorHandler';
import { AlertCircle } from 'lucide-react';
import { ROUTES } from '../../constants/routes';
import { OIDCConfig } from '../../types/auth';
import { apiClient } from '../../utils/api/apiClient';
import { capitalizeFirstLetter } from '../../utils/helpers/changeCaseUtils';

export const RegisterPage: React.FC = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [oidcConfig, setOIDCConfig] = useState<OIDCConfig | null>(null);
  const { login, authConfig, isAuthenticated, refreshAuthConfig } = useAuth();
  const { addToast } = useToast();
  const handleOIDCError = useOidcErrorHandler();
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/auth');

  useEffect(() => {
    const fetchOIDCConfig = async () => {
      try {
        const response = await apiClient.get<OIDCConfig>('/api/auth/oidc/config');
        setOIDCConfig(response);
      } catch (error) {
        console.error('Failed to fetch OIDC config:', error);
      }
    };
    
    fetchOIDCConfig();
  }, []);

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const error = params.get('error');
    const message = params.get('message');
    
    if (error) {
      handleOIDCError(error, oidcConfig?.displayName, message || undefined);
    }
  }, [oidcConfig]);

  if (isAuthenticated) {
    return <Navigate to="/" replace />;
  }

  if (!authConfig?.allowNewAccounts && authConfig?.hasUsers) {
    return (
      <PageContainer className="flex items-center justify-center min-h-screen">
        <div className="text-center">
          <h2 className="text-2xl font-bold mb-4 text-light-text dark:text-dark-text">{translate('register.disabled.title')}</h2>
          <p className="text-light-text-secondary dark:text-dark-text-secondary mb-4">{translate('register.disabled.description')}</p>
          <Link
            to="/login" 
            className="text-light-primary dark:text-dark-primary hover:opacity-80"
          >
            {translate('register.disabled.link.text')}
          </Link>
        </div>
      </PageContainer>
    );
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);

    if (password !== confirmPassword) {
      addToast(translate('register.error.passwordsDoNotMatch'), 'error');
      setIsLoading(false);
      return;
    }

    try {
      const response = await register(username, password);
      if (response.token && response.user) {
        await refreshAuthConfig();
        login(response.token, response.user);
      }
    } catch (err: any) {
      const errorMessage = err.error || translate('register.error.default');
      addToast(errorMessage, 'error');
    } finally {
      setIsLoading(false);
    }
  };

  const handleOIDCLogin = () => {
    window.location.href = `${window.__BASE_PATH__ || ''}/api/auth/oidc/auth`;
  };

  const showInternalRegistration = !authConfig?.disableInternalAccounts;

  return (
    <PageContainer className="flex items-center justify-center min-h-screen">
      <div className="max-w-md w-full space-y-6">
        <div>
          <h2 className="mt-6 text-center text-3xl font-bold text-light-text dark:text-dark-text">
            {translate('register.title')}
          </h2>
          <p className="mt-2 text-center text-sm text-light-text-secondary dark:text-dark-text-secondary">
            {authConfig?.hasUsers ? (
              <>
                <Link to="/login" className="text-light-primary dark:text-dark-primary hover:opacity-80">
                  {capitalizeFirstLetter(translate('register.signInToYourAccount'))}
                </Link>
                {' '}{t('or')}{' '}
                <Link to={ROUTES.PUBLIC_SNIPPETS} className="text-light-primary dark:text-dark-primary hover:opacity-80">
                  {translate('register.browsePublicSnippets')}
                </Link>
              </>
            ) : (
              <div className="mt-4 relative overflow-hidden">
                <div className="rounded-xl bg-light-primary/10 dark:bg-dark-primary/10 p-4 border border-light-primary/20 dark:border-dark-primary/20">
                  <div className="flex gap-3 items-start">
                    <div className="w-5 h-5 rounded-full bg-light-primary/20 dark:bg-dark-primary/20 flex items-center justify-center flex-shrink-0 mt-0.25">
                      <AlertCircle size={14} className="text-light-primary dark:text-dark-primary" />
                    </div>
                    <p className="text-sm text-light-text dark:text-dark-text text-left">
                      {translate('register.firstAccountDescription')}
                    </p>
                  </div>
                </div>
              </div>
            )}
          </p>
        </div>

        {oidcConfig?.enabled && (
          <>
            <button
              onClick={handleOIDCLogin}
              className="w-full flex items-center justify-center gap-2 px-4 py-2 
                bg-light-primary dark:bg-dark-primary text-white rounded-md hover:opacity-90 transition-colors"
            >
              {translate('signIn.with', { displayName: oidcConfig.displayName })}
            </button>
            {showInternalRegistration && (
              <div className="relative my-6">
                <div className="absolute inset-0 flex items-center">
                  <div className="w-full border-t border-light-border dark:border-dark-border"></div>
                </div>
                <div className="relative flex justify-center">
                  <span className="px-2 bg-light-bg dark:bg-dark-bg text-light-text-secondary dark:text-dark-text-secondary text-sm">
                    {translate('login.orContinueWithPassword')}
                  </span>
                </div>
              </div>
            )}
          </>
        )}

        {showInternalRegistration && (
          <form className="mt-8 space-y-6" onSubmit={handleSubmit}>
            <div className="rounded-md shadow-sm -space-y-px">
              <div>
                <label htmlFor="username" className="sr-only">{t('username')}</label>
                <input
                  id="username"
                  type="text"
                  required
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border 
                    border-light-border dark:border-dark-border placeholder-light-text-secondary dark:placeholder-dark-text-secondary 
                    text-light-text dark:text-dark-text bg-light-surface dark:bg-dark-surface rounded-t-md 
                    focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary focus:border-light-primary dark:focus:border-dark-primary focus:z-10 sm:text-sm"
                  placeholder={t('username')}
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  disabled={isLoading}
                />
              </div>
              <div>
                <label htmlFor="password" className="sr-only">{t('password')}</label>
                <input
                  id="password"
                  type="password"
                  required
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border 
                    border-light-border dark:border-dark-border placeholder-light-text-secondary dark:placeholder-dark-text-secondary 
                    text-light-text dark:text-dark-text bg-light-surface dark:bg-dark-surface
                    focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary focus:border-light-primary dark:focus:border-dark-primary focus:z-10 sm:text-sm"
                  placeholder={t('password')}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  disabled={isLoading}
                />
              </div>
              <div>
                <label htmlFor="confirm-password" className="sr-only">{t('confirmPassword')}</label>
                <input
                  id="confirm-password"
                  type="password"
                  required
                  className="appearance-none rounded-none relative block w-full px-3 py-2 border 
                    border-light-border dark:border-dark-border placeholder-light-text-secondary dark:placeholder-dark-text-secondary 
                    text-light-text dark:text-dark-text bg-light-surface dark:bg-dark-surface rounded-b-md
                    focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary focus:border-light-primary dark:focus:border-dark-primary focus:z-10 sm:text-sm"
                  placeholder={t('confirmPassword')}
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  disabled={isLoading}
                />
              </div>
            </div>

            <div>
              <button
                type="submit"
                className="group relative w-full flex justify-center py-2 px-4 border border-transparent 
                  text-sm font-medium rounded-md text-white bg-light-primary dark:bg-dark-primary hover:opacity-90
                  focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-light-primary dark:focus:ring-dark-primary 
                  disabled:opacity-50 disabled:cursor-not-allowed"
                disabled={isLoading}
              >
                {isLoading ? (
                  <span className="flex items-center">
                    <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    {translate('register.creatingAccount')}
                  </span>
                ) : (
                  t('action.createAccount')
                )}
              </button>
            </div>
          </form>
        )}

        {!showInternalRegistration && !oidcConfig?.enabled && (
          <div className="text-center">
            <h2 className="text-xl font-bold text-red-400 mb-4">{translate('register.notAvailable.title')}</h2>
            <p className="text-light-text-secondary dark:text-dark-text-secondary mb-4">
              {translate('register.notAvailable.description')}
            </p>
            <Link 
              to={ROUTES.PUBLIC_SNIPPETS}
              className="text-light-primary dark:text-dark-primary hover:opacity-80"
            >
              {capitalizeFirstLetter(translate('register.browsePublicSnippets'))}
            </Link>
          </div>
        )}
      </div>
    </PageContainer>
  );
};
````

## File: client/src/components/auth/UserDropdown.tsx
````typescript
import React, { useRef, useState, useEffect } from 'react';
import { LogOut, User, Key, Lock, Shield } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../../hooks/useAuth';
import { useOutsideClick } from '../../hooks/useOutsideClick';
import { Link, useNavigate } from 'react-router-dom';
import { ApiKeysModal } from './ApiKeysModal';
import { ChangePasswordModal } from './ChangePasswordModal';
import { apiClient } from '../../utils/api/apiClient';
import { OIDCConfig } from '../../types/auth';
import { ROUTES } from '../../constants/routes';

export const UserDropdown: React.FC = () => {
  const { t: translate } = useTranslation('components/auth');
  const [isOpen, setIsOpen] = useState(false);
  const [isApiKeysModalOpen, setIsApiKeysModalOpen] = useState(false);
  const [isChangePasswordModalOpen, setIsChangePasswordModalOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);
  const { user, logout, authConfig } = useAuth();
  const [oidcConfig, setOIDCConfig] = useState<OIDCConfig | null>(null);
  const navigate = useNavigate();


  useEffect(() => {
    const fetchOIDCConfig = async () => {
      try {
        const response = await apiClient.get<OIDCConfig>('/api/auth/oidc/config');
        setOIDCConfig(response);
      } catch (error) {
        console.error('Failed to fetch OIDC config:', error);
      }
    };

    fetchOIDCConfig();
  }, []);

  if (user?.id === 0) {
    return (<></>)
  }

  useOutsideClick(dropdownRef, () => setIsOpen(false));

  const handlePasswordChanged = () => {
    // Log out the user after password change to force re-login
    oidcConfig?.enabled && oidcConfig?.logged_in ? handleOIDCLogout() : logout();
  };

  const handleOIDCLogout = async () => {
    window.location.href = `${window.__BASE_PATH__ || ''}/api/auth/oidc/logout`;
  };

  if (user) {
    return (
      <div ref={dropdownRef} className="relative">
        <button
          onClick={() => setIsOpen(!isOpen)}
          className="flex items-center gap-2 px-3 py-1.5 bg-light-surface dark:bg-dark-surface hover:bg-light-hover 
            dark:hover:bg-dark-hover rounded-md transition-colors text-sm text-light-text dark:text-dark-text"
        >
          <User size={16} />
          <span>{user?.username}</span>
        </button>

        {isOpen && (
          <div
            className="absolute right-0 mt-1 w-48 bg-light-surface dark:bg-dark-surface rounded-md shadow-lg
              border border-light-border dark:border-dark-border py-1 z-50"
          >
            {user.is_admin && (
              <button
                onClick={() => {
                  setIsOpen(false);
                  navigate(ROUTES.ADMIN);
                }}
                className="w-full px-4 py-2 text-sm text-left text-light-text dark:text-dark-text hover:bg-light-hover
                  dark:hover:bg-dark-hover flex items-center gap-2"
              >
                <Shield size={16} />
                <span>{translate('userDropdown.adminPanel')}</span>
              </button>
            )}
            <button
              onClick={() => {
                setIsOpen(false);
                setIsApiKeysModalOpen(true);
              }}
              className="w-full px-4 py-2 text-sm text-left text-light-text dark:text-dark-text hover:bg-light-hover
                dark:hover:bg-dark-hover flex items-center gap-2"
            >
              <Key size={16} />
              <span>{translate('userDropdown.apiKeys')}</span>
            </button>
            {!user.oidc_id && authConfig?.allowPasswordChanges && (
              <button
                onClick={() => {
                  setIsOpen(false);
                  setIsChangePasswordModalOpen(true);
                }}
                className="w-full px-4 py-2 text-sm text-left text-light-text dark:text-dark-text hover:bg-light-hover 
                  dark:hover:bg-dark-hover flex items-center gap-2"
              >
                <Lock size={16} />
                <span>{translate('userDropdown.changePassword')}</span>
              </button>
            )}
            <button
              onClick={() => {
                setIsOpen(false);
                oidcConfig?.enabled && oidcConfig?.logged_in ? handleOIDCLogout() : logout();
              }}
              className="w-full px-4 py-2 text-sm text-left text-light-text dark:text-dark-text hover:bg-light-hover 
                dark:hover:bg-dark-hover flex items-center gap-2"
            >
              <LogOut size={16} />
              <span>{translate('userDropdown.signOut')}</span>
            </button>
          </div>
        )}

        <ApiKeysModal
          isOpen={isApiKeysModalOpen}
          onClose={() => setIsApiKeysModalOpen(false)}
        />

        <ChangePasswordModal
          isOpen={isChangePasswordModalOpen}
          onClose={() => setIsChangePasswordModalOpen(false)}
          onPasswordChanged={handlePasswordChanged}
        />
      </div>
    );
  }

  return (
    <div ref={dropdownRef} className="relative">
      <Link
        to="/login"
        className="flex items-center gap-2 px-3 py-1.5 bg-light-surface dark:bg-dark-surface hover:bg-light-hover 
          dark:hover:bg-dark-hover rounded-md transition-colors text-sm text-light-text dark:text-dark-text"
      >
        <User size={16} />
        <span>{translate('userDropdown.signIn')}</span>
      </Link>
    </div>
  );
};
````

## File: client/src/components/categories/CategoryList.tsx
````typescript
import React, { useState, useRef, useEffect } from "react";
import { ChevronDown, ChevronUp } from "lucide-react";
import { useTranslation } from "react-i18next";
import CategoryTag, { type CategoryTagVariant } from "./CategoryTag";

interface CategoryListProps {
  categories: string[];
  onCategoryClick: (e: React.MouseEvent, category: string) => void;
  className?: string;
  variant: CategoryTagVariant;
  showAll?: boolean;
}

const CategoryList: React.FC<CategoryListProps> = ({
  categories,
  onCategoryClick,
  className = "",
  variant,
  showAll = false,
}) => {
  const { t: translate } = useTranslation('components/categories');
  const [isExpanded, setIsExpanded] = useState(false);
  const [visibleCount, setVisibleCount] = useState(categories.length);
  const containerRef = useRef<HTMLDivElement>(null);
  const measureRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (showAll) return;

    const calculateVisibleCount = () => {
      const container = containerRef.current;
      const measure = measureRef.current;
      if (!container || !measure || categories.length === 0) return;

      measure.style.visibility = "hidden";
      measure.style.display = "flex";

      const containerWidth = container.offsetWidth;
      const items = Array.from(measure.children) as HTMLElement[];
      let currentWidth = 0;
      let count = 0;

      const moreButtonWidth = items[items.length - 1].offsetWidth + 8;

      for (let i = 0; i < items.length - 1; i++) {
        const itemWidth = items[i].offsetWidth + 8;
        if (currentWidth + itemWidth + moreButtonWidth > containerWidth) break;
        currentWidth += itemWidth;
        count++;
      }

      measure.style.display = "none";

      if (count > 0 && count !== visibleCount) {
        setVisibleCount(count);
      }
    };

    calculateVisibleCount();

    window.addEventListener("resize", calculateVisibleCount);
    return () => window.removeEventListener("resize", calculateVisibleCount);
  }, [categories, visibleCount, showAll]);

  if (categories.length === 0) {
    return (
      <div className={`relative ${className}`}>
        <div className="flex flex-wrap items-center gap-1.5">
          <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-light-hover/50 dark:bg-dark-hover/50 text-light-text-secondary dark:text-dark-text-secondary">
            {translate('categoryList.noData')}
          </span>
        </div>
      </div>
    );
  }

  const visibleCategories =
    showAll || isExpanded ? categories : categories.slice(0, visibleCount);

  const hasMoreCategories = !showAll && categories.length > visibleCount;
  const moreCount = categories.length - visibleCount;

  const handleExpandClick = (e: React.MouseEvent) => {
    e.stopPropagation();
    setIsExpanded(true);
  };

  const handleCollapseClick = (e: React.MouseEvent) => {
    e.stopPropagation();
    setIsExpanded(false);
  };

  return (
    <div className={`relative ${className}`}>
      <div ref={containerRef} className="flex flex-wrap items-center gap-1.5">
        {visibleCategories.map((category) => (
          <CategoryTag
            key={category}
            category={category}
            onClick={onCategoryClick}
            variant={variant}
          />
        ))}

        {hasMoreCategories && !isExpanded && (
          <button
            onClick={handleExpandClick}
            className="flex items-center gap-1 px-2 py-0.5 rounded-full text-xs 
              font-medium bg-light-surface/20 dark:bg-dark-surface/20 text-light-text dark:text-dark-text 
              hover:bg-light-surface/30 dark:hover:bg-dark-surface/30 
              transition-colors duration-200"
          >
            <span>{translate('categoryList.moreCount', { moreCount })}</span>
            <ChevronDown size={12} />
          </button>
        )}

        {isExpanded && hasMoreCategories && (
          <button
            onClick={handleCollapseClick}
            className="flex items-center gap-1 px-2 py-0.5 rounded-full text-xs 
              font-medium bg-light-surface/20 dark:bg-dark-surface/20 text-light-text dark:text-dark-text 
              hover:bg-light-surface/30 dark:hover:bg-dark-surface/30 
              transition-colors duration-200"
          >
            <span>{translate('categoryList.showLess')}</span>
            <ChevronUp size={12} />
          </button>
        )}
      </div>

      {!showAll && (
        <div
          ref={measureRef}
          className="absolute flex flex-wrap items-center gap-1.5"
          aria-hidden="true"
          style={{
            visibility: "hidden",
            position: "absolute",
            top: 0,
            left: 0,
          }}
        >
          {categories.map((category) => (
            <CategoryTag
              key={category}
              category={category}
              onClick={onCategoryClick}
              variant={variant}
            />
          ))}
          <button
            className="flex items-center gap-1 px-2 py-0.5 rounded-full text-xs 
              font-medium bg-light-surface/20 dark:bg-dark-surface/20 text-light-text dark:text-dark-text"
          >
            <span>{translate('categoryList.moreCount', { moreCount: 99 })}</span>
            <ChevronDown size={12} />
          </button>
        </div>
      )}
    </div>
  );
};

export default CategoryList;
````

## File: client/src/components/categories/CategorySuggestions.tsx
````typescript
import React, { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import BaseDropdown from '../common/dropdowns/BaseDropdown';

export interface CategorySuggestionsProps {
  inputValue: string;
  onInputChange: (value: string) => void;
  onCategorySelect: (category: string) => void;
  existingCategories: string[];
  selectedCategories: string[];
  placeholder?: string;
  disabled?: boolean;
  className?: string;
  showAddText?: boolean;
  maxCategories?: number;
  handleHashtag: boolean;
}

const CategorySuggestions: React.FC<CategorySuggestionsProps> = ({
  inputValue,
  onInputChange,
  onCategorySelect,
  existingCategories,
  selectedCategories,
  disabled = false,
  className = "",
  maxCategories,
  handleHashtag = false,
  ...props
}) => {
  const { t: translate } = useTranslation('components/categories');
  const [internalValue, setInternalValue] = useState(inputValue);

  const placeholder = props.placeholder || translate('categorySuggestions.placeholder');
  const addNewLabel = translate('categorySuggestions.addNewLabel');

  useEffect(() => {
    setInternalValue(inputValue);
  }, [inputValue]);

  const getSections = (searchTerm: string) => {
    const term = handleHashtag
      ? searchTerm.slice(searchTerm.lastIndexOf('#') + 1).trim().toLowerCase()
      : searchTerm.trim().toLowerCase();

    if (handleHashtag && !searchTerm.includes('#')) {
      return [];
    }

    const sections = [];
    
    const availableCategories = existingCategories.filter(
      cat => !selectedCategories.includes(cat.toLowerCase())
    );

    const filtered = term
      ? availableCategories.filter(cat => 
          cat.toLowerCase().includes(term)
        )
      : availableCategories;

    if (filtered.length > 0) {
      sections.push({
        title: translate('categorySuggestions.title'),
        items: filtered
      });
    }

    if (term && term.length > 0 && 
        !existingCategories.some(cat => cat.toLowerCase() === term)) {
      sections.push({
        title: addNewLabel,
        items: [`${addNewLabel}: ${term}`]
      });
    }

    return sections;
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === ',') {
      e.preventDefault();
      const term = handleHashtag
        ? internalValue.slice(internalValue.lastIndexOf('#') + 1).trim()
        : internalValue.trim();
      
      if (term) {
        handleSelect(`${addNewLabel}: ${term}`);
      }
    }
  };

  const handleChange = (newValue: string) => {
    setInternalValue(newValue);
    onInputChange(newValue);
  };

  const handleSelect = (option: string) => {
    let newCategory;
    if (option.startsWith(`${addNewLabel}:`)) {
      newCategory = option.slice(9).trim();
    } else {
      newCategory = option;
    }

    if (handleHashtag) {
      const hashtagIndex = internalValue.lastIndexOf('#');
      if (hashtagIndex !== -1) {
        const newValue = internalValue.substring(0, hashtagIndex).trim();
        setInternalValue(newValue);
        onInputChange(newValue);
      }
    } else {
      setInternalValue('');
      onInputChange('');
    }

    onCategorySelect(newCategory.toLowerCase());
  };

  return (
    <BaseDropdown
      value={internalValue}
      onChange={handleChange}
      onSelect={handleSelect}
      onKeyDown={handleKeyDown}
      getSections={getSections}
      placeholder={placeholder}
      className={className}
      disabled={disabled || (maxCategories !== undefined && selectedCategories.length >= maxCategories)}
      showChevron={false}
    />
  );
};

export default CategorySuggestions;
````

## File: client/src/components/categories/CategoryTag.tsx
````typescript
import React from 'react';

export type CategoryTagVariant = 'removable' | 'clickable';

interface CategoryTagProps {
  category: string;
  onClick: (e: React.MouseEvent, category: string) => void;
  variant: CategoryTagVariant;
  className?: string;
}

const CategoryTag: React.FC<CategoryTagProps> = ({
  category,
  onClick,
  variant,
  className = ""
}) => {
  const handleClick = (e: React.MouseEvent) => {
    e.stopPropagation();
    onClick(e, category);
  };

  if (variant === 'removable') {
    return (
      <button
        onClick={handleClick}
        className={`flex items-center gap-1 px-2 py-1 rounded-md bg-light-hover/50 dark:bg-dark-hover/50 text-sm 
          hover:bg-light-hover dark:hover:bg-dark-hover transition-colors group ${className}`}
        type="button"
      >
        <span className='text-light-text dark:text-dark-text'>{category}</span>
        <span className="text-light-text-secondary dark:text-dark-text-secondary group-hover:text-light-text dark:group-hover:text-dark-text">×</span>
      </button>
    );
  }

  return (
    <button
      onClick={handleClick}
      className={`px-2 py-0.5 rounded-full text-xs font-medium transition-colors duration-200 
        ${getCategoryColor(category)} ${className}`}
      type="button"
    >
      {category}
    </button>
  );
};

const getCategoryColor = (name: string) => {
  const colors = [
    'blue', 'emerald',
    'purple', 'amber',
    'rose', 'cyan',
    'indigo', 'teal',
  ];
  const colorSchemes = colors.map((color) => ({
    bg: `bg-${color}-500/20 dark:bg-${color}-500/30`,
    text: `text-${color}-700 dark:text-${color}-200`,
    hover: `hover:bg-${color}-500/30 dark:hover:bg-${color}-500/40`
  }));
  
  const hash = name.split('').reduce((acc, char, i) => {
    return char.charCodeAt(0) + ((acc << 5) - acc) + i;
  }, 0);
  
  const scheme = colorSchemes[Math.abs(hash) % colorSchemes.length];
  return `${scheme.bg} ${scheme.text} ${scheme.hover}`;
};

export default CategoryTag;
````

## File: client/src/components/common/buttons/CopyButton.tsx
````typescript
import React, { useState } from 'react';
import { Copy, Check } from 'lucide-react';
import { useTranslation } from 'react-i18next';

export interface CopyButtonProps {
  text: string;
}

const CopyButton: React.FC<CopyButtonProps> = ({ text }) => {
  const { t: translate } = useTranslation('components/common/buttons');
  const [isCopied, setIsCopied] = useState(false);

  const handleCopy = async (e: React.MouseEvent) => {
    e.stopPropagation();
    try {
      if (navigator.clipboard && window.isSecureContext) {
        await navigator.clipboard.writeText(text);
      } else {
        const textArea = document.createElement('textarea');
        textArea.value = text;
        textArea.style.position = 'fixed';
        textArea.style.left = '-999999px';
        textArea.style.top = '-999999px';
        document.body.appendChild(textArea);
        textArea.focus();
        textArea.select();
        
        try {
          document.execCommand('copy');
        } finally {
          textArea.remove();
        }
      }
      
      setIsCopied(true);
      setTimeout(() => setIsCopied(false), 2000);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  };

  return (
    <button
      onClick={handleCopy}
      className="p-1 bg-light-surface dark:bg-dark-surface rounded-md 
        hover:bg-light-hover dark:hover:bg-dark-hover transition-colors text-light-text dark:text-dark-text"
      title={translate('copyButton.title')}
    >
      {isCopied ? (
        <Check size={16} className="text-light-primary dark:text-dark-primary" />
      ) : (
        <Copy size={16} className="text-light-text dark:text-dark-text" />
      )}
    </button>
  );
};

export default CopyButton;
````

## File: client/src/components/common/buttons/DownloadArchiveButton.tsx
````typescript
import React from "react";
import { ArrowDownToLine } from "lucide-react";
import { useTranslation } from "react-i18next";
import { useToast } from "../../../hooks/useToast";
import { downloadSnippetArchive } from "../../../utils/downloadUtils";

interface DownloadArchiveButtonProps {
  snippetTitle: string;
  fragments: Array<{
    code: string;
    file_name: string;
    language: string;
  }>;
  className?: string;
  size?: "sm" | "md" | "lg";
  variant?: "primary" | "secondary";
}

export const DownloadArchiveButton: React.FC<DownloadArchiveButtonProps> = ({
  snippetTitle,
  fragments,
  className = "",
  size = "md",
  variant = "primary",
}) => {
  const { t: translate } = useTranslation('components/common/buttons');
  const { addToast } = useToast();

  const handleDownload = async () => {
    if (fragments.length === 0) {
      addToast("No fragments to download", "warning");
      return;
    }

    try {
      await downloadSnippetArchive(snippetTitle, fragments);
      addToast(translate('downloadArchiveButton.success.downloadedAll'), "success");
    } catch (error) {
      console.error("Failed to download archive:", error);
      addToast(translate('downloadArchiveButton.error.failedDownload'), "error");
    }
  };

  const sizeClasses = {
    sm: "px-2 py-1 text-xs",
    md: "px-3 py-1.5 text-sm",
    lg: "px-4 py-2 text-base",
  };

  const variantClasses = {
    primary: "bg-blue-600 hover:bg-blue-700 text-white",
    secondary:
      "bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text hover:bg-light-hover/80 dark:hover:bg-dark-hover/80",
  };

  const iconSize = {
    sm: 12,
    md: 14,
    lg: 16,
  };

  return (
    <button
      onClick={handleDownload}
      disabled={fragments.length === 0}
      className={`
        inline-flex items-center gap-2 rounded-md font-medium transition-colors
        disabled:opacity-50 disabled:cursor-not-allowed
        ${sizeClasses[size]}
        ${variantClasses[variant]}
        ${className}
      `}
      title={translate('downloadArchiveButton.title')}
    >
      <ArrowDownToLine size={iconSize[size]} />
      <span>{translate('downloadArchiveButton.label')}</span>
      <span className="opacity-70">
        {translate('downloadArchiveButton.fileLabel', { count: fragments.length })}
      </span>
    </button>
  );
};

export default DownloadArchiveButton;
````

## File: client/src/components/common/buttons/DownloadButton.tsx
````typescript
import React from "react";
import { Download } from "lucide-react";
import { useTranslation } from "react-i18next";
import { useToast } from "../../../hooks/useToast";
import { downloadFragment } from "../../../utils/downloadUtils";

interface DownloadButtonProps {
  code: string;
  fileName: string;
  language: string;
  className?: string;
}

const DownloadButton: React.FC<DownloadButtonProps> = ({
  code,
  fileName,
  language,
  className = "",
}) => {
  const { t: translate } = useTranslation('components/common/buttons');
  const { addToast } = useToast();

  const handleDownload = (e: React.MouseEvent) => {
    try {
      e.stopPropagation();
      e.preventDefault();

      if (!code || !fileName) {
        addToast(translate('downloadButton.warning.nothing'), "warning");
        return;
      }

      downloadFragment(code, fileName, language);
      addToast(translate('downloadButton.success.downloaded', { fileName }), "success");
    } catch (error) {
      console.error("Download failed:", error);
      addToast(translate('downloadButton.error.failedDownload'), "error");
    }
  };

  return (
    <button
      onClick={handleDownload}
      className={`inline-flex items-center justify-center w-8 h-8 text-light-text-secondary dark:text-dark-text-secondary bg-light-surface dark:bg-dark-surface hover:bg-light-hover dark:hover:bg-dark-hover rounded border border-light-border dark:border-dark-border transition-colors ${className}`}
      title={translate('downloadButton.title', { fileName })}
      aria-label={translate('downloadButton.title', { fileName })}
    >
      <Download size={20} />
    </button>
  );
};

export default DownloadButton;
````

## File: client/src/components/common/buttons/FileUploadButton.tsx
````typescript
import React, { useRef, useState } from "react";
import { Upload, Link } from "lucide-react";
import { useTranslation } from "react-i18next";
import { useToast } from "../../../hooks/useToast";
import {
  processUploadedFile,
  ACCEPTED_FILE_EXTENSIONS,
  detectLanguageFromFilename,
} from "../../../utils/fileUploadUtils";

interface FileUploadButtonProps {
  onFileProcessed: (fileData: {
    file_name: string;
    code: string;
    language: string;
    position: number;
  }) => void;
  onError: (error: string) => void;
  className?: string;
  multiple?: boolean;
  existingFragments?: Array<{
    file_name: string;
    language: string;
  }>;
}

export const FileUploadButton: React.FC<FileUploadButtonProps> = ({
  onFileProcessed,
  onError,
  className = "",
  multiple = true,
  existingFragments = [],
}) => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/common/buttons');
  const fileInputRef = useRef<HTMLInputElement>(null);
  const { addToast } = useToast();
  const [showUrlModal, setShowUrlModal] = useState(false);
  const [urlInput, setUrlInput] = useState("");
  const [isLoadingUrl, setIsLoadingUrl] = useState(false);

  const handleFileSelect = () => {
    fileInputRef.current?.click();
  };

  const handleFileChange = async (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    const files = event.target.files;
    if (!files || files.length === 0) return;

    let successCount = 0;
    let duplicateCount = 0;

    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      try {
        const fileData = await processUploadedFile(file);
        // Check for duplicates
        const isDuplicate = existingFragments.some(
          (existing) =>
            existing.file_name === fileData.file_name &&
            existing.language === fileData.language
        );

        if (isDuplicate) {
          duplicateCount++;
          continue;
        }

        onFileProcessed(fileData);
        successCount++;
      } catch (error) {
        const errorMessage = `${
          error instanceof Error ? error.message : translate('fileUploadButton.error.unknown')
        }`;
        onError(errorMessage);
        addToast(errorMessage, "error");
      }
    }

    // Show success toast for successfully processed files
    if (successCount > 0) {
      if (successCount === 1 && files.length === 1) {
        addToast(translate('fileUploadButton.success.fileUploaded', { fileName: files[0].name }), "success");
      } else if (successCount === files.length) {
        addToast(translate('fileUploadButton.success.filesUploaded', { count: successCount }), "success");
      } else {
        addToast(translate('fileUploadButton.success.someFilesUploaded', { successCount, total: files.length }), "success");
      }
    }

    // Show summary toast if there were duplicates
    if (duplicateCount > 0) {
      if (duplicateCount === 1) {
        addToast(translate('fileUploadButton.info.duplicateDetected'), "info");
      } else {
        addToast(translate('fileUploadButton.info.duplicatesDetected', { count: duplicateCount }), "info");
      }
    }

    // Reset the input
    if (fileInputRef.current) {
      fileInputRef.current.value = "";
    }
  };

  const handleUrlLoad = async () => {
    if (!urlInput.trim()) {
      addToast(translate('fileUploadButton.loadFromUrl.invalidUrl'), "error");
      return;
    }

    setIsLoadingUrl(true);
    try {
      // Fetch content from URL
      const response = await fetch(urlInput);
      if (!response.ok) {
        throw new Error(`Failed to fetch: ${response.statusText}`);
      }

      const code = await response.text();

      // Extract filename from URL
      const urlPath = new URL(urlInput).pathname;
      const fullFileName = urlPath.split("/").pop() || "untitled.txt";
      const fileName = fullFileName.split(".").slice(0, -1).join(".") || fullFileName;
      const language = detectLanguageFromFilename(fullFileName);

      // Check for duplicates
      const isDuplicate = existingFragments.some(
        (existing) =>
          existing.file_name === fileName && existing.language === language
      );

      if (isDuplicate) {
        addToast(translate('fileUploadButton.info.duplicateDetected'), "info");
        setShowUrlModal(false);
        setUrlInput("");
        setIsLoadingUrl(false);
        return;
      }

      // Validate size (max 1MB)
      if (code.length > 1024 * 1024) {
        throw new Error(translate('fileUploadButton.loadFromUrl.contentMaxSizeError', { max: '1MB' }));
      }

      const fileData = {
        file_name: fileName,
        code: code,
        language: language,
        position: 0,
      };

      onFileProcessed(fileData);
      addToast(translate('fileUploadButton.success.fileUploaded', { fileName: fullFileName }), "success");
      setShowUrlModal(false);
      setUrlInput("");
    } catch (error) {
      const errorMessage = `Failed to load from URL: ${
        error instanceof Error ? error.message : translate('fileUploadButton.error.unknown')
      }`;
      onError(errorMessage);
      addToast(errorMessage, "error");
    } finally {
      setIsLoadingUrl(false);
    }
  };

  return (
    <>
      <input
        ref={fileInputRef}
        type="file"
        onChange={handleFileChange}
        multiple={multiple}
        accept={ACCEPTED_FILE_EXTENSIONS}
        className="hidden"
        aria-label={translate('fileUploadButton.label')}
      />
      <div className="inline-flex gap-2">
        <button
          type="button"
          onClick={handleFileSelect}
          className={`inline-flex items-center gap-2 px-3 py-1.5 text-sm font-medium rounded-md border transition-colors
            bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text border-light-border dark:border-dark-border
            hover:bg-light-hover/80 dark:hover:bg-dark-hover/80 hover:border-light-border dark:hover:border-dark-border
            focus:outline-none
            ${className}`}
          title={translate('fileUploadButton.title')}
        >
          <Upload size={16} />
          <span>{translate('fileUploadButton.label')}</span>
        </button>
        <button
          type="button"
          onClick={() => setShowUrlModal(true)}
          className={`inline-flex items-center gap-2 px-3 py-1.5 text-sm font-medium rounded-md border transition-colors
            bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text border-light-border dark:border-dark-border
            hover:bg-light-hover/80 dark:hover:bg-dark-hover/80 hover:border-light-border dark:hover:border-dark-border
            focus:outline-none
            ${className}`}
          title={translate('fileUploadButton.loadFromUrl.title')}
        >
          <Link size={16} />
          <span>{translate('fileUploadButton.loadFromUrl.label')}</span>
        </button>
      </div>

      {/* URL Modal */}
      {showUrlModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-light-surface dark:bg-dark-surface p-6 rounded-lg shadow-xl max-w-md w-full mx-4 border border-light-border dark:border-dark-border">
            <h3 className="text-lg font-semibold mb-4 text-light-text dark:text-dark-text">
              {translate('fileUploadButton.loadFromUrl.label')}
            </h3>
            <input
              type="url"
              value={urlInput}
              onChange={(e) => setUrlInput(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === "Enter" && !isLoadingUrl) {
                  handleUrlLoad();
                } else if (e.key === "Escape") {
                  setShowUrlModal(false);
                  setUrlInput("");
                }
              }}
              placeholder="https://raw.githubusercontent.com/..."
              className="w-full px-3 py-2 border border-light-border dark:border-dark-border rounded-md
                bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text
                focus:outline-none focus:ring-2 focus:ring-blue-500 mb-4"
              autoFocus
              disabled={isLoadingUrl}
            />
            <div className="flex gap-2 justify-end">
              <button
                type="button"
                onClick={() => {
                  setShowUrlModal(false);
                  setUrlInput("");
                }}
                className="px-4 py-2 text-sm font-medium rounded-md border transition-colors
                  bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text
                  border-light-border dark:border-dark-border
                  hover:bg-light-hover/80 dark:hover:bg-dark-hover/80"
                disabled={isLoadingUrl}
              >
                {t('action.cancel')}
              </button>
              <button
                type="button"
                onClick={handleUrlLoad}
                className="px-4 py-2 text-sm font-medium rounded-md transition-colors
                  bg-blue-600 text-white hover:bg-blue-700
                  disabled:opacity-50 disabled:cursor-not-allowed"
                disabled={isLoadingUrl}
              >
                {isLoadingUrl ? "Loading..." : t('action.load')}
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default FileUploadButton;
````

## File: client/src/components/common/buttons/IconButton.tsx
````typescript
import React, { forwardRef } from 'react';

export interface IconButtonProps {
  icon: React.ReactNode;
  onClick: (e: React.MouseEvent) => void;
  label?: string;
  variant?: 'primary' | 'secondary' | 'danger' | 'action' | 'custom';
  size?: 'sm' | 'md' | 'lg';
  disabled?: boolean;
  className?: string;
  type?: 'button' | 'submit' | 'reset';
  showLabel?: boolean;
}

export const IconButton = forwardRef<HTMLButtonElement, IconButtonProps>(({
  icon,
  onClick,
  label,
  variant = 'secondary',
  size = 'md',
  disabled = false,
  className = '',
  type = 'button',
  showLabel = false
}, ref) => {
  const baseClasses = 'flex items-center justify-center gap-2 rounded-md transition-colors';
  const variantClasses = {
    primary: 'bg-light-hover dark:bg-dark-hover hover:bg-light-hover dark:hover:bg-dark-hover text-light-text dark:text-dark-text',
    secondary: 'bg-light-surface dark:bg-dark-surface hover:bg-light-hover dark:hover:bg-dark-hover text-light-text dark:text-dark-text',
    danger: 'bg-red-600 hover:bg-red-700 dark:bg-red-700 dark:hover:bg-red-800 text-white',
    action: 'bg-light-primary dark:bg-dark-primary hover:opacity-90 text-white',
    custom: ''
  };
  const sizeClasses = {
    sm: label ? 'p-1.5 text-sm' : 'p-1.5',
    md: label ? 'p-2 text-base' : 'p-2',
    lg: label ? 'p-3 text-lg' : 'p-3'
  };

  const handleClick = (e: React.MouseEvent) => {
    e.preventDefault();
    onClick(e);
  };

  return (
    <button
      ref={ref}
      onClick={handleClick}
      disabled={disabled}
      type={type}
      className={`${baseClasses} ${variantClasses[variant]} ${sizeClasses[size]} ${className} ${
        disabled ? 'opacity-50 cursor-not-allowed' : ''
      }`}
      title={label}
      aria-label={label}
    >
      {icon}
      {(label && showLabel) && <span>{label}</span>}
    </button>
  );
});

IconButton.displayName = 'IconButton';
````

## File: client/src/components/common/buttons/RawButton.tsx
````typescript
import React, { useState } from 'react';
import { Check, Code } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { basePath } from '../../../utils/api/basePath';

export interface RawButtonProps {
  isPublicView: boolean;
  snippetId: string;
  fragmentId: string;
}

const RawButton: React.FC<RawButtonProps> = ({ isPublicView, snippetId, fragmentId }) => {
  const { t: translate } = useTranslation('components/common/buttons');
  const [isOpenRaw, setIsOpenRaw] = useState(false);

  const handleOpenRaw = async (e: React.MouseEvent) => {
    e.stopPropagation();
    try {
      if (isPublicView) {
        window.open(`${basePath}/api/public/snippets/${snippetId}/${fragmentId}/raw`, '_blank');
      } else {
        window.open(`${basePath}/api/snippets/${snippetId}/${fragmentId}/raw`, '_blank');
      }
    } catch (err) {
      console.error('Failed to open raw: ', err);
    }
      
    setIsOpenRaw(true);
    setTimeout(() => setIsOpenRaw(false), 2000);
  };

  return (
    <button
      onClick={handleOpenRaw}
      className="p-1 bg-light-surface dark:bg-dark-surface rounded-md 
        hover:bg-light-hover dark:hover:bg-dark-hover transition-colors text-light-text dark:text-dark-text"
      title={translate('rawButton.title')}
    >
      {isOpenRaw ? (
        <Check size={16} className="text-light-primary dark:text-dark-primary" />
      ) : (
        <Code size={16} className="text-light-text dark:text-dark-text" />
      )}
    </button>
  );
};

export default RawButton;
````

## File: client/src/components/common/dropdowns/BaseDropdown.tsx
````typescript
import React, { useState, useRef, useEffect, forwardRef, useImperativeHandle } from "react";
import { ChevronDown } from "lucide-react";
import { useTranslation } from "react-i18next";

interface Section {
  title: string;
  items: string[];
}

export interface BaseDropdownProps {
  value: string;
  onChange: (value: string) => void;
  onSelect: (value: string) => void;
  onKeyDown?: (e: React.KeyboardEvent) => void;
  getSections: (searchTerm: string) => Section[];
  placeholder?: string;
  className?: string;
  disabled?: boolean;
  maxLength?: number;
  showChevron?: boolean;
}

/**
 * Ref interface for BaseDropdown component
 */
export interface BaseDropdownRef {
  /** Focus the dropdown input */
  focus: () => void;
}

const BaseDropdown = forwardRef<BaseDropdownRef, BaseDropdownProps>(({
  value,
  onChange,
  onSelect,
  onKeyDown,
  getSections,
  className = "",
  disabled = false,
  maxLength,
  showChevron = true,
  ...props
}, ref) => {
  const { t: translate } = useTranslation('components/common/dropdowns');
  const [isOpen, setIsOpen] = useState(false);
  const [highlightedIndex, setHighlightedIndex] = useState<number>(-1);
  const [internalValue, setInternalValue] = useState(value);
  const dropdownRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);
  const listRef = useRef<HTMLUListElement>(null);
  const lastInteractionWasMouse = useRef(false);

  const placeholder = props.placeholder || translate('baseDropdown.defaultPlaceholder');

  useImperativeHandle(ref, () => ({
    focus: () => {
      if (inputRef.current) {
        inputRef.current.focus();
      }
    },
  }));

  useEffect(() => {
    setInternalValue(value);
  }, [value]);

  const getAllItems = (sections: Section[]): string[] => {
    return sections.reduce(
      (acc: string[], section) => [...acc, ...section.items],
      []
    );
  };

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (
        dropdownRef.current &&
        !dropdownRef.current.contains(event.target as Node)
      ) {
        setIsOpen(false);
        setHighlightedIndex(-1);
        setInternalValue(value);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [value]);

  useEffect(() => {
    if (isOpen && highlightedIndex >= 0 && listRef.current) {
      const highlightedElement = listRef.current.querySelector(
        `[data-index="${highlightedIndex}"]`
      );
      if (highlightedElement) {
        if (!lastInteractionWasMouse.current) {
          highlightedElement.scrollIntoView({ block: "nearest" });
        }
      }
    }
  }, [highlightedIndex]);

  const handleMouseEnter = (index: number) => {
    lastInteractionWasMouse.current = true;
    setHighlightedIndex(index);
  };

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const newValue = maxLength
      ? e.target.value.slice(0, maxLength)
      : e.target.value;
    setInternalValue(newValue);
    onChange(newValue);
    setIsOpen(true);
    setHighlightedIndex(-1);
  };

  const addNewLabel = translate('baseDropdown.addNewLabel');

  const handleOptionClick = (option: string) => {
    const finalValue = option.startsWith(`${addNewLabel}:`)
      ? option.slice(9).trim()
      : option;
    setInternalValue(finalValue);
    onSelect(finalValue);
    setIsOpen(false);
    setHighlightedIndex(-1);
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (onKeyDown) {
      onKeyDown(e);
      if (e.defaultPrevented) return;
    }

    const sections = getSections(internalValue);
    const allItems = getAllItems(sections);
    const totalItems = allItems.length;

    switch (e.key) {
      case "ArrowDown":
        e.preventDefault();
        if (!isOpen) {
          setIsOpen(true);
        }
        setHighlightedIndex((prev) =>
          prev < totalItems - 1 ? prev + 1 : totalItems - 1
        );
        break;

      case "ArrowUp":
        e.preventDefault();
        if (!isOpen) {
          setIsOpen(true);
        }
        setHighlightedIndex((prev) => (prev > 0 ? prev - 1 : 0));
        break;

      case "Enter":
        e.preventDefault();
        if (isOpen) {
          if (highlightedIndex >= 0 && highlightedIndex < totalItems) {
            handleOptionClick(allItems[highlightedIndex]);
          } else if (sections.length > 0) {
            const lastSection = sections[sections.length - 1];
            if (lastSection.items.length > 0) {
              handleOptionClick(lastSection.items[0]);
            }
          }
          setIsOpen(false);
        }
        break;

      case "Escape":
        e.preventDefault();
        setIsOpen(false);
        setHighlightedIndex(-1);
        setInternalValue(value);
        break;

      case "Tab":
        setIsOpen(false);
        setHighlightedIndex(-1);
        setInternalValue(value);
        break;
    }
  };

  const sections = getSections(internalValue);
  let currentIndex = -1;

  return (
    <div className="relative" ref={dropdownRef}>
      <div className="relative">
        <input
          ref={inputRef}
          type="text"
          className={`block w-full rounded-md bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text p-2 pr-8 text-sm focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary ${className}`}
          value={internalValue}
          onChange={handleInputChange}
          onFocus={() => setIsOpen(true)}
          onKeyDown={handleKeyDown}
          placeholder={placeholder}
          disabled={disabled}
          maxLength={maxLength}
          aria-expanded={isOpen}
          aria-haspopup="listbox"
          role="combobox"
        />
        {showChevron && (
          <ChevronDown
            className={`absolute right-2 top-1/2 -translate-y-1/2 text-light-text-secondary dark:text-dark-text-secondary transition-transform duration-200 ${
              isOpen ? "rotate-180" : ""
            }`}
            size={16}
          />
        )}
      </div>
      {isOpen && sections.length > 0 && (
        <ul
          ref={listRef}
          className="absolute z-10 w-full mt-1 overflow-auto border rounded-md shadow-lg bg-light-surface dark:bg-dark-surface border-light-border dark:border-dark-border max-h-60"
          role="listbox"
        >
          {sections.map((section, sectionIndex) => (
            <React.Fragment key={section.title}>
              {sectionIndex > 0 && (
                <li
                  className="border-t border-light-border dark:border-dark-border"
                  role="separator"
                />
              )}
              <li className="px-3 py-1 text-xs font-medium text-light-text-secondary dark:text-dark-text-secondary bg-light-hover dark:bg-dark-hover">
                {section.title}
              </li>
              {section.items.map((item) => {
                currentIndex++;
                return (
                  <li
                    key={`${section.title}-${item}`}
                    className={`px-4 py-2 cursor-pointer text-light-text dark:text-dark-text text-sm ${
                      highlightedIndex === currentIndex
                        ? "bg-light-primary/20 dark:bg-dark-primary/20"
                        : "hover:bg-light-hover dark:hover:bg-dark-hover"
                    }`}
                    onClick={() => handleOptionClick(item)}
                    onMouseDown={(e) => e.preventDefault()}
                    onMouseEnter={() => handleMouseEnter(currentIndex)}
                    data-index={currentIndex}
                    role="option"
                    aria-selected={highlightedIndex === currentIndex}
                  >
                    {item}
                  </li>
                );
              })}
            </React.Fragment>
          ))}
        </ul>
      )}
    </div>
  );
});

BaseDropdown.displayName = 'BaseDropdown';

export default BaseDropdown;
````

## File: client/src/components/common/layout/AppHeader.tsx
````typescript
import React from 'react';
import { Link } from 'react-router-dom';
import { APP_VERSION } from '../../../constants/settings';

interface AppHeaderProps {
  subtitle?: string;
  children?: React.ReactNode;
}

export const AppHeader: React.FC<AppHeaderProps> = ({ subtitle, children }) => {
  return (
    <div className="flex flex-col gap-2">
      <h1 className="text-4xl font-bold text-light-text dark:text-dark-text flex items-baseline gap-2">
        <Link to="/" className="hover:opacity-80 transition-opacity cursor-pointer">
          ByteStash
        </Link>
        <span className="text-sm text-light-text-secondary dark:text-dark-text-secondary">v{APP_VERSION}</span>
      </h1>

      {subtitle && (
        <p className="text-sm text-light-text-secondary dark:text-dark-text-secondary">
          {subtitle}
        </p>
      )}

      {children}
    </div>
  );
};
````

## File: client/src/components/common/layout/PageContainer.tsx
````typescript
import React from 'react';

export interface PageContainerProps {
  children: React.ReactNode;
  className?: string;
  title?: string;
  actions?: React.ReactNode;
}

export const PageContainer: React.FC<PageContainerProps> = ({
  children,
  className = '',
  title,
  actions
}) => {
  return (
    <div className="min-h-screen bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text p-8">
      <div className={`max-w-7xl mx-auto ${className}`}>
        {(title || actions) && (
          <div className="flex justify-between items-center mb-6">
            {title && <h1 className="text-3xl font-bold text-light-text dark:text-dark-text">{title}</h1>}
            {actions && <div className="flex items-center gap-4">{actions}</div>}
          </div>
        )}
        {children}
      </div>
    </div>
  );
};
````

## File: client/src/components/common/markdown/MarkdownRenderer.tsx
````typescript
import React from 'react';
import ReactMarkdown from 'react-markdown';
import Admonition from '../../utils/Admonition';
import { flattenToText } from '../../../utils/markdownUtils';
import MermaidViewer from './MermaidViewer';
import remarkGfm from 'remark-gfm';

const REMARK_PLUGINS = [remarkGfm];

export interface MarkdownRendererProps {
    children: string;
    className?: string;
    disableMermaid?: boolean;
}

export const MarkdownRenderer: React.FC<MarkdownRendererProps> = ({ children, className, disableMermaid }) => {
    return (
        <ReactMarkdown
            className={className}
            remarkPlugins={REMARK_PLUGINS}
            components={{
                blockquote: ({ children }) => {
                    const text = flattenToText(children).trim();
                    const match = text.match(
                        /^\[!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\]\s*([\s\S]*)$/
                    );
                    if (match) {
                        return (
                            <Admonition type={match[1] as any}>{match[2].trim()}</Admonition>
                        );
                    }
                    return <blockquote>{children}</blockquote>;
                },
                p: ({ children }) => {
                    const text = flattenToText(children).trim();
                    const match = text.match(
                        /^\[!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\]\s*([\s\S]*)$/
                    );
                    if (match) {
                        return (
                            <Admonition type={match[1] as any}>{match[2].trim()}</Admonition>
                        );
                    }
                    return <p>{children}</p>;
                },
                pre: ({ node, children, ...props }: any) => {
                    if (disableMermaid) {
                        return <pre {...props}>{children}</pre>;
                    }
                    const childArray = React.Children.toArray(children);
                    if (
                        childArray.length === 1 &&
                        React.isValidElement(childArray[0]) &&
                        typeof childArray[0].props.className === 'string' &&
                        childArray[0].props.className.includes('language-mermaid')
                    ) {
                        return <>{children}</>;
                    }
                    return <pre {...props}>{children}</pre>;
                },
                code: ({ node, className, children, ...props }: any) => {
                    const match = /language-(\w+)/.exec(className || '');
                    const isMermaid = !disableMermaid && match && match[1] === 'mermaid';

                    if (isMermaid) {
                        return <MermaidViewer code={String(children).replace(/\n$/, '')} />;
                    }

                    return (
                        <code className={className} {...props}>
                            {children}
                        </code>
                    );
                }
            }}
        >
            {children}
        </ReactMarkdown>
    );
};


export default MarkdownRenderer;
````

## File: client/src/components/common/markdown/MermaidViewer.tsx
````typescript
import React, { useEffect, useRef, useState, useCallback } from 'react';
import { useTheme } from '../../../contexts/ThemeContext';
import { TransformWrapper, TransformComponent } from 'react-zoom-pan-pinch';
import { ZoomIn, ZoomOut, Maximize, Minimize, Download, Image as ImageIcon, Copy, Check, RefreshCw, AlertTriangle } from 'lucide-react';
import { useTranslation } from 'react-i18next';

export interface MermaidViewerProps {
  code: string;
}

let lastInitTheme: string | null = null;

async function loadAndInitMermaid(theme: 'light' | 'dark') {
  const { default: mermaid } = await import('mermaid');
  const mermaidTheme = theme === 'dark' ? 'dark' : 'default';
  if (lastInitTheme !== mermaidTheme) {
    mermaid.initialize({
      startOnLoad: false,
      theme: mermaidTheme,
      securityLevel: 'strict',
    });
    lastInitTheme = mermaidTheme;
  }
  return mermaid;
}

export const MermaidViewer: React.FC<MermaidViewerProps> = ({ code }) => {
  const containerRef = useRef<HTMLDivElement>(null);
  const { theme } = useTheme();
  const { t } = useTranslation('components/common/markdown');
  const [svgContent, setSvgContent] = useState<string>('');
  const [error, setError] = useState<string | null>(null);
  const [isFullscreen, setIsFullscreen] = useState(false);
  const [copied, setCopied] = useState(false);

  const [effectiveTheme, setEffectiveTheme] = useState<"light" | "dark">(
    theme === "system"
      ? (typeof window !== 'undefined' && window.matchMedia("(prefers-color-scheme: dark)").matches)
        ? "dark"
        : "light"
      : theme as "light" | "dark"
  );

  useEffect(() => {
    if (theme === "system") {
      const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");
      const handleChange = () => {
        setEffectiveTheme(mediaQuery.matches ? "dark" : "light");
      };
      mediaQuery.addEventListener("change", handleChange);
      return () => mediaQuery.removeEventListener("change", handleChange);
    } else {
      setEffectiveTheme(theme as "light" | "dark");
    }
  }, [theme]);

  useEffect(() => {
    let isMounted = true;

    const renderDiagram = async () => {
      try {
        setError(null);
        const mermaid = await loadAndInitMermaid(effectiveTheme);
        const id = `mermaid-${Math.random().toString(36).substring(2, 11)}`;
        const { svg } = await mermaid.render(id, code);

        if (isMounted) {
          setSvgContent(svg);
        }
      } catch (err) {
        console.error("Failed to render mermaid diagram", err);
        if (isMounted) {
          const message = err instanceof Error ? err.message : String(err);
          setError(message || 'Error rendering diagram');
          setSvgContent('');
        }
      }
    };

    if (code) {
      renderDiagram();
    }

    return () => {
      isMounted = false;
    };
  }, [code, effectiveTheme]);

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape' && isFullscreen) {
        setIsFullscreen(false);
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [isFullscreen]);

  const copyCode = useCallback(() => {
    navigator.clipboard.writeText(code).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    }).catch((err) => {
      console.error("Failed to copy Mermaid code to clipboard", err);
    });
  }, [code]);

  const downloadAsSVG = useCallback(() => {
    if (!svgContent) return;
    const blob = new Blob([svgContent], { type: 'image/svg+xml;charset=utf-8' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = `diagram-${new Date().getTime()}.svg`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
  }, [svgContent]);

  const downloadAsPNG = useCallback(() => {
    if (!containerRef.current || !svgContent) return;

    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');
    if (!ctx) {
      console.error("Failed to get canvas 2D context for PNG export");
      return;
    }

    const parser = new DOMParser();
    const doc = parser.parseFromString(svgContent, "image/svg+xml");
    const parseError = doc.querySelector('parsererror');
    if (parseError) {
      console.error("Failed to parse SVG for PNG export", parseError.textContent);
      return;
    }
    const svgElement = doc.querySelector('svg');
    if (!svgElement) return;

    const scale = 2;

    const viewBox = svgElement.getAttribute('viewBox');
    let width = parseInt(svgElement.getAttribute('width') || '0', 10);
    let height = parseInt(svgElement.getAttribute('height') || '0', 10);

    if ((!width || !height) && viewBox) {
      const parts = viewBox.split(' ');
      width = parseFloat(parts[2]);
      height = parseFloat(parts[3]);
    }

    if (!width) width = 800;
    if (!height) height = 600;

    canvas.width = width * scale;
    canvas.height = height * scale;

    ctx.fillStyle = effectiveTheme === 'dark' ? '#1E1E1E' : '#ffffff';
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    const img = new Image();
    svgElement.setAttribute('width', (width * scale).toString());
    svgElement.setAttribute('height', (height * scale).toString());

    const svgData = new XMLSerializer().serializeToString(svgElement);
    const blob = new Blob([svgData], { type: 'image/svg+xml;charset=utf-8' });
    const url = URL.createObjectURL(blob);

    img.onerror = () => {
      console.error("Failed to load SVG image for PNG conversion");
      URL.revokeObjectURL(url);
    };

    img.onload = () => {
      try {
        ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
        const pngUrl = canvas.toDataURL('image/png');
        const link = document.createElement('a');
        link.href = pngUrl;
        link.download = `diagram-${new Date().getTime()}.png`;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
      } catch (err) {
        console.error("Failed to convert diagram to PNG", err);
      } finally {
        URL.revokeObjectURL(url);
      }
    };
    img.src = url;
  }, [svgContent, effectiveTheme]);

  if (error) {
    return (
      <div className="flex bg-red-50 dark:bg-red-900/20 text-red-600 dark:text-red-400 p-4 border border-red-200 dark:border-red-800 rounded-lg my-4 items-start gap-3 overflow-hidden">
        <AlertTriangle className="shrink-0 mt-0.5" size={18} />
        <div className="overflow-auto text-sm font-mono whitespace-pre-wrap flex-1 min-w-0">
          <p className="font-semibold mb-1 font-sans">{t('mermaid.renderError')}</p>
          {error}
        </div>
      </div>
    );
  }

  return (
    <div className={`relative !w-full group border border-gray-300 dark:border-gray-700 rounded-lg transition-colors flex flex-col ${isFullscreen
      ? 'fixed inset-0 z-[100] bg-white dark:bg-[#0a0a0a] m-0 !border-0 !rounded-none'
      : 'my-6 bg-[#fcfcfc] dark:bg-[#121212] overflow-hidden'
      }`}>

      {svgContent && (
        <TransformWrapper
          initialScale={1}
          minScale={0.1}
          maxScale={8}
          centerOnInit={true}
          limitToBounds={false}
        >
          {({ zoomIn, zoomOut, resetTransform }) => (
            <React.Fragment>
              <div className="flex justify-between items-center bg-gray-100 dark:bg-[#1f1f1f] border-b border-gray-300 dark:border-gray-700 px-3 py-2 shrink-0">
                <span className="text-xs font-semibold text-gray-500 dark:text-gray-400 font-mono flex items-center gap-1.5">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="opacity-70"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
                  {t('mermaid.title')}
                </span>

                <div className="flex gap-1 items-center">
                  <button onClick={() => zoomIn()} className="p-1.5 hover:bg-gray-200 dark:hover:bg-gray-700 rounded text-gray-600 dark:text-gray-300 transition-colors cursor-pointer" title={t('mermaid.zoomIn')}><ZoomIn size={14} /></button>
                  <button onClick={() => zoomOut()} className="p-1.5 hover:bg-gray-200 dark:hover:bg-gray-700 rounded text-gray-600 dark:text-gray-300 transition-colors cursor-pointer" title={t('mermaid.zoomOut')}><ZoomOut size={14} /></button>
                  <button onClick={() => resetTransform()} className="p-1.5 hover:bg-gray-200 dark:hover:bg-gray-700 rounded text-gray-600 dark:text-gray-300 transition-colors cursor-pointer" title={t('mermaid.resetView')}><RefreshCw size={14} /></button>
                  <div className="w-px h-4 my-auto bg-gray-300 dark:bg-gray-600 mx-1"></div>
                  <button onClick={copyCode} className="p-1.5 hover:bg-gray-200 dark:hover:bg-gray-700 rounded text-gray-600 dark:text-gray-300 transition-colors cursor-pointer" title={t('mermaid.copyCode')}>{copied ? <Check size={14} className="text-green-500" /> : <Copy size={14} />}</button>
                  <button onClick={downloadAsSVG} className="p-1.5 hover:bg-gray-200 dark:hover:bg-gray-700 rounded text-gray-600 dark:text-gray-300 transition-colors cursor-pointer" title={t('mermaid.downloadSVG')}><Download size={14} /></button>
                  <button onClick={downloadAsPNG} className="p-1.5 hover:bg-gray-200 dark:hover:bg-gray-700 rounded text-gray-600 dark:text-gray-300 transition-colors cursor-pointer" title={t('mermaid.downloadPNG')}><ImageIcon size={14} /></button>
                  <div className="w-px h-4 my-auto bg-gray-300 dark:bg-gray-600 mx-1"></div>
                  <button onClick={() => { setIsFullscreen(!isFullscreen); setTimeout(resetTransform, 50); }} className="p-1.5 hover:bg-gray-200 dark:hover:bg-gray-700 rounded text-gray-600 dark:text-gray-300 transition-colors cursor-pointer" title={isFullscreen ? t('mermaid.exitFullscreen') : t('mermaid.fullscreen')}>
                    {isFullscreen ? <Minimize size={14} /> : <Maximize size={14} />}
                  </button>
                </div>
              </div>

              <TransformComponent
                wrapperClass={`!w-full ${isFullscreen ? 'h-[calc(100vh-45px)] flex-1' : 'min-h-[250px] h-auto p-4 border-x border-b border-gray-300 dark:border-gray-700 rounded-b-lg'} flex items-center justify-center cursor-grab active:cursor-grabbing`}
                contentClass="!w-full h-full flex items-center justify-center p-4"
              >
                <div
                  ref={containerRef}
                  className={`flex justify-center items-center !w-full h-full mermaid-container ${isFullscreen ? 'mermaid-fullscreen' : ''}`}
                  dangerouslySetInnerHTML={{ __html: svgContent }}
                />
              </TransformComponent>
            </React.Fragment>
          )}
        </TransformWrapper>
      )}
    </div>
  );
};

export default MermaidViewer;
````

## File: client/src/components/common/modals/ChangelogModal.tsx
````typescript
import React, { useEffect, useState } from 'react';
import { Loader2 } from 'lucide-react';
import MarkdownRenderer from '../markdown/MarkdownRenderer';
import { useTranslation } from 'react-i18next';
import { useTheme } from '../../../contexts/ThemeContext';
import { getCurrentLocale } from '../../../utils/getCurrentLocale';
import Modal from './Modal';

interface GitHubRelease {
  tag_name: string;
  published_at: string;
  body: string;
  prerelease: boolean;
}

interface ChangelogModalProps {
  isOpen: boolean;
  onClose: () => void;
}

const ChangelogModal: React.FC<ChangelogModalProps> = ({ isOpen, onClose }) => {
  const { t: translate } = useTranslation('components/common/modals');
  const [releases, setReleases] = useState<GitHubRelease[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const { theme } = useTheme();
  const [effectiveTheme, setEffectiveTheme] = useState<'light' | 'dark'>(
    theme === 'system'
      ? window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
      : theme
  );

  useEffect(() => {
    if (theme === 'system') {
      const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
      const handleChange = () => {
        setEffectiveTheme(mediaQuery.matches ? 'dark' : 'light');
      };
      mediaQuery.addEventListener('change', handleChange);
      return () => mediaQuery.removeEventListener('change', handleChange);
    } else {
      setEffectiveTheme(theme);
    }
  }, [theme]);

  const isDark = effectiveTheme === 'dark';

  useEffect(() => {
    const fetchReleases = async () => {
      if (!isOpen) return;

      setIsLoading(true);
      setError(null);

      try {
        const response = await fetch('https://api.github.com/repos/jordan-dalby/ByteStash/releases');
        if (!response.ok) {
          throw new Error('Failed to fetch releases');
        }
        const data = await response.json();
        setReleases(data);
      } catch (err) {
        setError(translate('changelogModal.error.default'));
        console.error('Error fetching releases:', err);
      } finally {
        setIsLoading(false);
      }
    };

    fetchReleases();
  }, [isOpen]);

  const formatDate = (dateString: string) => {
    const { isoCode } = getCurrentLocale();

    return new Date(dateString).toLocaleDateString(isoCode, {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  };

  const backgroundColor = isDark ? '#1E1E1E' : '#ffffff';

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      title={<h2 className="text-xl font-bold text-light-text dark:text-dark-text">Changelog</h2>}
    >
      <style>
        {`
          .markdown-content-changelog {
            color: var(--text-color);
            background-color: ${backgroundColor};
            padding: 1rem;
            border-radius: 0.5rem;
            position: relative;
          }
          :root {
            --text-color: ${isDark ? '#ffffff' : '#000000'};
          }
        `}
      </style>
      <div className="pb-4">
        <div className="space-y-8">
          {isLoading ? (
            <div className="flex justify-center items-center py-8">
              <Loader2 className="w-6 h-6 text-light-text-secondary dark:text-dark-text-secondary animate-spin" />
            </div>
          ) : error ? (
            <div className="text-red-400 text-center py-4">{error}</div>
          ) : releases.length === 0 ? (
            <div className="text-light-text-secondary dark:text-dark-text-secondary text-center py-4">No releases found</div>
          ) : (
            releases.map((release) => (
              <div key={release.tag_name} className="border-b border-light-border dark:border-dark-border pb-6 last:border-0">
                <div className="flex flex-col mb-4">
                  <div className="flex items-center gap-2">
                    <h3 className="text-lg font-semibold text-light-text dark:text-dark-text">
                      {release.tag_name}
                      {release.prerelease && (
                        <span className="ml-2 text-xs bg-light-surface dark:bg-dark-surface text-light-text-secondary dark:text-dark-text-secondary px-2 py-1 rounded">
                          Pre-release
                        </span>
                      )}
                    </h3>
                  </div>
                  <span className="text-sm text-light-text-secondary dark:text-dark-text-secondary mt-1">
                    {formatDate(release.published_at)}
                  </span>
                </div>
                <div className="markdown-content markdown-content-changelog rounded-lg" style={{ backgroundColor }}>
                  <MarkdownRenderer className="markdown prose dark:prose-invert max-w-none">
                    {release.body}
                  </MarkdownRenderer>
                </div>
              </div>
            ))
          )}
        </div>
      </div>
    </Modal>
  );
};

export default ChangelogModal;
````

## File: client/src/components/common/modals/ConfirmationModal.tsx
````typescript
import React from 'react';
import { useTranslation } from 'react-i18next';
import Modal from './Modal';

export interface ConfirmationModalProps {
  isOpen: boolean;
  onClose: () => void;
  onConfirm: () => void;
  title: string;
  message: string;
  confirmLabel?: string;
  cancelLabel?: string;
  variant?: 'danger' | 'warning' | 'info';
}

export const ConfirmationModal: React.FC<ConfirmationModalProps> = ({
  isOpen,
  onClose,
  onConfirm,
  title,
  message,
  variant = 'danger',
  ...props
}) => {
  const { t } = useTranslation();

  const confirmLabel = props.confirmLabel || t('action.confirm');
  const cancelLabel = props.cancelLabel || t('action.cancel');

  const variantClasses = {
    danger: 'bg-red-600 hover:bg-red-700 dark:bg-red-700 dark:hover:bg-red-800',
    warning: 'bg-yellow-600 hover:bg-yellow-700 dark:bg-yellow-700 dark:hover:bg-yellow-800',
    info: 'bg-light-primary hover:opacity-90 dark:bg-dark-primary dark:hover:opacity-90'
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} title={title}>
      <div className="px-0.5 pt-1 pb-3">
        <p className="text-light-text dark:text-dark-text mb-4">{message}</p>
        <div className="flex justify-end gap-2">
          <button
            onClick={onClose}
            className="px-3 py-1.5 bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text rounded-md hover:bg-light-hover dark:hover:bg-dark-hover transition-colors"
          >
            {cancelLabel}
          </button>
          <button
            onClick={onConfirm}
            className={`px-3 py-1.5 text-white rounded-md transition-colors ${variantClasses[variant]}`}
          >
            {confirmLabel}
          </button>
        </div>
      </div>
    </Modal>
  );
};
````

## File: client/src/components/common/modals/Modal.tsx
````typescript
import React, { useEffect, useRef, useState } from "react";
import { X, Maximize2, Minimize2, Trash2, Pencil } from "lucide-react";
import { useTranslation } from "react-i18next";
import { IconButton } from "../buttons/IconButton";

export interface ModalProps {
  isOpen: boolean;
  onClose: () => void;
  title?: React.ReactNode;
  children: React.ReactNode;
  width?: string;
  expandable?: boolean;
  defaultExpanded?: boolean;
  onEdit?: () => void;
  onDelete?: () => void;
  contentRef?: React.Ref<HTMLDivElement>;
}

const Modal: React.FC<ModalProps> = ({
  isOpen,
  onClose,
  title,
  children,
  width = "max-w-3xl",
  expandable = false,
  defaultExpanded = false,
  onEdit,
  onDelete,
  contentRef,
}) => {
  const { t } = useTranslation();

  const [isExpanded, setIsExpanded] = useState(() => {
    if (expandable) {
      const savedState = localStorage.getItem("modalExpandedState");
      return savedState !== null ? savedState === "true" : defaultExpanded;
    }
    return defaultExpanded;
  });

  useEffect(() => {
    if (expandable) {
      localStorage.setItem("modalExpandedState", isExpanded.toString());
    }
  }, [isExpanded, expandable]);

  const modalRef = useRef<HTMLDivElement>(null);

  // Handle outside click + escape
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      const isBackdropClick = (event.target as HTMLElement).classList.contains(
        "modal-backdrop"
      );
      if (isBackdropClick && modalRef.current?.parentElement === event.target) {
        onClose();
      }
    };

    const handleEscapeKey = (event: KeyboardEvent) => {
      if (event.key === "Escape" && isOpen) {
        onClose();
      }
    };

    if (isOpen) {
      document.body.style.overflow = "hidden";
      document.addEventListener("mousedown", handleClickOutside);
      document.addEventListener("keydown", handleEscapeKey);
    }

    return () => {
      document.body.style.overflow = "unset";
      document.removeEventListener("mousedown", handleClickOutside);
      document.removeEventListener("keydown", handleEscapeKey);
    };
  }, [isOpen, onClose]);

  const modalWidth = isExpanded ? "max-w-[90vw]" : width;

  return (
    <div
      className={`modal-backdrop fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center p-4 z-50 transition-opacity duration-300
        ${isOpen ? "opacity-100" : "opacity-0 pointer-events-none"}`}
    >
      <div
        ref={modalRef}
        className={`bg-light-surface dark:bg-dark-surface rounded-lg w-full ${modalWidth} max-h-[80vh] flex flex-col
          transition-all duration-300 ease-in-out transform
          ${isOpen ? "opacity-100 scale-100" : "opacity-0 scale-95"}`}
        style={{
          willChange: "transform, opacity, width",
        }}
      >
        {/* Header */}
        <div className="flex items-center justify-between px-4 pt-4 pb-4 border-b border-light-border dark:border-dark-border">
          <div className="flex-1 text-lg font-semibold text-light-text dark:text-dark-text">
            {title}
          </div>
          <div className="flex items-center gap-2">
            {onEdit && (
              <IconButton
                icon={<Pencil size={18} />}
                onClick={onEdit}
                variant="secondary"
                size="sm"
                label={t('action.edit')}
              />
            )}
            {onDelete && (
              <IconButton
                icon={<Trash2 size={18} />}
                onClick={onDelete}
                variant="secondary"
                size="sm"
                label={t('action.delete')}
              />
            )}
            <div className="h-6 w-px bg-light-border dark:bg-dark-border mx-2" />
            {expandable && (
              <IconButton
                icon={
                  isExpanded ? <Minimize2 size={18} /> : <Maximize2 size={18} />
                }
                onClick={() => setIsExpanded(!isExpanded)}
                variant="secondary"
                size="sm"
                label={isExpanded ? t('action.minimize') : t('action.maximize')}
              />
            )}
            <IconButton
              icon={<X size={20} />}
              onClick={onClose}
              variant="secondary"
              size="sm"
              label={t('action.close')}
            />
          </div>
        </div>

        {/* Single scrollable area connected to external ref */}
        <div ref={contentRef} className="flex-1 px-4 pb-4 mt-4 overflow-y-auto">
          {children}
        </div>
      </div>
    </div>
  );
};

export default Modal;
````

## File: client/src/components/common/switch/Switch.tsx
````typescript
import React from 'react';

export const Switch: React.FC<{
  id: string;
  checked: boolean;
  onChange: (checked: boolean) => void;
}> = ({ id, checked, onChange }) => (
  <button
    type="button"
    id={id}
    role="switch"
    aria-checked={checked}
    onClick={() => onChange(!checked)}
    className={`
      relative inline-flex h-5 w-9 items-center rounded-full
      transition-colors duration-200 ease-in-out focus:outline-none focus-visible:ring-2 focus-visible:ring-light-primary dark:focus-visible:ring-dark-primary
      ${checked ? 'bg-light-primary dark:bg-dark-primary' : 'bg-light-hover dark:bg-dark-hover'}
    `}
  >
    <span
      className={`
        inline-block h-4 w-4 transform rounded-full
        transition duration-200 ease-in-out
        ${checked ? 'translate-x-4 bg-white' : 'translate-x-1 bg-light-text-secondary dark:bg-dark-text-secondary'}
      `}
    />
  </button>
);
````

## File: client/src/components/editor/export/CarbonExportPreview.tsx
````typescript
import { forwardRef } from 'react';
import { Prism as SyntaxHighlighter } from 'react-syntax-highlighter';
import { vscDarkPlus, vs } from 'react-syntax-highlighter/dist/esm/styles/prism';
import { useTheme } from '../../../contexts/ThemeContext';

export interface CarbonExportPreviewProps {
  code: string;
  language: string;
  showLineNumbers: boolean;
}

export const CarbonExportPreview = forwardRef<HTMLDivElement, CarbonExportPreviewProps>(
  ({ code, language, showLineNumbers }, ref) => {
    const { theme } = useTheme();
    const isDark = theme === 'dark' || (theme === 'system' && window.matchMedia('(prefers-color-scheme: dark)').matches);
    const syntaxTheme = isDark ? vscDarkPlus : vs;

    return (
      <div 
        ref={ref} 
        className="p-8 flex items-center justify-center font-sans"
        style={{
          background: 'linear-gradient(140deg, rgb(142, 197, 252), rgb(224, 195, 252))',
          width: 'max-content',
          minWidth: '600px',
        }}
      >
        <div 
          className="rounded-xl overflow-hidden shadow-2xl flex flex-col w-full"
          style={{
            backgroundColor: isDark ? '#1E1E1E' : '#ffffff',
            boxShadow: 'rgba(0, 0, 0, 0.55) 0px 20px 68px'
          }}
        >
          {/* macOS window controls */}
          <div 
            className="flex items-center h-10 px-4"
            style={{ 
              backgroundColor: isDark ? '#2D2D2D' : '#f5f5f5',
              borderBottom: isDark ? '1px solid #404040' : '1px solid #e5e5e5'
            }}
          >
            <div className="flex gap-2">
              <div className="w-3 h-3 rounded-full bg-[#FF5F56]"></div>
              <div className="w-3 h-3 rounded-full bg-[#FFBD2E]"></div>
              <div className="w-3 h-3 rounded-full bg-[#27C93F]"></div>
            </div>
          </div>
          
          {/* Code content */}
          <div className="p-4 text-sm" style={{ maxHeight: 'none', overflow: 'visible' }}>
            <SyntaxHighlighter
              language={language.toLowerCase()}
              style={syntaxTheme}
              showLineNumbers={showLineNumbers}
              customStyle={{
                margin: 0,
                padding: 0,
                background: 'transparent',
                overflow: 'visible'
              }}
              codeTagProps={{
                style: {
                  fontFamily: '"SF Mono", "Fira Code", format, Consolas, "Liberation Mono", Menlo, Courier, monospace',
                  fontSize: '14px',
                  lineHeight: '1.5'
                }
              }}
            >
              {code}
            </SyntaxHighlighter>
          </div>
        </div>
      </div>
    );
  }
);

CarbonExportPreview.displayName = 'CarbonExportPreview';
````

## File: client/src/components/editor/export/ExportImageButton.tsx
````typescript
import React from 'react';
import { Camera as ImageIcon } from 'lucide-react';
import { useTranslation } from 'react-i18next';

export interface ExportImageButtonProps {
  onClick: (e: React.MouseEvent) => void;
}

const ExportImageButton: React.FC<ExportImageButtonProps> = ({ onClick }) => {
  const { t } = useTranslation('components/common/buttons');

  return (
    <button
      onClick={onClick}
      className="p-1 bg-light-surface dark:bg-dark-surface rounded-md 
        hover:bg-light-hover dark:hover:bg-dark-hover transition-colors text-light-text dark:text-dark-text"
      title={t('exportButton.tooltip')}
    >
      <ImageIcon size={16} className="text-light-text dark:text-dark-text" />
    </button>
  );
};

export default ExportImageButton;
````

## File: client/src/components/editor/export/ExportImageModal.tsx
````typescript
import React, { useRef, useState } from 'react';
import Modal from '../../common/modals/Modal';
import { CarbonExportPreview } from './CarbonExportPreview';
import { useTranslation } from 'react-i18next';
import { toPng, toSvg } from 'html-to-image';
import { Download, Copy, Share2, Linkedin } from 'lucide-react';

export interface ExportImageModalProps {
  isOpen: boolean;
  onClose: () => void;
  code: string;
  language: string;
}

const ExportImageModal: React.FC<ExportImageModalProps> = ({
  isOpen,
  onClose,
  code,
  language,
}) => {
  const { t } = useTranslation('components/common/buttons');
  const previewRef = useRef<HTMLDivElement>(null);
  const [isExporting, setIsExporting] = useState(false);
  const [copiedMessage, setCopiedMessage] = useState('');

  const handleDownloadPng = async () => {
    if (!previewRef.current) return;
    setIsExporting(true);
    try {
      const dataUrl = await toPng(previewRef.current, { pixelRatio: 2 });
      const link = document.createElement('a');
      link.download = `carbon-${Date.now()}.png`;
      link.href = dataUrl;
      link.click();
    } catch (err) {
      console.error('Failed to generate PNG', err);
      alert(t('exportModal.errorGenerate'));
    } finally {
      setIsExporting(false);
    }
  };

  const handleDownloadSvg = async () => {
    if (!previewRef.current) return;
    setIsExporting(true);
    try {
      const dataUrl = await toSvg(previewRef.current);
      const link = document.createElement('a');
      link.download = `carbon-${Date.now()}.svg`;
      link.href = dataUrl;
      link.click();
    } catch (err) {
      console.error('Failed to generate SVG', err);
      alert(t('exportModal.errorGenerate'));
    } finally {
      setIsExporting(false);
    }
  };

  const handleCopyClipboard = async () => {
    if (!previewRef.current) return;
    setIsExporting(true);
    try {
      const dataUrl = await toPng(previewRef.current, { pixelRatio: 2 });
      // Convert base64 to blob
      const res = await fetch(dataUrl);
      const blob = await res.blob();
      
      const item = new ClipboardItem({ 'image/png': blob });
      await navigator.clipboard.write([item]);
      
      setCopiedMessage(t('exportModal.successCopy'));
      setTimeout(() => setCopiedMessage(''), 3000);
    } catch (err) {
      console.error('Failed to copy to clipboard', err);
      alert(t('exportModal.errorCopy'));
    } finally {
      setIsExporting(false);
    }
  };

  const getTwitterShareUrl = () => {
    const text = encodeURIComponent('Check out this code snippet!');
    return `https://twitter.com/intent/tweet?text=${text}`;
  };

  const getLinkedInShareUrl = () => {
    // LinkedIn doesn't support pre-filling images via URL intent well,
    // but users can copy to clipboard and paste in the post intent.
    return `https://www.linkedin.com/sharing/share-offsite/`;
  };

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      title={t('exportModal.title')}
      width="max-w-5xl"
    >
      <div className="flex flex-col gap-6">
        
        {/* Preview Area */}
        <div className="flex justify-center bg-light-background dark:bg-dark-background rounded-lg border border-light-border dark:border-dark-border overflow-x-auto p-4 max-h-[500px]">
          <div className="transform scale-75 origin-top relative" style={{ height: 'max-content' }}>
            <CarbonExportPreview
              ref={previewRef}
              code={code}
              language={language}
              showLineNumbers={true}
            />
          </div>
        </div>

        {/* Actions Area */}
        <div className="flex flex-col gap-4 border-t border-light-border dark:border-dark-border pt-4">
          <div className="flex flex-wrap justify-between items-center gap-4">
            
            <div className="flex gap-3">
              <button
                disabled={isExporting}
                onClick={handleDownloadPng}
                className="flex items-center gap-2 px-4 py-2 bg-light-primary dark:bg-dark-primary text-white rounded-md hover:opacity-90 transition-opacity disabled:opacity-50"
              >
                <Download size={16} />
                {t('exportModal.downloadPng')}
              </button>
              
              <button
                disabled={isExporting}
                onClick={handleDownloadSvg}
                className="flex items-center gap-2 px-4 py-2 border border-light-border dark:border-dark-border rounded-md hover:bg-light-surface dark:hover:bg-dark-surface transition-colors disabled:opacity-50 text-light-text dark:text-dark-text"
              >
                <Download size={16} />
                {t('exportModal.downloadSvg')}
              </button>

              <button
                disabled={isExporting}
                onClick={handleCopyClipboard}
                className="flex items-center gap-2 px-4 py-2 border border-light-border dark:border-dark-border rounded-md hover:bg-light-surface dark:hover:bg-dark-surface transition-colors disabled:opacity-50 text-light-text dark:text-dark-text"
              >
                <Copy size={16} />
                {t('exportModal.copyClipboard')}
              </button>

              {copiedMessage && (
                <span className="text-sm text-green-500 self-center">{copiedMessage}</span>
              )}
            </div>

            <div className="flex gap-3">
              <a
                href={getTwitterShareUrl()}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-2 px-3 py-2 bg-[#1DA1F2] text-white rounded-md hover:opacity-90 transition-opacity"
              >
                <Share2 size={16} />
                {t('exportModal.shareTwitter')}
              </a>
              <a
                href={getLinkedInShareUrl()}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-2 px-3 py-2 bg-[#0A66C2] text-white rounded-md hover:opacity-90 transition-opacity"
              >
                <Linkedin size={16} />
                {t('exportModal.shareLinkedIn')}
              </a>
            </div>

          </div>
        </div>

      </div>
    </Modal>
  );
};

export default ExportImageModal;
````

## File: client/src/components/editor/CodeEditor.tsx
````typescript
import React, { useRef, useEffect, useState } from 'react';
import Editor, { OnMount } from '@monaco-editor/react';
import * as Monaco from 'monaco-editor/esm/vs/editor/editor.api';
import { getMonacoLanguage } from '../../utils/language/languageUtils';
import { useTheme } from '../../contexts/ThemeContext';

export interface CodeEditorProps {
  code: string;
  language?: string;
  onValueChange: (value?: string) => void;
  showLineNumbers: boolean;
  minHeight?: string;
  maxHeight?: string;
}

export const CodeEditor: React.FC<CodeEditorProps> = ({
  code,
  language = 'plaintext',
  onValueChange,
  showLineNumbers = true,
  minHeight = "100px",
  maxHeight = "500px"
}) => {
  const editorRef = useRef<Monaco.editor.IStandaloneCodeEditor | null>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const monacoLanguage = getMonacoLanguage(language);
  const [editorHeight, setEditorHeight] = useState<string>(minHeight);
  const { theme } = useTheme();
  const [effectiveTheme, setEffectiveTheme] = useState<'light' | 'dark'>(
    theme === 'system' 
      ? window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
      : theme
  );
  
  useEffect(() => {
    const updateEffectiveTheme = () => {
      if (theme === 'system') {
        setEffectiveTheme(window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
      } else {
        setEffectiveTheme(theme);
      }
    };

    updateEffectiveTheme();

    if (theme === 'system') {
      const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
      mediaQuery.addEventListener('change', updateEffectiveTheme);
      return () => mediaQuery.removeEventListener('change', updateEffectiveTheme);
    }
  }, [theme]);

  const isDark = effectiveTheme === 'dark';

  useEffect(() => {
    if (editorRef.current) {
      const currentValue = editorRef.current.getValue();
      if (currentValue !== code) {
        editorRef.current.setValue(code);
      }
    }
  }, [code]);

  const updateEditorHeight = () => {
    if (!editorRef.current) return;
    
    const editor = editorRef.current;
    const contentHeight = editor.getContentHeight();
    const minHeightPx = parseInt(minHeight);
    const maxHeightPx = parseInt(maxHeight);
    
    const newHeight = Math.min(maxHeightPx, Math.max(minHeightPx, contentHeight));
    
    setEditorHeight(`${newHeight}px`);
    
    const shouldShowScrollbar = contentHeight > maxHeightPx;
    editor.updateOptions({
      scrollbar: {
        vertical: shouldShowScrollbar ? 'visible' : 'hidden',
        horizontal: 'visible',
        verticalScrollbarSize: 12,
        horizontalScrollbarSize: 12,
      }
    });
    
    editor.layout();
  };

  const handleEditorDidMount: OnMount = (editor) => {
    editorRef.current = editor;

    editor.onDidContentSizeChange(() => {
      window.requestAnimationFrame(updateEditorHeight);
    });

    updateEditorHeight();
  };

  useEffect(() => {
    if (editorRef.current) {
      const model = editorRef.current.getModel();
      if (model) {
        Monaco.editor.setModelLanguage(model, monacoLanguage);
        updateEditorHeight();
      }
    }
  }, [monacoLanguage]);

  return (
    <div ref={containerRef} className="overflow-hidden rounded-lg border border-light-border dark:border-dark-border">
      <Editor
        height={editorHeight}
        value={code}
        defaultLanguage={monacoLanguage}
        onChange={(value) => {
          onValueChange?.(value);
          setTimeout(updateEditorHeight, 10);
        }}
        onMount={handleEditorDidMount}
        theme={isDark ? "vs-dark" : "light"}
        options={{
          minimap: { enabled: false },
          scrollBeyondLastLine: false,
          fontSize: 13,
          lineNumbers: showLineNumbers ? 'on' : 'off',
          renderLineHighlight: 'all',
          wordWrap: 'on',
          wrappingIndent: 'indent',
          automaticLayout: true,
          folding: false,
          tabSize: 4,
          formatOnPaste: true,
          formatOnType: true,
          padding: { top: 12, bottom: 12 },
          lineDecorationsWidth: showLineNumbers ? 24 : 50,
          overviewRulerBorder: false,
          scrollbar: {
            alwaysConsumeMouseWheel: false, // Fixes an issue where scrolling to end of code block did not allow further scrolling
            vertical: 'visible',
            horizontal: 'visible',
            verticalScrollbarSize: 12,
            horizontalScrollbarSize: 12,
            useShadows: false
          }
        }}
      />
    </div>
  );
};
````

## File: client/src/components/editor/FullCodeBlock.tsx
````typescript
import React, { useEffect, useRef, useState } from "react";
import MarkdownRenderer from "../common/markdown/MarkdownRenderer";
import Editor from "@monaco-editor/react";
import {
  getLanguageLabel,
  getMonacoLanguage,
} from "../../utils/language/languageUtils";
import CopyButton from "../common/buttons/CopyButton";
import { useTheme } from "../../contexts/ThemeContext";
import RawButton from "../common/buttons/RawButton";
import ExportImageButton from "./export/ExportImageButton";
import ExportImageModal from "./export/ExportImageModal";

export interface FullCodeBlockProps {
  code: string;
  language?: string;
  showLineNumbers?: boolean;
  isPublicView?: boolean;
  snippetId?: string;
  fragmentId?: string;
}

export const FullCodeBlock: React.FC<FullCodeBlockProps> = ({
  code,
  language = "plaintext",
  showLineNumbers = true,
  isPublicView,
  snippetId,
  fragmentId,
}) => {
  const { theme } = useTheme();
  const [effectiveTheme, setEffectiveTheme] = useState<"light" | "dark">(
    theme === "system"
      ? window.matchMedia("(prefers-color-scheme: dark)").matches
        ? "dark"
        : "light"
      : theme
  );
  
  const [isExportModalOpen, setIsExportModalOpen] = useState(false);

  useEffect(() => {
    if (theme === "system") {
      const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");
      const handleChange = () => {
        setEffectiveTheme(mediaQuery.matches ? "dark" : "light");
      };
      mediaQuery.addEventListener("change", handleChange);
      return () => mediaQuery.removeEventListener("change", handleChange);
    } else {
      setEffectiveTheme(theme);
    }
  }, [theme]);

  const isDark = effectiveTheme === "dark";
  const isMarkdown = getLanguageLabel(language) === "markdown";
  const [highlighterHeight, setHighlighterHeight] = useState<string>("100px");
  const containerRef = useRef<HTMLDivElement>(null);
  const LINE_HEIGHT = 19;

  useEffect(() => {
    updateHighlighterHeight();
    const resizeObserver = new ResizeObserver(updateHighlighterHeight);
    if (containerRef.current) {
      resizeObserver.observe(containerRef.current);
    }
    return () => resizeObserver.disconnect();
  }, [code]);

  const updateHighlighterHeight = () => {
    if (!containerRef.current) return;

    const lineCount = code.split("\n").length;
    const contentHeight = lineCount * LINE_HEIGHT + 35;
    const newHeight = Math.min(500, Math.max(100, contentHeight));
    setHighlighterHeight(`${newHeight}px`);
  };
  const backgroundColor = isDark ? "#1E1E1E" : "#ffffff";

  return (
    <div className="relative">
      <style>
        {`
          .markdown-content-full {
            color: var(--text-color);
            background-color: ${backgroundColor};
            padding: 1rem;
            border-radius: 0.5rem;
            position: relative;
          }
          :root {
            --text-color: ${isDark ? "#ffffff" : "#000000"};
          }
        `}
      </style>
      <div className="relative">
        {isMarkdown ? (
          <div
            className="rounded-lg markdown-content markdown-content-full"
            style={{ backgroundColor }}
          >
            <MarkdownRenderer
              className={`markdown prose ${isDark ? "prose-invert" : ""
                } max-w-none`}
            >
              {code}
            </MarkdownRenderer>
          </div>
        ) : (
          <div ref={containerRef} style={{ 
            maxHeight: "500px", 
            borderRadius: "0.5rem", 
            overflow: "hidden", 
            background: backgroundColor,
            border: isDark ? '1px solid #333' : '1px solid #e5e7eb'
          }}>
            <Editor
              height={highlighterHeight}
              language={getMonacoLanguage(language)}
              theme={isDark ? "vs-dark" : "light"}
              value={code}
              options={{
                readOnly: true,
                minimap: { enabled: false },
                scrollBeyondLastLine: false,
                wordWrap: "off",
                padding: { top: 16, bottom: 16 },
                lineNumbers: showLineNumbers ? "on" : "off",
                renderLineHighlight: "none",
                scrollbar: {
                  vertical: "visible",
                  horizontal: "visible"
                }
              }}
            />
          </div>
        )}

        <div className="absolute top-2 right-2 flex items-center gap-2 z-10">
          <CopyButton text={code} />
          <ExportImageButton onClick={() => setIsExportModalOpen(true)} />
          {isPublicView !== undefined &&
            snippetId !== undefined &&
            fragmentId !== undefined && (
              <RawButton
                isPublicView={isPublicView}
                snippetId={snippetId}
                fragmentId={fragmentId}
              />
            )}
        </div>
      </div>

      <ExportImageModal
        isOpen={isExportModalOpen}
        onClose={() => setIsExportModalOpen(false)}
        code={code}
        language={language}
      />
    </div>
  );
};
````

## File: client/src/components/editor/PreviewCodeBlock.tsx
````typescript
import React, { useEffect, useState } from "react";
import MarkdownRenderer from "../common/markdown/MarkdownRenderer";
import Editor from "@monaco-editor/react";
import {
  getLanguageLabel,
  getMonacoLanguage,
} from "../../utils/language/languageUtils";
import CopyButton from "../common/buttons/CopyButton";
import { useTheme } from "../../contexts/ThemeContext";
import RawButton from "../common/buttons/RawButton";

interface PreviewCodeBlockProps {
  code: string;
  language?: string;
  previewLines?: number;
  showLineNumbers?: boolean;
  isPublicView?: boolean;
  isRecycleView?: boolean;
  snippetId?: string;
  fragmentId?: string;
}

export const PreviewCodeBlock: React.FC<PreviewCodeBlockProps> = ({
  code,
  language = "plaintext",
  previewLines = 4,
  showLineNumbers = true,
  isPublicView,
  isRecycleView,
  snippetId,
  fragmentId,
}) => {
  const { theme } = useTheme();
  const [effectiveTheme, setEffectiveTheme] = useState<"light" | "dark">(
    theme === "system"
      ? window.matchMedia("(prefers-color-scheme: dark)").matches
        ? "dark"
        : "light"
      : theme
  );

  useEffect(() => {
    const updateEffectiveTheme = () => {
      if (theme === "system") {
        setEffectiveTheme(
          window.matchMedia("(prefers-color-scheme: dark)").matches
            ? "dark"
            : "light"
        );
      } else {
        setEffectiveTheme(theme);
      }
    };

    updateEffectiveTheme();

    if (theme === "system") {
      const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");
      mediaQuery.addEventListener("change", updateEffectiveTheme);
      return () =>
        mediaQuery.removeEventListener("change", updateEffectiveTheme);
    }
  }, [theme]);

  const isDark = effectiveTheme === "dark";
  const isMarkdown = getLanguageLabel(language) === "markdown";
  const LINE_HEIGHT = 19;
  const visibleHeight = (previewLines + 2) * LINE_HEIGHT;

  const truncatedCode = code
    .split("\n")
    .slice(0, previewLines + 5)
    .join("\n");

  const backgroundColor = isDark ? "#1E1E1E" : "#ffffff";

  return (
    <div className="relative select-none" style={{ height: visibleHeight }}>
      <style>
        {`
          .markdown-content-preview {
            color: var(--text-color);
            background-color: ${backgroundColor};
            padding: 1rem;
            border-radius: 0.5rem;
            position: relative;
            max-height: ${visibleHeight}px;
            overflow: hidden;
          }
          .token-line:nth-child(n+${previewLines + 1}) {
            visibility: hidden;
          }
          .react-syntax-highlighter-line-number:nth-child(n+${previewLines + 1
          }) {
            visibility: hidden;
          }
          :root {
            --text-color: ${isDark ? "#ffffff" : "#000000"};
          }
        `}
      </style>

      <div className="relative">
        {isMarkdown ? (
          <div
            className="overflow-hidden rounded-lg markdown-content markdown-content-preview"
            style={{ backgroundColor }}
          >
            <MarkdownRenderer
              className={`markdown prose ${isDark ? "prose-invert" : ""
                } max-w-none`}
              disableMermaid
            >
              {truncatedCode}
            </MarkdownRenderer>
          </div>
        ) : (
          <div className="preview-wrapper" style={{ 
            height: visibleHeight, 
            borderRadius: "0.5rem", 
            overflow: "hidden", 
            background: backgroundColor,
            border: isDark ? '1px solid #333' : '1px solid #e5e7eb'
          }}>
            <Editor
              height={visibleHeight}
              language={getMonacoLanguage(language)}
              theme={isDark ? "vs-dark" : "light"}
              value={truncatedCode}
              options={{
                readOnly: true,
                minimap: { enabled: false },
                scrollBeyondLastLine: false,
                wordWrap: "off",
                padding: { top: 16, bottom: 16 },
                lineNumbers: showLineNumbers ? "on" : "off",
                renderLineHighlight: "none",
                scrollbar: {
                  vertical: "hidden",
                  horizontal: "visible"
                }
              }}
            />
          </div>
        )}

        <div
          className="absolute inset-x-0 bottom-0 rounded-b-lg pointer-events-none bg-gradient-to-t to-transparent"
          style={{
            height: `${LINE_HEIGHT * 2}px`,
            background: `linear-gradient(to top, ${backgroundColor}, transparent)`,
          }}
        />

        <div className="absolute top-2 right-2 flex items-center gap-2 z-10">
          <CopyButton text={code} />
          {!isRecycleView &&
            isPublicView !== undefined &&
            snippetId !== undefined &&
            fragmentId !== undefined && (
              <RawButton
                isPublicView={isPublicView}
                snippetId={snippetId}
                fragmentId={fragmentId}
              />
            )}
        </div>
      </div>
    </div>
  );
};
````

## File: client/src/components/search/SearchAndFilter.tsx
````typescript
import React, { memo, useMemo } from "react";
import {
  ChevronDown,
  Grid,
  List,
  Settings,
  Plus,
  Trash,
  Star,
} from "lucide-react";
import { useTranslation } from "react-i18next";
import { SearchBar } from "./SearchBar";
import { IconButton } from "../common/buttons/IconButton";
import { useNavigate, useSearchParams } from "react-router-dom";

export interface SearchAndFilterProps {
  metadata: { categories: string[]; languages: string[] };
  onSearchChange: (search: string) => void;
  onLanguageChange: (language: string) => void;
  onCategoryToggle: (category: string) => void;
  onSortChange: (sort: string) => void;
  viewMode: "grid" | "list";
  setViewMode: (mode: "grid" | "list") => void;
  openSettingsModal: () => void;
  openNewSnippetModal: () => void;
  hideNewSnippet?: boolean;
  hideRecycleBin?: boolean;
  showFavorites?: boolean;
  handleShowFavorites?: () => void;
  isPublicView?: boolean;
}

export const SearchAndFilter: React.FC<SearchAndFilterProps> = memo(({
  metadata,
  onSearchChange,
  onLanguageChange,
  onCategoryToggle,
  onSortChange,
  viewMode,
  setViewMode,
  openSettingsModal,
  openNewSnippetModal,
  hideNewSnippet = false,
  hideRecycleBin = false,
  showFavorites,
  handleShowFavorites,
}) => {
  const { t: translate } = useTranslation('components/search');
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();

  const selectedCategories = useMemo(() =>
    searchParams.get("categories")?.split(",").filter(Boolean) || [],
    [searchParams]
  );

  const currentLanguage = useMemo(() =>
    searchParams.get("language") || "",
    [searchParams]
  );

  const currentSort = useMemo(() =>
    searchParams.get("sort") || "newest",
    [searchParams]
  );

  const currentSearch = useMemo(() =>
    searchParams.get("search") || "",
    [searchParams]
  );

  const sortOptions = [
    { value: "newest" as const, label: translate('sort.newestFirst') },
    { value: "oldest" as const, label: translate('sort.oldestFirst') },
    { value: "alpha-asc" as const, label: translate('sort.alphaAsc') },
    { value: "alpha-desc" as const, label: translate('sort.alphaDesc') },
  ];

  return (
    <div className="flex flex-wrap items-center gap-2 mb-6">
      <SearchBar
        value={currentSearch}
        onChange={onSearchChange}
        onCategorySelect={onCategoryToggle}
        existingCategories={metadata.categories}
        selectedCategories={selectedCategories}
      />

      <div className="relative">
        <select
          className="px-4 py-2 pr-10 rounded-lg appearance-none bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary"
          value={currentLanguage}
          onChange={(e) => onLanguageChange(e.target.value)}
        >
          <option value="">{translate('filter.language.all')}</option>
          {metadata.languages.map((lang) => (
            <option key={lang} value={lang}>
              {lang}
            </option>
          ))}
        </select>
        <ChevronDown
          className="absolute -translate-y-1/2 pointer-events-none right-2 top-1/2 text-light-text-secondary dark:text-dark-text-secondary"
          size={20}
        />
      </div>

      <div className="relative">
        <select
          className="px-4 py-2 pr-10 rounded-lg appearance-none bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary"
          value={currentSort}
          onChange={(e) => onSortChange(e.target.value)}
        >
          {sortOptions.map((option) => (
            <option key={option.value} value={option.value}>
              {option.label}
            </option>
          ))}
        </select>
        <ChevronDown
          className="absolute -translate-y-1/2 pointer-events-none right-2 top-1/2 text-light-text-secondary dark:text-dark-text-secondary"
          size={20}
        />
      </div>

      <div className="flex items-center gap-2">
        <IconButton
          icon={<Grid size={20} />}
          onClick={() => setViewMode("grid")}
          variant={viewMode === "grid" ? "primary" : "secondary"}
          className="h-10 px-4"
          label={translate('view.grid')}
        />
        <IconButton
          icon={<List size={20} />}
          onClick={() => setViewMode("list")}
          variant={viewMode === "list" ? "primary" : "secondary"}
          className="h-10 px-4"
          label={translate('view.list')}
        />
        <IconButton
          icon={<Settings size={20} />}
          onClick={openSettingsModal}
          variant="secondary"
          className="h-10 px-4"
          label={translate('action.openSettings')}
        />
        {!hideNewSnippet && (
          <div className="flex gap-2">
            {!hideRecycleBin && (
              <IconButton
                icon={<Plus size={20} />}
                label={translate('action.newSnippet')}
                onClick={openNewSnippetModal}
                variant="action"
                className="h-10 pl-2 pr-4"
                showLabel
              />
            )}
            <IconButton
              icon={<Star size={20} />}
              onClick={handleShowFavorites || (() => {})}
              variant={showFavorites ? "primary" : "secondary"}
              className="h-10 px-4"
              label={showFavorites ? translate('action.showAll') : translate('action.showFavorites')}
            />
            <IconButton
              icon={<Trash size={20} />}
              onClick={() => navigate("/recycle/snippets")}
              variant={
                location.pathname === "/recycle/snippets"
                  ? "primary"
                  : "secondary"
              }
              className="h-10 px-4"
              label={translate('action.recycleBin')}
            />
          </div>
        )}
      </div>
    </div>
  );
});

SearchAndFilter.displayName = 'SearchAndFilter';
````

## File: client/src/components/search/SearchBar.tsx
````typescript
import { useState, useEffect, useRef, useMemo, memo, useImperativeHandle, forwardRef } from 'react';
import { Search, X } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import BaseDropdown, { BaseDropdownRef } from '../common/dropdowns/BaseDropdown';
import { IconButton } from '../common/buttons/IconButton';
import { useKeyboardShortcut } from '../../hooks/useKeyboardShortcut';
import { debounce } from '../../utils/helpers/debounce';

interface SearchBarProps {
  value?: string;
  onChange: (value: string) => void;
  onCategorySelect: (category: string) => void;
  existingCategories: string[];
  selectedCategories: string[];
  placeholder?: string;
}

export interface SearchBarRef {
  clear: () => void;
  getValue: () => string;
}

export const SearchBar = memo(forwardRef<SearchBarRef, SearchBarProps>(({
  value = '',
  onChange,
  onCategorySelect,
  existingCategories,
  selectedCategories,
  ...props
}, ref) => {
  const { t: translate } = useTranslation('components/search');
  const [inputValue, setInputValue] = useState(value);
  const inputRef = useRef<BaseDropdownRef>(null);

  const placeholder = props.placeholder || translate('defaultPlaceholder');

  useEffect(() => {
    setInputValue(value);
  }, [value]);

  const debouncedOnChange = useMemo(
    () => debounce((value: string) => {
      onChange(value);
    }, 300),
    [onChange]
  );

  useEffect(() => {
    return () => {
      debouncedOnChange.cancel();
    };
  }, [debouncedOnChange]);

  useImperativeHandle(ref, () => ({
    clear: () => {
      setInputValue('');
      debouncedOnChange.cancel();
      onChange('');
    },
    getValue: () => inputValue
  }), [inputValue, debouncedOnChange, onChange]);

  // Focus the search input when "/" key is pressed
  useKeyboardShortcut({
    key: '/',
    callback: () => {
      if (inputRef.current) {
        inputRef.current.focus();
      }
    },
  });

  const getSections = (searchTerm: string) => {
    if (!searchTerm.includes('#')) return [];

    const term = searchTerm.slice(searchTerm.lastIndexOf('#') + 1).trim().toLowerCase();
    const sections = [];

    const availableCategories = existingCategories.filter(
      cat => !selectedCategories.includes(cat.toLowerCase())
    );

    const filtered = term
      ? availableCategories.filter(cat => cat.toLowerCase().includes(term))
      : availableCategories;

    if (filtered.length > 0) {
      sections.push({
        title: translate('categories.title'),
        items: filtered
      });
    }

    if (term && !existingCategories.some(cat => cat.toLowerCase() === term)) {
      sections.push({
        title: translate('categories.addNew'),
        items: [`${translate('categories.addNew')}: ${term}`]
      });
    }

    return sections;
  };

  const handleInputChange = (value: string) => {
    setInputValue(value);

    // Don't trigger onChange while typing category (after #)
    // This prevents the hashtag portion from being sent to the backend
    if (!value.includes('#')) {
      debouncedOnChange(value);
    } else {
      // Cancel any pending debounced changes when # is typed
      debouncedOnChange.cancel();
    }
  };

  const handleSelect = (option: string) => {
    const newCategory = option.startsWith(`${translate('categories.addNew')}:`)
      ? option.slice(9).trim()
      : option;

    // Remove the hashtag portion from the search
    const hashtagIndex = inputValue.lastIndexOf('#');
    const newValue = hashtagIndex !== -1
      ? inputValue.substring(0, hashtagIndex).trim()
      : inputValue;

    // Update input value
    setInputValue(newValue);

    // Immediately call onChange with the cleaned value (no debounce)
    onChange(newValue);

    // Select the category
    onCategorySelect(newCategory.toLowerCase());
  };

  const handleClear = () => {
    setInputValue('');
    debouncedOnChange.cancel();
    onChange('');
  };

  return (
    <div className="relative flex-grow">
      <BaseDropdown
        ref={inputRef}
        value={inputValue}
        onChange={handleInputChange}
        onSelect={handleSelect}
        getSections={getSections}
        placeholder={placeholder}
        className="h-10 mt-0 bg-light-surface dark:bg-dark-surface"
        showChevron={false}
      />
      {inputValue && (
        <IconButton
          icon={<X size={20} />}
          onClick={handleClear}
          variant="secondary"
          className="absolute right-3 top-1/2 -translate-y-1/2 mr-4 text-light-text-secondary dark:text-dark-text-secondary"
          label={translate('action.clear')}
        />
      )}
      <Search
        className="absolute right-3 top-1/2 -translate-y-1/2 text-light-text-secondary dark:text-dark-text-secondary pointer-events-none"
        size={16}
      />
    </div>
  );
}));

SearchBar.displayName = 'SearchBar';
````

## File: client/src/components/settings/SettingsModal.tsx
````typescript
import React, { useRef, useState, useEffect, type HTMLAttributes } from "react";
import { useTranslation } from "react-i18next";
import {
  AlertCircle,
  BookOpen,
  ChevronDown,
  Clock,
  Download,
  Upload,
  Sun,
  Moon,
  Monitor,
} from "lucide-react";
import JSZip from "jszip";
import { useToast } from "../../hooks/useToast";
import { Locale } from "../../i18n/types";
import { Snippet } from "../../types/snippets";
import ChangelogModal from "../common/modals/ChangelogModal";
import Modal from "../common/modals/Modal";
import { Switch } from "../common/switch/Switch";
import { getAssetPath } from "../../utils/paths";
import { snippetService } from "../../service/snippetService";

const GITHUB_URL = "https://github.com/jordan-dalby/ByteStash";
const DOCKER_URL =
  "https://github.com/jordan-dalby/ByteStash/pkgs/container/bytestash";
const REDDIT_URL =
  "https://www.reddit.com/r/selfhosted/comments/1gb1ail/selfhosted_code_snippet_manager/";
const WIKI_URL = "https://github.com/jordan-dalby/ByteStash/wiki";

interface ImportProgress {
  total: number;
  current: number;
  succeeded: number;
  failed: number;
  errors: { title: string; error: string }[];
}

interface ImportData {
  version: string;
  exported_at: string;
  snippets: Omit<Snippet, "id" | "updated_at">[];
}

export interface SettingsModalProps {
  isOpen: boolean;
  onClose: () => void;
  settings: {
    compactView: boolean;
    showCodePreview: boolean;
    previewLines: number;
    includeCodeInSearch: boolean;
    showCategories: boolean;
    expandCategories: boolean;
    showLineNumbers: boolean;
    theme: "light" | "dark" | "system";
    locale: Locale;
  };
  onSettingsChange: (newSettings: SettingsModalProps["settings"]) => void;
  isPublicView: boolean;
}

type LocaleSelectProps = {
  value: Locale;
  onChange: (value: Locale) => void;
  theme: string;
} & Omit<HTMLAttributes<HTMLSelectElement>, 'onChange'>

const LocaleSelect = ({
  value,
  onChange,
  theme,
  ...attrs
}: LocaleSelectProps) => {
  const { t } = useTranslation();

  const localeNames = Object.keys(Locale);
  const localesOptions = localeNames.map((locale) => ({
    value: locale as Locale,
    label: t(`locale.${locale}`),
  }));

  return (
    <div className="relative">
      <select
        className="px-4 py-2 pr-10 rounded-lg appearance-none focus:outline-none bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text"
        value={value}
        onChange={(e) => onChange(e.target.value as Locale)}
        {...attrs}
      >
        {localesOptions.map((option) => (
          <option key={option.value} value={option.value}>
            {option.label}
          </option>
        ))}
      </select>
      <ChevronDown
        className="absolute -translate-y-1/2 pointer-events-none right-2 top-1/2 text-light-text-secondary dark:text-dark-text-secondary"
        size={20}
      />
    </div>
  );
};

const SettingsModal: React.FC<SettingsModalProps> = ({
  isOpen,
  onClose,
  settings,
  onSettingsChange,
  isPublicView,
}) => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/settings');

  const [compactView, setCompactView] = useState(settings.compactView);
  const [showCodePreview, setShowCodePreview] = useState(
    settings.showCodePreview
  );
  const [previewLines, setPreviewLines] = useState(settings.previewLines);
  const [includeCodeInSearch, setIncludeCodeInSearch] = useState(
    settings.includeCodeInSearch
  );
  const [showCategories, setShowCategories] = useState(settings.showCategories);
  const [expandCategories, setExpandCategories] = useState(
    settings.expandCategories
  );
  const [showLineNumbers, setShowLineNumbers] = useState(
    settings.showLineNumbers
  );
  const [themePreference, setThemePreference] = useState(settings.theme);
  const [localePreference, setLocalePreference] = useState(settings.locale);
  const [showChangelog, setShowChangelog] = useState(false);
  const [importing, setImporting] = useState(false);
  const [importProgress, setImportProgress] = useState<ImportProgress | null>(
    null
  );
  const [isExporting, setIsExporting] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const { addToast } = useToast();

  // Scroll preservation setup
  const modalContentRef = useRef<HTMLDivElement | null>(null);
  const scrollPosition = useRef(0);

  useEffect(() => {
    const modalEl = modalContentRef.current;
    if (!modalEl) return;

    const handleScroll = () => {
      scrollPosition.current = modalEl.scrollTop;
    };

    modalEl.addEventListener("scroll", handleScroll);
    return () => modalEl.removeEventListener("scroll", handleScroll);
  }, []);

  useEffect(() => {
    const modalEl = modalContentRef.current;
    if (modalEl) modalEl.scrollTop = scrollPosition.current;
  });

  const handleSave = () => {
    onSettingsChange({
      compactView,
      showCodePreview,
      previewLines,
      includeCodeInSearch,
      showCategories,
      expandCategories,
      showLineNumbers,
      theme: themePreference,
      locale: localePreference,
    });
    onClose();
  };

  const resetImportState = () => {
    setImporting(false);
    setImportProgress(null);
    if (fileInputRef.current) {
      fileInputRef.current.value = "";
    }
  };

  const validateImportData = (data: any): data is ImportData => {
    if (!data || typeof data !== "object") return false;
    if (typeof data.version !== "string") return false;
    if (!Array.isArray(data.snippets)) return false;

    return data.snippets.every(
      (snippet: Snippet) =>
        typeof snippet === "object" &&
        typeof snippet.title === "string" &&
        Array.isArray(snippet.fragments) &&
        Array.isArray(snippet.categories)
    );
  };

  const fetchAllSnippets = async (): Promise<Snippet[]> => {
    try {
      const allSnippets = await snippetService.getAllSnippets();
      return allSnippets;
    } catch (error) {
      console.error("Error fetching all snippets for export:", error);
      throw error;
    }
  };

  const handleImportFile = async (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    const file = event.target.files?.[0];
    if (!file) return;

    try {
      setImporting(true);
      const content = await file.text();
      const importData = JSON.parse(content);

      if (!validateImportData(importData)) {
        throw new Error("Invalid import file format");
      }

      const progress: ImportProgress = {
        total: importData.snippets.length,
        current: 0,
        succeeded: 0,
        failed: 0,
        errors: [],
      };

      setImportProgress(progress);

      for (const snippet of importData.snippets) {
        try {
          await snippetService.createSnippet(snippet);
          progress.succeeded += 1;
        } catch (error) {
          progress.failed += 1;
          progress.errors.push({
            title: snippet.title,
            error: error instanceof Error ? error.message : "Unknown error",
          });
          console.error(`Failed to import snippet "${snippet.title}":`, error);
        }

        progress.current += 1;
        setImportProgress({ ...progress });
      }

      if (progress.failed === 0) {
        addToast(
          translate('settingsModal.import.successOnly', { count: progress.succeeded, succeeded: progress.succeeded }),
          "success"
        );
      } else {
        addToast(
          translate('settingsModal.import.hasFailed', { succeeded: progress.succeeded, failed: progress.failed }),
          "warning"
        );
      }
    } catch (error) {
      console.error("Import error:", error);
      addToast(
        error instanceof Error ? error.message : translate('settingsModal.import.error.default'),
        "error"
      );
    } finally {
      resetImportState();
    }
  };

  const handleExport = async () => {
    try {
      setIsExporting(true);
      const allSnippets = await fetchAllSnippets();

      if (allSnippets.length === 0) {
        addToast(translate('settingsModal.export.error.noSnippets'), "warning");
        return;
      }

      const exportData = {
        version: "1.0",
        exported_at: new Date().toISOString(),
        snippets: allSnippets,
      };

      const blob = new Blob([JSON.stringify(exportData, null, 2)], {
        type: "application/json",
      });
      const url = window.URL.createObjectURL(blob);
      const link = document.createElement("a");
      link.href = url;
      link.download = `bytestash-export-${
        new Date().toISOString().split("T")[0]
      }.json`;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      window.URL.revokeObjectURL(url);

      addToast(translate('settingsModal.export.success.default', { total: allSnippets.length }), "success");
    } catch (error) {
      console.error("Export error:", error);
      addToast(translate('settingsModal.export.error.default'), "error");
    } finally {
      setIsExporting(false);
    }
  };

  const snippetToMarkdown = (snippet: Snippet): string => {
    const lines: string[] = [];

    // title
    if (snippet.title) {
      lines.push(`# ${snippet.title}`, "");
    }

    // description
    if (snippet.description) {
      lines.push(snippet.description, "");
    }

    // tags
    if (snippet.categories?.length) {
      snippet.categories.forEach((tag) => {
        lines.push(`• ${tag}`);
      });
      lines.push("");
    }

    // code fragments
    snippet.fragments?.forEach((fragment) => {
      lines.push(
        "```" + (fragment.language || ""),
        fragment.code || "",
        "```",
        ""
      );
    });

    return lines.join("\n");
  };

  const handleMarkdownExport = async () => {
    try {
      setIsExporting(true);
      const allSnippets = await fetchAllSnippets();

      if (allSnippets.length === 0) {
        addToast(translate('settingsModal.export.markdown.warning.default'), "warning");
        return;
      }

      const zip = new JSZip();

      allSnippets.forEach((snippet: Snippet) => {
        const mdContent = snippetToMarkdown(snippet);
        const filename = `${(snippet.title || "snippet").replace(
          /[^\w-]/g,
          "_"
        )}.md`;
        zip.file(filename, mdContent);
      });

      const content = await zip.generateAsync({ type: "blob" });
      const url = window.URL.createObjectURL(content);
      const link = document.createElement("a");
      link.href = url;
      link.download = `bytestash-export-${
        new Date().toISOString().split("T")[0]
      }.zip`;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      window.URL.revokeObjectURL(url);

      addToast(translate('settingsModal.export.markdown.success.default'), "success");
    } catch (error) {
      console.error("Markdown export error:", error);
      addToast(translate('settingsModal.export.markdown.error.default'), "error");
    } finally {
      setIsExporting(false);
    }
  };

  const SettingsGroup: React.FC<{
    title: string;
    children: React.ReactNode;
  }> = ({ title, children }) => (
    <div className="p-4 pt-0 space-y-3 rounded-lg gpl-0 bg-light-surface dark:bg-dark-surface">
      <h3 className="mb-3 text-sm font-medium text-light-text dark:text-dark-text">
        {title}
      </h3>
      {children}
    </div>
  );

  const SettingRow: React.FC<{
    label: string;
    htmlFor: string;
    children: React.ReactNode;
    indent?: boolean;
    description?: string;
  }> = ({ label, htmlFor, children, indent, description }) => (
    <div className={`${indent ? "ml-4" : ""}`}>
      <div className="flex items-center justify-between">
        <div className="space-y-1">
          <label
            htmlFor={htmlFor}
            className="text-sm text-light-text dark:text-dark-text"
          >
            {label}
          </label>
          {description && (
            <p className="text-xs text-light-text-secondary dark:text-dark-text-secondary">
              {description}
            </p>
          )}
        </div>
        {children}
      </div>
    </div>
  );

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      title={
        <h2 className="text-xl font-bold text-light-text dark:text-dark-text">
          {translate('settingsModal.title')}
        </h2>
      }
      contentRef={modalContentRef}
    >
      <div className="pb-4">
        <div className="space-y-4">
          <SettingsGroup title={translate('settingsModal.block.theme.title')}>
            <div className="flex justify-start gap-2">
              <button
                onClick={() => setThemePreference("light")}
                className={`flex items-center gap-2 px-4 py-2 rounded-md transition-colors text-sm
                  ${
                    themePreference === "light"
                      ? "bg-light-primary dark:bg-dark-primary text-white"
                      : "bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text hover:bg-light-hover-more dark:hover:bg-dark-hover-more"
                  }`}
              >
                <Sun size={16} />
                {t('theme.light')}
              </button>
              <button
                onClick={() => setThemePreference("dark")}
                className={`flex items-center gap-2 px-4 py-2 rounded-md transition-colors text-sm
                  ${
                    themePreference === "dark"
                      ? "bg-light-primary dark:bg-dark-primary text-white"
                      : "bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text hover:bg-light-hover-more dark:hover:bg-dark-hover-more"
                  }`}
              >
                <Moon size={16} />
                {t('theme.dark')}
              </button>
              <button
                onClick={() => setThemePreference("system")}
                className={`flex items-center gap-2 px-4 py-2 rounded-md transition-colors text-sm
                  ${
                    themePreference === "system"
                      ? "bg-light-primary dark:bg-dark-primary text-white"
                      : "bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text hover:bg-light-hover-more dark:hover:bg-dark-hover-more"
                  }`}
              >
                <Monitor size={16} />
                {t('theme.system')}
              </button>
            </div>
          </SettingsGroup>

          <SettingsGroup title={translate('settingsModal.block.locale.title')}>
            <div className="flex justify-start gap-2">
              <LocaleSelect
                id="locale"
                value={localePreference}
                onChange={setLocalePreference}
                theme={themePreference}
              />
            </div>
          </SettingsGroup>

          <SettingsGroup title={translate('settingsModal.block.view.title')}>
            <SettingRow
              label={translate('settingsModal.block.view.compactView.label')}
              htmlFor="compactView"
              description={translate('settingsModal.block.view.compactView.description')}
            >
              <Switch
                id="compactView"
                checked={compactView}
                onChange={setCompactView}
              />
            </SettingRow>

            <div className="space-y-3">
              <SettingRow
                label={translate('settingsModal.block.view.showCodePreview.label')}
                htmlFor="showCodePreview"
                description={translate('settingsModal.block.view.showCodePreview.description')}
              >
                <Switch
                  id="showCodePreview"
                  checked={showCodePreview}
                  onChange={setShowCodePreview}
                />
              </SettingRow>

              {showCodePreview && (
                <SettingRow
                  label={translate('settingsModal.block.view.previewLines.label')}
                  htmlFor="previewLines"
                  indent
                  description={translate('settingsModal.block.view.previewLines.description')}
                >
                  <input
                    type="number"
                    id="previewLines"
                    value={previewLines}
                    onChange={(e) =>
                      setPreviewLines(
                        Math.max(1, Math.min(20, parseInt(e.target.value) || 1))
                      )
                    }
                    min="1"
                    max="20"
                    className="w-20 p-1 text-sm border rounded-md form-input bg-light-surface dark:bg-dark-surface border-light-border dark:border-dark-border text-light-text dark:text-dark-text"
                  />
                </SettingRow>
              )}
            </div>

            <SettingRow
              label={translate('settingsModal.block.view.showLineNumbers.label')}
              htmlFor="showLineNumbers"
              description={translate('settingsModal.block.view.showLineNumbers.description')}
            >
              <Switch
                id="showLineNumbers"
                checked={showLineNumbers}
                onChange={setShowLineNumbers}
              />
            </SettingRow>
          </SettingsGroup>

          <SettingsGroup title={translate('settingsModal.block.category.title')}>
            <SettingRow
              label={translate('settingsModal.block.category.showCategories.label')}
              htmlFor="showCategories"
              description={translate('settingsModal.block.category.showCategories.description')}
            >
              <Switch
                id="showCategories"
                checked={showCategories}
                onChange={setShowCategories}
              />
            </SettingRow>

            {showCategories && (
              <SettingRow
                label={translate('settingsModal.block.category.expandCategories.label')}
                htmlFor="expandCategories"
                indent
                description={translate('settingsModal.block.category.expandCategories.description')}
              >
                <Switch
                  id="expandCategories"
                  checked={expandCategories}
                  onChange={setExpandCategories}
                />
              </SettingRow>
            )}
          </SettingsGroup>

          <SettingsGroup title={translate('settingsModal.block.search.title')}>
            <SettingRow
              label={translate('settingsModal.block.search.includeCodeInSearch.label')}
              htmlFor="includeCodeInSearch"
              description={translate('settingsModal.block.search.includeCodeInSearch.description')}
            >
              <Switch
                id="includeCodeInSearch"
                checked={includeCodeInSearch}
                onChange={setIncludeCodeInSearch}
              />
            </SettingRow>
          </SettingsGroup>

          {!isPublicView && (
            <SettingsGroup title={translate('settingsModal.block.dataManagement.title')}>
              <div className="flex gap-2">
                <button
                  onClick={handleExport}
                  disabled={isExporting || importing}
                  className={`flex items-center gap-2 px-4 py-2 text-sm transition-colors rounded-md bg-light-hover dark:bg-dark-hover hover:bg-light-hover-more dark:hover:bg-dark-hover-more text-light-text dark:text-dark-text ${
                    isExporting || importing ? "opacity-50 cursor-not-allowed" : ""
                  }`}
                >
                  <Download size={16} />
                  {translate('settingsModal.block.dataManagement.export.label')} (JSON)
                </button>
                <button
                  onClick={handleMarkdownExport}
                  disabled={isExporting || importing}
                  className={`flex items-center gap-2 px-4 py-2 text-sm transition-colors rounded-md bg-light-hover dark:bg-dark-hover hover:bg-light-hover-more dark:hover:bg-dark-hover-more text-light-text dark:text-dark-text ${
                    isExporting || importing ? "opacity-50 cursor-not-allowed" : ""
                  }`}
                >
                  <Download size={16} />
                  {translate('settingsModal.block.dataManagement.export.label')} (Markdown)
                </button>
                <label
                  className={`flex items-center gap-2 px-4 py-2 bg-light-hover dark:bg-dark-hover hover:bg-light-hover-more dark:hover:bg-dark-hover-more rounded-md transition-colors text-sm cursor-pointer text-light-text dark:text-dark-text ${
                    importing || isExporting ? "opacity-50 cursor-not-allowed" : ""
                  }`}
                >
                  <input
                    ref={fileInputRef}
                    type="file"
                    accept=".json"
                    onChange={handleImportFile}
                    disabled={importing || isExporting}
                    className="hidden"
                  />
                  <Upload size={16} />
                  {translate('settingsModal.block.dataManagement.import.label')}
                </label>
              </div>

              {importProgress && (
                <div className="mt-4 space-y-2">
                  <div className="flex justify-between text-sm text-light-text dark:text-dark-text">
                    <span>{translate('settingsModal.block.dataManagement.import.progress')}</span>
                    <span>
                      {importProgress.current} / {importProgress.total}
                    </span>
                  </div>

                  <div className="w-full h-2 overflow-hidden rounded-full bg-light-surface dark:bg-dark-surface">
                    <div
                      className="h-full transition-all duration-200 bg-light-primary dark:bg-dark-primary"
                      style={{
                        width: `${
                          (importProgress.current / importProgress.total) * 100
                        }%`,
                      }}
                    />
                  </div>

                  {importProgress.errors.length > 0 && (
                    <div className="mt-2 text-sm">
                      <div className="flex items-center gap-1 text-red-400">
                        <AlertCircle size={14} />
                        <span>
                          {
                            translate(
                              'settingsModal.block.dataManagement.import.errors.occurred',
                              {
                                count: importProgress.errors.length,
                              }
                            )
                          }
                        </span>
                      </div>
                      <div className="mt-1 overflow-y-auto max-h-24">
                        {importProgress.errors.map((error, index) => (
                          <div key={index} className="text-xs text-red-400">
                            {
                              translate(
                                'settingsModal.block.dataManagement.import.errors.failed',
                                {
                                  title: error.title,
                                  error: error.error,
                                }
                              )
                            }
                          </div>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              )}
            </SettingsGroup>
          )}

          <div className="pt-4 mt-4 border-t border-light-border dark:border-dark-border">
            <div className="flex justify-center gap-4">
              <button
                onClick={() => setShowChangelog(true)}
                className="transition-opacity opacity-60 hover:opacity-100"
                title="Changelog"
              >
                <Clock className="w-6 h-6 text-light-text dark:text-dark-text" />
              </button>
              <a
                href={GITHUB_URL}
                target="_blank"
                rel="noopener noreferrer"
                className="transition-opacity opacity-60 hover:opacity-100"
                title="GitHub Repository"
              >
                <img
                  src={getAssetPath("/github-mark-white.svg")}
                  alt="GitHub"
                  className="w-6 h-6 dark:brightness-100 brightness-0"
                />
              </a>
              <a
                href={DOCKER_URL}
                target="_blank"
                rel="noopener noreferrer"
                className="transition-opacity opacity-60 hover:opacity-100"
                title="GitHub Packages"
              >
                <img
                  src={getAssetPath("/docker-mark-white.svg")}
                  alt="Docker"
                  className="w-6 h-6 dark:brightness-100 brightness-0"
                />
              </a>
              <a
                href={REDDIT_URL}
                target="_blank"
                rel="noopener noreferrer"
                className="transition-opacity opacity-60 hover:opacity-100"
                title="Reddit Post"
              >
                <img
                  src={getAssetPath("/reddit-mark-white.svg")}
                  alt="Reddit"
                  className="w-6 h-6 dark:brightness-100 brightness-0"
                />
              </a>
              <a
                href={WIKI_URL}
                target="_blank"
                rel="noopener noreferrer"
                className="transition-opacity opacity-60 hover:opacity-100"
                title="Documentation"
              >
                <BookOpen className="w-6 h-6 text-light-text dark:text-dark-text" />
              </a>
            </div>
          </div>
        </div>

        <div className="flex justify-end mt-6">
          <button
            onClick={onClose}
            className="px-4 py-2 mr-2 text-sm rounded-md bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text hover:bg-light-hover dark:hover:bg-dark-hover"
          >
            {t('action.cancel')}
          </button>
          <button
            onClick={handleSave}
            className="px-4 py-2 text-sm text-white rounded-md bg-light-primary dark:bg-dark-primary hover:opacity-90"
          >
            {t('action.save')}
          </button>
        </div>
      </div>
      <ChangelogModal
        isOpen={showChangelog}
        onClose={() => setShowChangelog(false)}
      />
    </Modal>
  );
};

export default SettingsModal;
````

## File: client/src/components/snippets/edit/EditSnippetModal.tsx
````typescript
import React, { useState, useEffect, useMemo, useRef } from "react";
import "prismjs";
import "prismjs/components/prism-markup-templating.js";
import "prismjs/themes/prism.css";
import { Plus, Search, PanelLeftClose, PanelLeftOpen, ListFilter, Check } from "lucide-react";
import { useTranslation } from "react-i18next";
import { Switch } from "../../../components/common/switch/Switch";
import { CodeFragment, Snippet } from "../../../types/snippets";
import { detectLanguageFromFileName, getFileIcon, getFullFileName } from "../../../utils/language/languageUtils";
import CategoryList from "../../categories/CategoryList";
import CategorySuggestions from "../../categories/CategorySuggestions";
import FileUploadButton from "../../common/buttons/FileUploadButton";
import Modal from "../../common/modals/Modal";
import { FragmentEditor } from "./FragmentEditor";

export interface EditSnippetModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSubmit: (snippetData: Omit<Snippet, "id" | "updated_at">) => void;
  snippetToEdit: Snippet | null;
  showLineNumbers: boolean;
  allCategories: string[];
}

const EditSnippetModal: React.FC<EditSnippetModalProps> = ({
  isOpen,
  onClose,
  onSubmit,
  snippetToEdit,
  showLineNumbers,
  allCategories,
}) => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/snippets/edit');
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [fragments, setFragments] = useState<CodeFragment[]>([]);
  const [categories, setCategories] = useState<string[]>([]);
  const [categoryInput, setCategoryInput] = useState("");
  const [error, setError] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isPublic, setIsPublic] = useState(snippetToEdit?.is_public || false);
  const [hasUnsavedChanges, setHasUnsavedChanges] = useState(false);
  const [activeFragmentIndex, setActiveFragmentIndex] = useState(0);

  // File Tree states
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [hiddenExtensions, setHiddenExtensions] = useState<Set<string>>(new Set());
  const [isFilterOpen, setIsFilterOpen] = useState(false);
  const filterRef = useRef<HTMLDivElement>(null);
  const [editingFileIndex, setEditingFileIndex] = useState<number | null>(null);
  const editInputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (filterRef.current && !filterRef.current.contains(event.target as Node)) {
        setIsFilterOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  const extensionStats = useMemo(() => {
    const counts: Record<string, number> = {};
    let noExtCount = 0;
    fragments.forEach((f) => {
      const fullName = getFullFileName(f.file_name, f.language);
      if (fullName.includes('.')) {
        const ext = '.' + fullName.split('.').pop()?.toLowerCase();
        counts[ext] = (counts[ext] || 0) + 1;
      } else {
        noExtCount++;
      }
    });
    const result = Object.entries(counts).map(([ext, count]) => ({ ext, count })).sort((a, b) => a.ext.localeCompare(b.ext));
    if (noExtCount > 0) {
      result.push({ ext: '__no_ext__', count: noExtCount });
    }
    return result;
  }, [fragments]);

  const toggleExtension = (ext: string) => {
    setHiddenExtensions(prev => {
      const next = new Set(prev);
      if (next.has(ext)) {
        next.delete(ext);
      } else {
        next.add(ext);
      }
      return next;
    });
  };

  const filteredFragments = useMemo(() => {
    return fragments.filter((f) => {
      const fullName = getFullFileName(f.file_name, f.language).toLowerCase();
      const matchesSearch = !searchQuery.trim() || fullName.includes(searchQuery.toLowerCase());
      
      let ext = '__no_ext__';
      if (fullName.includes('.')) {
        ext = '.' + fullName.split('.').pop()?.toLowerCase();
      }
      const matchesExt = !hiddenExtensions.has(ext);
      return matchesSearch && matchesExt;
    });
  }, [fragments, searchQuery, hiddenExtensions]);

  useEffect(() => {
    if (editingFileIndex !== null && editInputRef.current) {
      editInputRef.current.focus();
      // Select the filename chunk without the extension
      const fileName = fragments[editingFileIndex]?.file_name || "";
      const dotIndex = fileName.lastIndexOf(".");
      if (dotIndex > 0) {
        editInputRef.current.setSelectionRange(0, dotIndex);
      } else {
        editInputRef.current.select();
      }
    }
  }, [editingFileIndex]);

  const handleFileNameChange = (index: number, newName: string) => {
    setFragments((current) => {
      const newFragments = [...current];
      newFragments[index] = { ...newFragments[index], file_name: newName };

      const detectedLanguage = detectLanguageFromFileName(newName);
      if (detectedLanguage) {
        newFragments[index].language = detectedLanguage;
      }

      return newFragments;
    });
    setHasUnsavedChanges(true);
  };

  const handleFileNameKeyDown = (
    e: React.KeyboardEvent<HTMLInputElement>
  ) => {
    if (e.key === "Enter") {
      setEditingFileIndex(null);
    } else if (e.key === "Escape") {
      setEditingFileIndex(null);
    }
  };

  const resetForm = () => {
    setTitle("");
    setDescription("");
    setFragments([
      {
        file_name: "main",
        code: "",
        language: "",
        position: 0,
      },
    ]);
    setCategories([]);
    setError("");
    setCategoryInput("");
    setHasUnsavedChanges(false);
  };

  useEffect(() => {
    if (isOpen) {
      if (snippetToEdit) {
        setTitle(snippetToEdit.title?.slice(0, 255) || "");
        setDescription(snippetToEdit.description || "");
        setFragments(JSON.parse(JSON.stringify(snippetToEdit.fragments || [])));
        setCategories(snippetToEdit.categories || []);
        setIsPublic(snippetToEdit.is_public || false);
      } else {
        resetForm();
      }
    }
  }, [isOpen, snippetToEdit]);

  useEffect(() => {
    if (!isOpen) {
      resetForm();
    }
  }, [isOpen]);

  const handleCategorySelect = (category: string) => {
    const normalizedCategory = category.toLowerCase().trim();
    if (
      normalizedCategory &&
      categories.length < 20 &&
      !categories.includes(normalizedCategory)
    ) {
      setCategories((prev) => [...prev, normalizedCategory]);
      setHasUnsavedChanges(true);
    }
    setCategoryInput("");
  };

  const handleRemoveCategory = (e: React.MouseEvent, category: string) => {
    e.preventDefault();
    setCategories((cats) => cats.filter((c) => c !== category));
    setHasUnsavedChanges(true);
  };

  const handleAddFragment = () => {
    setFragments((current) => {
      const newFragments = [
        ...current,
        {
          file_name: `file${current.length + 1}`,
          code: "",
          language: "",
          position: current.length,
        },
      ];
      setActiveFragmentIndex(newFragments.length - 1);
      setEditingFileIndex(newFragments.length - 1); // Edit inline directly
      return newFragments;
    });
    setHasUnsavedChanges(true);
  };

  const handleFileUpload = (fileData: {
    file_name: string;
    code: string;
    language: string;
    position: number;
  }) => {
    setFragments((current) => {
      const newFragments = [
        ...current,
        {
          ...fileData,
          position: current.length,
        },
      ];
      setActiveFragmentIndex(newFragments.length - 1);
      return newFragments;
    });
    setHasUnsavedChanges(true);
  };

  const handleUploadError = (error: string) => {
    setError(error);
    // Clear error after 5 seconds
    setTimeout(() => {
      setError("");
    }, 5000);
  };

  const handleUpdateFragment = (
    index: number,
    updatedFragment: CodeFragment
  ) => {
    setFragments((current) => {
      const newFragments = [...current];
      newFragments[index] = updatedFragment;
      return newFragments;
    });
    setHasUnsavedChanges(true);
  };

  const handleDeleteFragment = (index: number) => {
    if (fragments.length > 1) {
      setFragments((current) => current.filter((_, i) => i !== index));
      if (activeFragmentIndex === index) {
        setActiveFragmentIndex(Math.max(0, index - 1));
      } else if (activeFragmentIndex > index) {
        setActiveFragmentIndex(activeFragmentIndex - 1);
      }
      setHasUnsavedChanges(true);
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (isSubmitting) return;

    if (fragments.length === 0) {
      setError(translate('editSnippetModal.fragmentRequired'));
      return;
    }

    if (fragments.some((f) => !f.file_name.trim())) {
      setError(translate('editSnippetModal.mustHaveFileNames'));
      return;
    }

    setIsSubmitting(true);
    const snippetData = {
      title: title.slice(0, 255),
      description: description,
      fragments: fragments.map((f, idx) => ({ ...f, position: idx })),
      categories: categories,
      is_public: isPublic ? 1 : 0,
      is_pinned: snippetToEdit?.is_pinned || 0,
      is_favorite: snippetToEdit?.is_favorite || 0,
    };

    try {
      await onSubmit(snippetData);
      setHasUnsavedChanges(false);
      onClose();
    } catch (error) {
      setError(translate('editSnippetModal.error.savingFailed'));
      console.error("Error saving snippet:", error);
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleModalClose = () => {
    if (hasUnsavedChanges) {
      const confirmClose = window.confirm(
        translate('editSnippetModal.unsavedChanges')
      );
      if (!confirmClose) return;
    }
    onClose();
  };

  return (
    <Modal
      isOpen={isOpen}
      onClose={handleModalClose}
      expandable={true}
      title={
        <h2 className="text-xl font-bold text-light-text dark:text-dark-text">
          {
            snippetToEdit
              ? translate('editSnippetModal.editSnippet')
              : translate('editSnippetModal.addSnippet')
          }
        </h2>
      }
    >
      <style>
        {`
          /* Force the modal to use full height when possible */
          .modal-content-wrapper {
             max-height: 85vh;
             display: flex;
             flex-direction: column;
          }
          .modal-footer {
            position: sticky;
            background: var(--footer-bg);
            border-top: 1px solid var(--footer-border);
            margin-top: 1rem;
            z-index: 100;
          }

          .modal-footer::before {
            content: '';
            position: absolute;
            bottom: 100%;
            left: 0;
            right: 0;
            height: 20px;
            background: linear-gradient(to top, var(--footer-bg), transparent);
            pointer-events: none;
          }

          .add-fragment-button {
            transition: all 0.2s ease-in-out;
          }

          .add-fragment-button:hover {
            transform: translateY(-1px);
          }

          :root {
            --footer-bg: var(--light-surface);
            --footer-border: var(--light-border);
          }

          .dark {
            --footer-bg: var(--dark-surface);
            --footer-border: var(--dark-border);
          }
        `}
      </style>
      <div className="relative flex flex-col h-full max-h-full isolate">
        <form onSubmit={handleSubmit} className="flex flex-col h-full">
          <div className="flex-none">
            {error && (
              <p className="mb-4 text-red-500 dark:text-red-400">{error}</p>
            )}
          </div>

          <div className="flex-1 min-h-0 overflow-y-auto">
            <div className="pr-2 space-y-4">
              {/* Title input */}
              <div>
                <label
                  htmlFor="title"
                  className="block text-sm font-medium text-light-text dark:text-dark-text"
                >
                  {translate('editSnippetModal.form.title.label')}
                </label>
                <input
                  type="text"
                  id="title"
                  value={title}
                  onChange={(e) => {
                    setTitle(e.target.value.slice(0, 100));
                    setHasUnsavedChanges(true);
                  }}
                  className="block w-full p-2 mt-1 text-sm border rounded-md bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text border-light-border dark:border-dark-border focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary focus:border-light-primary dark:focus:border-dark-primary"
                  required
                  placeholder={translate('editSnippetModal.form.title.placeholder', { max: 100 })}
                  maxLength={100}
                />
                <p className="mt-1 text-sm text-light-text-secondary dark:text-dark-text-secondary">
                  {translate('editSnippetModal.form.title.counter', { characters: title.length, max: 100 })}
                </p>
              </div>

              {/* Description input */}
              <div>
                <label
                  htmlFor="description"
                  className="block text-sm font-medium text-light-text dark:text-dark-text"
                >
                  {translate('editSnippetModal.form.description.label')}
                </label>
                <textarea
                  id="description"
                  value={description}
                  onChange={(e) => {
                    setDescription(e.target.value);
                    setHasUnsavedChanges(true);
                  }}
                  className="block w-full p-2 mt-1 text-sm border rounded-md bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text border-light-border dark:border-dark-border focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary focus:border-light-primary dark:focus:border-dark-primary"
                  rows={3}
                  placeholder={translate('editSnippetModal.form.description.placeholder', { max: 20 })}
                />
              </div>

              {/* Categories section */}
              <div>
                <label
                  htmlFor="categories"
                  className="block text-sm font-medium text-light-text dark:text-dark-text"
                >
                  {translate('editSnippetModal.form.categories.label', { max: 20 })}
                </label>
                <CategorySuggestions
                  inputValue={categoryInput}
                  onInputChange={setCategoryInput}
                  onCategorySelect={handleCategorySelect}
                  existingCategories={allCategories}
                  selectedCategories={categories}
                  placeholder={translate('editSnippetModal.form.categories.placeholder')}
                  maxCategories={20}
                  showAddText={true}
                  handleHashtag={false}
                  className="block w-full p-2 mt-1 text-sm border rounded-md bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text border-light-border dark:border-dark-border focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary focus:border-light-primary dark:focus:border-dark-primary"
                />
                <p className="mt-1 text-sm text-light-text-secondary dark:text-dark-text-secondary">
                  {translate('editSnippetModal.form.categories.counter', { categories: categories.length, max: 20 })}
                </p>
                <CategoryList
                  categories={categories}
                  onCategoryClick={handleRemoveCategory}
                  className="mt-2"
                  variant="removable"
                />
              </div>

              {/* Public snippet section */}
              <div className="space-y-1">
                <label className="flex items-center gap-2">
                  <Switch
                    id="isPublic"
                    checked={!!isPublic}
                    onChange={(checked) => {
                      setIsPublic(checked);
                      setHasUnsavedChanges(true);
                    }}
                  />
                  <span className="text-sm font-medium text-light-text dark:text-dark-text">
                    {translate('editSnippetModal.form.isPublic.label')}
                  </span>
                </label>
                <p className="text-sm text-light-text-secondary dark:text-dark-text-secondary">
                  {translate('editSnippetModal.form.isPublic.description')}
                </p>
              </div>

              {/* Code Fragments section */}
              <div>
                <div className="flex items-center justify-between mb-4">
                  <label className="text-sm font-medium text-light-text dark:text-dark-text">
                    {translate('editSnippetModal.form.codeFragments.label', { fragments: fragments.length })}
                  </label>
                  <FileUploadButton
                    onFileProcessed={handleFileUpload}
                    onError={handleUploadError}
                    existingFragments={fragments}
                    className="text-xs"
                  />
                </div>

                <div className="flex flex-col md:flex-row border border-light-border dark:border-dark-border rounded-lg overflow-hidden bg-light-surface dark:bg-dark-surface shadow-sm h-[500px]">
                  {/* Sidebar (File Tree) */}
                  {isSidebarOpen && (
                    <div className="w-full md:w-56 xl:w-64 shrink-0 border-b md:border-b-0 md:border-r border-light-border dark:border-dark-border flex flex-col bg-light-bg/50 dark:bg-dark-bg/50 transition-all duration-300">
                      <div className="px-3 py-2 border-b border-light-border dark:border-dark-border flex flex-col gap-2 bg-light-hover/30 dark:bg-dark-hover/30">
                        <div className="flex items-center justify-between text-xs font-semibold text-light-text-secondary dark:text-dark-text-secondary">
                          <span>{translate('editSnippetModal.form.codeFragments.label', { fragments: fragments.length })}</span>
                          <button 
                            type="button"
                            onClick={() => setIsSidebarOpen(false)}
                            className="p-1 hover:bg-light-hover dark:hover:bg-dark-hover rounded transition-colors"
                          >
                            <PanelLeftClose size={14} />
                          </button>
                        </div>
                        <div className="flex items-center gap-2">
                          <div className="relative flex-1">
                            <Search size={12} className="absolute left-2 top-1/2 -translate-y-1/2 text-light-text-secondary dark:text-dark-text-secondary" />
                            <input 
                              type="text" 
                              value={searchQuery}
                              onChange={(e) => setSearchQuery(e.target.value)}
                              placeholder={translate('searchFiles')}
                              className="w-full pl-6 pr-2 py-1 text-xs bg-light-surface dark:bg-dark-surface border border-light-border dark:border-dark-border rounded focus:outline-none focus:border-light-primary dark:focus:border-dark-primary text-light-text dark:text-dark-text placeholder-light-text-secondary/50 dark:placeholder-dark-text-secondary/50"
                            />
                          </div>
                          {extensionStats.length > 0 && (
                            <div className="relative shrink-0" ref={filterRef}>
                              <button
                                type="button"
                                onClick={() => setIsFilterOpen(!isFilterOpen)}
                                className={`p-1 rounded border border-light-border dark:border-dark-border hover:bg-light-hover dark:hover:bg-dark-hover transition-colors flex items-center justify-center h-[26px] w-[26px] ${isFilterOpen ? 'bg-light-hover dark:bg-dark-hover' : 'bg-light-surface dark:bg-dark-surface'}`}
                                title={translate('filterFiles')}
                              >
                                <ListFilter size={14} className="text-light-text-secondary dark:text-dark-text-secondary" />
                              </button>

                              {isFilterOpen && (
                                <div className="absolute left-0 left-auto md:left-full md:ml-1 md:-mt-8 right-0 md:right-auto top-full mt-1 w-56 bg-light-surface dark:bg-dark-surface border border-light-border dark:border-dark-border rounded-lg shadow-xl z-50 py-2 flex flex-col">
                                  <div className="px-3 pb-2 text-xs font-semibold text-light-text-secondary dark:text-dark-text-secondary border-b border-light-border dark:border-dark-border mb-1">
                                    {translate('fileExtensions')}
                                  </div>
                                  <div className="max-h-60 overflow-y-auto custom-scrollbar">
                                    {extensionStats.map(({ ext, count }) => {
                                      const checked = !hiddenExtensions.has(ext);
                                      return (
                                        <button
                                          type="button"
                                          key={ext}
                                          onClick={() => toggleExtension(ext)}
                                          className="w-full px-3 py-1.5 flex items-center justify-between hover:bg-light-hover dark:hover:bg-dark-hover text-sm text-light-text dark:text-dark-text transition-colors group"
                                        >
                                          <div className="flex items-center gap-2">
                                            <div className="w-4 h-4 flex items-center justify-center shrink-0">
                                              <Check size={14} className={`transition-opacity ${checked ? 'opacity-100 text-light-primary dark:text-dark-primary' : 'opacity-0'}`} />
                                            </div>
                                            <span className="truncate max-w-[130px] text-left">{ext === '__no_ext__' ? translate('noExtension') : ext}</span>
                                          </div>
                                          <span className="text-xs bg-light-bg dark:bg-dark-bg px-1.5 py-0.5 rounded-full text-light-text-secondary dark:text-dark-text-secondary group-hover:bg-light-surface dark:group-hover:bg-dark-surface">
                                            {count}
                                          </span>
                                        </button>
                                      );
                                    })}
                                  </div>
                                </div>
                              )}
                            </div>
                          )}
                        </div>
                      </div>
                      <div className="flex-1 overflow-y-auto max-h-[500px]">
                        {filteredFragments.map((fragment) => {
                          const fullName = getFullFileName(fragment.file_name, fragment.language);
                          const originalIndex = fragments.findIndex(f => f.position === fragment.position && f.file_name === fragment.file_name && f.code === fragment.code);
                          const displayIndex = originalIndex >= 0 ? originalIndex : fragments.indexOf(fragment);
                          const isActive = activeFragmentIndex === displayIndex;
                          const isEditing = editingFileIndex === displayIndex;

                          return (
                            <div 
                              key={displayIndex} 
                              className={`w-full text-left px-3 py-1.5 text-sm flex items-center gap-2 transition-colors border-l-2 ${
                                isActive
                                  ? "bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text border-light-primary dark:border-dark-primary"
                                  : "border-transparent text-light-text-secondary dark:text-dark-text-secondary hover:bg-light-hover/50 dark:hover:bg-dark-hover/50"
                              }`}
                            >
                              <div className="shrink-0 w-3.5 h-3.5 flex items-center justify-center">
                                {getFileIcon(fragment.file_name, fragment.language, "w-full h-full text-light-text-secondary dark:text-dark-text-secondary")}
                              </div>
                              {isEditing ? (
                                <input
                                  ref={editInputRef}
                                  type="text"
                                  value={fullName}
                                  onChange={(e) => handleFileNameChange(displayIndex, e.target.value)}
                                  onBlur={() => setEditingFileIndex(null)}
                                  onKeyDown={(e) => handleFileNameKeyDown(e)}
                                  className="w-full bg-light-surface dark:bg-dark-surface border border-light-primary dark:border-dark-primary rounded px-1 text-sm text-light-text dark:text-dark-text outline-none"
                                />
                              ) : (
                                <div 
                                  className="truncate flex-1 cursor-pointer select-none"
                                  onClick={() => setActiveFragmentIndex(displayIndex)}
                                  onDoubleClick={() => setEditingFileIndex(displayIndex)}
                                >
                                  {fullName || '...'}
                                </div>
                              )}
                            </div>
                          );
                        })}
                        {filteredFragments.length === 0 && (
                          <div className="px-3 py-4 text-xs text-center text-light-text-secondary dark:text-dark-text-secondary">
                            {translate('noFilesFound')}
                          </div>
                        )}
                      </div>
                      <div className="p-2 border-t border-light-border dark:border-dark-border bg-light-surface dark:bg-dark-surface">
                        <button 
                          type="button" 
                          onClick={handleAddFragment} 
                          className="w-full flex items-center justify-center gap-1 p-1.5 text-xs font-semibold rounded bg-light-primary/10 dark:bg-dark-primary/10 text-light-primary dark:text-dark-primary hover:bg-light-primary/20 dark:hover:bg-dark-primary/20 transition-colors"
                        >
                          <Plus size={14}/> {translate('editSnippetModal.form.codeFragments.add')}
                        </button>
                      </div>
                    </div>
                  )}

                  {/* Main Editor */}
                  <div className="flex-1 min-w-0 flex flex-col bg-light-bg dark:bg-dark-bg overflow-y-auto relative">
                    {!isSidebarOpen && (
                      <button
                        type="button"
                        onClick={() => setIsSidebarOpen(true)}
                        className="absolute top-2.5 left-2.5 z-10 p-1.5 bg-light-surface dark:bg-dark-surface border border-light-border dark:border-dark-border hover:bg-light-hover dark:hover:bg-dark-hover rounded transition-colors text-light-text-secondary dark:text-dark-text-secondary flex items-center justify-center shadow-sm"
                        title={translate('expandSidebar')}
                      >
                        <PanelLeftOpen size={16} />
                      </button>
                    )}
                    {(() => {
                      const activeIndex = activeFragmentIndex >= fragments.length ? 0 : activeFragmentIndex;
                      const activeFragment = fragments[activeIndex];
                      if (!activeFragment) return null;
                      
                      return (
                        <FragmentEditor
                          key={`editor-${activeIndex}`}
                          fragment={activeFragment}
                          onUpdate={(updated) => handleUpdateFragment(activeIndex, updated)}
                          onDelete={() => handleDeleteFragment(activeIndex)}
                          showLineNumbers={showLineNumbers}
                        />
                      );
                    })()}
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Footer */}
          {/* Added more specificity to footer background to avoid visible background elements in edit/create snippet mode. */}
          <div className="!bg-light-surface dark:!bg-dark-surface modal-footer -bottom-5 inset-x-0 mt-4 z-10">
            <div className="flex justify-end gap-2 py-4">
              <button
                type="button"
                onClick={handleModalClose}
                className="px-4 py-2 text-sm border rounded-md bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text hover:bg-light-hover dark:hover:bg-dark-hover border-light-border dark:border-dark-border"
              >
                {t('action.cancel')}
              </button>
              <button
                type="submit"
                className="px-4 py-2 text-sm text-white rounded-md bg-light-primary dark:bg-dark-primary hover:opacity-90 disabled:opacity-50 disabled:cursor-not-allowed"
                disabled={isSubmitting}
              >
                {
                  isSubmitting
                    ? t('action.saving')
                    : snippetToEdit
                      ? t('action.save')
                      : t('action.addSnippet')
                }
              </button>
            </div>
          </div>
        </form>
      </div>
    </Modal>
  );
};

export default EditSnippetModal;
````

## File: client/src/components/snippets/edit/FragmentEditor.tsx
````typescript
import React from "react";
import {
  Trash2,
} from "lucide-react";
import { useTranslation } from "react-i18next";
import { CodeFragment } from "../../../types/snippets";
import { getLanguageLabel, getFullFileName } from "../../../utils/language/languageUtils";
import { IconButton } from "../../common/buttons/IconButton";
import { CodeEditor } from "../../editor/CodeEditor";

interface FragmentEditorProps {
  fragment: CodeFragment;
  onUpdate: (fragment: CodeFragment) => void;
  onDelete: () => void;
  showLineNumbers: boolean;
}

export const FragmentEditor: React.FC<FragmentEditorProps> = ({
  fragment,
  onUpdate,
  onDelete,
  showLineNumbers,
}) => {
  const { t: translate } = useTranslation('components/snippets/edit');

  const handleCodeChange = (newCode: string | undefined) => {
    onUpdate({
      ...fragment,
      code: newCode || "",
    });
  };

  return (
    <div className="flex flex-col h-full w-full">
      <div className="flex items-center gap-2 p-3 bg-light-hover dark:bg-dark-hover border-b border-light-border dark:border-dark-border shrink-0">
        <div className="flex items-center gap-0.5">
          {/* Sorting delegated to Sidebar */}
        </div>        <div className="flex items-center flex-1 min-w-0 pr-4 pl-1">
           <span className="truncate font-medium text-sm text-light-text dark:text-dark-text mr-4">
             {getFullFileName(fragment.file_name, fragment.language) || translate('fragmentEditor.form.fileName.placeholder')}
           </span>
           {fragment.language && (
             <span className="bg-light-primary/10 dark:bg-dark-primary/10 text-light-primary dark:text-dark-primary text-xs font-semibold px-2 py-0.5 rounded ml-auto tracking-wide uppercase">
               {getLanguageLabel(fragment.language)}
             </span>
           )}
        </div>

        <div className="flex items-center gap-1">
          <IconButton
            icon={<Trash2 size={16} className="hover:text-red-500" />}
            onClick={onDelete}
            variant="custom"
            size="sm"
            className="w-9 h-9 bg-light-hover dark:bg-dark-hover hover:bg-light-surface dark:hover:bg-dark-surface"
            label={translate('fragmentEditor.action.delete')}
          />
        </div>
      </div>

      <div className="flex-1 overflow-hidden p-3 bg-light-surface dark:bg-dark-surface">
        <div className="h-full overflow-y-auto pr-1">
          <CodeEditor
            code={fragment.code}
            language={fragment.language}
            onValueChange={handleCodeChange}
            showLineNumbers={showLineNumbers}
          />
        </div>
      </div>
    </div>
  );
};
````

## File: client/src/components/snippets/embed/EmbedCodeView.tsx
````typescript
import React, { useEffect, useRef, useState } from "react";
import MarkdownRenderer from "../../common/markdown/MarkdownRenderer";
import { Prism as SyntaxHighlighter } from "react-syntax-highlighter";
import {
  vscDarkPlus,
  oneLight,
} from "react-syntax-highlighter/dist/cjs/styles/prism";
import {
  getLanguageLabel,
  getMonacoLanguage,
} from "../../../utils/language/languageUtils";
import EmbedCopyButton from "./EmbedCopyButton";

export interface EmbedCodeBlockProps {
  code: string;
  language?: string;
  showLineNumbers?: boolean;
  theme?: "light" | "dark" | "blue" | "system";
}

export const EmbedCodeView: React.FC<EmbedCodeBlockProps> = ({
  code,
  language = "plaintext",
  showLineNumbers = true,
  theme = "system",
}) => {
  const [effectiveTheme, setEffectiveTheme] = useState<
    "light" | "dark" | "blue"
  >(() => {
    if (theme === "system") {
      return window.matchMedia("(prefers-color-scheme: dark)").matches
        ? "dark"
        : "light";
    }
    return theme;
  });

  useEffect(() => {
    if (theme !== "system") {
      setEffectiveTheme(theme);
      return;
    }

    const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");
    const handleChange = () => {
      setEffectiveTheme(mediaQuery.matches ? "dark" : "light");
    };
    mediaQuery.addEventListener("change", handleChange);
    return () => mediaQuery.removeEventListener("change", handleChange);
  }, [theme]);

  const isDark = effectiveTheme === "dark" || effectiveTheme === "blue";
  const isMarkdown = getLanguageLabel(language) === "markdown";
  const [highlighterHeight, setHighlighterHeight] = useState<string>("100px");
  const containerRef = useRef<HTMLDivElement>(null);
  const LINE_HEIGHT = 19;

  useEffect(() => {
    updateHighlighterHeight();
    const resizeObserver = new ResizeObserver(updateHighlighterHeight);
    if (containerRef.current) {
      resizeObserver.observe(containerRef.current);
    }
    return () => resizeObserver.disconnect();
  }, [code]);

  const updateHighlighterHeight = () => {
    if (!containerRef.current) return;

    const lineCount = code.split("\n").length;
    const contentHeight = lineCount * LINE_HEIGHT + 35;
    const newHeight = Math.min(500, Math.max(100, contentHeight));
    setHighlighterHeight(`${newHeight}px`);
  };

  const baseTheme = isDark ? vscDarkPlus : oneLight;
  const getBackgroundColor = () => {
    switch (effectiveTheme) {
      case "blue":
      case "dark":
        return "#1E1E1E";
      case "light":
        return "#ffffff";
    }
  };

  const backgroundColor = getBackgroundColor();
  const customStyle = {
    ...baseTheme,
    'pre[class*="language-"]': {
      ...baseTheme['pre[class*="language-"]'],
      margin: 0,
      fontSize: "13px",
      background: backgroundColor,
      padding: "1rem",
    },
    'code[class*="language-"]': {
      ...baseTheme['code[class*="language-"]'],
      fontSize: "13px",
      background: backgroundColor,
      display: "block",
      textIndent: 0,
    },
  };

  return (
    <div className="relative">
      <style>
        {`
          .markdown-content-full {
            color: var(--text-color);
            background-color: ${backgroundColor};
            padding: 1rem;
            border-radius: 0.5rem;
            position: relative;
          }
          .markdown-content-full pre,
          .markdown-content-full code {
            background-color: ${isDark ? "#2d2d2d" : "#ebebeb"} !important;
            color: ${isDark ? "#e5e7eb" : "#1f2937"} !important;
          }
          .markdown-content-full pre code {
            background-color: transparent !important;
            padding: 0;
            border: none;
            box-shadow: none;
          }
          :root {
            --text-color: ${isDark ? "#ffffff" : "#000000"};
          }
        `}
      </style>
      <div className="relative">
        {isMarkdown ? (
          <div
            className="rounded-lg markdown-content markdown-content-full"
            style={{ backgroundColor }}
          >
            <MarkdownRenderer
              className={`markdown prose ${
                isDark ? "prose-invert" : ""
              } max-w-none`}
            >
              {code}
            </MarkdownRenderer>
          </div>
        ) : (
          <div ref={containerRef} style={{ maxHeight: "500px" }}>
            <SyntaxHighlighter
              language={getMonacoLanguage(language)}
              style={customStyle}
              showLineNumbers={showLineNumbers}
              wrapLines={true}
              lineProps={{
                style: {
                  whiteSpace: "pre",
                  wordBreak: "break-all",
                  paddingLeft: 0,
                },
              }}
              customStyle={{
                height: highlighterHeight,
                minHeight: "100px",
                marginBottom: 0,
                marginTop: 0,
                textIndent: 0,
                paddingLeft: showLineNumbers ? 10 : 20,
                borderRadius: "0.5rem",
                background: backgroundColor,
              }}
            >
              {code}
            </SyntaxHighlighter>
          </div>
        )}

        <EmbedCopyButton text={code} theme={theme} />
      </div>
    </div>
  );
};
````

## File: client/src/components/snippets/embed/EmbedCopyButton.tsx
````typescript
import React, { useState } from 'react';
import { Copy, Check } from 'lucide-react';
import { useTranslation } from 'react-i18next';

export interface EmbedCopyButtonProps {
  text: string;
  theme: 'light' | 'dark' | 'blue' | 'system';
}

const EmbedCopyButton: React.FC<EmbedCopyButtonProps> = ({ text, theme }) => {
  const { t: translate } = useTranslation('components/snippets/embed');
  const [isCopied, setIsCopied] = useState(false);
  
  const isDark = theme === 'dark' || theme === 'blue' || 
    (theme === 'system' && window.matchMedia('(prefers-color-scheme: dark)').matches);

  const handleCopy = async (e: React.MouseEvent) => {
    e.stopPropagation();
    try {
      const textArea = document.createElement('textarea');
      textArea.value = text;
      textArea.style.position = 'fixed';
      textArea.style.left = '-999999px';
      textArea.style.top = '-999999px';
      document.body.appendChild(textArea);
      textArea.focus();
      textArea.select();
      
      try {
        const successful = document.execCommand('copy');
        if (!successful) {
          throw new Error('Copy command failed');
        }
      } finally {
        textArea.remove();
      }
      
      setIsCopied(true);
      setTimeout(() => setIsCopied(false), 2000);
    } catch (err) {
      console.error('Failed to copy text: ', err);
      setIsCopied(false);
    }
  };

  const getBackgroundColor = () => {
    switch (theme) {
      case 'blue':
        return 'bg-dark-surface hover:bg-dark-hover';
      case 'dark':
        return 'bg-neutral-700 hover:bg-neutral-600';
      case 'light':
        return 'bg-light-surface hover:bg-light-hover';
      case 'system':
        return isDark 
          ? 'bg-neutral-700 hover:bg-neutral-600' 
          : 'bg-light-surface hover:bg-light-hover';
    }
  };

  const getTextColor = () => {
    if (theme === 'blue' || theme === 'dark' || (theme === 'system' && isDark)) {
      return 'text-dark-text';
    }
    return 'text-light-text';
  };

  const getIconColor = () => {
    if (isCopied) {
      return isDark ? 'text-dark-primary' : 'text-light-primary';
    }
    if (theme === 'blue' || theme === 'dark' || (theme === 'system' && isDark)) {
      return 'text-dark-text';
    }
    return 'text-light-text';
  };

  return (
    <button
      onClick={handleCopy}
      className={`absolute top-2 right-2 p-1 rounded-md transition-colors ${getBackgroundColor()} ${getTextColor()}`}
      title={translate('embedCopyButton.title')}
    >
      {isCopied ? (
        <Check size={16} className={getIconColor()} />
      ) : (
        <Copy size={16} className={getIconColor()} />
      )}
    </button>
  );
};

export default EmbedCopyButton;
````

## File: client/src/components/snippets/embed/EmbedModal.tsx
````typescript
import React, { useState } from 'react';
import { Code2 } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import Modal from '../../common/modals/Modal';
import { Switch } from '../../common/switch/Switch';
import { basePath } from '../../../utils/api/basePath';
import { Snippet } from '../../../types/snippets';
import { FullCodeBlock } from '../../editor/FullCodeBlock';
import { generateEmbedId } from '../../../utils/helpers/embedUtils';

interface EmbedModalProps {
  isOpen: boolean;
  onClose: () => void;
  shareId: string;
  snippet: Snippet;
}

export const EmbedModal: React.FC<EmbedModalProps> = ({
  isOpen,
  onClose,
  shareId,
  snippet
}) => {
  const { t: translateDefault } = useTranslation();
  const { t: translate } = useTranslation('components/snippets/embed');
  const [showTitle, setShowTitle] = useState(true);
  const [showDescription, setShowDescription] = useState(true);
  const [showFileHeaders, setShowFileHeaders] = useState(true);
  const [showPoweredBy, setShowPoweredBy] = useState(true);
  const [theme, setTheme] = useState<'light' | 'dark' | 'system'>('system');
  const [selectedFragment, setSelectedFragment] = useState<number | undefined>(undefined);

  const getEmbedCode = () => {
    const origin = window.location.origin;
    const embedUrl = `${origin}${basePath}/embed/${shareId}?showTitle=${showTitle}&showDescription=${showDescription}&showFileHeaders=${showFileHeaders}&showPoweredBy=${showPoweredBy}&theme=${theme}${
      selectedFragment !== undefined ? `&fragmentIndex=${selectedFragment}` : ''
    }`;
    
    const embedId = generateEmbedId({
      shareId,
      showTitle,
      showDescription,
      showFileHeaders,
      showPoweredBy,
      theme,
      fragmentIndex: selectedFragment
    });

    return `<iframe
  src="${embedUrl}"
  style="width: 100%; border: none; border-radius: 8px;"
  onload="(function(iframe) {
    window.addEventListener('message', function(e) {
      if (e.data.type === 'resize' && e.data.embedId === '${embedId}') {
        iframe.style.height = e.data.height + 'px';
      }
    });
  })(this);"
  title="ByteStash Code Snippet"
></iframe>`;
  };

  const handleModalClick = (e: React.MouseEvent) => {
    e.stopPropagation();
  };

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      title={
        <div className="flex items-center gap-2 text-light-text dark:text-dark-text">
          <Code2 size={20} />
          <h2 className="text-xl font-bold">{translate('embedModal.title')}</h2>
        </div>
      }
    >
      <div className="space-y-6 text-light-text dark:text-dark-text" onClick={handleModalClick}>
        <div className="space-y-4">
          <h3 className="text-lg font-medium">{translate('embedModal.subTitle')}</h3>

          <div className="space-y-4">
            <label className="flex items-center gap-2">
              <Switch 
                id="showTitle"
                checked={showTitle}
                onChange={setShowTitle}
              />
              <span>{translate('embedModal.form.showTitle')}</span>
            </label>

            <label className="flex items-center gap-2">
              <Switch 
                id="showDescription"
                checked={showDescription}
                onChange={setShowDescription}
              />
              <span>{translate('embedModal.form.showDescription')}</span>
            </label>

            <label className="flex items-center gap-2">
              <Switch 
                id="showFileHeaders"
                checked={showFileHeaders}
                onChange={setShowFileHeaders}
              />
              <span>{translate('embedModal.form.showFileHeaders')}</span>
            </label>

            <label className="flex items-center gap-2">
              <Switch 
                id="showPoweredBy"
                checked={showPoweredBy}
                onChange={setShowPoweredBy}
              />
              <span>{translate('embedModal.form.showPoweredBy')}</span>
            </label>

            <div>
              <label className="block text-sm mb-2">{translate('embedModal.form.theme')}</label>
              <select
                value={theme}
                onChange={(e) => setTheme(e.target.value as 'light' | 'dark' | 'system')}
                className="w-full px-3 py-2 bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text rounded-md border border-light-border dark:border-dark-border focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary"
              >
                <option value="system">{translateDefault('theme.system')}</option>
                <option value="light">{translateDefault('theme.light')}</option>
                <option value="dark">{translateDefault('theme.dark')}</option>
              </select>
            </div>

            <div>
              <label className="block text-sm mb-2">{translate('embedModal.form.fragmentToShow.label')}</label>
              <select
                value={selectedFragment === undefined ? '' : selectedFragment}
                onChange={(e) => setSelectedFragment(e.target.value === '' ? undefined : parseInt(e.target.value, 10))}
                className="w-full px-3 py-2 bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text rounded-md border border-light-border dark:border-dark-border focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary"
              >
                <option value="">{translate('embedModal.form.fragmentToShow.all')}</option>
                {snippet.fragments.map((fragment, index) => (
                  <option key={index} value={index}>
                    {fragment.file_name}
                  </option>
                ))}
              </select>
            </div>
          </div>
        </div>

        <div className="space-y-4">
          <h3 className="text-lg font-medium">{translate('embedModal.form.embedCode')}</h3>
          <FullCodeBlock
            code={getEmbedCode()}
            language={'html'}
            showLineNumbers={false}
          />
        </div>
      </div>
    </Modal>
  );
};

export default EmbedModal;
````

## File: client/src/components/snippets/embed/EmbedView.tsx
````typescript
import React, { useEffect, useState, useRef } from 'react';
import { useTranslation } from 'react-i18next';
import { Snippet } from '../../../types/snippets';
import { getLanguageLabel, getFullFileName, getFileIcon } from '../../../utils/language/languageUtils';
import { basePath } from '../../../utils/api/basePath';
import { generateEmbedId } from '../../../utils/helpers/embedUtils';
import { EmbedCodeView } from './EmbedCodeView';

interface EmbedViewProps {
  shareId: string;
  showTitle?: boolean;
  showDescription?: boolean;
  showFileHeaders?: boolean;
  showPoweredBy?: boolean;
  theme?: 'light' | 'dark' | 'blue' | 'system';
  fragmentIndex?: number;
}

export const EmbedView: React.FC<EmbedViewProps> = ({
  shareId,
  showTitle = false,
  showDescription = false,
  showFileHeaders = true,
  showPoweredBy = true,
  theme = 'system',
  fragmentIndex
}) => {
  const { t: translateDefault } = useTranslation();
  const { t: translate } = useTranslation('components/snippets/embed');
  const [snippet, setSnippet] = useState<Snippet | null>(null);
  const [error, setError] = useState<string | null>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const [effectiveTheme, setEffectiveTheme] = useState<'light' | 'dark' | 'blue'>(() => {
    if (theme === 'system') {
      return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    }
    return theme;
  });

  const embedId = generateEmbedId({
    shareId,
    showTitle,
    showDescription,
    showFileHeaders,
    showPoweredBy,
    theme,
    fragmentIndex
  });

  useEffect(() => {
    if (theme !== 'system') {
      setEffectiveTheme(theme);
      return;
    }

    const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
    const handleChange = () => {
      setEffectiveTheme(mediaQuery.matches ? 'dark' : 'light');
    };
    mediaQuery.addEventListener('change', handleChange);
    return () => mediaQuery.removeEventListener('change', handleChange);
  }, [theme]);

  useEffect(() => {
    const fetchSnippet = async () => {
      try {
        const response = await fetch(
          `${basePath}/api/embed/${shareId}?` + 
          new URLSearchParams({
            showTitle: showTitle.toString(),
            showDescription: showDescription.toString(),
            showFileHeaders: showFileHeaders.toString(),
            showPoweredBy: showPoweredBy.toString(),
            theme: theme,
            ...(fragmentIndex !== undefined && { fragmentIndex: fragmentIndex.toString() })
          })
        );

        if (!response.ok) {
          const data = await response.json();
          throw new Error(data.error || translate('embedView.error.default'));
        }

        const data = await response.json();
        setSnippet(data);
      } catch (err) {
        setError(err instanceof Error ? err.message : translate('embedView.error.default'));
      }
    };

    fetchSnippet();
  }, [shareId, showTitle, showDescription, showFileHeaders, showPoweredBy, theme, fragmentIndex]);

  useEffect(() => {
    const updateHeight = () => {
      if (containerRef.current) {
        const height = containerRef.current.offsetHeight;
        window.parent.postMessage({ type: 'resize', height, embedId }, '*');
      }
    };

    updateHeight();

    const observer = new ResizeObserver(updateHeight);
    if (containerRef.current) {
      observer.observe(containerRef.current);
    }

    return () => observer.disconnect();
  }, [snippet, embedId]);

  if (error) {
    return (
      <div ref={containerRef} className={`theme-${theme} flex items-center justify-center p-4`}>
        <div className="text-center">
          <p className="text-red-500">{error}</p>
        </div>
      </div>
    );
  }

  if (!snippet) {
    return (
      <div ref={containerRef} className={`theme-${theme} flex items-center justify-center p-4`}>
        <div className="text-center">
          <p className={effectiveTheme === 'light' ? "text-light-text" : "text-dark-text"}>{translateDefault('loading')}</p>
        </div>
      </div>
    );
  }

  const getBackgroundColor = () => {
    switch (effectiveTheme) {
      case 'blue':
        return 'bg-dark-surface';
      case 'dark':
        return 'bg-neutral-800';
      case 'light':
        return 'bg-light-surface';
    }
  };

  const getHoverColor = () => {
    switch (effectiveTheme) {
      case 'blue':
        return 'bg-dark-hover/50';
      case 'dark':
        return 'bg-neutral-700/50';
      case 'light':
        return 'bg-light-hover/50';
    }
  };

  const getTextColor = () => {
    if (effectiveTheme === 'light') {
      return 'text-light-text';
    }
    return 'text-dark-text';
  };

  return (
    <div ref={containerRef} className={`theme-${theme} max-w-5xl mx-auto p-0`}>
      <div className={`${getBackgroundColor()} rounded-lg overflow-hidden`}>
        <div className="p-4">
          {(showTitle || showDescription) && (
            <div className="mb-4">
              {showTitle && snippet.title && (
                <h1 className={`text-xl font-bold mb-2 ${getTextColor()}`}>
                  {snippet.title}
                </h1>
              )}
              {showDescription && snippet.description && (
                <p className={`text-sm ${getTextColor()}`}>
                  {snippet.description}
                </p>
              )}
            </div>
          )}

          <div className="space-y-4">
            {snippet.fragments.map((fragment, index) => (
              <div key={index}>
                {showFileHeaders && (
                  <div className={`flex items-center justify-between text-xs mb-1 h-7 px-3 rounded ${getHoverColor()}`}>
                    <div className="flex items-center gap-1 min-w-0 flex-1">
                      <div className="shrink-0 w-3 h-3 flex items-center justify-center">
                        {getFileIcon(fragment.file_name, fragment.language, `w-full h-full ${getTextColor()}`)}
                      </div>
                      <span className={`truncate ${getTextColor()}`}>{getFullFileName(fragment.file_name, fragment.language)}</span>
                    </div>
                    <span className="ml-2">
                      {getLanguageLabel(fragment.language)}
                    </span>
                  </div>
                )}

                <EmbedCodeView
                  code={fragment.code}
                  language={fragment.language}
                  showLineNumbers={true}
                  theme={theme}
                />
              </div>
            ))}
          </div>

          {showPoweredBy && (
            <div className="mt-2 text-right">
              <span className={`text-xs ${getTextColor()}`}>
                Powered by ByteStash
              </span>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default EmbedView;
````

## File: client/src/components/snippets/list/SnippetCard.tsx
````typescript
import React, { useState } from "react";
import {
  Clock,
  Users,
  ChevronLeft,
  ChevronRight,
  Globe,
  Pin,
  Star,
} from "lucide-react";
import ReactMarkdown from "react-markdown";
import { formatDistanceToNow } from "date-fns";
import { useTranslation } from "react-i18next";
import SnippetCardMenu from "./SnippetCardMenu";
import SnippetRecycleCardMenu from "./SnippetRecycleCardMenu";
import { ConfirmationModal } from "../../common/modals/ConfirmationModal";
import { Snippet } from "../../../types/snippets";
import CategoryList from "../../categories/CategoryList";
import { PreviewCodeBlock } from "../../editor/PreviewCodeBlock";
import {
  getUniqueLanguages,
  getFullFileName,
  getFileIcon,
} from "../../../utils/language/languageUtils";
import { basePath } from "../../../utils/api/basePath";

interface SnippetCardProps {
  snippet: Snippet;
  viewMode: "grid" | "list";
  onOpen: (snippet: Snippet) => void;
  onDelete: (id: string) => void;
  onRestore: (id: string) => void;
  onEdit: (snippet: Snippet) => void;
  onShare: (snippet: Snippet) => void;
  onDuplicate: (snippet: Snippet) => void;
  onCategoryClick: (category: string) => void;
  compactView: boolean;
  showCodePreview: boolean;
  previewLines: number;
  showCategories: boolean;
  expandCategories: boolean;
  showLineNumbers: boolean;
  isPublicView?: boolean;
  isRecycleView?: boolean;
  isAuthenticated: boolean;
  pinSnippet?: (id: string, isPinned: boolean) => Promise<Snippet | undefined>;
  favoriteSnippet?: (
    id: string,
    isFavorite: boolean
  ) => Promise<Snippet | undefined>;
}

export const SnippetCard: React.FC<SnippetCardProps> = ({
  snippet,
  viewMode,
  onOpen,
  onDelete,
  onRestore,
  onEdit,
  onShare,
  onDuplicate,
  onCategoryClick,
  compactView,
  showCodePreview,
  previewLines,
  showCategories,
  expandCategories,
  showLineNumbers,
  isPublicView = false,
  isRecycleView = false,
  isAuthenticated,
  pinSnippet,
  favoriteSnippet,
}) => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/snippets/list/snippetCard');
  const [currentSnippet, setCurrentSnippet] = useState<Snippet>(snippet);
  const [currentFragmentIndex, setCurrentFragmentIndex] = useState(0);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [isRestoreModalOpen, setIsRestoreModalOpen] = useState(false);
  const [isPinned, setIsPinned] = useState(snippet.is_pinned);
  const [isFavorite, setIsFavorite] = useState(snippet.is_favorite);

  const getRelativeUpdateTime = (updatedAt: string): string => {
    const defaultUpdateTime = translate('defaultUpdateTime');

    try {
      if (!updatedAt) {
        return defaultUpdateTime;
      }
      const updateDate = new Date(updatedAt);
      if (isNaN(updateDate.getTime())) {
        return defaultUpdateTime;
      }
      return formatDistanceToNow(updateDate);
    } catch (error) {
      console.error("Error formatting update date:", error);
      return defaultUpdateTime;
    }
  };

  const handleDeleteConfirm = (e?: React.MouseEvent) => {
    e?.stopPropagation();
    onDelete(snippet.id);
    setIsDeleteModalOpen(false);
  };

  const handleRestoreConfirm = (e?: React.MouseEvent) => {
    e?.stopPropagation();
    onRestore(snippet.id);
    setIsRestoreModalOpen(false);
  };

  const handleCategoryClick = (e: React.MouseEvent, category: string) => {
    e.preventDefault();
    e.stopPropagation();
    onCategoryClick(category);
  };

  const handlePrevFragment = (e: React.MouseEvent) => {
    e.stopPropagation();
    setCurrentFragmentIndex((prev) =>
      prev > 0 ? prev - 1 : snippet.fragments.length - 1
    );
  };

  const handleNextFragment = (e: React.MouseEvent) => {
    e.stopPropagation();
    setCurrentFragmentIndex((prev) =>
      prev < snippet.fragments.length - 1 ? prev + 1 : 0
    );
  };

  const handleOpenInNewTab = () => {
    window.open(`${basePath}/snippets/${snippet.id}`, "_blank");
  };

  const handleDelete = (e: React.MouseEvent) => {
    e.stopPropagation();
    setIsDeleteModalOpen(true);
  };

  const handleRestore = (e: React.MouseEvent) => {
    e.stopPropagation();
    setIsRestoreModalOpen(true);
  };

  const handleDeleteModalClose = (e?: React.MouseEvent) => {
    e?.stopPropagation();
    setIsDeleteModalOpen(false);
  };

  const handleDuplicate = (e: React.MouseEvent) => {
    e.stopPropagation();
    onDuplicate(snippet);
  };

  const handlePin = async () => {
    if (!pinSnippet) return;
    try {
      const updatedSnippet = await pinSnippet(
        currentSnippet.id,
        currentSnippet.is_pinned === 1
      );
      if (updatedSnippet) {
        setCurrentSnippet(updatedSnippet);
        setIsPinned(updatedSnippet.is_pinned);
      }
    } catch (error) {
      console.error("Error pinning snippet:", error);
    }
  };

  const handleFavorite = async () => {
    if (!favoriteSnippet) return;
    try {
      const updatedSnippet = await favoriteSnippet(
        currentSnippet.id,
        currentSnippet.is_favorite === 1
      );
      if (updatedSnippet) {
        setCurrentSnippet(updatedSnippet);
        setIsFavorite(updatedSnippet.is_favorite);
      }
    } catch (error) {
      console.error("Error favoriting snippet:", error);
    }
  };

  const currentFragment = snippet.fragments[currentFragmentIndex];

  return (
    <>
      <div
        className={`bg-light-surface dark:bg-dark-surface rounded-lg ${
          viewMode === "grid" ? "h-full" : "mb-4"
        }
          cursor-pointer hover:bg-light-hover dark:hover:bg-dark-hover transition-colors relative group`}
        onClick={() => {
          if (!isRecycleView) onOpen(snippet);
        }}
      >
        {(snippet.is_public === 1 ||
          snippet.updated_at ||
          snippet.is_pinned === 1 ||
          snippet.is_favorite === 1) && (
          <div className="flex items-center justify-between px-3 py-1 text-xs rounded-t-lg bg-light-hover/50 dark:bg-dark-hover/50">
            <div className="flex items-center gap-2">
              {snippet.is_public === 1 && (
                <div className="flex items-center gap-1 bg-emerald-100 dark:bg-emerald-900/30 text-emerald-700 dark:text-emerald-300 px-1.5 py-0.5 rounded">
                  <Globe size={12} />
                  <span>{translate('public')}</span>
                </div>
              )}
              {isPublicView && (snippet.share_count || 0) > 0 && (
                <div className="flex items-center gap-1 bg-blue-100 dark:bg-blue-900/30 text-blue-700 dark:text-blue-300 px-1.5 py-0.5 rounded">
                  <Users size={12} />
                  <span>{translate('shared')}</span>
                </div>
              )}
              {snippet.is_pinned === 1 && (
                <div className="flex items-center gap-1 bg-orange-100 dark:bg-orange-900/30 text-orange-700 dark:text-orange-300 px-1.5 py-0.5 rounded">
                  <Pin size={12} />
                  <span>{translate('pinned')}</span>
                </div>
              )}
              {snippet.is_favorite === 1 && (
                <div className="flex items-center gap-1 bg-yellow-100 dark:bg-yellow-900/30 text-yellow-700 dark:text-yellow-300 px-1.5 py-0.5 rounded">
                  <Star size={12} />
                  <span>{translate('favorite')}</span>
                </div>
              )}
            </div>
            <div className="flex items-center gap-1 ml-auto text-light-text-secondary dark:text-dark-text-secondary">
              <Clock size={12} />
              {!isRecycleView ? (
                <span>{translate('date.ago', { date: getRelativeUpdateTime(snippet.updated_at) })}</span>
              ) : snippet.expiry_date ? (
                <span>
                  {translate('date.left', { date: getRelativeUpdateTime(snippet.expiry_date) })}
                </span>
              ) : (
                <span>{translate('date.expiringSoon')}</span>
              )}
            </div>
          </div>
        )}

        <div className="p-4 pt-2">
          <div className="flex items-start justify-between gap-4 mb-3">
            <div className="flex-1 min-w-0">
              <h3
                className={`${
                  compactView ? "text-lg" : "text-xl"
                } font-bold text-light-text dark:text-dark-text
                truncate leading-normal mb-2`}
              >
                {snippet.title}
              </h3>

              <div className="flex flex-wrap items-center gap-3 text-sm">
                {getUniqueLanguages(snippet.fragments) && (
                  <div className="flex items-center gap-1 text-light-text-secondary dark:text-dark-text-secondary">
                    <div className="shrink-0 w-3.5 h-3.5 flex items-center justify-center">
                      {getFileIcon(snippet.fragments[0]?.file_name || "", snippet.fragments[0]?.language, "w-full h-full text-light-text-secondary dark:text-dark-text-secondary")}
                    </div>
                    <span>{getUniqueLanguages(snippet.fragments)}</span>
                  </div>
                )}

                {snippet.username && isPublicView && (
                  <div className="flex items-center gap-1 text-light-text-secondary dark:text-dark-text-secondary">
                    <Users size={14} />
                    <span>{snippet.username}</span>
                  </div>
                )}
              </div>
            </div>
            <div className="transition-opacity opacity-0 group-hover:opacity-100">
              {!isRecycleView ? (
                <SnippetCardMenu
                  onEdit={(e: React.MouseEvent) => {
                    e.stopPropagation();
                    onEdit(snippet);
                  }}
                  onDelete={handleDelete}
                  onShare={(e: React.MouseEvent) => {
                    e.stopPropagation();
                    onShare(snippet);
                  }}
                  onOpenInNewTab={handleOpenInNewTab}
                  onDuplicate={handleDuplicate}
                  isPublicView={isPublicView}
                  isAuthenticated={isAuthenticated}
                  isPinned={isPinned === 1}
                  isFavorite={isFavorite === 1}
                  handlePin={handlePin}
                  handleFavorite={handleFavorite}
                />
              ) : (
                <SnippetRecycleCardMenu
                  onRestore={handleRestore}
                  onDelete={handleDelete}
                />
              )}
            </div>
          </div>

          {!compactView && (
            <div className="mb-3 text-sm text-light-text dark:text-dark-text line-clamp-2 overflow-hidden">
              <ReactMarkdown className={`markdown prose dark:prose-invert max-w-none`}>
                {snippet.description || translate('defaultDescription')}
              </ReactMarkdown>
            </div>
          )}

          {showCategories && (
            <div className="mb-3">
              <CategoryList
                categories={snippet.categories}
                onCategoryClick={handleCategoryClick}
                variant="clickable"
                showAll={expandCategories}
              />
            </div>
          )}

          {showCodePreview && currentFragment && (
            <div>
              <div className="flex items-center justify-between px-2 mb-1 text-xs rounded text-light-text-secondary dark:text-dark-text-secondary bg-light-hover/50 dark:bg-dark-hover/50 h-7">
                <div className="flex items-center flex-1 min-w-0 gap-1">
                  <div className="shrink-0 w-3 h-3 flex items-center justify-center">
                    {getFileIcon(currentFragment.file_name, currentFragment.language, "w-full h-full text-light-text-secondary dark:text-dark-text-secondary")}
                  </div>
                  <span className="truncate">{getFullFileName(currentFragment.file_name, currentFragment.language)}</span>
                </div>
                <div className="flex items-center gap-0.5 ml-2">
                  {snippet.fragments.length > 1 ? (
                    <>
                      <button
                        onClick={handlePrevFragment}
                        className="p-0.5 hover:bg-light-hover dark:hover:bg-dark-hover rounded transition-colors"
                      >
                        <ChevronLeft size={14} />
                      </button>
                      <span className="mx-1 text-light-text-secondary dark:text-dark-text-secondary">
                        {currentFragmentIndex + 1}/{snippet.fragments.length}
                      </span>
                      <button
                        onClick={handleNextFragment}
                        className="p-0.5 hover:bg-light-hover dark:hover:bg-dark-hover rounded transition-colors"
                      >
                        <ChevronRight size={14} />
                      </button>
                    </>
                  ) : (
                    <div className="w-[14px]" />
                  )}
                </div>
              </div>

              <PreviewCodeBlock
                code={currentFragment.code}
                language={currentFragment.language}
                previewLines={previewLines}
                showLineNumbers={showLineNumbers}
                isPublicView={isPublicView}
                isRecycleView={isRecycleView}
                snippetId={snippet.id}
                fragmentId={currentFragment.id}
              />
            </div>
          )}
        </div>
      </div>

      <ConfirmationModal
        isOpen={isDeleteModalOpen}
        onClose={handleDeleteModalClose}
        onConfirm={handleDeleteConfirm}
        title={
          isRecycleView
            ? translate('confirmationModalDelete.title.isRecycleView.true')
            : translate('confirmationModalDelete.title.isRecycleView.false')
        }
        message={
          isRecycleView
            ? translate('confirmationModalDelete.message.isRecycleView.true', { title: snippet.title })
            : translate('confirmationModalDelete.message.isRecycleView.false', { title: snippet.title })
        }
        confirmLabel={
          isRecycleView
            ? translate('confirmationModalDelete.confirmLabel.isRecycleView.true')
            : translate('confirmationModalDelete.confirmLabel.isRecycleView.false')
        }
        cancelLabel={t('action.cancel')}
        variant="danger"
      />

      <ConfirmationModal
        isOpen={isRestoreModalOpen}
        onClose={() => setIsRestoreModalOpen(false)}
        onConfirm={handleRestoreConfirm}
        title={translate('confirmationModalRestore.title')}
        message={translate('confirmationModalRestore.message', { title: snippet.title })}
        confirmLabel={t('action.restore')}
        cancelLabel={t('action.cancel')}
        variant="info"
      />
    </>
  );
};
````

## File: client/src/components/snippets/list/SnippetCardMenu.tsx
````typescript
import React, { useState, useRef } from "react";
import {
  Share,
  Pencil,
  Trash2,
  ExternalLink,
  MoreVertical,
  Copy,
  Pin,
  Star,
  PinOff,
  StarOff,
} from "lucide-react";
import { useTranslation } from "react-i18next";
import { useOutsideClick } from "../../../hooks/useOutsideClick";
import { IconButton } from "../../common/buttons/IconButton";

interface SnippetCardMenuProps {
  onEdit: (e: React.MouseEvent) => void;
  onDelete: (e: React.MouseEvent) => void;
  onShare: (e: React.MouseEvent) => void;
  onOpenInNewTab: () => void;
  onDuplicate: (e: React.MouseEvent) => void;
  isPublicView: boolean;
  isAuthenticated: boolean;
  isPinned: boolean;
  isFavorite: boolean;
  handlePin: (e: React.MouseEvent) => void;
  handleFavorite: (e: React.MouseEvent) => void;
}

const SnippetCardMenu: React.FC<SnippetCardMenuProps> = ({
  onEdit,
  onDelete,
  onShare,
  onOpenInNewTab,
  onDuplicate,
  isPublicView,
  isAuthenticated,
  isPinned,
  isFavorite,
  handlePin,
  handleFavorite,
}) => {
  const { t: translate } = useTranslation('components/snippets/list/snippetCardMenu');
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);
  const buttonRef = useRef<HTMLButtonElement>(null);

  useOutsideClick(dropdownRef, () => setIsDropdownOpen(false), [buttonRef]);

  if (isPublicView) {
    return (
      <div className="flex items-center gap-1 top-4 right-4">
        {isAuthenticated && (
          <IconButton
            icon={<Copy size={16} />}
            onClick={(e: React.MouseEvent) => {
              e.stopPropagation();
              onDuplicate(e);
            }}
            variant="custom"
            size="sm"
            className="bg-light-hover dark:bg-dark-hover hover:bg-light-surface dark:hover:bg-dark-surface"
            label={translate('duplicateSnippet')}
          />
        )}
        <IconButton
          icon={<ExternalLink size={16} />}
          onClick={(e: React.MouseEvent) => {
            e.stopPropagation();
            onOpenInNewTab();
          }}
          variant="custom"
          size="sm"
          className="bg-light-hover dark:bg-dark-hover hover:bg-light-surface dark:hover:bg-dark-surface"
          label={translate('openInNewTab')}
        />
      </div>
    );
  }

  return (
    <div className="flex items-center gap-1 top-4 right-4">
      <IconButton
        icon={<Pencil size={16} />}
        onClick={(e: React.MouseEvent) => {
          e.stopPropagation();
          onEdit(e);
        }}
        variant="custom"
        size="sm"
        className="bg-light-hover dark:bg-dark-hover hover:bg-light-hover-more dark:hover:bg-dark-hover-more"
        label={translate('editSnippet')}
      />
      <IconButton
        icon={
          isFavorite ? (
            <StarOff size={16} className="hover:text-yellow-500" />
          ) : (
            <Star size={16} className="hover:text-yellow-500" />
          )
        }
        onClick={(e: React.MouseEvent) => {
          e.stopPropagation();
          handleFavorite(e);
        }}
        variant="custom"
        size="sm"
        className="bg-light-hover dark:bg-dark-hover hover:bg-light-hover-more dark:hover:bg-dark-hover-more"
        label={
          isFavorite
            ? translate('removeFromFavorites')
            : translate('addToFavorites')
          }
      />
      <IconButton
        icon={<Trash2 size={16} className="hover:text-red-500" />}
        onClick={(e: React.MouseEvent) => {
          e.stopPropagation();
          onDelete(e);
        }}
        variant="custom"
        size="sm"
        className="bg-light-hover dark:bg-dark-hover hover:bg-light-hover-more dark:hover:bg-dark-hover-more"
        label={translate('deleteSnippet')}
      />
      <div className="relative">
        <IconButton
          ref={buttonRef}
          icon={<MoreVertical size={16} />}
          onClick={(e: React.MouseEvent) => {
            e.stopPropagation();
            setIsDropdownOpen(!isDropdownOpen);
          }}
          variant="custom"
          size="sm"
          className="bg-light-hover dark:bg-dark-hover hover:bg-light-hover-more dark:hover:bg-dark-hover-more"
          label="More options"
        />

        {isDropdownOpen && (
          <div
            ref={dropdownRef}
            onMouseLeave={() => setIsDropdownOpen(false)}
            className="absolute right-0 top-full mt-1 w-52 bg-light-surface dark:bg-dark-surface rounded-md shadow-lg 
              border border-light-border dark:border-dark-border z-[100]"
          >
            <button
              onClick={(e) => {
                e.stopPropagation();
                onOpenInNewTab();
                setIsDropdownOpen(false);
              }}
              className="flex items-center w-full gap-2 px-4 py-2 text-sm text-light-text dark:text-dark-text hover:bg-light-hover dark:hover:bg-dark-hover"
            >
              <ExternalLink size={16} />
              {translate('openInNewTab')}
            </button>
            <button
              onClick={(e) => {
                e.stopPropagation();
                handlePin(e);
                setIsDropdownOpen(false);
              }}
              className="flex items-center w-full gap-2 px-4 py-2 text-sm text-light-text dark:text-dark-text hover:bg-light-hover dark:hover:bg-dark-hover"
            >
              {isPinned ? (
                <>
                  <PinOff size={16} />
                  {translate('unpinSnippet')}
                </>
              ) : (
                <>
                  <Pin size={16} />
                  {translate('pinSnippet')}
                </>
              )}
            </button>
            <button
              onClick={(e) => {
                e.stopPropagation();
                onShare(e);
                setIsDropdownOpen(false);
              }}
              className="flex items-center w-full gap-2 px-4 py-2 text-sm text-light-text dark:text-dark-text hover:bg-light-hover dark:hover:bg-dark-hover"
            >
              <Share size={16} />
              {translate('shareSnippet')}
            </button>
            <button
              onClick={(e) => {
                e.stopPropagation();
                onDuplicate(e);
                setIsDropdownOpen(false);
              }}
              className="flex items-center w-full gap-2 px-4 py-2 text-sm text-light-text dark:text-dark-text hover:bg-light-hover dark:hover:bg-dark-hover"
            >
              <Copy size={16} />
              {translate('duplicateSnippet')}
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default SnippetCardMenu;
````

## File: client/src/components/snippets/list/SnippetList.tsx
````typescript
import React from "react";
import { useTranslation } from "react-i18next";
import { Snippet } from "../../../types/snippets";
import { SnippetCard } from "./SnippetCard";

export interface SnippetListProps {
  snippets: Snippet[];
  viewMode: "grid" | "list";
  onOpen: (snippet: Snippet) => void;
  onDelete: (id: string) => void;
  onRestore: (id: string) => void;
  onEdit: (snippet: Snippet) => void;
  onShare: (snippet: Snippet) => void;
  onDuplicate: (snippet: Snippet) => void;
  onCategoryClick: (category: string) => void;
  compactView: boolean;
  showCodePreview: boolean;
  previewLines: number;
  showCategories: boolean;
  expandCategories: boolean;
  showLineNumbers: boolean;
  isPublicView: boolean;
  isRecycleView: boolean;
  isAuthenticated: boolean;
  pinSnippet?: (id: string, isPinned: boolean) => Promise<Snippet | undefined>;
  favoriteSnippet?: (
    id: string,
    isFavorite: boolean
  ) => Promise<Snippet | undefined>;
}

const SnippetList: React.FC<SnippetListProps> = ({
  snippets,
  viewMode,
  onOpen,
  onDelete,
  onRestore,
  onEdit,
  onShare,
  onDuplicate,
  onCategoryClick,
  compactView,
  showCodePreview,
  previewLines,
  showCategories,
  expandCategories,
  showLineNumbers,
  isPublicView,
  isRecycleView,
  isAuthenticated,
  pinSnippet,
  favoriteSnippet,
}) => {
  const { t: translate } = useTranslation('components/snippets/list/snippetList');

  if (snippets.length === 0) {
    return (
      <div className="py-12 text-center">
        <p className="mb-4 text-xl text-light-text-secondary dark:text-dark-text-secondary">
          {translate('noSnippetsMatch')}
        </p>
      </div>
    );
  }
  return (
    <div
      className={
        viewMode === "grid"
          ? "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6"
          : "space-y-6"
      }
    >
      {snippets.map((snippet) => (
        <SnippetCard
          key={snippet.id}
          snippet={snippet}
          viewMode={viewMode}
          onOpen={onOpen}
          onDelete={onDelete}
          onRestore={onRestore}
          onEdit={onEdit}
          onShare={onShare}
          onDuplicate={onDuplicate}
          onCategoryClick={onCategoryClick}
          compactView={compactView}
          showCodePreview={showCodePreview}
          previewLines={previewLines}
          showCategories={showCategories}
          expandCategories={expandCategories}
          showLineNumbers={showLineNumbers}
          isPublicView={isPublicView}
          isRecycleView={isRecycleView}
          isAuthenticated={isAuthenticated}
          pinSnippet={pinSnippet}
          favoriteSnippet={favoriteSnippet}
        />
      ))}
    </div>
  );
};

export default SnippetList;
````

## File: client/src/components/snippets/list/SnippetRecycleCardMenu.tsx
````typescript
import React from 'react';
import { Trash2, ArchiveRestore } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { IconButton } from '../../common/buttons/IconButton';

interface SnippetRecycleCardMenuProps {
  onRestore: (e: React.MouseEvent) => void;
  onDelete: (e: React.MouseEvent) => void;
}

const SnippetRecycleCardMenu: React.FC<SnippetRecycleCardMenuProps> = ({
  onDelete,
  onRestore,
}) => {
  const { t: translate } = useTranslation('components/snippets/list/snippetRecycleCardMenu');

  return (
    <div className="top-4 right-4 flex items-center gap-1">
        <IconButton
        icon={<ArchiveRestore size={16} className="hover:text-yellow-500" />}
        onClick={(e: React.MouseEvent) => {
          e.stopPropagation();
          onRestore(e);
        }}
        variant="custom"
        size="sm"
        className="bg-light-hover dark:bg-dark-hover hover:bg-light-hover-more dark:hover:bg-dark-hover-more"
        label={translate('restoreSnippet')}
      />
      <IconButton
        icon={<Trash2 size={17} className="hover:text-red-500" />}
        onClick={(e: React.MouseEvent) => {
          e.stopPropagation();
          onDelete(e);
        }}
        variant="custom"
        size="sm"
        className="bg-light-hover dark:bg-dark-hover hover:bg-light-hover-more dark:hover:bg-dark-hover-more"
        label={translate('deleteSnippet')}
      />
    </div>
  );
};

export default SnippetRecycleCardMenu;
````

## File: client/src/components/snippets/share/SharedSnippetView.tsx
````typescript
import React, { useState, useEffect } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { Loader2 } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { Snippet } from '../../../types/snippets';
import { useAuth } from '../../../hooks/useAuth';
import { getSharedSnippet } from '../../../utils/api/share';
import { FullCodeView } from '../view/FullCodeView';
import { ROUTES } from '../../../constants/routes';

const SharedSnippetView: React.FC = () => {
  const { t: translate } = useTranslation('components/snippets/share');
  const { shareId } = useParams<{ shareId: string }>();
  const [snippet, setSnippet] = useState<Snippet | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [errorCode, setErrorCode] = useState<number | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const { isAuthenticated } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    loadSharedSnippet();
  }, [shareId, isAuthenticated]);

  const loadSharedSnippet = async () => {
    if (!shareId) return;
  
    try {
      setIsLoading(true);
      const shared = await getSharedSnippet(shareId);
      setSnippet(shared);
      setError(null);
      setErrorCode(null);
    } catch (err: any) {
      setErrorCode(err.status);
      setError(err.error);

      if (err.status === 401 && !isAuthenticated) {
        navigate(`${ROUTES.LOGIN}`, { replace: true });
        return;
      }
    } finally {
      setIsLoading(false);
    }
  };

  if (isLoading) {
    return (
      <div className="min-h-screen bg-light-bg dark:bg-dark-bg flex items-center justify-center">
        <div className="flex items-center gap-3">
          <Loader2 className="w-6 h-6 text-light-text-secondary dark:text-dark-text-secondary animate-spin" />
          <span className="text-light-text dark:text-dark-text text-lg">{translate('sharedSnippetView.loadingSnippet')}</span>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen bg-light-bg dark:bg-dark-bg flex flex-col items-center justify-center gap-4">
        <div className="text-red-500 dark:text-red-400 text-xl">{error}</div>
        <Link 
          to={ROUTES.PUBLIC_SNIPPETS}
          className="text-light-primary dark:text-dark-primary hover:opacity-80"
        >
          {translate('sharedSnippetView.browsePublicSnippets')}
        </Link>
      </div>
    );
  }

  if (errorCode === 410) {
    return (
      <div className="min-h-screen bg-light-bg dark:bg-dark-bg flex flex-col items-center justify-center gap-4">
        <div className="text-light-text dark:text-dark-text text-xl">{translate('sharedSnippetView.snippetExpired')}</div>
        <Link 
          to={ROUTES.PUBLIC_SNIPPETS}
          className="text-light-primary dark:text-dark-primary hover:opacity-80"
        >
          {translate('sharedSnippetView.browsePublicSnippets')}
        </Link>
      </div>
    );
  }

  if (!snippet) {
    return (
      <div className="min-h-screen bg-light-bg dark:bg-dark-bg flex flex-col items-center justify-center gap-4">
        <div className="text-light-text dark:text-dark-text text-xl">{translate('sharedSnippetView.snippetNotFound')}</div>
        <Link 
          to={ROUTES.PUBLIC_SNIPPETS}
          className="text-light-primary dark:text-dark-primary hover:opacity-80"
        >
          {translate('sharedSnippetView.browsePublicSnippets')}
        </Link>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text p-8">
      <div className="max-w-4xl mx-auto">
        <FullCodeView snippet={snippet} isPublicView={true} />
      </div>
    </div>
  );
};

export default SharedSnippetView;
````

## File: client/src/components/snippets/share/ShareMenu.tsx
````typescript
import React, { useState, useEffect } from 'react';
import { Share as ShareIcon, Trash2, Link as LinkIcon, Check, ShieldCheck, ShieldOff, Code2 } from 'lucide-react';
import parseDuration from 'parse-duration';
import { formatDistanceToNow } from 'date-fns';
import { useTranslation } from 'react-i18next';
import { Share, ShareSettings, Snippet } from '../../../types/snippets';
import { useToast } from '../../../hooks/useToast';
import { createShare, deleteShare, getSharesBySnippetId } from '../../../utils/api/share';
import { basePath } from '../../../utils/api/basePath';
import Modal from '../../common/modals/Modal';
import { Switch } from '../../common/switch/Switch';
import EmbedModal from '../embed/EmbedModal';

interface ShareMenuProps {
  isOpen: boolean;
  onClose: () => void;
  snippet: Snippet;
}

export const ShareMenu: React.FC<ShareMenuProps> = ({ isOpen, onClose, snippet }) => {
  const { t: translate } = useTranslation('components/snippets/share');
  const [shares, setShares] = useState<Share[]>([]);
  const [requiresAuth, setRequiresAuth] = useState(false);
  const [expiresIn, setExpiresIn] = useState<string>('');
  const [durationError, setDurationError] = useState<string>('');
  const [copiedStates, setCopiedStates] = useState<Record<string, boolean>>({});
  const [selectedShareId, setSelectedShareId] = useState<string | null>(null);
  const [isEmbedModalOpen, setIsEmbedModalOpen] = useState(false);
  const { addToast } = useToast();
  
  useEffect(() => {
    if (isOpen) {
      loadShares();
      setCopiedStates({});
    }
  }, [isOpen, snippet]);

  const loadShares = async () => {
    try {
      const loadedShares = await getSharesBySnippetId(snippet.id);
      setShares(loadedShares);
    } catch (error) {
      addToast(translate('shareMenu.error.load'), 'error');
    }
  };

  const handleCreateShare = async () => {
    if (expiresIn) {
      const seconds = parseDuration(expiresIn, 's');
      if (!seconds) {
        setDurationError(translate('shareMenu.error.invalidDuration'));
        return;
      }
      setDurationError('');
    }

    try {
      const settings: ShareSettings = {
        requiresAuth,
        expiresIn: expiresIn ? Math.floor(parseDuration(expiresIn, 's')!) : undefined
      };
      
      await createShare(snippet.id, settings);
      await loadShares();
      addToast(translate('shareMenu.success.created'), 'success');

      setRequiresAuth(false);
      setExpiresIn('');
    } catch (error) {
      addToast(translate('shareMenu.error.created'), 'error');
    }
  };

  const handleDeleteShare = async (shareId: string) => {
    try {
      await deleteShare(shareId);
      setShares(shares.filter(share => share.id !== shareId));
      addToast(translate('shareMenu.success.deleted'), 'success');
    } catch (error) {
      addToast(translate('shareMenu.error.deleted'), 'error');
    }
  };

  const copyShareLink = async (shareId: string) => {
    const url = `${window.location.origin}${basePath}/s/${shareId}`;
    try {
      if (navigator.clipboard && window.isSecureContext) {
        await navigator.clipboard.writeText(url);
      } else {
        const textArea = document.createElement('textarea');
        textArea.value = url;
        textArea.style.position = 'fixed';
        textArea.style.left = '-999999px';
        textArea.style.top = '-999999px';
        document.body.appendChild(textArea);
        textArea.focus();
        textArea.select();
        
        try {
          document.execCommand('copy');
        } finally {
          textArea.remove();
        }
      }

      setCopiedStates(prev => ({ ...prev, [shareId]: true }));
      setTimeout(() => {
        setCopiedStates(prev => ({ ...prev, [shareId]: false }));
      }, 2000);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  };

  const handleEmbedClick = (shareId: string) => {
    setSelectedShareId(shareId);
    setIsEmbedModalOpen(true);
  };

  const getRelativeExpiryTime = (expiresAt: string): string => {
    try {
      const expiryDate = new Date(expiresAt);
      return translate(
        'shareMenu.activeShareLinks.relativeExpiryTime',
        {
          date: formatDistanceToNow(expiryDate)
        }
      );
    } catch (error) {
      console.error('Error formatting expiry date:', error);
      return translate('shareMenu.error.unknownExpiryTime');
    }
  };

  return (
    <>
      <Modal
        isOpen={isOpen}
        onClose={onClose}
        title={
          <div className="flex items-center gap-2 text-light-text dark:text-dark-text">
            <ShareIcon size={20} />
            <h2 className="text-xl font-bold">{translate('shareMenu.title')}</h2>
          </div>
        }
      >
        <div className="space-y-6 text-light-text dark:text-dark-text">
          <div className="space-y-4">
            <h3 className="text-lg font-medium">{translate('shareMenu.subTitle')}</h3>
            
            <div className="space-y-4">
              <label className="flex items-center gap-2">
                <Switch 
                  id="useAuth"
                  checked={requiresAuth}
                  onChange={setRequiresAuth}/>
                <span>{translate('shareMenu.requiresAuth')}</span>
              </label>

              <div>
                <label className="block text-sm mb-1">{translate('shareMenu.expiresIn')}</label>
                <input
                  type="text"
                  value={expiresIn}
                  onChange={e => {
                    setExpiresIn(e.target.value);
                    setDurationError('');
                  }}
                  placeholder={translate('shareMenu.expiresInPlaceholder')}
                  className="w-full px-3 py-2 bg-light-surface dark:bg-dark-surface text-light-text dark:text-dark-text rounded-md border border-light-border dark:border-dark-border focus:outline-none focus:ring-2 focus:ring-light-primary dark:focus:ring-dark-primary"
                />
                {durationError && (
                  <p className="text-red-400 text-sm mt-1">{durationError}</p>
                )}
              </div>

              <button
                onClick={handleCreateShare}
                className="w-full py-2 bg-light-primary dark:bg-dark-primary text-white rounded-md hover:opacity-90 transition-colors"
              >
                {translate('shareMenu.createButtonText')}
              </button>
            </div>
          </div>

          <div className="space-y-4">
            <h3 className="text-lg font-medium">{translate('shareMenu.activeShareLinks.title')}</h3>
            
            {shares.length === 0 ? (
              <p className="text-light-text-secondary dark:text-dark-text-secondary">{translate('shareMenu.activeShareLinks.noLinks')}</p>
            ) : (
              <div className="space-y-2">
                {shares.map(share => (
                  <div
                    key={share.id}
                    className="flex items-center justify-between p-3 bg-light-surface dark:bg-dark-surface rounded-md border border-light-border dark:border-dark-border"
                  >
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2">
                        <span className="truncate">{share.id}</span>
                        {share.requires_auth === 1 && (
                          <span className="text-emerald-500 dark:text-emerald-400" title={translate('shareMenu.activeShareLinks.requiresAuth.true')}>
                            <ShieldCheck size={15} className="stroke-[2.5]" />
                          </span>
                        )}
                        {share.requires_auth === 0 && (
                          <span className="text-light-text-secondary dark:text-dark-text-secondary" title={translate('shareMenu.activeShareLinks.requiresAuth.false')}>
                            <ShieldOff size={15} className="stroke-[2.5]" />
                          </span>
                        )}
                        <div className="flex items-center">
                          {share.expired === 1 && (
                            <span className="px-2 py-0.5 bg-red-500/10 dark:bg-red-500/20 text-red-600 dark:text-red-400 border border-red-500/20 dark:border-red-500/30 rounded text-xs">
                              {translate('shareMenu.activeShareLinks.date.expired')}
                            </span>
                          )}
                          {share.expires_at && share.expired === 0 && (
                            <span className="px-2 py-0.5 bg-light-primary/10 dark:bg-dark-primary/20 text-light-primary dark:text-dark-primary border border-light-primary/20 dark:border-dark-primary/30 rounded text-xs">
                              {getRelativeExpiryTime(share.expires_at)}
                            </span>
                          )}
                          {share.expires_at === null && (
                            <span className="px-2 py-0.5 bg-light-primary/10 dark:bg-dark-primary/20 text-light-primary dark:text-dark-primary border border-light-primary/20 dark:border-dark-primary/30 rounded text-xs">
                              {translate('shareMenu.activeShareLinks.date.neverExpires')}
                            </span>
                          )}
                        </div>
                      </div>
                    </div>
                    <div className="flex items-center gap-2">
                      <button
                        onClick={() => copyShareLink(share.id)}
                        className="p-2 hover:bg-light-hover dark:hover:bg-dark-hover rounded-md transition-colors"
                        title={translate('shareMenu.activeShareLinks.buttons.copy')}
                      >
                        {copiedStates[share.id] ? (
                          <Check size={16} className="text-light-primary dark:text-dark-primary" />
                        ) : (
                          <LinkIcon size={16} className="text-light-text dark:text-dark-text" />
                        )}
                      </button>
                      <button
                        onClick={() => share.requires_auth === 0 && handleEmbedClick(share.id)}
                        className={`p-2 rounded-md transition-colors ${
                          share.requires_auth === 0 
                            ? 'hover:bg-light-hover dark:hover:bg-dark-hover' 
                            : 'cursor-not-allowed'
                        }`}
                        title={
                          share.requires_auth === 1
                            ? translate('shareMenu.activeShareLinks.buttons.requiresAuth.true')
                            : translate('shareMenu.activeShareLinks.buttons.requiresAuth.false')
                        }
                      >
                        <Code2 
                          size={16} 
                          className={share.requires_auth === 1 
                            ? "text-light-text-secondary dark:text-dark-text-secondary opacity-50" 
                            : "text-light-text dark:text-dark-text"
                          } 
                        />
                      </button>
                      <button
                        onClick={() => handleDeleteShare(share.id)}
                        className="p-2 hover:bg-light-hover dark:hover:bg-dark-hover rounded-md transition-colors"
                        title={translate('shareMenu.activeShareLinks.buttons.delete')}
                      >
                        <Trash2 size={16} className="hover:text-red-500" />
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      </Modal>

      {selectedShareId && (
        <EmbedModal
          isOpen={isEmbedModalOpen}
          onClose={() => {
            setIsEmbedModalOpen(false);
            setSelectedShareId(null);
          }}
          shareId={selectedShareId}
          snippet={snippet}
        />
      )}
    </>
  );
}
````

## File: client/src/components/snippets/view/common/AuthAwareSnippetPage.tsx
````typescript
import React, { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Loader2 } from 'lucide-react';
import { useTranslation } from 'react-i18next';
import { ROUTES } from '../../../../constants/routes';
import { useAuth } from '../../../../hooks/useAuth';
import { Snippet } from '../../../../types/snippets';
import { getSnippetById, getPublicSnippetById } from '../../../../utils/api/snippets';
import { FullCodeView } from '../FullCodeView';

const AuthAwareSnippetView: React.FC = () => {
  const { t: translate } = useTranslation('components/snippets/view/common');
  const { snippetId } = useParams<{ snippetId: string }>();
  const [snippet, setSnippet] = useState<Snippet | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [requiresAuth, setRequiresAuth] = useState(false);
  const [tryingPublicAccess, setTryingPublicAccess] = useState(false);
  const { isAuthenticated } = useAuth();

  useEffect(() => {
    loadSnippet();
  }, [snippetId, isAuthenticated]);

  const loadSnippet = async () => {
    if (!snippetId) return;
    
    setIsLoading(true);
    setError(null);
    setTryingPublicAccess(false);
    setRequiresAuth(false);

    try {
      if (isAuthenticated) {
        const data = await getSnippetById(snippetId);
        setSnippet(data);
        return;
      }

      setTryingPublicAccess(true);
      const publicData = await getPublicSnippetById(snippetId);
      setSnippet(publicData);
    } catch (err: any) {
      if (err.status === 401 || err.status === 403) {
        setRequiresAuth(true);
        if (!tryingPublicAccess) {
          try {
            const publicData = await getPublicSnippetById(snippetId);
            setSnippet(publicData);
            setRequiresAuth(false);
            setError(null);
            return;
          } catch (publicErr: any) {
            setError(translate('authAwareSnippetView.error.snippetRequireAuth'));
          }
        } else {
          setError(translate('authAwareSnippetView.error.snippetRequireAuth'));
        }
      } else {
        setError(err.message || translate('authAwareSnippetView.error.snippetLoad'));
      }
    } finally {
      setIsLoading(false);
    }
  };

  if (isLoading) {
    return (
      <div className="min-h-screen bg-white dark:bg-gray-900 flex items-center justify-center">
        <div className="flex items-center gap-3">
          <Loader2 className="w-6 h-6 text-gray-600 dark:text-gray-400 animate-spin" />
          <span className="text-gray-800 dark:text-gray-200 text-lg">
            {translate('loadingSnippets')}
          </span>
        </div>
      </div>
    );
  }

  if (requiresAuth && !isAuthenticated) {
    return (
      <div className="min-h-screen bg-white dark:bg-gray-900 flex flex-col items-center justify-center gap-4">
        <div className="text-red-600 dark:text-red-400 text-xl mb-4">
          {translate('authAwareSnippetView.error.snippetRequireAuth')}
        </div>
        <div className="flex gap-4">
          <Link 
            to={ROUTES.LOGIN} 
            className="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-md transition-colors"
          >
            {translate('signIn')}
          </Link>
          <Link 
            to={ROUTES.PUBLIC_SNIPPETS}
            className="px-4 py-2 bg-gray-200 dark:bg-gray-700 hover:bg-gray-300 dark:hover:bg-gray-600 text-gray-900 dark:text-white rounded-md transition-colors"
          >
            {translate('browsePublicSnippets')}
          </Link>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen bg-white dark:bg-gray-900 flex flex-col items-center justify-center gap-4">
        <div className="text-red-600 dark:text-red-400 text-xl">{error}</div>
        <Link 
          to={ROUTES.PUBLIC_SNIPPETS}
          className="text-blue-600 dark:text-blue-400 hover:text-blue-700 dark:hover:text-blue-300"
        >
          {translate('browsePublicSnippets')}
        </Link>
      </div>
    );
  }

  if (!snippet) {
    return (
      <div className="min-h-screen bg-white dark:bg-gray-900 flex flex-col items-center justify-center gap-4">
        <div className="text-gray-900 dark:text-white text-xl">{translate('sippetNotFound')}</div>
        <Link 
          to={ROUTES.PUBLIC_SNIPPETS}
          className="text-blue-600 dark:text-blue-400 hover:text-blue-700 dark:hover:text-blue-300"
        >
          {translate('browsePublicSnippets')}
        </Link>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100 p-8">
      <div className="max-w-4xl mx-auto">
        <FullCodeView snippet={snippet} />
      </div>
    </div>
  );
};

export default AuthAwareSnippetView;
````

## File: client/src/components/snippets/view/common/BaseSnippetStorage.tsx
````typescript
import React, { useState, useEffect, useCallback, useRef } from "react";
import { useSearchParams } from "react-router-dom";
import { useTranslation } from "react-i18next";
import { initializeMonaco } from "../../../../utils/language/languageUtils";
import { useAuth } from "../../../../hooks/useAuth";
import { useSettings } from "../../../../hooks/useSettings";
import { useCreateSnippet, useEditSnippet } from "../../../../hooks/useSnippetsQuery";
import { useToast } from "../../../../hooks/useToast";
import { SearchAndFilter } from "../../../search/SearchAndFilter";
import { snippetService } from "../../../../service/snippetService";
import { Snippet } from "../../../../types/snippets";
import SettingsModal from "../../../settings/SettingsModal";
import { UserDropdown } from "../../../auth/UserDropdown";
import EditSnippetModal from "../../edit/EditSnippetModal";
import { ShareMenu } from "../../share/ShareMenu";
import SnippetContentArea from "./SnippetContentArea";
import StorageHeader from "./StorageHeader";

const BaseSnippetStorage: React.FC = () => {
  const { t: translate } = useTranslation('components/snippets/view/common');
  const [, setSearchParams] = useSearchParams();
  const { addToast } = useToast();
  const { isAuthenticated, logout } = useAuth();
  const {
    viewMode,
    setViewMode,
    compactView,
    showCodePreview,
    previewLines,
    includeCodeInSearch,
    updateSettings,
    showCategories,
    expandCategories,
    showLineNumbers,
    theme,
    locale,
    showFavorites,
    setShowFavorites,
  } = useSettings();

  // Metadata - loaded once, never changes
  const [metadata, setMetadata] = useState<{ categories: string[]; languages: string[] }>({
    categories: [],
    languages: []
  });

  // UI state
  const [isEditSnippetModalOpen, setIsEditSnippetModalOpen] = useState(false);
  const [isSettingsModalOpen, setIsSettingsModalOpen] = useState(false);
  const [snippetToEdit, setSnippetToEdit] = useState<Snippet | null>(null);
  const [isShareMenuOpen, setIsShareMenuOpen] = useState(false);
  const [snippetToShare, setSnippetToShare] = useState<Snippet | null>(null);

  const mountedRef = useRef(false);

  // React Query mutations
  const createSnippetMutation = useCreateSnippet();
  const editSnippetMutation = useEditSnippet();

  useEffect(() => {
    mountedRef.current = true;
    initializeMonaco();
    return () => {
      mountedRef.current = false;
    };
  }, []);

  // Load metadata once
  useEffect(() => {
    const fetchMetadata = async () => {
      try {
        const data = await snippetService.getSnippetsMetadata();
        setMetadata(data);
      } catch (error) {
        console.error("Failed to fetch metadata:", error);
      }
    };
    fetchMetadata();
  }, []);

  // Stable callbacks that only update URL - these NEVER change
  const handleSearchChange = useCallback((search: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      const trimmedSearch = search.trim();
      if (trimmedSearch) {
        next.set("search", trimmedSearch);
      } else {
        next.delete("search");
      }
      return next;
    });
  }, [setSearchParams]);

  const handleLanguageChange = useCallback((language: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      if (language) {
        next.set("language", language);
      } else {
        next.delete("language");
      }
      return next;
    });
  }, [setSearchParams]);

  const handleCategoryToggle = useCallback((category: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      const current = next.get("categories")?.split(",").filter(Boolean) || [];
      const updated = current.includes(category)
        ? current.filter(c => c !== category)
        : [...current, category];

      if (updated.length > 0) {
        next.set("categories", updated.join(","));
      } else {
        next.delete("categories");
      }
      return next;
    });
  }, [setSearchParams]);

  const handleSortChange = useCallback((sort: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      next.set("sort", sort);
      return next;
    });
  }, [setSearchParams]);

  const handleShowFavorites = useCallback(() => {
    setShowFavorites((prev) => {
      const newValue = !prev;
      if (newValue) {
        addToast(translate('baseSnippetStorage.success.displayFavorites'), "success");
      } else {
        addToast(translate('baseSnippetStorage.success.displayAll'), "info");
      }
      return newValue;
    });
  }, [setShowFavorites, addToast]);

  // Modal handlers
  const openEditSnippetModal = useCallback((snippet: Snippet | null = null) => {
    setSnippetToEdit(snippet);
    setIsEditSnippetModalOpen(true);
  }, []);

  const closeEditSnippetModal = useCallback(() => {
    setSnippetToEdit(null);
    setIsEditSnippetModalOpen(false);
  }, []);
  
  const sessionExpiredHandler = useCallback(() => {
    logout();
    addToast(translate('baseSnippetStorage.error.sessionExpired'), "error");
  }, []);

  const handleSnippetSubmit = useCallback(async (snippetData: Omit<Snippet, "id" | "updated_at">) => {
    try {
      if (snippetToEdit) {
        await editSnippetMutation.mutateAsync({ id: snippetToEdit.id, snippet: snippetData });
        addToast(translate('baseSnippetStorage.success.snippetUpdated'), "success");
      } else {
        await createSnippetMutation.mutateAsync(snippetData);
        addToast(translate('baseSnippetStorage.success.snippetCreated'), "success");
      }
      closeEditSnippetModal();
    } catch (error: any) {
      console.error("Error saving snippet:", error);
      if (error.status === 401 || error.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(
          snippetToEdit
            ? translate('baseSnippetStorage.error.snippetUpdated')
            : translate('baseSnippetStorage.error.snippetCreated'),
          "error"
        );
      }
      throw error;
    }
  }, [snippetToEdit, createSnippetMutation, editSnippetMutation, addToast, logout, closeEditSnippetModal]);

  const openShareMenu = useCallback((snippet: Snippet) => {
    setSnippetToShare(snippet);
    setIsShareMenuOpen(true);
  }, []);

  const closeShareMenu = useCallback(() => {
    setSnippetToShare(null);
    setIsShareMenuOpen(false);
  }, []);

  const handleSettingsOpen = useCallback(() => setIsSettingsModalOpen(true), []);
  const handleNewSnippet = useCallback(() => openEditSnippetModal(null), [openEditSnippetModal]);

  return (
    <>
      <div className="min-h-screen p-8 bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text">
        <div className="flex items-start justify-between mb-4">
          <StorageHeader isPublicView={false} />
          <UserDropdown />
        </div>

        <SearchAndFilter
          metadata={metadata}
          onSearchChange={handleSearchChange}
          onLanguageChange={handleLanguageChange}
          onCategoryToggle={handleCategoryToggle}
          onSortChange={handleSortChange}
          viewMode={viewMode}
          setViewMode={setViewMode}
          openSettingsModal={handleSettingsOpen}
          openNewSnippetModal={handleNewSnippet}
          showFavorites={showFavorites}
          handleShowFavorites={handleShowFavorites}
          hideNewSnippet={false}
          hideRecycleBin={false}
          isPublicView={false}
        />

        <SnippetContentArea
          includeCodeInSearch={includeCodeInSearch}
          showFavorites={showFavorites}
          viewMode={viewMode}
          compactView={compactView}
          showCodePreview={showCodePreview}
          previewLines={previewLines}
          showCategories={showCategories}
          expandCategories={expandCategories}
          showLineNumbers={showLineNumbers}
          isAuthenticated={isAuthenticated}
          onCategoryClick={handleCategoryToggle}
          onSnippetSelect={() => {}}
          onEdit={openEditSnippetModal}
          onShare={openShareMenu}
        />
      </div>

      <EditSnippetModal
        isOpen={isEditSnippetModalOpen}
        onClose={closeEditSnippetModal}
        onSubmit={handleSnippetSubmit}
        snippetToEdit={snippetToEdit}
        showLineNumbers={showLineNumbers}
        allCategories={metadata.categories}
      />

      <SettingsModal
        isOpen={isSettingsModalOpen}
        onClose={() => setIsSettingsModalOpen(false)}
        settings={{
          compactView,
          showCodePreview,
          previewLines,
          includeCodeInSearch,
          showCategories,
          expandCategories,
          showLineNumbers,
          theme,
          locale,
        }}
        onSettingsChange={updateSettings}
        isPublicView={false}
      />

      {snippetToShare && (
        <ShareMenu
          snippet={snippetToShare}
          isOpen={isShareMenuOpen}
          onClose={closeShareMenu}
        />
      )}
    </>
  );
};

export default BaseSnippetStorage;
````

## File: client/src/components/snippets/view/common/SnippetContentArea.tsx
````typescript
import React, { useEffect, useCallback, useMemo, useState, useRef } from "react";
import { useSearchParams } from "react-router-dom";
import { Loader2 } from "lucide-react";
import { useTranslation } from "react-i18next";
import { Snippet } from "../../../../types/snippets";
import { useAuth } from "../../../../hooks/useAuth";
import { useToast } from "../../../../hooks/useToast";
import { saveLanguagesUsage } from "../../../../utils/language/languageUtils";
import {
  useSnippetsInfiniteQuery,
  useMoveToRecycleBin,
  usePinSnippet,
  useFavoriteSnippet,
  useCreateSnippet,
  SnippetsQueryKey,
} from "../../../../hooks/useSnippetsQuery";
import { PageContainer } from "../../../common/layout/PageContainer";
import SnippetList from "../../list/SnippetList";
import SnippetModal from "../SnippetModal";

interface SnippetContentAreaProps {
  includeCodeInSearch: boolean;
  showFavorites: boolean;
  viewMode: "grid" | "list";
  compactView: boolean;
  showCodePreview: boolean;
  previewLines: number;
  showCategories: boolean;
  expandCategories: boolean;
  showLineNumbers: boolean;
  isAuthenticated: boolean;
  onCategoryClick: (category: string) => void;
  onSnippetSelect: (snippet: Snippet | null) => void;
  onEdit: (snippet: Snippet) => void;
  onShare: (snippet: Snippet) => void;
}

const SnippetContentArea: React.FC<SnippetContentAreaProps> = ({
  includeCodeInSearch,
  showFavorites,
  viewMode,
  compactView,
  showCodePreview,
  previewLines,
  showCategories,
  expandCategories,
  showLineNumbers,
  isAuthenticated,
  onCategoryClick,
  onSnippetSelect,
  onEdit,
  onShare,
}) => {
  const { t: translate } = useTranslation('components/snippets/view/common');
  const [searchParams] = useSearchParams();
  const { addToast } = useToast();
  const { logout } = useAuth();
  const [selectedSnippet, setSelectedSnippet] = useState<Snippet | null>(null);
  const observerTarget = useRef<HTMLDivElement>(null);

  const queryFilters: SnippetsQueryKey = useMemo(() => ({
    search: searchParams.get("search") || undefined,
    searchCode: includeCodeInSearch,
    language: searchParams.get("language") || undefined,
    category: searchParams.get("categories") || undefined,
    favorites: showFavorites,
    recycled: false,
    sort: searchParams.get("sort") || "newest",
    viewType: "base",
  }), [searchParams, includeCodeInSearch, showFavorites]);

  const {
    data,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
    isLoading,
    isError,
    error,
  } = useSnippetsInfiniteQuery(queryFilters);

  const moveToRecycleBinMutation = useMoveToRecycleBin();
  const pinSnippetMutation = usePinSnippet();
  const favoriteSnippetMutation = useFavoriteSnippet();
  const createSnippetMutation = useCreateSnippet();

  const sessionExpiredHandler = useCallback(() => {
    logout();
    addToast(translate('snippetContentArea.error.sessionExpired'), "error");
  }, []);

  const snippets = useMemo(() => {
    return data?.pages.flatMap(page => page.data) ?? [];
  }, [data]);

  useEffect(() => {
    if (snippets.length > 0) {
      saveLanguagesUsage(snippets);
    }
  }, [snippets]);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting && hasNextPage && !isFetchingNextPage) {
          fetchNextPage();
        }
      },
      { threshold: 0.1 }
    );

    if (observerTarget.current) {
      observer.observe(observerTarget.current);
    }

    return () => observer.disconnect();
  }, [hasNextPage, isFetchingNextPage, fetchNextPage]);

  useEffect(() => {
    if (isError && error) {
      const err = error as any;
      if (err.status === 401 || err.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(translate('snippetContentArea.error.loadSnippets'), "error");
      }
    }
  }, [isError, error, logout, addToast]);

  const removeSnippet = useCallback(async (id: string) => {
    try {
      await moveToRecycleBinMutation.mutateAsync(id);
      addToast(translate('snippetContentArea.success.moveSnippetToRecycleBin'), "success");
    } catch (error: any) {
      console.error("Failed to move snippet to recycle bin:", error);
      if (error.status === 401 || error.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(translate('snippetContentArea.error.moveSnippetToRecycleBin'), "error");
      }
      throw error;
    }
  }, [moveToRecycleBinMutation, addToast, logout]);

  const pinSnippet = useCallback(async (id: string, isPinned: boolean) => {
    try {
      const updatedSnippet = await pinSnippetMutation.mutateAsync({ id, isPinned });
      addToast(translate(
        isPinned
          ? "snippetContentArea.success.updatePinStatusDeleted"
          : "snippetContentArea.success.updatePinStatusAdded"
      ), "success");
      return updatedSnippet;
    } catch (error: any) {
      console.error("Failed to update pin status:", error);
      if (error.status === 401 || error.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(translate(
          isPinned
            ? "snippetContentArea.error.updatePinStatusDeleted"
            : "snippetContentArea.error.updatePinStatusAdded"
        ), "error");
      }
    }
  }, [pinSnippetMutation, addToast, logout]);

  const favoriteSnippet = useCallback(async (id: string, isFavorite: boolean) => {
    try {
      const updatedSnippet = await favoriteSnippetMutation.mutateAsync({ id, isFavorite });
      addToast(translate(
        isFavorite
          ? "snippetContentArea.success.updateFavoriteStatusDeleted"
          : "snippetContentArea.success.updateFavoriteStatusAdded"
      ), "success");
      return updatedSnippet;
    } catch (error: any) {
      console.error("Failed to update favorite status:", error);
      if (error.status === 401 || error.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(translate(
          isFavorite
            ? "snippetContentArea.error.updateFavoriteStatusDeleted"
            : "snippetContentArea.error.updateFavoriteStatusAdded"
        ), "error");
      }
    }
  }, [favoriteSnippetMutation, addToast, logout]);

  const handleDuplicate = useCallback(async (snippet: Snippet) => {
    try {
      const duplicatedSnippet: Omit<Snippet, "id" | "updated_at" | "share_count"> = {
        title: `${snippet.title}`,
        description: snippet.description,
        categories: [...snippet.categories],
        fragments: snippet.fragments.map((f) => ({ ...f })),
        is_public: snippet.is_public,
        is_pinned: 0,
        is_favorite: 0,
      };
      await createSnippetMutation.mutateAsync(duplicatedSnippet);
      addToast(translate('snippetContentArea.success.duplicateSnippet'), "success");
    } catch (error: any) {
      console.error("Failed to duplicate snippet:", error);
      if (error.status === 401 || error.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(translate('snippetContentArea.error.duplicateSnippet'), "error");
      }
    }
  }, [createSnippetMutation, addToast, logout]);

  const handleSnippetSelect = useCallback((snippet: Snippet | null) => {
    setSelectedSnippet(snippet);
    onSnippetSelect(snippet);
  }, [onSnippetSelect]);

  if (isLoading) {
    return (
      <PageContainer>
        <div className="flex flex-col items-center justify-center min-h-screen bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text">
          <div className="relative">
            <h1 className="mb-4 text-4xl font-bold">ByteStash</h1>
            <div className="flex items-center justify-center gap-3">
              <Loader2 className="w-5 h-5 text-light-text-secondary dark:text-dark-text-secondary animate-spin" />
              <span className="text-light-text-secondary dark:text-dark-text-secondary">
                {translate('loadingSnippets')}
              </span>
            </div>
          </div>
        </div>
      </PageContainer>
    );
  }

  const filters = {
    categories: searchParams.get("categories")?.split(",").filter(Boolean) || [],
  };

  return (
    <>
      {filters.categories.length > 0 && (
        <div className="flex flex-wrap items-center gap-2 mb-4">
          <span className="text-sm text-light-text-secondary dark:text-dark-text-secondary">
            {translate('filter.filteredByCategories')}:
          </span>
          {filters.categories.map((category, index) => (
            <button
              key={index}
              onClick={() => onCategoryClick(category)}
              className="flex items-center gap-1 px-2 py-1 text-sm rounded-md bg-light-primary/20 dark:bg-dark-primary/20 text-light-primary dark:text-dark-primary hover:bg-light-primary/30 dark:hover:bg-dark-primary/30"
            >
              <span>{category}</span>
              <span className="text-light-text-secondary dark:text-dark-text-secondary hover:text-light-text dark:hover:text-dark-text">
                ×
              </span>
            </button>
          ))}
        </div>
      )}

      <SnippetList
        snippets={snippets}
        viewMode={viewMode}
        onOpen={handleSnippetSelect}
        onDelete={removeSnippet}
        onRestore={() => Promise.resolve()}
        onEdit={onEdit}
        onCategoryClick={onCategoryClick}
        onShare={onShare}
        onDuplicate={handleDuplicate}
        compactView={compactView}
        showCodePreview={showCodePreview}
        previewLines={previewLines}
        showCategories={showCategories}
        expandCategories={expandCategories}
        showLineNumbers={showLineNumbers}
        isPublicView={false}
        isRecycleView={false}
        isAuthenticated={isAuthenticated}
        pinSnippet={pinSnippet}
        favoriteSnippet={favoriteSnippet}
      />

      {hasNextPage && (
        <div ref={observerTarget} className="h-20 flex items-center justify-center">
          {isFetchingNextPage && <Loader2 className="animate-spin" />}
        </div>
      )}

      {
        selectedSnippet && (
          <SnippetModal
            snippet={selectedSnippet}
            isOpen={!!selectedSnippet}
            onClose={() => handleSnippetSelect(null)}
            onDelete={removeSnippet}
            onEdit={onEdit}
            onCategoryClick={onCategoryClick}
            showLineNumbers={showLineNumbers}
            isPublicView={false}
            isRecycleView={false}
          />
        )
      }
    </>
  );
};

export default SnippetContentArea;
````

## File: client/src/components/snippets/view/common/StorageHeader.tsx
````typescript
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { ROUTES } from '../../../../constants/routes';
import { AppHeader } from '../../../common/layout/AppHeader';
import ViewSwitch from './ViewSwitch';

interface StorageHeaderProps {
  isPublicView: boolean;
}

const StorageHeader: React.FC<StorageHeaderProps> = ({ isPublicView }) => {
  const [isTooltipVisible, setIsTooltipVisible] = useState(false);
  const navigate = useNavigate();
  const { t: translate } = useTranslation('components/snippets/view/common');

  const tooltipText = isPublicView
    ? translate('storageHeader.public')
    : translate('storageHeader.private');

  const handleViewToggle = (checked: boolean) => {
    navigate(checked ? ROUTES.PUBLIC_SNIPPETS : ROUTES.HOME);
  };

  return (
    <AppHeader>
      <div
        className="relative inline-block"
        onMouseEnter={() => setIsTooltipVisible(true)}
        onMouseLeave={() => setIsTooltipVisible(false)}
      >
        <ViewSwitch checked={isPublicView} onChange={handleViewToggle} />

        {isTooltipVisible && (
          <div
            className="absolute left-1/2 top-full mt-3 w-64 -translate-x-1/2 rounded-lg border border-light-border
              dark:border-dark-border bg-light-surface dark:bg-dark-surface p-3 text-sm z-50 shadow-lg
              text-light-text dark:text-dark-text before:content-[''] before:absolute before:-top-2 before:left-1/2
              before:-translate-x-1/2 before:border-8 before:border-transparent before:border-b-light-surface
              dark:before:border-b-dark-surface"
            role="tooltip"
          >
            {tooltipText}
          </div>
        )}
      </div>
    </AppHeader>
  );
};

export default StorageHeader;
````

## File: client/src/components/snippets/view/common/ViewSwitch.tsx
````typescript
import React from 'react';
import { Globe, Lock } from 'lucide-react';
import { useTranslation } from 'react-i18next';

interface ViewSwitchProps {
  checked: boolean;
  onChange: (checked: boolean) => void;
}

const ViewSwitch: React.FC<ViewSwitchProps> = ({ checked, onChange }) => {
  const { t: translate } = useTranslation('components/snippets/view/common');

  return (
    <div className="flex items-center gap-3 text-sm text-light-text dark:text-dark-text w-full">
      <div
        className="flex gap-0.5 rounded-lg bg-light-surface dark:bg-dark-surface px-0.5 py-0.5 w-full"
        role="group"
      >
        <button
          type="button"
          onClick={() => onChange(false)}
          className={`
            flex items-center justify-center gap-1 px-2 py-0.5 rounded-md transition-all duration-200 flex-1
            ${!checked 
              ? 'bg-light-hover dark:bg-dark-hover' 
              : 'hover:bg-light-hover/50 dark:hover:bg-dark-hover/50'
            }
          `}
        >
          <Lock 
            className={`
              stroke-[2] transition-colors duration-200
              ${!checked ? 'text-emerald-500' : 'text-light-text/50 dark:text-dark-text/50'}
            `} 
            size={14} 
          />
          <span className="text-xs font-medium">{translate('viewSwitch.private')}</span>
        </button>
        <button
          type="button"
          onClick={() => onChange(true)}
          className={`
            flex items-center justify-center gap-1 px-2 py-0.5 rounded-md transition-all duration-200 flex-1
            ${checked 
              ? 'bg-light-hover dark:bg-dark-hover' 
              : 'hover:bg-light-hover/50 dark:hover:bg-dark-hover/50'
            }
          `}
        >
          <Globe 
            className={`
              stroke-[2] transition-colors duration-200
              ${checked ? 'text-light-primary dark:text-dark-primary' : 'text-light-text/50 dark:text-dark-text/50'}
            `} 
            size={14} 
          />
          <span className="text-xs font-medium">{translate('viewSwitch.public')}</span>
        </button>
      </div>
    </div>
  );
};

export default ViewSwitch;
````

## File: client/src/components/snippets/view/public/PublicSnippetContentArea.tsx
````typescript
import React, { useEffect, useCallback, useMemo, useState, useRef } from "react";
import { useSearchParams, useNavigate } from "react-router-dom";
import { Loader2 } from "lucide-react";
import { useTranslation } from "react-i18next";
import { Snippet } from "../../../../types/snippets";
import { useToast } from "../../../../hooks/useToast";
import {
  useSnippetsInfiniteQuery,
  useCreateSnippet,
  SnippetsQueryKey,
} from "../../../../hooks/useSnippetsQuery";
import SnippetList from "../../list/SnippetList";
import SnippetModal from "../SnippetModal";
import { PageContainer } from "../../../common/layout/PageContainer";
import { ROUTES } from "../../../../constants/routes";

interface PublicSnippetContentAreaProps {
  includeCodeInSearch: boolean;
  viewMode: "grid" | "list";
  compactView: boolean;
  showCodePreview: boolean;
  previewLines: number;
  showCategories: boolean;
  expandCategories: boolean;
  showLineNumbers: boolean;
  isAuthenticated: boolean;
  onCategoryClick: (category: string) => void;
}

const PublicSnippetContentArea: React.FC<PublicSnippetContentAreaProps> = ({
  includeCodeInSearch,
  viewMode,
  compactView,
  showCodePreview,
  previewLines,
  showCategories,
  expandCategories,
  showLineNumbers,
  isAuthenticated,
  onCategoryClick,
}) => {
  const { t: translate } = useTranslation('components/snippets/view/public');
  const [searchParams] = useSearchParams();
  const { addToast } = useToast();
  const navigate = useNavigate();
  const [selectedSnippet, setSelectedSnippet] = useState<Snippet | null>(null);
  const observerTarget = useRef<HTMLDivElement>(null);

  const queryFilters: SnippetsQueryKey = useMemo(() => ({
    search: searchParams.get("search") || undefined,
    searchCode: includeCodeInSearch,
    language: searchParams.get("language") || undefined,
    category: searchParams.get("categories") || undefined,
    sort: searchParams.get("sort") || "newest",
    viewType: "public",
  }), [searchParams, includeCodeInSearch]);

  const {
    data,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
    isLoading,
    isError,
    error,
  } = useSnippetsInfiniteQuery(queryFilters);

  const createSnippetMutation = useCreateSnippet();

  const snippets = useMemo(() => {
    return data?.pages.flatMap(page => page.data) ?? [];
  }, [data]);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting && hasNextPage && !isFetchingNextPage) {
          fetchNextPage();
        }
      },
      { threshold: 0.1 }
    );

    if (observerTarget.current) {
      observer.observe(observerTarget.current);
    }

    return () => observer.disconnect();
  }, [hasNextPage, isFetchingNextPage, fetchNextPage]);

  useEffect(() => {
    if (isError && error) {
      addToast(translate('publicSnippetContentArea.error.failedLoadSnippets'), "error");
    }
  }, [isError, error, addToast]);

  const handleDuplicate = useCallback(async (snippet: Snippet) => {
    if (!isAuthenticated) {
      addToast(translate('publicSnippetContentArea.info.requireAuth'), "info");
      navigate(ROUTES.LOGIN);
      return;
    }

    try {
      const duplicatedSnippet: Omit<Snippet, "id" | "updated_at" | "share_count" | "username"> = {
        title: `${snippet.title}`,
        description: snippet.description,
        categories: [...snippet.categories],
        fragments: snippet.fragments.map((f) => ({ ...f })),
        is_public: 0,
        is_pinned: 0,
        is_favorite: 0,
      };

      await createSnippetMutation.mutateAsync(duplicatedSnippet);
      addToast(translate('publicSnippetContentArea.success.addSnippetToCollection'), "success");
    } catch (error) {
      console.error("Failed to duplicate snippet:", error);
      addToast(translate('publicSnippetContentArea.error.addSnippetToCollection'), "error");
    }
  }, [isAuthenticated, createSnippetMutation, addToast, navigate]);

  if (isLoading) {
    return (
      <PageContainer>
        <div className="flex flex-col items-center justify-center min-h-screen bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text">
          <div className="relative">
            <h1 className="mb-4 text-4xl font-bold">ByteStash</h1>
            <div className="flex items-center justify-center gap-3">
              <Loader2 className="w-5 h-5 text-light-text-secondary dark:text-dark-text-secondary animate-spin" />
              <span className="text-light-text-secondary dark:text-dark-text-secondary">
                {translate('publicSnippetContentArea.loadingSnippets')}
              </span>
            </div>
          </div>
        </div>
      </PageContainer>
    );
  }

  const filters = {
    categories: searchParams.get("categories")?.split(",").filter(Boolean) || [],
  };

  return (
    <>
      {filters.categories.length > 0 && (
        <div className="flex flex-wrap items-center gap-2 mb-4">
          <span className="text-sm text-light-text-secondary dark:text-dark-text-secondary">
            {translate('publicSnippetContentArea.filter.byCategories')}:
          </span>
          {filters.categories.map((category, index) => (
            <button
              key={index}
              onClick={() => onCategoryClick(category)}
              className="flex items-center gap-1 px-2 py-1 text-sm rounded-md bg-light-primary/20 dark:bg-dark-primary/20 text-light-primary dark:text-dark-primary hover:bg-light-primary/30 dark:hover:bg-dark-primary/30"
            >
              <span>{category}</span>
              <span className="text-light-text-secondary dark:text-dark-text-secondary hover:text-light-text dark:hover:text-dark-text">
                ×
              </span>
            </button>
          ))}
        </div>
      )}

      <SnippetList
        snippets={snippets}
        viewMode={viewMode}
        onOpen={setSelectedSnippet}
        onDelete={() => Promise.resolve()}
        onRestore={() => Promise.resolve()}
        onEdit={() => {}}
        onCategoryClick={onCategoryClick}
        onShare={() => {}}
        onDuplicate={handleDuplicate}
        compactView={compactView}
        showCodePreview={showCodePreview}
        previewLines={previewLines}
        showCategories={showCategories}
        expandCategories={expandCategories}
        showLineNumbers={showLineNumbers}
        isPublicView={true}
        isRecycleView={false}
        isAuthenticated={isAuthenticated}
      />

      {hasNextPage && (
        <div ref={observerTarget} className="h-20 flex items-center justify-center">
          {isFetchingNextPage && <Loader2 className="animate-spin" />}
        </div>
      )}

      {
        selectedSnippet && (
          <SnippetModal
            snippet={selectedSnippet}
            isOpen={!!selectedSnippet}
            onClose={() => setSelectedSnippet(null)}
            onDelete={() => Promise.resolve()}
            onEdit={() => {}}
            onCategoryClick={onCategoryClick}
            showLineNumbers={showLineNumbers}
            isPublicView={true}
            isRecycleView={false}
          />
        )
      }
    </>
  );
};

export default PublicSnippetContentArea;
````

## File: client/src/components/snippets/view/public/PublicSnippetStorage.tsx
````typescript
import React, { useState, useEffect, useCallback } from "react";
import { useSearchParams } from "react-router-dom";
import { useSettings } from "../../../../hooks/useSettings";
import { useAuth } from "../../../../hooks/useAuth";
import { initializeMonaco } from "../../../../utils/language/languageUtils";
import { snippetService } from "../../../../service/snippetService";
import SettingsModal from "../../../settings/SettingsModal";
import { SearchAndFilter } from "../../../search/SearchAndFilter";
import { UserDropdown } from "../../../auth/UserDropdown";
import StorageHeader from "../common/StorageHeader";
import PublicSnippetContentArea from "./PublicSnippetContentArea";

const PublicSnippetStorage: React.FC = () => {
  // URL-based filter state
  const [, setSearchParams] = useSearchParams();

  // Settings
  const {
    viewMode,
    setViewMode,
    compactView,
    showCodePreview,
    previewLines,
    includeCodeInSearch,
    updateSettings,
    showCategories,
    expandCategories,
    showLineNumbers,
    theme,
    locale,
  } = useSettings();

  const { isAuthenticated } = useAuth();

  // Metadata - loaded once
  const [metadata, setMetadata] = useState<{ categories: string[]; languages: string[] }>({
    categories: [],
    languages: []
  });

  // UI state
  const [isSettingsModalOpen, setIsSettingsModalOpen] = useState(false);

  useEffect(() => {
    initializeMonaco();
  }, []);

  // Load metadata once
  useEffect(() => {
    const fetchMetadata = async () => {
      try {
        const data = await snippetService.getPublicSnippetsMetadata();
        setMetadata(data);
      } catch (error) {
        console.error("Failed to fetch metadata:", error);
      }
    };
    fetchMetadata();
  }, []);


  // URL update handlers - stable callbacks
  const handleSearchChange = useCallback((search: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      const trimmedSearch = search.trim();
      if (trimmedSearch) {
        next.set("search", trimmedSearch);
      } else {
        next.delete("search");
      }
      return next;
    });
  }, [setSearchParams]);

  const handleLanguageChange = useCallback((language: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      if (language) {
        next.set("language", language);
      } else {
        next.delete("language");
      }
      return next;
    });
  }, [setSearchParams]);

  const handleCategoryToggle = useCallback((category: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      const current = next.get("categories")?.split(",").filter(Boolean) || [];
      const updated = current.includes(category)
        ? current.filter(c => c !== category)
        : [...current, category];

      if (updated.length > 0) {
        next.set("categories", updated.join(","));
      } else {
        next.delete("categories");
      }
      return next;
    });
  }, [setSearchParams]);

  const handleSortChange = useCallback((sort: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      next.set("sort", sort);
      return next;
    });
  }, [setSearchParams]);

  // Handlers
  const handleSettingsOpen = useCallback(() => setIsSettingsModalOpen(true), []);
  const handleNewSnippet = useCallback(() => null, []);

  return (
    <>
      <div className="min-h-screen p-8 bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text">
        <div className="flex items-start justify-between mb-4">
          <StorageHeader isPublicView={true} />
          <UserDropdown />
        </div>

        <SearchAndFilter
          metadata={metadata}
          onSearchChange={handleSearchChange}
          onLanguageChange={handleLanguageChange}
          onCategoryToggle={handleCategoryToggle}
          onSortChange={handleSortChange}
          viewMode={viewMode}
          setViewMode={setViewMode}
          openSettingsModal={handleSettingsOpen}
          openNewSnippetModal={handleNewSnippet}
          hideNewSnippet={true}
          hideRecycleBin={false}
        />

        <PublicSnippetContentArea
          includeCodeInSearch={includeCodeInSearch}
          viewMode={viewMode}
          compactView={compactView}
          showCodePreview={showCodePreview}
          previewLines={previewLines}
          showCategories={showCategories}
          expandCategories={expandCategories}
          showLineNumbers={showLineNumbers}
          isAuthenticated={isAuthenticated}
          onCategoryClick={handleCategoryToggle}
        />
      </div>

      <SettingsModal
        isOpen={isSettingsModalOpen}
        onClose={() => setIsSettingsModalOpen(false)}
        settings={{
          compactView,
          showCodePreview,
          previewLines,
          includeCodeInSearch,
          showCategories,
          expandCategories,
          showLineNumbers,
          theme,
          locale,
        }}
        onSettingsChange={updateSettings}
        isPublicView={true}
      />
    </>
  );
};

export default PublicSnippetStorage;
````

## File: client/src/components/snippets/view/recycle/RecycleSnippetContentArea.tsx
````typescript
import React, { useEffect, useCallback, useMemo, useState, useRef } from "react";
import { useSearchParams, useNavigate } from "react-router-dom";
import { Loader2 } from "lucide-react";
import { useTranslation } from "react-i18next";
import { Snippet } from "../../../../types/snippets";
import { useAuth } from "../../../../hooks/useAuth";
import { useToast } from "../../../../hooks/useToast";
import {
  useSnippetsInfiniteQuery,
  useDeleteSnippet,
  useRestoreSnippet,
  SnippetsQueryKey,
} from "../../../../hooks/useSnippetsQuery";
import SnippetList from "../../list/SnippetList";
import SnippetModal from "../SnippetModal";
import { PageContainer } from "../../../common/layout/PageContainer";

interface RecycleSnippetContentAreaProps {
  includeCodeInSearch: boolean;
  viewMode: "grid" | "list";
  compactView: boolean;
  showCodePreview: boolean;
  previewLines: number;
  showCategories: boolean;
  expandCategories: boolean;
  showLineNumbers: boolean;
  isAuthenticated: boolean;
  onCategoryClick: (category: string) => void;
  onSnippetsChange?: (snippets: Snippet[]) => void;
}

const RecycleSnippetContentArea: React.FC<RecycleSnippetContentAreaProps> = ({
  includeCodeInSearch,
  viewMode,
  compactView,
  showCodePreview,
  previewLines,
  showCategories,
  expandCategories,
  showLineNumbers,
  isAuthenticated,
  onCategoryClick,
  onSnippetsChange,
}) => {
  const { t: translate } = useTranslation('components/snippets/view/recycle');
  const [searchParams] = useSearchParams();
  const { addToast } = useToast();
  const { logout } = useAuth();
  const navigate = useNavigate();
  const [selectedSnippet, setSelectedSnippet] = useState<Snippet | null>(null);
  const observerTarget = useRef<HTMLDivElement>(null);

  const queryFilters: SnippetsQueryKey = useMemo(() => ({
    search: searchParams.get("search") || undefined,
    searchCode: includeCodeInSearch,
    language: searchParams.get("language") || undefined,
    category: searchParams.get("categories") || undefined,
    favorites: false,
    recycled: true,
    sort: searchParams.get("sort") || "newest",
    viewType: "recycle",
  }), [searchParams, includeCodeInSearch]);

  const {
    data,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
    isLoading,
    isError,
    error,
  } = useSnippetsInfiniteQuery(queryFilters);

  const deleteSnippetMutation = useDeleteSnippet();
  const restoreSnippetMutation = useRestoreSnippet();

  const snippets = useMemo(() => {
    return data?.pages.flatMap(page => page.data) ?? [];
  }, [data]);

  const sessionExpiredHandler = useCallback(() => {
    logout();
    addToast(translate('recycleSnippetContentArea.error.sessionExpired'), "error");
  }, []);

  // Notify parent when snippets change (for bulk delete)
  useEffect(() => {
    if (onSnippetsChange) {
      onSnippetsChange(snippets);
    }
  }, [snippets, onSnippetsChange]);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting && hasNextPage && !isFetchingNextPage) {
          fetchNextPage();
        }
      },
      { threshold: 0.1 }
    );

    if (observerTarget.current) {
      observer.observe(observerTarget.current);
    }

    return () => observer.disconnect();
  }, [hasNextPage, isFetchingNextPage, fetchNextPage]);

  useEffect(() => {
    if (isError && error) {
      const err = error as any;
      if (err.status === 401 || err.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(translate('recycleSnippetContentArea.error.loadSnippets'), "error");
      }
    }
  }, [isError, error, logout, addToast]);

  const permanentDeleteSnippet = useCallback(async (id: string) => {
    try {
      await deleteSnippetMutation.mutateAsync(id);
      addToast(translate('recycleSnippetContentArea.success.deleteSnippet'), "success");
    } catch (error: any) {
      console.error("Failed to delete snippet:", error);
      if (error.status === 401 || error.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(translate('recycleSnippetContentArea.error.deleteSnippet'), "error");
      }
    }
  }, [deleteSnippetMutation, addToast, logout]);

  const restoreSnippet = useCallback(async (id: string) => {
    try {
      await restoreSnippetMutation.mutateAsync(id);
      addToast(translate('recycleSnippetContentArea.success.restoreSnippet'), "success");
      navigate("/");
    } catch (error: any) {
      console.error("Failed to restore snippet:", error);
      if (error.status === 401 || error.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(translate('recycleSnippetContentArea.error.restoreSnippet'), "error");
      }
    }
  }, [restoreSnippetMutation, addToast, logout, navigate]);

  if (isLoading) {
    return (
      <PageContainer>
        <div className="flex flex-col items-center justify-center min-h-screen bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text">
          <div className="relative">
            <h1 className="mb-4 text-4xl font-bold">ByteStash</h1>
            <div className="flex items-center justify-center gap-3">
              <Loader2 className="w-5 h-5 text-light-text-secondary dark:text-dark-text-secondary animate-spin" />
              <span className="text-light-text-secondary dark:text-dark-text-secondary">
                {translate('recycleSnippetContentArea.loadingSnippets')}
              </span>
            </div>
          </div>
        </div>
      </PageContainer>
    );
  }

  const filters = {
    categories: searchParams.get("categories")?.split(",").filter(Boolean) || [],
  };

  return (
    <>
      {filters.categories.length > 0 && (
        <div className="flex flex-wrap items-center gap-2 mb-4">
          <span className="text-sm text-light-text-secondary dark:text-dark-text-secondary">
            {translate('recycleSnippetContentArea.filter.byCategories')}:
          </span>
          {filters.categories.map((category, index) => (
            <button
              key={index}
              onClick={() => onCategoryClick(category)}
              className="flex items-center gap-1 px-2 py-1 text-sm rounded-md bg-light-primary/20 dark:bg-dark-primary/20 text-light-primary dark:text-dark-primary hover:bg-light-primary/30 dark:hover:bg-dark-primary/30"
            >
              <span>{category}</span>
              <span className="text-light-text-secondary dark:text-dark-text-secondary hover:text-light-text dark:hover:text-dark-text">
                ×
              </span>
            </button>
          ))}
        </div>
      )}

      <SnippetList
        snippets={snippets}
        viewMode={viewMode}
        onOpen={setSelectedSnippet}
        onDelete={permanentDeleteSnippet}
        onRestore={restoreSnippet}
        onEdit={() => {}}
        onCategoryClick={onCategoryClick}
        onShare={() => {}}
        onDuplicate={() => {}}
        compactView={compactView}
        showCodePreview={showCodePreview}
        previewLines={previewLines}
        showCategories={showCategories}
        expandCategories={expandCategories}
        showLineNumbers={showLineNumbers}
        isPublicView={false}
        isRecycleView={true}
        isAuthenticated={isAuthenticated}
      />

      {hasNextPage && (
        <div ref={observerTarget} className="h-20 flex items-center justify-center">
          {isFetchingNextPage && <Loader2 className="animate-spin" />}
        </div>
      )}

      {
        selectedSnippet && (
          <SnippetModal
            snippet={selectedSnippet}
            isOpen={!!selectedSnippet}
            onClose={() => setSelectedSnippet(null)}
            onDelete={permanentDeleteSnippet}
            onEdit={() => {}}
            onCategoryClick={onCategoryClick}
            showLineNumbers={showLineNumbers}
            isPublicView={false}
            isRecycleView={true}
          />
        )
      }
    </>
  );
};

export default RecycleSnippetContentArea;
````

## File: client/src/components/snippets/view/recycle/RecycleSnippetStorage.tsx
````typescript
import React, { useState, useEffect, useCallback, useRef } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import { ArrowLeftToLine, Trash2 } from "lucide-react";
import { useTranslation } from "react-i18next";
import { useSettings } from "../../../../hooks/useSettings";
import { useToast } from "../../../../hooks/useToast";
import { useAuth } from "../../../../hooks/useAuth";
import { initializeMonaco } from "../../../../utils/language/languageUtils";
import { snippetService } from "../../../../service/snippetService";
import { Snippet } from "../../../../types/snippets";
import { useDeleteSnippet } from "../../../../hooks/useSnippetsQuery";
import SettingsModal from "../../../settings/SettingsModal";
import { SearchAndFilter } from "../../../search/SearchAndFilter";
import { UserDropdown } from "../../../auth/UserDropdown";
import StorageHeader from "../common/StorageHeader";
import { IconButton } from "../../../common/buttons/IconButton";
import { ConfirmationModal } from "../../../common/modals/ConfirmationModal";
import RecycleSnippetContentArea from "./RecycleSnippetContentArea";

const RecycleSnippetStorage: React.FC = () => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/snippets/view/recycle');
  // URL-based filter state
  const [, setSearchParams] = useSearchParams();

  // Settings
  const {
    viewMode,
    setViewMode,
    compactView,
    showCodePreview,
    previewLines,
    includeCodeInSearch,
    updateSettings,
    showCategories,
    expandCategories,
    showLineNumbers,
    theme,
    locale,
  } = useSettings();

  const { isAuthenticated, logout } = useAuth();
  const { addToast } = useToast();
  const navigate = useNavigate();

  // Metadata - loaded once
  const [metadata, setMetadata] = useState<{ categories: string[]; languages: string[] }>({
    categories: [],
    languages: []
  });

  // UI state
  const [isSettingsModalOpen, setIsSettingsModalOpen] = useState(false);
  const [isPermanentDeleteAllModalOpen, setIsPermanentDeleteAllModalOpen] = useState(false);

  // Ref to track all snippets for bulk delete
  const snippetsRef = useRef<Snippet[]>([]);

  // React Query mutation
  const deleteSnippetMutation = useDeleteSnippet();

  useEffect(() => {
    initializeMonaco();
  }, []);

  // Load metadata once
  useEffect(() => {
    const fetchMetadata = async () => {
      try {
        const data = await snippetService.getSnippetsMetadata();
        setMetadata(data);
      } catch (error) {
        console.error("Failed to fetch metadata:", error);
      }
    };
    fetchMetadata();
  }, []);
  
  const sessionExpiredHandler = useCallback(() => {
    logout();
    addToast(translate('recycleSnippetStorage.error.sessionExpired'), "error");
  }, []);

  // Snippet operations
  const permanentDeleteAllSnippets = useCallback(async () => {
    try {
      await Promise.all(snippetsRef.current.map((s) => deleteSnippetMutation.mutateAsync(s.id)));
      addToast(translate('recycleSnippetStorage.success.clear'), "success");
    } catch (error: any) {
      console.error("Failed to clear all recycle bin snippets:", error);
      if (error.status === 401 || error.status === 403) {
        sessionExpiredHandler();
      } else {
        addToast(translate('recycleSnippetStorage.error.clear'), "error");
      }
    }
  }, [deleteSnippetMutation, addToast, logout]);

  // URL update handlers - stable callbacks
  const handleSearchChange = useCallback((search: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      const trimmedSearch = search.trim();
      if (trimmedSearch) {
        next.set("search", trimmedSearch);
      } else {
        next.delete("search");
      }
      return next;
    });
  }, [setSearchParams]);

  const handleLanguageChange = useCallback((language: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      if (language) {
        next.set("language", language);
      } else {
        next.delete("language");
      }
      return next;
    });
  }, [setSearchParams]);

  const handleCategoryToggle = useCallback((category: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      const current = next.get("categories")?.split(",").filter(Boolean) || [];
      const updated = current.includes(category)
        ? current.filter(c => c !== category)
        : [...current, category];

      if (updated.length > 0) {
        next.set("categories", updated.join(","));
      } else {
        next.delete("categories");
      }
      return next;
    });
  }, [setSearchParams]);

  const handleSortChange = useCallback((sort: string) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      next.set("sort", sort);
      return next;
    });
  }, [setSearchParams]);

  // Handlers
  const handleSnippetsChange = useCallback((snippets: Snippet[]) => {
    snippetsRef.current = snippets;
  }, []);

  const openPermanentDeleteAllModal = useCallback(() => {
    if (snippetsRef.current.length === 0) {
      addToast(translate('recycleSnippetStorage.info.noSnippets'), "info");
      return;
    }
    setIsPermanentDeleteAllModalOpen(true);
  }, [addToast]);

  const handlePermanentDeleteAllConfirm = useCallback(async () => {
    setIsPermanentDeleteAllModalOpen(false);
    await permanentDeleteAllSnippets();
  }, [permanentDeleteAllSnippets]);

  const handleSettingsOpen = useCallback(() => setIsSettingsModalOpen(true), []);
  const handleNewSnippet = useCallback(() => null, []);

  return (
    <>
      <div className="min-h-screen p-8 bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text">
        <div className="flex items-start justify-between mb-4">
          <StorageHeader isPublicView={false} />
          <UserDropdown />
        </div>

        <SearchAndFilter
          metadata={metadata}
          onSearchChange={handleSearchChange}
          onLanguageChange={handleLanguageChange}
          onCategoryToggle={handleCategoryToggle}
          onSortChange={handleSortChange}
          viewMode={viewMode}
          setViewMode={setViewMode}
          openSettingsModal={handleSettingsOpen}
          openNewSnippetModal={handleNewSnippet}
          hideNewSnippet={true}
          hideRecycleBin={true}
        />

        <div className="mb-6 space-y-3">
          <button
            onClick={() => navigate("/")}
            className="flex items-center gap-2 text-sm font-medium text-light-text-primary dark:text-dark-text-secondary hover:underline"
          >
            <ArrowLeftToLine size={18} /> {translate('recycleSnippetStorage.backToSnippets')}
          </button>

          <div className="flex items-center justify-between text-sm text-light-text-primary dark:text-dark-text-secondary">
            <div>
              <h1 className="text-2xl font-semibold text-light-text-primary dark:text-dark-text-secondary">{translate('recycleSnippetStorage.recycleBin')}</h1>
              <p className="text-sm">
                {translate('recycleSnippetStorage.description')}
              </p>
            </div>

            <IconButton
              icon={<Trash2 size={18} />}
              label={t('action.clearAll')}
              showLabel={true}
              variant="danger"
              size="sm"
              onClick={openPermanentDeleteAllModal}
            />
          </div>
        </div>

        <RecycleSnippetContentArea
          includeCodeInSearch={includeCodeInSearch}
          viewMode={viewMode}
          compactView={compactView}
          showCodePreview={showCodePreview}
          previewLines={previewLines}
          showCategories={showCategories}
          expandCategories={expandCategories}
          showLineNumbers={showLineNumbers}
          isAuthenticated={isAuthenticated}
          onCategoryClick={handleCategoryToggle}
          onSnippetsChange={handleSnippetsChange}
        />
      </div>

      <SettingsModal
        isOpen={isSettingsModalOpen}
        onClose={() => setIsSettingsModalOpen(false)}
        settings={{
          compactView,
          showCodePreview,
          previewLines,
          includeCodeInSearch,
          showCategories,
          expandCategories,
          showLineNumbers,
          theme,
          locale,
        }}
        onSettingsChange={updateSettings}
        isPublicView={true}
      />

      <ConfirmationModal
        isOpen={isPermanentDeleteAllModalOpen}
        onClose={() => setIsPermanentDeleteAllModalOpen(false)}
        onConfirm={handlePermanentDeleteAllConfirm}
        title={translate('recycleSnippetStorage.confirmationModal.title')}
        message={translate('recycleSnippetStorage.confirmationModal.message')}
        confirmLabel={t('action.delete')}
        cancelLabel={t('action.cancel')}
        variant="danger"
      />
    </>
  );
};

export default RecycleSnippetStorage;
````

## File: client/src/components/snippets/view/FullCodeView.tsx
````typescript
import React, { useState, useMemo, useRef, useEffect } from "react";
import { Clock, PanelLeftClose, PanelLeftOpen, Search, ListFilter, Check } from "lucide-react";
import { formatDistanceToNow } from "date-fns";
import MarkdownRenderer from "../../common/markdown/MarkdownRenderer";
import { useTranslation } from "react-i18next";
import { Snippet } from "../../../types/snippets";
import CategoryList from "../../categories/CategoryList";
import {
  getLanguageLabel,
  getUniqueLanguages,
  getFullFileName,
  getFileIcon,
} from "../../../utils/language/languageUtils";
import { FullCodeBlock } from "../../editor/FullCodeBlock";
import DownloadButton from "../../common/buttons/DownloadButton";
import DownloadArchiveButton from "../../common/buttons/DownloadArchiveButton";

interface FullCodeViewProps {
  showTitle?: boolean;
  snippet: Snippet;
  onCategoryClick?: (category: string) => void;
  showLineNumbers?: boolean;
  className?: string;
  isModal?: boolean;
  isPublicView?: boolean;
}

export const FullCodeView: React.FC<FullCodeViewProps> = ({
  showTitle = true,
  snippet,
  onCategoryClick,
  showLineNumbers = true,
  className = "",
  isModal = false,
  isPublicView = false,
}) => {
  const { t: translate } = useTranslation('components/snippets/view/all');
  const [activeFragmentIndex, setActiveFragmentIndex] = useState(0);
  const [searchQuery, setSearchQuery] = useState("");
  const [hiddenExtensions, setHiddenExtensions] = useState<Set<string>>(new Set());
  const [isFilterOpen, setIsFilterOpen] = useState(false);
  const filterRef = useRef<HTMLDivElement>(null);
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (filterRef.current && !filterRef.current.contains(event.target as Node)) {
        setIsFilterOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  const extensionStats = useMemo(() => {
    const counts: Record<string, number> = {};
    let noExtCount = 0;
    snippet.fragments.forEach((f) => {
      const fullName = getFullFileName(f.file_name, f.language);
      if (fullName.includes('.')) {
        const ext = '.' + fullName.split('.').pop()?.toLowerCase();
        counts[ext] = (counts[ext] || 0) + 1;
      } else {
        noExtCount++;
      }
    });
    const result = Object.entries(counts).map(([ext, count]) => ({ ext, count })).sort((a, b) => a.ext.localeCompare(b.ext));
    if (noExtCount > 0) {
      result.push({ ext: '__no_ext__', count: noExtCount });
    }
    return result;
  }, [snippet.fragments]);

  const toggleExtension = (ext: string) => {
    setHiddenExtensions(prev => {
      const next = new Set(prev);
      if (next.has(ext)) {
        next.delete(ext);
      } else {
        next.add(ext);
      }
      return next;
    });
  };

  const filteredFragments = useMemo(() => {
    return snippet.fragments.filter((f) => {
      const fullName = getFullFileName(f.file_name, f.language).toLowerCase();
      const matchesSearch = !searchQuery.trim() || fullName.includes(searchQuery.toLowerCase());
      
      let ext = '__no_ext__';
      if (fullName.includes('.')) {
        ext = '.' + fullName.split('.').pop()?.toLowerCase();
      }
      const matchesExt = !hiddenExtensions.has(ext);
      return matchesSearch && matchesExt;
    });
  }, [snippet.fragments, searchQuery, hiddenExtensions]);

  const handleCategoryClick = (e: React.MouseEvent, category: string) => {
    e.preventDefault();
    onCategoryClick?.(category);
  };

  const getRelativeUpdateTime = (updatedAt: string): string => {
    const defaultUpdateTime = translate('defaultUpdateTime');

    try {
      if (!updatedAt) {
        return defaultUpdateTime;
      }
      const updateDate = new Date(updatedAt);
      if (isNaN(updateDate.getTime())) {
        return defaultUpdateTime;
      }
      return formatDistanceToNow(updateDate);
    } catch (error) {
      console.error("Error formatting update date:", error);
      return defaultUpdateTime;
    }
  };

  const containerClasses = isModal
    ? `overflow-hidden ${className}`
    : `bg-light-surface dark:bg-dark-surface rounded-lg overflow-hidden ${className}`;

  return (
    <div className={containerClasses}>
      {/* Status Bar with Update Time */}
      {!isModal && snippet.updated_at && (
        <div className="bg-light-hover/50 dark:bg-dark-hover/50 px-3 py-1.5 text-xs flex items-center justify-end">
          <div className="flex items-center gap-1 text-light-text-secondary dark:text-dark-text-secondary">
            <Clock size={12} />
            <span>{translate('fullCodeView.dateTimeAgo', { dateTime: getRelativeUpdateTime(snippet.updated_at) })}</span>
          </div>
        </div>
      )}

      <div className={isModal ? "p-2 pt-0" : "p-4 pt-0"}>
        {/* Header Section */}
        <div>
          {showTitle && (
            <h1
              className={`text-xl md:text-2xl font-bold text-light-text dark:text-dark-text ${
                isModal ? "" : "mt-2"
              }`}
            >
              {snippet.title}
            </h1>
          )}

          {/* Language Info */}
          {getUniqueLanguages(snippet.fragments) && (
            <div
              className={`flex items-center gap-1 text-sm text-light-text-secondary dark:text-dark-text-secondary mt-${
                showTitle ? "2" : "0"
              }`}
            >
              <div className="shrink-0 w-3.5 h-3.5 flex items-center justify-center">
                {getFileIcon(snippet.fragments[0]?.file_name || "", snippet.fragments[0]?.language, "w-full h-full text-light-text-secondary dark:text-dark-text-secondary")}
              </div>
              <span>{getUniqueLanguages(snippet.fragments)}</span>
            </div>
          )}

          {/* Description */}
          <div className="mt-3 text-sm text-light-text dark:text-dark-text">
            <MarkdownRenderer className={`markdown prose dark:prose-invert max-w-none`}>
              {snippet.description || translate('fullCodeView.defaultDescription')}
            </MarkdownRenderer>
          </div>

          {/* Categories */}
          <div className="mt-3">
            <CategoryList
              categories={snippet.categories}
              onCategoryClick={handleCategoryClick}
              variant="clickable"
              showAll={true}
            />
          </div>
        </div>

        {/* Download Archive Button */}
        {snippet.fragments.length > 1 && (
          <div className="flex justify-end mt-4">
            <DownloadArchiveButton
              snippetTitle={snippet.title}
              fragments={snippet.fragments}
              variant="secondary"
              size="sm"
            />
          </div>
        )}

        {/* Code Fragments */}
        <div className="mt-4">
          {snippet.fragments.length > 1 ? (
            <div className="flex flex-col md:flex-row border border-light-border dark:border-dark-border rounded-lg overflow-hidden bg-light-surface dark:bg-dark-surface shadow-sm">
              {/* Sidebar File Tree */}
              {isSidebarOpen && (
                <div className="w-full md:w-64 shrink-0 border-b md:border-b-0 md:border-r border-light-border dark:border-dark-border flex flex-col bg-light-bg/50 dark:bg-dark-bg/50 transition-all duration-300">
                  <div className="px-3 py-2 border-b border-light-border dark:border-dark-border flex flex-col gap-2 bg-light-hover/30 dark:bg-dark-hover/30">
                    <div className="flex items-center justify-between text-xs font-semibold text-light-text-secondary dark:text-dark-text-secondary">
                      <span>{snippet.fragments.length} {translate('files')}</span>
                      <button 
                        onClick={() => setIsSidebarOpen(false)}
                        className="p-1 hover:bg-light-hover dark:hover:bg-dark-hover rounded transition-colors"
                        title={translate('collapseSidebar')}
                      >
                        <PanelLeftClose size={14} />
                      </button>
                    </div>
                    <div className="flex items-center gap-2">
                      <div className="relative flex-1">
                        <Search size={12} className="absolute left-2 top-1/2 -translate-y-1/2 text-light-text-secondary dark:text-dark-text-secondary" />
                        <input 
                          type="text" 
                          value={searchQuery}
                          onChange={(e) => setSearchQuery(e.target.value)}
                          placeholder={translate('searchFiles')}
                          className="w-full pl-6 pr-2 py-1 text-xs bg-light-surface dark:bg-dark-surface border border-light-border dark:border-dark-border rounded focus:outline-none focus:border-light-primary dark:focus:border-dark-primary text-light-text dark:text-dark-text placeholder-light-text-secondary/50 dark:placeholder-dark-text-secondary/50"
                        />
                      </div>
                      {extensionStats.length > 0 && (
                        <div className="relative shrink-0" ref={filterRef}>
                          <button
                            type="button"
                            onClick={() => setIsFilterOpen(!isFilterOpen)}
                            className={`p-1 rounded border border-light-border dark:border-dark-border hover:bg-light-hover dark:hover:bg-dark-hover transition-colors flex items-center justify-center h-[26px] w-[26px] ${isFilterOpen ? 'bg-light-hover dark:bg-dark-hover' : 'bg-light-surface dark:bg-dark-surface'}`}
                            title={translate('filterFiles')}
                          >
                            <ListFilter size={14} className="text-light-text-secondary dark:text-dark-text-secondary" />
                          </button>

                          {isFilterOpen && (
                            <div className="absolute left-0 left-auto md:left-full md:ml-1 md:-mt-8 right-0 md:right-auto top-full mt-1 w-56 bg-light-surface dark:bg-dark-surface border border-light-border dark:border-dark-border rounded-lg shadow-xl z-50 py-2 flex flex-col">
                              <div className="px-3 pb-2 text-xs font-semibold text-light-text-secondary dark:text-dark-text-secondary border-b border-light-border dark:border-dark-border mb-1">
                                {translate('fileExtensions')}
                              </div>
                              <div className="max-h-60 overflow-y-auto custom-scrollbar">
                                {extensionStats.map(({ ext, count }) => {
                                  const checked = !hiddenExtensions.has(ext);
                                  return (
                                    <button
                                      type="button"
                                      key={ext}
                                      onClick={() => toggleExtension(ext)}
                                      className="w-full px-3 py-1.5 flex items-center justify-between hover:bg-light-hover dark:hover:bg-dark-hover text-sm text-light-text dark:text-dark-text transition-colors group"
                                    >
                                      <div className="flex items-center gap-2">
                                        <div className="w-4 h-4 flex items-center justify-center shrink-0">
                                          <Check size={14} className={`transition-opacity ${checked ? 'opacity-100 text-light-primary dark:text-dark-primary' : 'opacity-0'}`} />
                                        </div>
                                        <span className="truncate max-w-[130px] text-left">{ext === '__no_ext__' ? translate('noExtension') : ext}</span>
                                      </div>
                                      <span className="text-xs bg-light-bg dark:bg-dark-bg px-1.5 py-0.5 rounded-full text-light-text-secondary dark:text-dark-text-secondary group-hover:bg-light-surface dark:group-hover:bg-dark-surface">
                                        {count}
                                      </span>
                                    </button>
                                  );
                                })}
                              </div>
                            </div>
                          )}
                        </div>
                      )}
                    </div>
                  </div>
                  <div className="overflow-y-auto max-h-[500px]">
                    {filteredFragments.map((fragment) => {
                      const originalIndex = snippet.fragments.findIndex(f => f.id === fragment.id);
                      const displayIndex = originalIndex >= 0 ? originalIndex : snippet.fragments.indexOf(fragment);
                      return (
                        <button
                          key={fragment.id || displayIndex}
                          onClick={() => setActiveFragmentIndex(displayIndex)}
                          className={`w-full text-left px-3 py-2 text-sm flex items-center gap-2 transition-colors ${
                            activeFragmentIndex === displayIndex
                              ? "bg-light-hover dark:bg-dark-hover text-light-text dark:text-dark-text border-l-2 border-light-primary dark:border-dark-primary"
                              : "text-light-text-secondary dark:text-dark-text-secondary hover:bg-light-hover/50 dark:hover:bg-dark-hover/50 border-l-2 border-transparent"
                          }`}
                        >
                          <div className="shrink-0 w-3.5 h-3.5 flex items-center justify-center">
                            {getFileIcon(fragment.file_name, fragment.language, "w-full h-full text-light-text-secondary dark:text-dark-text-secondary")}
                          </div>
                          <span className="truncate">{getFullFileName(fragment.file_name, fragment.language)}</span>
                        </button>
                      );
                    })}
                    {filteredFragments.length === 0 && (
                      <div className="px-3 py-4 text-xs text-center text-light-text-secondary dark:text-dark-text-secondary">
                        {translate('noFilesFound')}
                      </div>
                    )}
                  </div>
                </div>
              )}

              {/* Main Content Area */}
              <div className="flex-1 min-w-0 bg-light-bg dark:bg-dark-bg">
                {(() => {
                  const fragment = snippet.fragments[activeFragmentIndex] || snippet.fragments[0];
                  return (
                    <div className="flex flex-col h-full">
                      {/* File Header */}
                      <div className="flex items-center justify-between px-3 h-10 border-b border-light-border dark:border-dark-border bg-light-surface dark:bg-dark-surface shrink-0">
                        <div className="flex items-center flex-1 min-w-0 gap-2">
                          {!isSidebarOpen && (
                            <button
                              onClick={() => setIsSidebarOpen(true)}
                              className="p-1.5 -ml-1.5 mr-1 hover:bg-light-hover dark:hover:bg-dark-hover rounded transition-colors text-light-text-secondary dark:text-dark-text-secondary flex items-center justify-center"
                              title={translate('expandSidebar')}
                            >
                              <PanelLeftOpen size={16} />
                            </button>
                          )}
                          <div className="shrink-0 w-3.5 h-3.5 flex items-center justify-center">
                            {getFileIcon(fragment.file_name, fragment.language, "w-full h-full text-light-text-secondary dark:text-dark-text-secondary")}
                          </div>
                          <span className="truncate font-medium text-sm text-light-text dark:text-dark-text">
                            {getFullFileName(fragment.file_name, fragment.language)}
                          </span>
                        </div>
                        <div className="flex items-center gap-2">
                          <span className="text-xs text-light-text-secondary dark:text-dark-text-secondary">
                            {getLanguageLabel(fragment.language)}
                          </span>
                          <DownloadButton
                            code={fragment.code}
                            fileName={fragment.file_name}
                            language={fragment.language}
                            className="scale-90"
                          />
                        </div>
                      </div>

                      {/* Code Block */}
                      <div className="p-0 border-t-0 flex-1 overflow-auto">
                        <FullCodeBlock
                          code={fragment.code}
                          language={fragment.language}
                          showLineNumbers={showLineNumbers}
                          isPublicView={isPublicView}
                          snippetId={snippet.id}
                          fragmentId={fragment.id}
                        />
                      </div>
                    </div>
                  );
                })()}
              </div>
            </div>
          ) : (
            <div className="space-y-4">
              {snippet.fragments.map((fragment, index) => (
                <div key={index}>
                  {/* File Header */}
                  <div className="flex items-center justify-between px-3 mb-1 text-xs rounded text-light-text-secondary dark:text-dark-text-secondary bg-light-hover/50 dark:bg-dark-hover/50 h-7">
                    <div className="flex items-center flex-1 min-w-0 gap-1">
                      <div className="shrink-0 w-3 h-3 flex items-center justify-center">
                        {getFileIcon(fragment.file_name, fragment.language, "w-full h-full text-light-text-secondary dark:text-dark-text-secondary")}
                      </div>
                      <span className="truncate">{getFullFileName(fragment.file_name, fragment.language)}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className="text-light-text-secondary dark:text-dark-text-secondary">
                        {getLanguageLabel(fragment.language)}
                      </span>
                      <DownloadButton
                        code={fragment.code}
                        fileName={fragment.file_name}
                        language={fragment.language}
                        className="scale-75"
                      />
                    </div>
                  </div>

                  {/* Code Block */}
                  <FullCodeBlock
                    code={fragment.code}
                    language={fragment.language}
                    showLineNumbers={showLineNumbers}
                    isPublicView={isPublicView}
                    snippetId={snippet.id}
                    fragmentId={fragment.id}
                  />
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default FullCodeView;
````

## File: client/src/components/snippets/view/SnippetModal.tsx
````typescript
import React, { useState, useCallback } from "react";
import { useTranslation } from "react-i18next";
import { Snippet } from "../../../types/snippets";
import { ConfirmationModal } from "../../common/modals/ConfirmationModal";
import Modal from "../../common/modals/Modal";
import { FullCodeView } from "./FullCodeView";

export interface SnippetModalProps {
  snippet: Snippet;
  isOpen: boolean;
  onClose: () => void;
  onEdit?: (snippet: Snippet) => void;
  onDelete?: (id: string) => Promise<void>;
  onCategoryClick: (category: string) => void;
  showLineNumbers: boolean;
  isPublicView: boolean;
  isRecycleView?: boolean;
}

const SnippetModal: React.FC<SnippetModalProps> = ({
  snippet,
  isOpen,
  onClose,
  onEdit,
  onDelete,
  onCategoryClick,
  showLineNumbers,
  isPublicView,
  isRecycleView
}) => {
  const { t } = useTranslation();
  const { t: translate } = useTranslation('components/snippets/view/all');

  const handleCategoryClick = (e: React.MouseEvent, category: string) => {
    e.preventDefault();
    onCategoryClick(category);
  };

  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [snippetToDelete, setSnippetToDelete] = useState<Snippet | null>(null);

  const handleDeleteSnippet = useCallback(() => {
    setSnippetToDelete(snippet);
    setIsDeleteModalOpen(true);
  }, [snippet]);

  const confirmDeleteSnippet = useCallback(async () => {
    if (snippetToDelete && onDelete) {
      await onDelete(snippetToDelete.id);
      onClose();
    }
    setSnippetToDelete(null);
    setIsDeleteModalOpen(false);
  }, [snippetToDelete, onDelete, onClose]);

  const cancelDeleteSnippet = useCallback(() => {
    setIsDeleteModalOpen(false);
  }, []);

  const handleEditSnippet = useCallback(() => {
    if (snippet && onEdit) {
      onEdit(snippet);
      onClose();
    }
  }, [snippet, onEdit, onClose]);

  return (
    <>
      <Modal
        isOpen={isOpen}
        onClose={onClose}
        onEdit={handleEditSnippet}
        onDelete={handleDeleteSnippet}
        title={
          <h2 className="text-2xl font-bold text-light-text dark:text-dark-text">{snippet.title}</h2>
        }
        expandable={true}
      >
        <FullCodeView
          showTitle={false}
          snippet={snippet}
          showLineNumbers={showLineNumbers}
          onCategoryClick={() => handleCategoryClick}
          isModal={true}
          isPublicView={isPublicView}
        />
      </Modal>
      <ConfirmationModal
        isOpen={isDeleteModalOpen}
        onClose={cancelDeleteSnippet}
        onConfirm={confirmDeleteSnippet}
        title={
          isRecycleView
            ? translate('snippetModal.confirmationModal.title.isRecycleView.true')
            : translate('snippetModal.confirmationModal.title.isRecycleView.false')
        }
        message={
          isRecycleView
            ? translate('snippetModal.confirmationModal.message.isRecycleView.true', { title: snippet.title })
            : translate('snippetModal.confirmationModal.message.isRecycleView.false', { title: snippet.title })
        }
        confirmLabel={
          isRecycleView
            ? translate('snippetModal.confirmationModal.confirmLabel.isRecycleView.true')
            : translate('snippetModal.confirmationModal.confirmLabel.isRecycleView.false')
        }
        cancelLabel={t('action.cancel')}
        variant="danger"
      />
    </>
  );
};

export default SnippetModal;
````

## File: client/src/components/snippets/view/SnippetPage.tsx
````typescript
import React from 'react';
import AuthAwareSnippetView from './common/AuthAwareSnippetPage';

const SnippetPage: React.FC = () => {
  return <AuthAwareSnippetView />;
};

export default SnippetPage;
````

## File: client/src/components/snippets/view/SnippetStorage.tsx
````typescript
import React from "react";
import BaseSnippetStorage from "./common/BaseSnippetStorage";

const SnippetStorage: React.FC = () => {
  return <BaseSnippetStorage />;
};

export default SnippetStorage;
````

## File: client/src/components/utils/Admonition.tsx
````typescript
import React from "react";
import {
  Info,
  Lightbulb,
  MessageSquareWarning,
  AlertTriangle,
  AlertOctagon,
} from "lucide-react";
import { useTranslation } from "react-i18next";

type AdmonitionType = "NOTE" | "TIP" | "IMPORTANT" | "WARNING" | "CAUTION";
type AdmonitionValue = {
  title: string;
  container: string;
  bar: string;
  titleColor: string;
  iconColor: string;
  Icon: React.ComponentType<{ className?: string }>;
};

const Admonition: React.FC<{ type: string; children: React.ReactNode }> = ({
  type,
  children,
}) => {
  const { t: translate } = useTranslation('components/utils');

  const key = (type?.toUpperCase() as AdmonitionType) || translate('config.note').toUpperCase();
  const config: Record<AdmonitionType, AdmonitionValue> = {
    NOTE: {
      title: translate('config.note'),
      container: "bg-blue-500/10 dark:bg-blue-500/10",
      bar: "bg-blue-500",
      titleColor: "text-blue-600 dark:text-blue-400",
      iconColor: "text-blue-500",
      Icon: Info,
    },
    TIP: {
      title: translate('config.tip'),
      container: "bg-green-500/10 dark:bg-green-500/10",
      bar: "bg-green-500",
      titleColor: "text-green-600 dark:text-green-400",
      iconColor: "text-green-500",
      Icon: Lightbulb,
    },
    IMPORTANT: {
      title: translate('config.important'),
      container: "bg-purple-500/10 dark:bg-purple-500/10",
      bar: "bg-purple-500",
      titleColor: "text-purple-600 dark:text-purple-400",
      iconColor: "text-purple-500",
      Icon: MessageSquareWarning,
    },
    WARNING: {
      title: translate('config.warning'),
      container: "bg-amber-500/10 dark:bg-amber-500/10",
      bar: "bg-amber-500",
      titleColor: "text-amber-600 dark:text-amber-400",
      iconColor: "text-amber-500",
      Icon: AlertTriangle,
    },
    CAUTION: {
      title: translate('config.caution'),
      container: "bg-red-500/10 dark:bg-red-500/10",
      bar: "bg-red-500",
      titleColor: "text-red-600 dark:text-red-400",
      iconColor: "text-red-500",
      Icon: AlertOctagon,
    },
  };
  const cfg = config[key] || config.NOTE;

  return (
    <div className={`not-prose my-3 relative overflow-hidden ${cfg.container}`}>
      <div className="flex items-stretch">
        <span
          aria-hidden
          className={`block w-1 ${cfg.bar}`}
          style={{ minHeight: "100%", height: "auto" }}
        />
        <div className="flex items-start flex-1 gap-2 p-2">
          <cfg.Icon className={`mt-0.5 h-5 w-5 ${cfg.iconColor}`} />
          <div className="flex-1">
            <div className={`font-semibold ${cfg.titleColor}`}>{cfg.title}</div>
            {children && (
              <div className="mt-1 text-sm leading-relaxed">{children}</div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Admonition;
````

## File: client/src/constants/api.ts
````typescript
export const API_ENDPOINTS = {
  AUTH: '/api/auth',
  SNIPPETS: '/api/snippets',
  SHARE: '/api/share',
  PUBLIC: '/api/public/snippets'
} as const;

export const API_METHODS = {
  GET: 'GET',
  POST: 'POST',
  PUT: 'PUT',
  DELETE: 'DELETE'
} as const;
````

## File: client/src/constants/events.ts
````typescript
export const EVENTS = {
  AUTH_ERROR: 'bytestash:auth_error',
  SNIPPET_UPDATED: 'bytestash:snippet_updated',
  SNIPPET_DELETED: 'bytestash:snippet_deleted',
  SHARE_CREATED: 'bytestash:share_created',
  SHARE_DELETED: 'bytestash:share_deleted',
} as const;

export const createCustomEvent = (eventName: string) => new CustomEvent(eventName);
````

## File: client/src/constants/routes.ts
````typescript
export const ROUTES = {
  HOME: '/',
  SHARED_SNIPPET: '/s/:shareId',
  SNIPPET: '/snippets/:snippetId',
  SNIPPETS: '/snippets',
  LOGIN: '/login',
  REGISTER: '/register',
  PUBLIC_SNIPPETS: '/public/snippets',
  AUTH_CALLBACK: '/auth/callback',
  LOGOUT_CALLBACK: '/auth/logout_callback',
  EMBED: '/embed/:shareId',
  RECYCLE: '/recycle/snippets',
  ADMIN: '/admin',
  ADMIN_DASHBOARD: '/admin/dashboard',
  ADMIN_USERS: '/admin/users',
  ADMIN_SNIPPETS: '/admin/snippets',
  ADMIN_API_KEYS: '/admin/api-keys',
  ADMIN_SHARES: '/admin/shares',
} as const;
````

## File: client/src/constants/settings.ts
````typescript
export const DEFAULT_SETTINGS = {
  viewMode: 'grid',
  compactView: false,
  showCodePreview: true,
  previewLines: 4,
  includeCodeInSearch: false,
  showCategories: true,
  expandCategories: false,
  showLineNumbers: true,
  theme: 'system',
} as const;

export const APP_VERSION = '1.5.12';
````

## File: client/src/contexts/AuthContext.tsx
````typescript
import React, { createContext, useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { useToast } from '../hooks/useToast';
import { EVENTS } from '../constants/events';
import { anonymous, getAuthConfig, verifyToken } from '../utils/api/auth';
import type { User, AuthConfig } from '../types/user';

interface AuthContextType {
  isAuthenticated: boolean;
  isLoading: boolean;
  user: User | null;
  authConfig: AuthConfig | null;
  login: (token: string, user: User | null) => void;
  logout: () => void;
  refreshAuthConfig: () => Promise<void>;
}

export const AuthContext = createContext<AuthContextType | undefined>(undefined);

export interface AuthProviderProps {
  children: React.ReactNode;
}

export const AuthProvider: React.FC<AuthProviderProps> = ({ children }) => {
  const { t: translate } = useTranslation('components/auth');
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState<User | null>(null);
  const [authConfig, setAuthConfig] = useState<AuthConfig | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const { addToast } = useToast();

  const defaultCookie = 'bytestash_token=; path=/; max-age=0';
  const defaultCookieTime = 86400;

  useEffect(() => {
    const handleAuthError = () => {
      localStorage.removeItem('token');
      document.cookie = defaultCookie;
      setIsAuthenticated(false);
      setUser(null);
    };

    window.addEventListener(EVENTS.AUTH_ERROR, handleAuthError);
    return () => window.removeEventListener(EVENTS.AUTH_ERROR, handleAuthError);
  }, [addToast]);

  useEffect(() => {
    const initializeAuth = async () => {
      try {
        const config = await getAuthConfig();
        setAuthConfig(config);

        if (config.disableAccounts) {
          try {
            const response = await anonymous();
            if (response.token && response.user) {
              login(response.token, response.user);
            }
          } catch (error) {
            console.error('Failed to create anonymous session:', error);
            addToast(translate('authProvider.error.failedCreateAnonymousSession'), 'error');
          }
        } else {
          const token = localStorage.getItem('token');
          if (token) {
            const response = await verifyToken();
            if (response.valid && response.user) {
              setIsAuthenticated(true);
              setUser(response.user);
            } else {
              localStorage.removeItem('token');
              document.cookie = defaultCookie;
            }
          }
        }
      } catch (error) {
        console.error('Auth initialization error:', error);
        localStorage.removeItem('token');
        document.cookie = defaultCookie;
      } finally {
        setIsLoading(false);
      }
    };

    initializeAuth();
  }, []);

  const login = (token: string, userData: User | null) => {
    localStorage.setItem('token', token);
    // Also set as httpOnly cookie for direct browser API access
    document.cookie = `bytestash_token=${token}; path=/; max-age=${defaultCookieTime}; SameSite=Lax`;
    setIsAuthenticated(true);
    setUser(userData);
  };

  const logout = () => {
    localStorage.removeItem('token');
    // Clear the cookie as well
    document.cookie = defaultCookie;
    setIsAuthenticated(false);
    setUser(null);
    addToast(translate('authProvider.info.logoutSuccess'), 'info');
  };

  const refreshAuthConfig = async () => {
    try {
      const config = await getAuthConfig();
      setAuthConfig(config);
    } catch (error) {
      console.error('Error refreshing auth config:', error);
    }
  };

  return (
    <AuthContext.Provider 
      value={{ 
        isAuthenticated, 
        isLoading, 
        user,
        authConfig,
        login, 
        logout,
        refreshAuthConfig
      }}
    >
      {children}
    </AuthContext.Provider>
  );
};
````

## File: client/src/contexts/ThemeContext.tsx
````typescript
import React, { createContext, useContext, useEffect, useState } from 'react';

type Theme = 'light' | 'dark' | 'system';

interface ThemeContextType {
  theme: Theme;
  toggleTheme: () => void;
  setTheme: (theme: Theme) => void;
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export const ThemeProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [theme, setThemeState] = useState<Theme>(() => {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'light' || savedTheme === 'dark' || savedTheme === 'system') {
      return savedTheme;
    }
    return 'system';
  });

  useEffect(() => {
    const root = window.document.documentElement;
    const effectiveTheme = theme === 'system'
      ? window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
      : theme;
      
    if (effectiveTheme === 'dark') {
      root.classList.add('dark');
    } else {
      root.classList.remove('dark');
    }
    localStorage.setItem('theme', theme);
  }, [theme]);

  useEffect(() => {
    if (theme === 'system') {
      const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
      const handleChange = () => {
        const root = window.document.documentElement;
        if (mediaQuery.matches) {
          root.classList.add('dark');
        } else {
          root.classList.remove('dark');
        }
      };

      mediaQuery.addEventListener('change', handleChange);
      return () => mediaQuery.removeEventListener('change', handleChange);
    }
  }, [theme]);

  const toggleTheme = () => {
    setThemeState(prev => prev === 'light' ? 'dark' : 'light');
  };

  const setTheme = (newTheme: Theme) => {
    setThemeState(newTheme);
  };

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme, setTheme }}>
      {children}
    </ThemeContext.Provider>
  );
};

export const useTheme = () => {
  const context = useContext(ThemeContext);
  if (context === undefined) {
    throw new Error('useTheme must be used within a ThemeProvider');
  }
  return context;
};
````

## File: client/src/contexts/ToastContext.tsx
````typescript
import React, { createContext, useState, useCallback } from 'react';
import { X, Info, CheckCircle, AlertTriangle, AlertCircle } from 'lucide-react';

export type ToastType = 'info' | 'success' | 'error' | 'warning';

export interface Toast {
  id: number;
  message: string;
  type: ToastType;
  duration: number | null;
}

export interface ToastContextType {
  addToast: (message: string, type?: ToastType, duration?: number | null) => void;
  removeToast: (id: number) => void;
}

export const ToastContext = createContext<ToastContextType | undefined>(undefined);

interface ToastProps extends Toast {
  onClose: () => void;
}

const toastConfig = {
  info: {
    icon: Info,
    bgColor: 'bg-light-primary dark:bg-dark-primary',
    borderColor: 'border-light-primary dark:border-dark-primary',
    textColor: 'text-white',
    hoverColor: 'hover:bg-light-hover dark:hover:bg-dark-hover'
  },
  success: {
    icon: CheckCircle,
    bgColor: 'bg-green-500 dark:bg-green-600',
    borderColor: 'border-green-600 dark:border-green-700',
    textColor: 'text-white',
    hoverColor: 'hover:bg-green-600 dark:hover:bg-green-700'
  },
  error: {
    icon: AlertCircle,
    bgColor: 'bg-red-500 dark:bg-red-600',
    borderColor: 'border-red-600 dark:border-red-700',
    textColor: 'text-white',
    hoverColor: 'hover:bg-red-600 dark:hover:bg-red-700'
  },
  warning: {
    icon: AlertTriangle,
    bgColor: 'bg-yellow-500 dark:bg-yellow-600',
    borderColor: 'border-yellow-600 dark:border-yellow-700',
    textColor: 'text-white',
    hoverColor: 'hover:bg-yellow-600 dark:hover:bg-yellow-700'
  },
} as const;

const ToastComponent: React.FC<ToastProps> = ({
  message, 
  type, 
  duration, 
  onClose 
}) => {
  const [progress, setProgress] = useState(100);
  const config = toastConfig[type];
  const Icon = config.icon;

  React.useEffect(() => {
    const interval = setInterval(() => {
      setProgress(prev => {
        if (prev <= 0) {
          clearInterval(interval);
          return 0;
        }
        return prev - (100 / ((duration || 0) / 100));
      });
    }, 100);

    return () => clearInterval(interval);
  }, [duration]);

  return (
    <div className={`${config.bgColor} ${config.textColor} p-4 rounded-lg shadow-lg relative 
      overflow-hidden border-l-4 ${config.borderColor} flex items-center max-w-md 
      backdrop-blur-sm bg-opacity-95 dark:bg-opacity-95`}>
      <div className="mr-3">
        <Icon size={24} />
      </div>
      <div className="flex-grow mr-8">
        <p className="font-semibold">{message}</p>
      </div>
      <button 
        onClick={onClose}
        className={`absolute top-0 right-0 h-full px-4 flex items-center justify-center 
          transition-colors duration-200 ${config.hoverColor}`}
      >
        <X size={16} />
      </button>
      <div 
        className="absolute bottom-0 left-0 h-1 bg-white bg-opacity-30"
        style={{ width: `${progress}%`, transition: 'width 100ms linear' }}
      />
    </div>
  );
};

export const ToastProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [toasts, setToasts] = useState<Toast[]>([]);

  const removeToast = useCallback((id: number) => {
    setToasts(prev => prev.filter(toast => toast.id !== id));
  }, []);

  const addToast = useCallback((
    message: string, 
    type: ToastType = 'info', 
    duration: number | null = 3000
  ) => {
    const id = Date.now();
    setToasts(prev => [...prev, { id, message, type, duration }]);
    if (duration !== null) {
      setTimeout(() => removeToast(id), duration);
    }
  }, [removeToast]);

  return (
    <ToastContext.Provider value={{ addToast, removeToast }}>
      {children}
      <div className="fixed bottom-4 right-4 z-50 space-y-2">
        {toasts.map(toast => (
          <ToastComponent
            key={toast.id}
            {...toast}
            onClose={() => removeToast(toast.id)}
          />
        ))}
      </div>
    </ToastContext.Provider>
  );
};
````

## File: client/src/hooks/queryUtils.ts
````typescript
import { QueryClient, InfiniteData } from '@tanstack/react-query';
import { Snippet } from '../types/snippets';

export interface PaginatedSnippetResponse {
  data: Snippet[];
  pagination: {
    offset: number;
    limit: number;
    total: number;
    hasMore: boolean;
  };
}

type InfiniteSnippetData = InfiniteData<PaginatedSnippetResponse, number>;

export const createOptimisticRemoval = (queryClient: QueryClient) => {
  return async (id: string, queryKey: readonly unknown[]) => {
    await queryClient.cancelQueries({ queryKey });
    const previousData = queryClient.getQueriesData<InfiniteSnippetData>({ queryKey });

    queryClient.setQueriesData<InfiniteSnippetData>(
      { queryKey },
      (old) => {
        if (!old?.pages) return old;
        return {
          ...old,
          pages: old.pages.map((page) => ({
            ...page,
            data: page.data.filter((s) => s.id !== id),
            pagination: {
              ...page.pagination,
              total: Math.max(0, page.pagination.total - 1),
            },
          })),
        };
      }
    );

    return { previousData };
  };
};

export const createOptimisticFieldUpdate = (
  queryClient: QueryClient,
  updateFn: (snippet: Snippet) => Partial<Snippet>
) => {
  return async (id: string, queryKey: readonly unknown[]) => {
    await queryClient.cancelQueries({ queryKey });
    const previousData = queryClient.getQueriesData<InfiniteSnippetData>({ queryKey });

    queryClient.setQueriesData<InfiniteSnippetData>(
      { queryKey },
      (old) => {
        if (!old?.pages) return old;
        return {
          ...old,
          pages: old.pages.map((page) => ({
            ...page,
            data: page.data.map((s) =>
              s.id === id ? { ...s, ...updateFn(s) } : s
            ),
          })),
        };
      }
    );

    return { previousData };
  };
};

export const createRollbackHandler = (queryClient: QueryClient) => {
  return (context: { previousData?: Array<[readonly unknown[], unknown]> } | undefined) => {
    if (context?.previousData) {
      context.previousData.forEach(([queryKey, data]) => {
        queryClient.setQueryData(queryKey, data);
      });
    }
  };
};

export const updateSnippetInCache = (
  queryClient: QueryClient,
  queryKey: readonly unknown[],
  updatedSnippet: Snippet
) => {
  queryClient.setQueriesData<InfiniteSnippetData>(
    { queryKey },
    (old) => {
      if (!old?.pages) return old;
      return {
        ...old,
        pages: old.pages.map((page) => ({
          ...page,
          data: page.data.map((s) =>
            s.id === updatedSnippet.id ? updatedSnippet : s
          ),
        })),
      };
    }
  );
};
````

## File: client/src/hooks/useAuth.ts
````typescript
import { useContext } from 'react';
import { AuthContext } from '../contexts/AuthContext';

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};
````

## File: client/src/hooks/useDebounce.ts
````typescript
import { useState, useEffect } from 'react';

export function useDebounce<T>(value: T, delay: number): T {
  const [debouncedValue, setDebouncedValue] = useState<T>(value);

  useEffect(() => {
    const handler = setTimeout(() => {
      setDebouncedValue(value);
    }, delay);

    return () => {
      clearTimeout(handler);
    };
  }, [value, delay]);

  return debouncedValue;
}
````

## File: client/src/hooks/useKeyboardShortcut.ts
````typescript
import { useEffect, useRef } from 'react';

/**
 * Options for the useKeyboardShortcut hook
 */
interface UseKeyboardShortcutOptions {
  /** The keyboard key to listen for (e.g., '/', 'Escape', 'Enter') */
  key: string;
  /** Function to call when the key is pressed */
  callback: () => void;
  /** Whether the shortcut is enabled (default: true) */
  enabled?: boolean;
  /** Whether to prevent the default browser behavior (default: true) */
  preventDefault?: boolean;
}

/**
 * Custom hook for handling global keyboard shortcuts
 * 
 * @param options - Configuration options for the keyboard shortcut
 * @returns void
 * 
 * @example
 * ```tsx
 * useKeyboardShortcut({
 *   key: '/',
 *   callback: () => focusSearchInput(),
 *   enabled: true,
 *   preventDefault: true
 * });
 * ```
 */
export const useKeyboardShortcut = ({
  key,
  callback,
  enabled = true,
  preventDefault = true,
}: UseKeyboardShortcutOptions) => {
  const callbackRef = useRef(callback);

  // Keep callback ref up to date
  useEffect(() => {
    callbackRef.current = callback;
  }, [callback]);

  useEffect(() => {
    if (!enabled) return;

    const handleKeyDown = (event: KeyboardEvent) => {
      // Check if the pressed key matches our target key
      if (event.key === key) {
        // Don't trigger if user is typing in an input, textarea, or contenteditable
        const target = event.target as HTMLElement;
        const isTyping = 
          target.tagName === 'INPUT' ||
          target.tagName === 'TEXTAREA' ||
          target.contentEditable === 'true';

        if (!isTyping) {
          if (preventDefault) {
            event.preventDefault();
          }
          callbackRef.current();
        }
      }
    };

    document.addEventListener('keydown', handleKeyDown);
    return () => document.removeEventListener('keydown', handleKeyDown);
  }, [key, enabled, preventDefault]);
};

export default useKeyboardShortcut;
````

## File: client/src/hooks/useOidcErrorHandler.ts
````typescript
import { useTranslation } from "react-i18next";
import { ToastType } from "../contexts/ToastContext";
import { useToast } from "./useToast";

interface OIDCErrorConfig {
  message: string;
  type: ToastType;
  duration?: number | null;
}

type ErrorKey = 'auth_failed'
  | 'registration_disabled'
  | 'provider_error'
  | 'config_error'
  | 'default'
  | string;

export const useOidcErrorHandler = () => {
  const { t: translate } = useTranslation('components/auth');
  const { addToast } = useToast();

  const OIDC_ERROR_CONFIGS: Record<ErrorKey, OIDCErrorConfig> = {
    auth_failed: {
      message: translate('oidc.error.auth_failed'),
      type: 'error',
      duration: 8000
    },
    registration_disabled: {
      message: translate('oidc.error.registration_disabled'),
      type: 'error',
      duration: null
    },
    provider_error: {
      message: translate('oidc.error.provider_error'),
      type: 'error',
      duration: 8000
    },
    config_error: {
      message: translate('oidc.error.config_error'),
      type: 'error',
      duration: null
    },
    default: {
      message: translate('oidc.error.default'),
      type: 'error',
      duration: 8000
    }
  };

  return (
    errorMessage: keyof typeof OIDC_ERROR_CONFIGS,
    providerName?: string,
    additionalMessage?: string
  ) => {
    const config = OIDC_ERROR_CONFIGS[errorMessage] || OIDC_ERROR_CONFIGS.default;
    let message = config.message;

    if (providerName) {
      message = message.replace('identity provider', providerName);
    }

    if (additionalMessage) {
      message = `${message}\n\nError details: ${additionalMessage}`;
    }

    addToast(message, config.type, config.duration);
  };
};
````

## File: client/src/hooks/useOutsideClick.ts
````typescript
import { useEffect, RefObject } from 'react';

export const useOutsideClick = (
  ref: RefObject<HTMLElement>,
  handler: () => void,
  deps: any[] = []
) => {
  useEffect(() => {
    const listener = (event: MouseEvent | TouchEvent) => {
      if (!ref.current || ref.current.contains(event.target as Node)) {
        return;
      }
      handler();
    };

    document.addEventListener('mousedown', listener);
    document.addEventListener('touchstart', listener);

    return () => {
      document.removeEventListener('mousedown', listener);
      document.removeEventListener('touchstart', listener);
    };
  }, [ref, handler, ...deps]);
};
````

## File: client/src/hooks/useSettings.ts
````typescript
import { useState, useEffect } from "react";
import { useTranslation } from "react-i18next";
import { useTheme } from "../contexts/ThemeContext";
import { Locale } from "../i18n/types";

type Theme = "light" | "dark" | "system";

interface Settings {
  compactView: boolean;
  showCodePreview: boolean;
  previewLines: number;
  includeCodeInSearch: boolean;
  showCategories: boolean;
  expandCategories: boolean;
  showLineNumbers: boolean;
  theme: Theme;
  locale: Locale;
  showFavorites?: boolean;
}

export const useSettings = () => {
  const { i18n } = useTranslation();

  const changeLocale = (locale: Locale) => {
    i18n.changeLanguage(locale);
  };

  const { setTheme: setThemeContext } = useTheme();
  const [viewMode, setViewMode] = useState<"grid" | "list">(
    () => (localStorage.getItem("viewMode") as "grid" | "list") || "grid"
  );
  const [compactView, setCompactView] = useState(
    () => localStorage.getItem("compactView") === "true"
  );
  const [showCodePreview, setShowCodePreview] = useState(
    () => localStorage.getItem("showCodePreview") !== "false"
  );
  const [previewLines, setPreviewLines] = useState(() =>
    parseInt(localStorage.getItem("previewLines") || "4", 10)
  );
  const [includeCodeInSearch, setIncludeCodeInSearch] = useState(
    () => localStorage.getItem("includeCodeInSearch") === "true"
  );
  const [showCategories, setShowCategories] = useState(
    () => localStorage.getItem("showCategories") !== "false"
  );
  const [expandCategories, setExpandCategories] = useState(
    () => localStorage.getItem("expandCategories") === "true"
  );
  const [showLineNumbers, setShowLineNumbers] = useState(
    () => localStorage.getItem("showLineNumbers") === "true"
  );
  const [showFavorites, setShowFavorites] = useState(
    () => localStorage.getItem("showFavorites") === "true"
  );
  const [theme, setThemeState] = useState<Theme>(() => {
    const savedTheme = localStorage.getItem("theme");
    return savedTheme === "light" ||
      savedTheme === "dark" ||
      savedTheme === "system"
      ? savedTheme
      : "system";
  });
  const [locale, setLocale] = useState<Locale>(
    () => i18n.language as Locale
  );

  useEffect(() => {
    localStorage.setItem("viewMode", viewMode);
  }, [viewMode]);

  useEffect(() => {
    localStorage.setItem("compactView", compactView.toString());
  }, [compactView]);

  useEffect(() => {
    localStorage.setItem("showCodePreview", showCodePreview.toString());
  }, [showCodePreview]);

  useEffect(() => {
    localStorage.setItem("previewLines", previewLines.toString());
  }, [previewLines]);

  useEffect(() => {
    localStorage.setItem("includeCodeInSearch", includeCodeInSearch.toString());
  }, [includeCodeInSearch]);

  useEffect(() => {
    localStorage.setItem("showCategories", showCategories.toString());
  }, [showCategories]);

  useEffect(() => {
    localStorage.setItem("expandCategories", expandCategories.toString());
  }, [expandCategories]);

  useEffect(() => {
    localStorage.setItem("showLineNumbers", showLineNumbers.toString());
  }, [showLineNumbers]);

  useEffect(() => {
    localStorage.setItem("showFavorites", showFavorites.toString());
  }, [showFavorites]);

  useEffect(() => {
    localStorage.setItem("theme", theme);
    setThemeContext(theme);
  }, [theme, setThemeContext]);

  useEffect(() => {
    changeLocale(locale);
  }, [locale, setLocale]);

  const updateSettings = (newSettings: Settings) => {
    setCompactView(newSettings.compactView);
    setShowCodePreview(newSettings.showCodePreview);
    setPreviewLines(newSettings.previewLines);
    setIncludeCodeInSearch(newSettings.includeCodeInSearch);
    setShowCategories(newSettings.showCategories);
    setExpandCategories(newSettings.expandCategories);
    setShowLineNumbers(newSettings.showLineNumbers);
    if (newSettings.showFavorites) {
      setShowFavorites(newSettings.showFavorites);
    }
    setThemeState(newSettings.theme);
    setLocale(newSettings.locale)
  };

  return {
    viewMode,
    setViewMode,
    compactView,
    showCodePreview,
    previewLines,
    includeCodeInSearch,
    showCategories,
    expandCategories,
    updateSettings,
    showLineNumbers,
    showFavorites,
    setShowFavorites,
    theme,
    locale,
  };
};
````

## File: client/src/hooks/useSnippetFilters.ts
````typescript
import { useSearchParams } from "react-router-dom";
import { useCallback, useMemo } from "react";

export type SortOrder = "newest" | "oldest" | "alpha-asc" | "alpha-desc";

export interface SnippetFilters {
  search: string;
  language: string;
  categories: string[];
  sort: SortOrder;
  favorites: boolean;
  recycled: boolean;
}

export interface SnippetFiltersActions {
  setSearch: (search: string) => void;
  setLanguage: (language: string) => void;
  setCategories: (categories: string[]) => void;
  toggleCategory: (category: string) => void;
  setSort: (sort: SortOrder) => void;
  setFavorites: (favorites: boolean) => void;
  clearFilters: () => void;
}

/**
 * Hook to manage snippet filters via URL search params.
 * All filter state lives in the URL, making it shareable and preventing re-render issues.
 */
export const useSnippetFilters = (defaultRecycled: boolean = false): [SnippetFilters, SnippetFiltersActions] => {
  const [searchParams, setSearchParams] = useSearchParams();

  const filters: SnippetFilters = useMemo(() => ({
    search: searchParams.get("search") || "",
    language: searchParams.get("language") || "",
    categories: searchParams.get("categories")?.split(",").filter(Boolean) || [],
    sort: (searchParams.get("sort") as SortOrder) || "newest",
    favorites: searchParams.get("favorites") === "true",
    recycled: defaultRecycled,
  }), [searchParams, defaultRecycled]);

  const updateParams = useCallback((updates: Partial<Record<string, string | null>>) => {
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);

      Object.entries(updates).forEach(([key, value]) => {
        if (value === null || value === "" || value === undefined) {
          next.delete(key);
        } else {
          next.set(key, value);
        }
      });

      return next;
    });
  }, [setSearchParams]);

  const actions: SnippetFiltersActions = useMemo(() => ({
    setSearch: (search: string) => {
      updateParams({ search: search || null });
    },

    setLanguage: (language: string) => {
      updateParams({ language: language || null });
    },

    setCategories: (categories: string[]) => {
      updateParams({ categories: categories.length > 0 ? categories.join(",") : null });
    },

    toggleCategory: (category: string) => {
      const current = filters.categories;
      const updated = current.includes(category)
        ? current.filter(c => c !== category)
        : [...current, category];

      updateParams({ categories: updated.length > 0 ? updated.join(",") : null });
    },

    setSort: (sort: SortOrder) => {
      updateParams({ sort });
    },

    setFavorites: (favorites: boolean) => {
      updateParams({ favorites: favorites ? "true" : null });
    },

    clearFilters: () => {
      setSearchParams({});
    },
  }), [filters.categories, updateParams, setSearchParams]);

  return [filters, actions];
};
````

## File: client/src/hooks/useSnippetPagination.ts
````typescript
import { useState, useEffect, useCallback, useRef, useMemo } from "react";
import { useTranslation } from "react-i18next";
import { Snippet } from "../types/snippets";
import { snippetService } from "../service/snippetService";
import { useAuth } from "./useAuth";
import { useToast } from "./useToast";

interface PaginationState {
  total: number;
  offset: number;
  limit: number;
  hasMore: boolean;
}

interface SnippetFilters {
  search: string;
  language: string;
  categories: string[];
  sort: string;
}

interface UseSnippetPaginationOptions {
  filters: SnippetFilters;
  includeCodeInSearch: boolean;
  showFavorites?: boolean;
  viewType: "base" | "public" | "recycle";
  forceReload?: number;
}

interface UseSnippetPaginationReturn {
  snippets: Snippet[];
  setSnippets: React.Dispatch<React.SetStateAction<Snippet[]>>;
  pagination: PaginationState;
  isLoading: boolean;
  isLoadingMore: boolean;
  selectedSnippet: Snippet | null;
  setSelectedSnippet: (snippet: Snippet | null) => void;
  observerTarget: React.RefObject<HTMLDivElement>;
  loadSnippets: (append?: boolean) => Promise<void>;
}

export const useSnippetPagination = ({
  filters,
  includeCodeInSearch,
  showFavorites = false,
  viewType,
  forceReload = 0,
}: UseSnippetPaginationOptions): UseSnippetPaginationReturn => {
  const { t } = useTranslation();
  const { logout } = useAuth();
  const { addToast } = useToast();

  const [snippets, setSnippets] = useState<Snippet[]>([]);
  const [pagination, setPagination] = useState<PaginationState>({
    total: 0,
    offset: 0,
    limit: 50,
    hasMore: false,
  });
  const [isLoading, setIsLoading] = useState(true);
  const [isLoadingMore, setIsLoadingMore] = useState(false);
  const [selectedSnippet, setSelectedSnippet] = useState<Snippet | null>(null);

  const mountedRef = useRef(false);
  const snippetsRef = useRef<Snippet[]>([]);
  const observerTarget = useRef<HTMLDivElement>(null);

  useEffect(() => {
    snippetsRef.current = snippets;
  }, [snippets]);

  useEffect(() => {
    mountedRef.current = true;
    return () => {
      mountedRef.current = false;
    };
  }, []);

  const apiFilters = useMemo(() => {
    const baseFilters = {
      search: filters.search,
      searchCode: includeCodeInSearch,
      language: filters.language,
      category: filters.categories.join(","),
      sort: filters.sort,
    };

    if (viewType === "base") {
      return {
        ...baseFilters,
        favorites: showFavorites,
        recycled: false,
      };
    } else if (viewType === "recycle") {
      return {
        ...baseFilters,
        favorites: false,
        recycled: true,
      };
    }

    return baseFilters;
  }, [filters, includeCodeInSearch, showFavorites, viewType]);

  const loadSnippets = useCallback(
    async (append = false) => {
      try {
        if (append) {
          setIsLoadingMore(true);
        } else {
          setIsLoading(true);
          setSnippets([]);
        }

        const offset = append ? snippetsRef.current.length : 0;
        const params = {
          offset,
          limit: 50,
          ...apiFilters,
        };

        const result =
          viewType === "public"
            ? await snippetService.getPublicSnippetsPaginated(params)
            : await snippetService.getSnippetsPaginated(params);

        if (mountedRef.current) {
          if (append) {
            setSnippets((prev) => [...prev, ...result.data]);
          } else {
            setSnippets(result.data);
          }
          setPagination(result.pagination);
        }
      } catch (error: any) {
        console.error("Failed to load snippets:", error);
        if (mountedRef.current) {
          if (viewType !== "public" && (error.status === 401 || error.status === 403)) {
            logout();
            addToast(t('pagination.useSnippetPagination.error.sessionExpired'), "error");
          } else {
            addToast(t('pagination.useSnippetPagination.error.failedSnippetsLoad'), "error");
          }
        }
      } finally {
        if (mountedRef.current) {
          setIsLoading(false);
          setIsLoadingMore(false);
        }
      }
    },
    [apiFilters, viewType, addToast, logout]
  );

  useEffect(() => {
    loadSnippets(false);
  }, [loadSnippets, forceReload]);

  const loadMore = useCallback(() => {
    if (pagination.hasMore && !isLoadingMore) {
      loadSnippets(true);
    }
  }, [pagination.hasMore, isLoadingMore, loadSnippets]);

  useEffect(() => {
    if (!pagination) return;

    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting && pagination.hasMore && !isLoadingMore) {
          loadMore();
        }
      },
      { threshold: 0.1 }
    );

    if (observerTarget.current) {
      observer.observe(observerTarget.current);
    }

    return () => observer.disconnect();
  }, [pagination, isLoadingMore, loadMore]);

  return {
    snippets,
    setSnippets,
    pagination,
    isLoading,
    isLoadingMore,
    selectedSnippet,
    setSelectedSnippet,
    observerTarget,
    loadSnippets,
  };
};
````

## File: client/src/hooks/useSnippetsQuery.ts
````typescript
import { useInfiniteQuery, useMutation, useQueryClient, InfiniteData } from '@tanstack/react-query';
import { snippetService } from '../service/snippetService';
import { Snippet } from '../types/snippets';
import {
  createSnippet,
  editSnippet,
  deleteSnippet,
  moveToRecycleBin,
  restoreSnippetById,
  setPinnedSnippet,
  setFavoriteSnippet,
} from '../utils/api/snippets';
import {
  createOptimisticRemoval,
  createOptimisticFieldUpdate,
  createRollbackHandler,
  updateSnippetInCache,
  PaginatedSnippetResponse,
} from './queryUtils';

type InfiniteSnippetData = InfiniteData<PaginatedSnippetResponse, number>;

export interface SnippetFilters {
  search?: string;
  searchCode?: boolean;
  language?: string;
  category?: string;
  favorites?: boolean;
  recycled?: boolean;
  sort?: string;
}

export interface SnippetsQueryKey extends SnippetFilters {
  viewType: 'base' | 'public' | 'recycle';
}

export const snippetKeys = {
  all: ['snippets'] as const,
  lists: () => [...snippetKeys.all, 'list'] as const,
  list: (filters: SnippetsQueryKey) => [...snippetKeys.lists(), filters] as const,
  metadata: (viewType: 'base' | 'public') => [...snippetKeys.all, 'metadata', viewType] as const,
};

export const useSnippetsInfiniteQuery = (filters: SnippetsQueryKey) => {
  return useInfiniteQuery<PaginatedSnippetResponse>({
    queryKey: snippetKeys.list(filters),
    queryFn: async ({ pageParam = 0 }) => {
      const params = {
        offset: pageParam as number,
        limit: 50,
        search: filters.search || '',
        searchCode: filters.searchCode || false,
        language: filters.language || '',
        category: filters.category || '',
        favorites: filters.favorites || false,
        recycled: filters.recycled || false,
        sort: filters.sort || 'newest',
      };

      if (filters.viewType === 'public') {
        return snippetService.getPublicSnippetsPaginated(params);
      }
      return snippetService.getSnippetsPaginated(params);
    },
    getNextPageParam: (lastPage) => {
      return lastPage.pagination.hasMore
        ? lastPage.pagination.offset + lastPage.pagination.limit
        : undefined;
    },
    initialPageParam: 0,
  });
};

export const useCreateSnippet = () => {
  const queryClient = useQueryClient();
  const rollback = createRollbackHandler(queryClient);

  return useMutation({
    mutationFn: (snippet: Omit<Snippet, 'id' | 'updated_at'>) => createSnippet(snippet),
    onMutate: async (newSnippet) => {
      const queryKey = snippetKeys.lists();
      await queryClient.cancelQueries({ queryKey });
      const previousData = queryClient.getQueriesData({ queryKey });

      const tempId = `temp-${Date.now()}`;
      const tempSnippet: Snippet = {
        ...newSnippet,
        id: tempId,
        updated_at: new Date().toISOString(),
        share_count: 0,
      };

      queryClient.setQueriesData<InfiniteSnippetData>(
        { queryKey },
        (old) => {
          if (!old?.pages || old.pages.length === 0) return old;

          const updatedPages = [...old.pages];
          updatedPages[0] = {
            ...updatedPages[0],
            data: [tempSnippet, ...updatedPages[0].data],
            pagination: {
              ...updatedPages[0].pagination,
              total: updatedPages[0].pagination.total + 1,
            },
          };

          return {
            ...old,
            pages: updatedPages,
          };
        }
      );

      return { previousData, tempId };
    },
    onSuccess: (createdSnippet, _, context) => {
      const queryKey = snippetKeys.lists();

      queryClient.setQueriesData<InfiniteSnippetData>(
        { queryKey },
        (old) => {
          if (!old?.pages) return old;

          const updatedPages = old.pages.map((page, index) => {
            if (index === 0) {
              return {
                ...page,
                data: page.data.map((s) =>
                  s.id === context.tempId ? createdSnippet : s
                ),
              };
            }
            return page;
          });

          return {
            ...old,
            pages: updatedPages,
          };
        }
      );
    },
    onError: (_, __, context) => rollback(context),
  });
};

export const useEditSnippet = () => {
  const queryClient = useQueryClient();
  const rollback = createRollbackHandler(queryClient);

  return useMutation({
    mutationFn: ({ id, snippet }: { id: string; snippet: Omit<Snippet, 'id' | 'updated_at'> }) =>
      editSnippet(id, snippet),
    onMutate: async ({ id, snippet }) => {
      const queryKey = snippetKeys.lists();
      const updateInPlace = createOptimisticFieldUpdate(queryClient, () => ({
        ...snippet,
        updated_at: new Date().toISOString(),
      }));
      return updateInPlace(id, queryKey);
    },
    onSuccess: (updatedSnippet) => {
      updateSnippetInCache(queryClient, snippetKeys.lists(), updatedSnippet);
    },
    onError: (_, __, context) => rollback(context),
  });
};

export const useDeleteSnippet = () => {
  const queryClient = useQueryClient();
  const removeSnippet = createOptimisticRemoval(queryClient);
  const rollback = createRollbackHandler(queryClient);

  return useMutation({
    mutationFn: (id: string) => deleteSnippet(id),
    onMutate: (id) => removeSnippet(id, snippetKeys.lists()),
    onError: (_, __, context) => rollback(context),
  });
};

export const useMoveToRecycleBin = () => {
  const queryClient = useQueryClient();
  const removeSnippet = createOptimisticRemoval(queryClient);
  const rollback = createRollbackHandler(queryClient);

  return useMutation({
    mutationFn: (id: string) => moveToRecycleBin(id),
    onMutate: (id) => removeSnippet(id, snippetKeys.lists()),
    onError: (_, __, context) => rollback(context),
  });
};

export const useRestoreSnippet = () => {
  const queryClient = useQueryClient();
  const removeSnippet = createOptimisticRemoval(queryClient);
  const rollback = createRollbackHandler(queryClient);

  return useMutation({
    mutationFn: (id: string) => restoreSnippetById(id),
    onMutate: (id) => removeSnippet(id, snippetKeys.lists()),
    onError: (_, __, context) => rollback(context),
  });
};

export const usePinSnippet = () => {
  const queryClient = useQueryClient();
  const rollback = createRollbackHandler(queryClient);

  return useMutation({
    mutationFn: ({ id, isPinned }: { id: string; isPinned: boolean }) =>
      setPinnedSnippet(id, !isPinned),
    onMutate: async ({ id, isPinned }) => {
      const queryKey = snippetKeys.lists();
      const updateField = createOptimisticFieldUpdate(queryClient, () => ({
        is_pinned: isPinned ? 0 : 1,
      }));
      return updateField(id, queryKey);
    },
    onSuccess: (updatedSnippet) => {
      updateSnippetInCache(queryClient, snippetKeys.lists(), updatedSnippet);
    },
    onError: (_, __, context) => rollback(context),
  });
};

export const useFavoriteSnippet = () => {
  const queryClient = useQueryClient();
  const rollback = createRollbackHandler(queryClient);

  return useMutation({
    mutationFn: ({ id, isFavorite }: { id: string; isFavorite: boolean }) =>
      setFavoriteSnippet(id, !isFavorite),
    onMutate: async ({ id, isFavorite }) => {
      const queryKey = snippetKeys.lists();
      const updateField = createOptimisticFieldUpdate(queryClient, () => ({
        is_favorite: isFavorite ? 0 : 1,
      }));
      return updateField(id, queryKey);
    },
    onSuccess: (updatedSnippet) => {
      updateSnippetInCache(queryClient, snippetKeys.lists(), updatedSnippet);
    },
    onError: (_, __, context) => rollback(context),
  });
};
````

## File: client/src/hooks/useToast.ts
````typescript
import { useContext } from 'react';
import { ToastContext } from '../contexts/ToastContext';

export const useToast = () => {
  const context = useContext(ToastContext);
  if (!context) {
    throw new Error('useToast must be used within a ToastProvider');
  }
  return context;
};
````

## File: client/src/i18n/locales/en/components/admin/tabs/apiKeys.json
````json
{
  "apiKeyDeletedSuccessfully": "API key deleted successfully",
  "columns": {
    "labels": {
      "actions": "Actions",
      "created": "Created",
      "lastUsed": "Last used",
      "name": "Name",
      "owner": "Owner",
      "status": "Status"
    }
  },
  "confirmationModal": {
    "message": "Are you sure you want to delete this API key? The key owner will no longer be able to use it to access the API. This action cannot be undone.",
    "title": "Delete API Key"
  },
  "entityName_one": "API key",
  "entityName_other": "API keys",
  "error": {
    "default": "Failed to delete API key"
  },
  "filters": {
    "userId": "Filter by User ID"
  },
  "status": {
    "active": "Active",
    "inactive": "Inactive"
  },
  "table": {
    "emptyMessage": "No API keys found",
    "loadingMessage": "Loading API keys..."
  }
}
````

## File: client/src/i18n/locales/en/components/admin/tabs/dashboard.json
````json
{
  "card": {
    "apiKeys": {
      "title": "API Keys"
    },
    "shares": {
      "title": "Shares"
    },
    "snippets": {
      "apiKeys": {
        "active": "Active"
      },
      "shares": {
        "total": "Total"
      },
      "title": "Snippets",
      "viewType": {
        "private": "Private",
        "public": "Public"
      }
    },
    "users": {
      "authType": {
        "internal": "Internal",
        "oidc": "OIDC"
      },
      "title": "Users"
    }
  },
  "loadingMessage": "Loading statistics..."
}
````

## File: client/src/i18n/locales/en/components/admin/tabs/shares.json
````json
{
  "action": {
    "copyShareLink": "Copy share link",
    "delete": "Delete share",
    "viewSnippet": "View snippet"
  },
  "columns": {
    "labels": {
      "actions": "Actions",
      "auth": "Auth required",
      "created": "Created",
      "expires": "Expires",
      "id": "Share ID",
      "owner": "Owner",
      "title": "Title"
    }
  },
  "confirmationModal": {
    "message": "Are you sure you want to delete this share link? Anyone with the link will no longer be able to access the snippet. This action cannot be undone.",
    "title": "Delete share"
  },
  "entityName_one": "share",
  "entityName_other": "shares",
  "error": {
    "delete": {
      "default": "Failed to delete share"
    }
  },
  "filters": {
    "authType": {
      "all": "All Auth Types",
      "public": "Public",
      "requiresAuth": "Requires Auth"
    },
    "userId": "Filter by User ID"
  },
  "success": {
    "copied": {
      "default": "Share link copied to clipboard"
    },
    "delete": {
      "default": "Share deleted successfully"
    }
  },
  "table": {
    "emptyMessage": "No shares found",
    "loadingMessage": "Loading shares..."
  }
}
````

## File: client/src/i18n/locales/en/components/admin/tabs/snippets.json
````json
{
  "action": {
    "delete": "Delete snippet",
    "makePrivate": "Make private",
    "makePublic": "Make public",
    "scanForOffensiveContent": "Scan for Offensive Content",
    "showAllSnippets": "Show All Snippets",
    "viewSnippet": "View snippet"
  },
  "columns": {
    "labels": {
      "actions": "Actions",
      "fragments": "Fragments",
      "owner": "Owner",
      "title": "Title",
      "updated": "Updated",
      "visibility": "Visibility"
    }
  },
  "confirmationModal": {
    "message": "Are you sure you want to permanently delete this snippet? This action cannot be undone.",
    "title": "Delete snippet"
  },
  "containsOffensiveWords": "Contains offensive words: {{words}}",
  "entityName_one": "snippet",
  "entityName_other": "snippets",
  "error": {
    "delete": {
      "default": "Failed to delete snippet"
    },
    "update": {
      "default": "Failed to update snippet visibility"
    }
  },
  "filters": {
    "search": "Search snippets...",
    "userId": "User ID",
    "visibility": {
      "all": "All visibility",
      "private": "Private",
      "public": "Public"
    }
  },
  "offensiveContentMessage": "Found {{total}} {{entityName}} with offensive content",
  "success": {
    "delete": {
      "default": "Snippet deleted successfully"
    },
    "update": {
      "default": "Snippet visibility updated"
    }
  },
  "table": {
    "emptyMessage": "No snippets found",
    "loadingMessage": "Loading snippets..."
  }
}
````

## File: client/src/i18n/locales/en/components/admin/tabs/users.json
````json
{
  "action": {
    "activate": "Activate user",
    "deactivate": "Deactivate user",
    "delete": "Delete user"
  },
  "columns": {
    "labels": {
      "actions": "Actions",
      "apiKeysCount": "API keys",
      "authType": "AUth type",
      "created": "Created",
      "email": "Email",
      "lastLogin": "Last login",
      "snippetsCount": "Snippets",
      "status": "Status",
      "username": "Username"
    }
  },
  "confirmationModal": {
    "message": "Are you sure you want to delete this user? This will permanently delete all their snippets, API keys, and shares. This action cannot be undone.",
    "title": "Delete user"
  },
  "entityName_one": "user",
  "entityName_other": "users",
  "error": {
    "delete": {
      "default": "Failed to delete user"
    },
    "update": {
      "default": "Failed to update user"
    }
  },
  "filters": {
    "authType": {
      "all": "All Auth Types",
      "internal": "Internal",
      "oidc": "OIDC"
    },
    "search": "Search users...",
    "status": {
      "active": "Active",
      "all": "All Status",
      "inactive": "Inactive"
    }
  },
  "status": {
    "active": "Active",
    "inactive": "Inactive"
  },
  "success": {
    "delete": {
      "default": "User deleted successfully"
    },
    "update": {
      "default": "User status updated"
    }
  },
  "table": {
    "emptyMessage": "No users found",
    "loadingMessage": "Loading users..."
  }
}
````

## File: client/src/i18n/locales/en/components/admin/common.json
````json
{
  "adminTable": {
    "defaultEmptyMessage": "No data found",
    "defaultLoadingMessage": "Loading..."
  },
  "filterInput": {
    "defaultPlaceholder": "Search..."
  },
  "filterSelect": {
    "defaultPlaceholder": "Select..."
  }
}
````

## File: client/src/i18n/locales/en/components/admin/modals.json
````json
{
  "snippetViewModal": {
    "error": {
      "failedLoad": "Failed to load snippet"
    },
    "title": "Loading snippet..."
  }
}
````

## File: client/src/i18n/locales/en/components/admin/selector.json
````json
{
  "apiKeys": "API Keys",
  "dashboard": "Dashboard",
  "shares": "Shares",
  "snippets": "Snippets",
  "users": "Users"
}
````

## File: client/src/i18n/locales/en/components/common/buttons.json
````json
{
  "copyButton": {
    "title": "Copy to clipboard"
  },
  "downloadArchiveButton": {
    "error": {
      "failedDownload": "Failed to download archive"
    },
    "fileLabel_one": "{{count, number}} file",
    "fileLabel_other": "{{count, number}} files",
    "label": "Download all",
    "success": {
      "downloadedAll": "Downloaded all code fragments"
    },
    "title": "Download all files as ZIP archive"
  },
  "downloadButton": {
    "error": {
      "failedDownload": "Failed to download file"
    },
    "success": {
      "downloaded": "\"{{fileName}}\" downloaded successfully"
    },
    "title": "Download {{fileName}}",
    "warning": {
      "nothing": "Nothing to download"
    }
  },
  "exportButton": {
    "title": "Export as image",
    "tooltip": "Export"
  },
  "exportModal": {
    "copyClipboard": "Copy",
    "downloadPng": "Download PNG",
    "downloadSvg": "Download SVG",
    "errorCopy": "Failed to copy image",
    "errorGenerate": "Failed to generate image",
    "shareLinkedIn": "Share on LinkedIn",
    "shareTwitter": "Share on X",
    "successCopy": "Image copied to clipboard!",
    "title": "Export code"
  },
  "fileUploadButton": {
    "error": {
      "unknown": "Unknown error"
    },
    "info": {
      "duplicateDetected": "Duplicate file detected",
      "duplicatesDetected_one": "{{count, number}} duplicate files detected",
      "duplicatesDetected_other": "{{count, number}} duplicate files detected"
    },
    "label": "Upload code file(s)",
    "loadFromUrl": {
      "contentMaxSizeError": "Content size must be less than {{max}}",
      "invalidUrl": "Please enter a valid URL",
      "label": "Load from URL",
      "title": "Load code from a URL (e.g., raw GitHub link)"
    },
    "success": {
      "filesUploaded_one": "{{count, number}} files uploaded successfully",
      "filesUploaded_other": "{{count, number}} files uploaded successfully",
      "fileUploaded": "\"{{fileName}}\" uploaded successfully",
      "someFilesUploaded": "{{successCount}} of {{total}} files uploaded successfully"
    },
    "title": "Upload code files to auto-create fragments"
  },
  "rawButton": {
    "title": "Open raw"
  }
}
````

## File: client/src/i18n/locales/en/components/common/dropdowns.json
````json
{
  "baseDropdown": {
    "addNewLabel": "Add new",
    "defaultPlaceholder": "Select or type a value"
  }
}
````

## File: client/src/i18n/locales/en/components/common/markdown.json
````json
{
  "mermaid": {
    "copyCode": "Copy Mermaid code",
    "downloadPNG": "Download as PNG",
    "downloadSVG": "Download as SVG",
    "exitFullscreen": "Exit fullscreen",
    "fullscreen": "Fullscreen",
    "renderError": "Failed to render Mermaid diagram:",
    "renderErrorFallback": "Error rendering diagram",
    "resetView": "Reset view",
    "title": "Mermaid Diagram",
    "zoomIn": "Zoom in",
    "zoomOut": "Zoom out"
  }
}
````

## File: client/src/i18n/locales/en/components/common/modals.json
````json
{
  "changelogModal": {
    "error": {
      "default": "Failed to load changelog. Please try again later."
    }
  }
}
````

## File: client/src/i18n/locales/en/components/snippets/list/snippetCard.json
````json
{
  "confirmationModalDelete": {
    "confirmLabel": {
      "isRecycleView": {
        "false": "Move to Recycle Bin",
        "true": "Delete Permanently"
      }
    },
    "message": {
      "isRecycleView": {
        "false": "Are you sure you want to move \"{{title}}\" to the Recycle Bin?",
        "true": "Are you sure you want to permanently delete \"{{title}}\"? This action cannot be undone."
      }
    },
    "title": {
      "isRecycleView": {
        "false": "Move to Recycle Bin",
        "true": "Confirm Deletion"
      }
    }
  },
  "confirmationModalRestore": {
    "message": "Are you sure you want to restore \"{{title}}\"?",
    "title": "Confirm Restore"
  },
  "date": {
    "ago": "{{date}} ago",
    "expiringSoon": "Expiring soon",
    "left": "{{date}} left"
  },
  "defaultDescription": "No description available",
  "defaultUpdateTime": "Unknown",
  "favorite": "Favorite",
  "pinned": "Pinned",
  "public": "Public",
  "shared": "Shared"
}
````

## File: client/src/i18n/locales/en/components/snippets/list/snippetCardMenu.json
````json
{
  "addToFavorites": "Add to favorites",
  "deleteSnippet": "Delete snippet",
  "duplicateSnippet": "Duplicate snippet",
  "editSnippet": "Edi snippet",
  "openInNewTab": "Open in new tab",
  "pinSnippet": "Pin snippet",
  "removeFromFavorites": "Remove from favorites",
  "shareSnippet": "Share snippet",
  "unpinSnippet": "Unpin snippet"
}
````

## File: client/src/i18n/locales/en/components/snippets/list/snippetList.json
````json
{
  "noSnippetsMatch": "No snippets match your search criteria"
}
````

## File: client/src/i18n/locales/en/components/snippets/list/snippetRecycleCardMenu.json
````json
{
  "deleteSnippet": "Delete snippet",
  "restoreSnippet": "Restore snippet"
}
````

## File: client/src/i18n/locales/en/components/snippets/view/all.json
````json
{
  "fullCodeView": {
    "dateTimeAgo": "{{dateTime}} ago",
    "defaultDescription": "No description available"
  },
  "files": "files",
  "collapseSidebar": "Collapse Sidebar",
  "expandSidebar": "Expand Sidebar",
  "searchFiles": "Search files...",
  "noFilesFound": "No files found matching your search",
  "filterFiles": "Filter files",
  "fileExtensions": "File extensions",
  "noExtension": "No extension",
  "snippetModal": {
    "confirmationModal": {
      "confirmLabel": {
        "isRecycleView": {
          "false": "Move to Recycle Bin",
          "true": "Delete Permanently"
        }
      },
      "message": {
        "isRecycleView": {
          "false": "Are you sure you want to move \"{{title}}\" to the Recycle Bin?",
          "true": "Are you sure you want to permanently delete \"{{title}}\"? This action cannot be undone."
        }
      },
      "title": {
        "isRecycleView": {
          "false": "Move to Recycle Bin",
          "true": "Confirm Deletion"
        }
      }
    }
  }
}
````

## File: client/src/i18n/locales/en/components/snippets/view/common.json
````json
{
  "authAwareSnippetView": {
    "error": {
      "snippetLoad": "Failed to load snippet",
      "snippetRequireAuth": "This snippet requires authentication to view"
    }
  },
  "baseSnippetStorage": {
    "error": {
      "sessionExpired": "Session expired. Please login again.",
      "snippetCreated": "Failed to create snippet",
      "snippetUpdated": "Failed to update snippet"
    },
    "success": {
      "displayAll": "Displaying all snippets",
      "displayFavorites": "Displaying favorite snippets",
      "snippetCreated": "New snippet created successfully",
      "snippetUpdated": "Snippet updated successfully"
    }
  },
  "browsePublicSnippets": "Browse public snippets",
  "filter": {
    "filteredByCategories": "Filtered by categories"
  },
  "loadingSnippets": "Loading snippets...",
  "signIn": "Sign in",
  "sippetNotFound": "Snippet not found",
  "snippetContentArea": {
    "error": {
      "duplicateSnippet": "Failed to duplicate snippet",
      "loadSnippets": "Failed to load snippets",
      "moveSnippetToRecycleBin": "Failed to move snippet to recycle bin. Please try again.",
      "sessionExpired": "Session expired. Please login again.",
      "updateFavoriteStatusAdded": "Failed to update favorite status. Please try again.",
      "updateFavoriteStatusDeleted": "Failed to update favorite status. Please try again.",
      "updatePinStatusAdded": "Failed to update pin status. Please try again.",
      "updatePinStatusDeleted": "Failed to update pin status. Please try again."
    },
    "success": {
      "duplicateSnippet": "Snippet duplicated successfully",
      "moveSnippetToRecycleBin": "Snippet moved to recycle bin successfully",
      "updateFavoriteStatusAdded": "Snippet added to favorites successfully",
      "updateFavoriteStatusDeleted": "Snippet remove from favorites successfully",
      "updatePinStatusAdded": "Snippet pinned successfully",
      "updatePinStatusDeleted": "Snippet unpinned favorites successfully"
    }
  },
  "storageHeader": {
    "private": "You're viewing your private snippets. Only you can see and modify these snippets.",
    "public": "You're viewing publicly shared snippets. These snippets are read-only and visible to everyone."
  },
  "viewSwitch": {
    "private": "Private",
    "public": "Public"
  }
}
````

## File: client/src/i18n/locales/en/components/snippets/view/public.json
````json
{
  "publicSnippetContentArea": {
    "error": {
      "addSnippetToCollection": "Failed to add snippet to your collection",
      "failedLoadSnippets": "Failed to load public snippets"
    },
    "filter": {
      "byCategories": "Filtered by categories"
    },
    "info": {
      "requireAuth": "Please sign in to add this snippet to your collection"
    },
    "loadingSnippets": "Loading snippets...",
    "success": {
      "addSnippetToCollection": "Snippet added to your collection"
    }
  }
}
````

## File: client/src/i18n/locales/en/components/snippets/view/recycle.json
````json
{
  "recycleSnippetContentArea": {
    "error": {
      "deleteSnippet": "Failed to delete snippet",
      "loadSnippets": "Failed to load snippets",
      "restoreSnippet": "Failed to restore snippet",
      "sessionExpired": "Session expired. Please login again."
    },
    "filter": {
      "byCategories": "Filtered by categories"
    },
    "loadingSnippets": "Loading snippets...",
    "success": {
      "deleteSnippet": "Snippet deleted successfully",
      "restoreSnippet": "Snippet restored successfully"
    }
  },
  "recycleSnippetStorage": {
    "backToSnippets": "Back to Snippets",
    "confirmationModal": {
      "message": "Are you sure you want to permanently clear all snippets in the recycle bin? This action cannot be undone.",
      "title": "Confirm Deletion"
    },
    "description": "Snippets in the recycle bin will be permanently deleted after 30 days",
    "error": {
      "clear": "Failed to clear recycle bin. Please try again.",
      "sessionExpired": "Session expired. Please login again."
    },
    "info": {
      "noSnippets": "No snippets in the recycle bin to clear"
    },
    "recycleBin": "Recycle Bin",
    "success": {
      "clear": "All snippets in the recycle bin are cleared"
    }
  }
}
````

## File: client/src/i18n/locales/en/components/snippets/edit.json
````json
{
  "editSnippetModal": {
    "addSnippet": "Add new snippet",
    "editSnippet": "Edit snippet",
    "error": {
      "savingFailed": "An error occurred while saving the snippet. Please try again."
    },
    "form": {
      "categories": {
        "counter": "{{categories}}/{{max}} categories",
        "label": "Categories (max {{max}})",
        "placeholder": "Type a category and press Enter or comma"
      },
      "codeFragments": {
        "add": "Add new fragment",
        "label": "Code Fragments ({{fragments}})"
      },
      "description": {
        "label": "Description",
        "placeholder": "Write a short description of the snippet"
      },
      "isPublic": {
        "description": "Public snippets can be viewed by anyone without authentication",
        "label": "Make snippet public"
      },
      "title": {
        "counter": "{{characters}}/{{max}} characters",
        "label": "Title",
        "placeholder": "Enter the title of the snippet (max {{max}} characters)"
      }
    },
    "fragmentRequired": "At least one code fragment is required",
    "mustHaveFileNames": "All fragments must have file names",
    "unsavedChanges": "You have unsaved changes. Are you sure you want to close?"
  },
  "searchFiles": "Search files...",
  "noFilesFound": "No files found matching your search",
  "expandSidebar": "Expand Sidebar",
  "filterFiles": "Filter files",
  "fileExtensions": "File extensions",
  "noExtension": "No extension",
  "fragmentEditor": {
    "action": {
      "collapse": "Collapse",
      "delete": "Delete",
      "expand": "Expand"
    },
    "form": {
      "fileName": {
        "placeholder": "File name"
      },
      "language": {
        "placeholder": "Select language",
        "sections": {
          "other": "Other",
          "used": "Used"
        }
      }
    },
    "moveDown": "Move down",
    "moveUp": "Move up"
  }
}
````

## File: client/src/i18n/locales/en/components/snippets/embed.json
````json
{
  "embedCopyButton": {
    "title": "Copy to clipboard"
  },
  "embedModal": {
    "form": {
      "embedCode": "Embed Code",
      "fragmentToShow": {
        "all": "All fragments",
        "label": "Fragment to show (optional)"
      },
      "showDescription": "Show description",
      "showFileHeaders": "Show file headers",
      "showPoweredBy": "Show \"Powered by ByteStash\"",
      "showTitle": "Show title",
      "theme": "Theme"
    },
    "subTitle": "Customize Embed",
    "title": "Embed Snippet"
  },
  "embedView": {
    "error": {
      "default": "Failed to load snippet"
    }
  }
}
````

## File: client/src/i18n/locales/en/components/snippets/share.json
````json
{
  "sharedSnippetView": {
    "browsePublicSnippets": "Browse public snippets",
    "loadingSnippet": "Loading snippet...",
    "snippetExpired": "This shared snippet has expired",
    "snippetNotFound": "Snippet not found"
  },
  "shareMenu": {
    "activeShareLinks": {
      "buttons": {
        "copy": "Copy link",
        "delete": "Delete share link",
        "requiresAuth": {
          "false": "Embed snippet",
          "true": "Only unauthenticated snippets can be embedded"
        }
      },
      "date": {
        "expired": "Expired",
        "neverExpires": "Never Expires"
      },
      "noLinks": "No active share links",
      "relativeExpiryTime": "Expires in {{date}}",
      "requiresAuth": {
        "false": "Public access",
        "true": "Protected - Authentication required"
      },
      "title": "Active Share Links"
    },
    "createButtonText": "Create Share Link",
    "error": {
      "created": "Failed to create share link",
      "deleted": "Failed to delete share link",
      "invalidDuration": "Invalid duration format. Use 1h, 2d, 30m etc.",
      "load": "Failed to load shares",
      "unknownExpiryTime": "Unknown expiry time"
    },
    "expiresIn": "Expires in (e.g. 1h, 2d, 30m)",
    "expiresInPlaceholder": "Never",
    "requiresAuth": "Require authentication",
    "subTitle": "Create New Share Link",
    "success": {
      "created": "Share link created",
      "deleted": "Share link deleted"
    },
    "title": "Share Snippet"
  }
}
````

## File: client/src/i18n/locales/en/components/auth.json
````json
{
  "apiKeysModal": {
    "created": "Created",
    "createKey": "Create key",
    "deleteApiKey": "Delete API key",
    "enterKeyName": "Enter key name",
    "lastUsed": "Last used",
    "newApiKey": "New API Key (copy it now, it won't be shown again)",
    "notApiKeys": "No API keys found",
    "title": "API Keys",
    "yourApiKeys": "Your API Keys"
  },
  "authProvider": {
    "error": {
      "failedCreateAnonymousSession": "Failed to initialize anonymous session"
    },
    "info": {
      "logoutSuccess": "Successfully logged out"
    }
  },
  "changePasswordModal": {
    "confirmNewPassword": "Confirm new password",
    "currentPassword": "Current password",
    "error": {
      "default": "Failed to change password",
      "newPasswordMustBeAtLeastCharacters": "New password must be at least {{minLength}} characters",
      "newPasswordsDoNotMatch": "New passwords do not match"
    },
    "newPassword": "New password",
    "passwordChangedSuccessfully": "Password changed successfully",
    "process": "Changing password...",
    "title": "Change password"
  },
  "login": {
    "account": "account",
    "browsePublicSnippets": "browse public snippets",
    "create": "create an",
    "error": {
      "invalidUsernameOrPassword": "Invalid username or password"
    },
    "orContinueWithPassword": "Or continue with password",
    "pleaseSignInToContinue": "Please sign in to continue",
    "signingIn": "Signing in..."
  },
  "oidc": {
    "error": {
      "auth_failed": "Authentication failed. This could be due to a cancelled login attempt or an expired session. Please try again.",
      "config_error": "There was an error with the SSO configuration. Please contact your administrator.",
      "default": "An unexpected error occurred during authentication. Please try again.",
      "provider_error": "The identity provider encountered an error or is unavailable. Please try again later or contact your administrator.",
      "registration_disabled": "New account registration is currently disabled on this ByteStash instance. Please contact your administrator."
    }
  },
  "register": {
    "browsePublicSnippets": "browse public snippets",
    "creatingAccount": "Creating account...",
    "disabled": {
      "description": "New account registration is currently disabled.",
      "link": {
        "text": "Return to Login"
      },
      "title": "Registration Disabled"
    },
    "error": {
      "default": "Failed to register",
      "passwordsDoNotMatch": "Passwords do not match"
    },
    "firstAccountDescription": "This is the first account to be created. All existing snippets will be automatically migrated to this account.",
    "notAvailable": {
      "description": "Internal account registration is disabled and no SSO providers are configured. Please contact your administrator.",
      "title": "Registration Not Available"
    },
    "signInToYourAccount": "sign in to your account",
    "title": "Create Account"
  },
  "signIn": {
    "completing": "Completing sign in...",
    "with": "Sign in with {{displayName}}"
  },
  "signOut": {
    "completing": "Completing sign out..."
  },
  "userDropdown": {
    "adminPanel": "Admin panel",
    "apiKeys": "API Keys",
    "changePassword": "Change password",
    "signIn": "Sign in",
    "signOut": "Sign out"
  }
}
````

## File: client/src/i18n/locales/en/components/categories.json
````json
{
  "categoryList": {
    "moreCount": "{{moreCount}} more",
    "noData": "No categories",
    "showLess": "Show less"
  },
  "categorySuggestions": {
    "addNewLabel": "Add new",
    "placeholder": "Type to search categories...",
    "title": "Categories"
  }
}
````

## File: client/src/i18n/locales/en/components/search.json
````json
{
  "action": {
    "clear": "Clear search",
    "newSnippet": "New snippet",
    "openSettings": "Open settings",
    "recycleBin": "Recycle bin",
    "showAll": "Show all",
    "showFavorites": "Show favorites"
  },
  "categories": {
    "addNew": "Add new",
    "title": "Categories"
  },
  "defaultPlaceholder": "Search snippets... (Type # to see all available categories)",
  "filter": {
    "language": {
      "all": "All languages"
    }
  },
  "sort": {
    "alphaAsc": "Alphabetically A-Z",
    "alphaDesc": "Alphabetically Z-A",
    "newestFirst": "Newest First",
    "oldestFirst": "Oldest First"
  },
  "view": {
    "grid": "Grid view",
    "list": "List view"
  }
}
````

## File: client/src/i18n/locales/en/components/settings.json
````json
{
  "settingsModal": {
    "block": {
      "category": {
        "expandCategories": {
          "description": "Automatically expand category groups",
          "label": "Expand Categories"
        },
        "showCategories": {
          "description": "Display category labels for snippets",
          "label": "Show Categories"
        },
        "title": "Category"
      },
      "dataManagement": {
        "export": {
          "label": "Export Snippets"
        },
        "import": {
          "errors": {
            "failed": "Failed to import \"{{title}}\": {{error}}",
            "occurred_one": "{{count, number}} error occurred",
            "occurred_other": "{{count, number}} errors occurred"
          },
          "label": "Import Snippets",
          "progress": "Importing snippets..."
        },
        "title": "Data management"
      },
      "locale": {
        "title": "Locale"
      },
      "search": {
        "includeCodeInSearch": {
          "description": "Search within code content, not just titles",
          "label": "Include Code in Search"
        },
        "title": "Search"
      },
      "theme": {
        "title": "Theme"
      },
      "view": {
        "compactView": {
          "description": "Display snippets in a more condensed format",
          "label": "Compact View"
        },
        "previewLines": {
          "description": "Display a preview of the code in the snippet list",
          "label": "Show Code Preview"
        },
        "showCodePreview": {
          "description": "Maximum number of lines to show in preview (1-20)",
          "label": "Number of Preview Lines"
        },
        "showLineNumbers": {
          "description": "Display line numbers in code blocks",
          "label": "Show Line Numbers"
        },
        "title": "View"
      }
    },
    "export": {
      "error": {
        "default": "Failed to export snippets",
        "noSnippets": "No snippets available for export"
      },
      "markdown": {
        "error": {
          "default": "Failed to export Markdown"
        },
        "success": {
          "default": "Markdown export successful"
        },
        "warning": {
          "default": "No snippets available for export"
        }
      },
      "success": {
        "default": "{{total}} snippets exported successfully"
      }
    },
    "import": {
      "error": {
        "default": "Failed to import snippets"
      },
      "hasFailed": "Imported {{succeeded}} snippets, {{failed}} failed. Check console for details.",
      "successOnly_one": "Successfully imported {{succeeded}} snippets. Close settings to see them.",
      "successOnly_other": "Successfully imported {{succeeded}} snippets. Close settings to see them."
    },
    "title": "Settings"
  }
}
````

## File: client/src/i18n/locales/en/components/utils.json
````json
{
  "config": {
    "caution": "Caution",
    "important": "Important",
    "note": "Note",
    "tip": "Tip",
    "warning": "Warning"
  }
}
````

## File: client/src/i18n/locales/en/translation.json
````json
{
  "action": {
    "addSnippet": "Add snippet",
    "cancel": "Cancel",
    "changePassword": "Change password",
    "clear": "Clear",
    "clearAll": "Clear all",
    "close": "Close",
    "confirm": "Confirm",
    "createAccount": "Create account",
    "delete": "Delete",
    "edit": "Edit",
    "hidePassword": "Hide password",
    "load": "Load",
    "maximize": "Maximize",
    "minimize": "Minimize",
    "restore": "Restore",
    "save": "Save",
    "saving": "Saving...",
    "showPassword": "Show password",
    "signIn": "Sign in"
  },
  "confirmPassword": "Confirm Password",
  "loading": "Loading...",
  "locale": {
    "en": "English",
    "es": "Spanish",
    "ja": "Japanese",
    "ru": "Russian"
  },
  "no": "no",
  "or": "or",
  "pagination": {
    "next": "Next",
    "pageOf": "Page {{currentPage}} of {{totalPages}}",
    "previous": "Previous",
    "total": "{{total}} total",
    "useSnippetPagination": {
      "error": {
        "failedSnippetsLoad": "Failed to load snippets",
        "sessionExpired": "Session expired. Please login again."
      }
    }
  },
  "password": "Password",
  "showing": "Showing",
  "theme": {
    "dark": "Dark",
    "light": "Light",
    "system": "System"
  },
  "username": "Username"
}
````

## File: client/src/i18n/locales/es/components/admin/tabs/apiKeys.json
````json
{
  "apiKeyDeletedSuccessfully": "Clave API eliminada con éxito",
  "columns": {
    "labels": {
      "actions": "Acciones",
      "created": "Creado",
      "lastUsed": "Último uso",
      "name": "Nombre",
      "owner": "Propietario",
      "status": "Estado"
    }
  },
  "confirmationModal": {
    "message": "¿Estás seguro de que quieres eliminar esta clave API? El propietario de la clave ya no podrá usarla para acceder a la API. Esta acción no se puede deshacer.",
    "title": "Eliminar clave API"
  },
  "entityName_one": "clave",
  "entityName_many": "claves",
  "entityName_other": "claves",
  "error": {
    "default": "Error al eliminar la clave API"
  },
  "filters": {
    "userId": "Filtrar por ID de Usuario"
  },
  "status": {
    "active": "Activo",
    "inactive": "Inactivo"
  },
  "table": {
    "emptyMessage": "No se encontraron claves API",
    "loadingMessage": "Cargando claves API..."
  }
}
````

## File: client/src/i18n/locales/es/components/admin/tabs/dashboard.json
````json
{
  "card": {
    "apiKeys": {
      "title": "Claves API"
    },
    "shares": {
      "title": "Enlaces compartidos"
    },
    "snippets": {
      "apiKeys": {
        "active": "Activas"
      },
      "shares": {
        "total": "Total"
      },
      "title": "Fragmentos",
      "viewType": {
        "private": "Privados",
        "public": "Públicos"
      }
    },
    "users": {
      "authType": {
        "internal": "Internos",
        "oidc": "OIDC"
      },
      "title": "Usuarios"
    }
  },
  "loadingMessage": "Cargando estadísticas..."
}
````

## File: client/src/i18n/locales/es/components/admin/tabs/shares.json
````json
{
  "action": {
    "copyShareLink": "Copiar enlace",
    "delete": "Eliminar enlace",
    "viewSnippet": "Ver fragmento"
  },
  "columns": {
    "labels": {
      "actions": "Acciones",
      "auth": "Auth requerida",
      "created": "Creado",
      "expires": "Expira",
      "id": "ID de compartición",
      "owner": "Propietario",
      "title": "Título"
    }
  },
  "confirmationModal": {
    "message": "¿Estás seguro de que quieres eliminar este enlace? Cualquier persona con el enlace ya no podrá acceder al fragmento. Esta acción no se puede deshacer.",
    "title": "Eliminar enlace compartido"
  },
  "entityName_one": "enlace",
  "entityName_many": "enlaces",
  "entityName_other": "enlaces",
  "error": {
    "delete": {
      "default": "Error al eliminar el enlace"
    }
  },
  "filters": {
    "authType": {
      "all": "Todos",
      "public": "Público",
      "requiresAuth": "Requiere auth"
    },
    "userId": "Filtrar por User ID"
  },
  "success": {
    "copied": {
      "default": "Enlace copiado al portapapeles"
    },
    "delete": {
      "default": "Enlace borrado con éxito"
    }
  },
  "table": {
    "emptyMessage": "No se encontraron enlaces activos",
    "loadingMessage": "Cargando registros..."
  }
}
````

## File: client/src/i18n/locales/es/components/admin/tabs/snippets.json
````json
{
  "action": {
    "delete": "Eliminar fragmento",
    "makePrivate": "Hacer privado",
    "makePublic": "Hacer público",
    "scanForOffensiveContent": "Escanear contenido ofensivo",
    "showAllSnippets": "Mostrar todos",
    "viewSnippet": "Visualizar"
  },
  "columns": {
    "labels": {
      "actions": "Acciones",
      "fragments": "Archivos",
      "owner": "Propietario",
      "title": "Anotación",
      "updated": "Actualizado",
      "visibility": "Visibilidad"
    }
  },
  "confirmationModal": {
    "message": "¿Estás seguro de que quieres eliminar permanentemente este fragmento? Esta acción no se puede deshacer.",
    "title": "Eliminar código"
  },
  "containsOffensiveWords": "Contiene lenguaje inapropiado: {{words}}",
  "entityName_one": "fragmento",
  "entityName_many": "fragmentos",
  "entityName_other": "fragmentos",
  "error": {
    "delete": {
      "default": "Fallo al remover fragmento"
    },
    "update": {
      "default": "Error actualizando visibilidad"
    }
  },
  "filters": {
    "search": "Buscar fragmentos...",
    "userId": "User ID",
    "visibility": {
      "all": "Todo",
      "private": "Privado",
      "public": "Público"
    }
  },
  "offensiveContentMessage": "Se han detectado {{total}} {{entityName}} con contenido ofensivo",
  "success": {
    "delete": {
      "default": "Fragmento eliminado exitosamente"
    },
    "update": {
      "default": "Visibilidad editada"
    }
  },
  "table": {
    "emptyMessage": "Lista completamente vacía",
    "loadingMessage": "Refrescando fragmentos..."
  }
}
````

## File: client/src/i18n/locales/es/components/admin/tabs/users.json
````json
{
  "action": {
    "activate": "Habilitar usuario",
    "deactivate": "Inhabilitar usuario",
    "delete": "Borrar usuario"
  },
  "columns": {
    "labels": {
      "actions": "Eventos",
      "apiKeysCount": "Claves",
      "authType": "Tipo de ingreso",
      "created": "Registro",
      "email": "Correo electrónico",
      "lastLogin": "Último ingreso",
      "snippetsCount": "Fragmentos",
      "status": "Estado de la cuenta",
      "username": "Usuario"
    }
  },
  "confirmationModal": {
    "message": "¿Confirmas el borrado de esta persona? Se destruirán de forma absoluta sus fragmentos, contraseñas API y datos compartidos. Esto no se puede revertir.",
    "title": "Borrado de cuenta permanentemente"
  },
  "entityName_one": "usuario",
  "entityName_many": "usuarios",
  "entityName_other": "usuarios",
  "error": {
    "delete": {
      "default": "No se pudo borrar al usuario"
    },
    "update": {
      "default": "Error afectando el estado del usuario"
    }
  },
  "filters": {
    "authType": {
      "all": "Tipos autorizados",
      "internal": "Público (ByteStash)",
      "oidc": "SSO (OIDC)"
    },
    "search": "Buscar por email o alias...",
    "status": {
      "active": "Solamente cuentas activas",
      "all": "Todos los perfiles",
      "inactive": "Vetados / Inactivos"
    }
  },
  "status": {
    "active": "Estable",
    "inactive": "Inactivo"
  },
  "success": {
    "delete": {
      "default": "El usuario ya no existe"
    },
    "update": {
      "default": "Modificación aplicada correctamente"
    }
  },
  "table": {
    "emptyMessage": "Nadie encontrado",
    "loadingMessage": "Validando sesiones de red..."
  }
}
````

## File: client/src/i18n/locales/es/components/admin/common.json
````json
{
  "adminTable": {
    "defaultEmptyMessage": "No se encontraron datos",
    "defaultLoadingMessage": "Cargando..."
  },
  "filterInput": {
    "defaultPlaceholder": "Buscar..."
  },
  "filterSelect": {
    "defaultPlaceholder": "Seleccionar..."
  }
}
````

## File: client/src/i18n/locales/es/components/admin/modals.json
````json
{
  "snippetViewModal": {
    "error": {
      "failedLoad": "Error al intentar cargar el fragmento"
    },
    "title": "Cargando fragmento..."
  }
}
````

## File: client/src/i18n/locales/es/components/admin/selector.json
````json
{
  "apiKeys": "Claves API",
  "dashboard": "Panel de control",
  "shares": "Compartidos",
  "snippets": "Fragmentos",
  "users": "Usuarios"
}
````

## File: client/src/i18n/locales/es/components/common/buttons.json
````json
{
  "copyButton": {
    "title": "Copiar al portapapeles"
  },
  "downloadArchiveButton": {
    "error": {
      "failedDownload": "Error al descargar comprimido"
    },
    "fileLabel_one": "{{count, number}} archivo",
    "fileLabel_many": "{{count, number}} archivos",
    "fileLabel_other": "{{count, number}} archivos",
    "label": "Descargar todos",
    "success": {
      "downloadedAll": "Todos los fragmentos descargados"
    },
    "title": "Descargar todos los archivos como ZIP"
  },
  "downloadButton": {
    "error": {
      "failedDownload": "Error al descargar archivo"
    },
    "success": {
      "downloaded": "\"{{fileName}}\" descargado con éxito"
    },
    "title": "Descargar {{fileName}}",
    "warning": {
      "nothing": "Nada que descargar"
    }
  },
  "exportButton": {
    "title": "Exportar como imagen",
    "tooltip": "Exportar"
  },
  "exportModal": {
    "copyClipboard": "Copiar",
    "downloadPng": "Descargar PNG",
    "downloadSvg": "Descargar SVG",
    "errorCopy": "Error al copiar la imagen",
    "errorGenerate": "Error al generar la imagen",
    "shareLinkedIn": "Compartir en LinkedIn",
    "shareTwitter": "Compartir en X",
    "successCopy": "¡Imagen copiada al portapapeles!",
    "title": "Exportar código"
  },
  "fileUploadButton": {
    "error": {
      "unknown": "Error desconocido"
    },
    "info": {
      "duplicateDetected": "Archivo duplicado",
      "duplicatesDetected_one": "{{count, number}} archivo duplicado",
      "duplicatesDetected_many": "{{count, number}} archivos duplicados",
      "duplicatesDetected_other": "{{count, number}} archivos duplicados"
    },
    "label": "Subir código(s)",
    "loadFromUrl": {
      "contentMaxSizeError": "El contenido debe ser menor a {{max}}",
      "invalidUrl": "Escribe una URL válida",
      "label": "Cargar desde URL",
      "title": "Cargar código desde URL externa"
    },
    "success": {
      "filesUploaded_one": "{{count, number}} archivo subido",
      "filesUploaded_many": "{{count, number}} archivos subidos",
      "filesUploaded_other": "{{count, number}} archivos subidos",
      "fileUploaded": "\"{{fileName}}\" subido con éxito",
      "someFilesUploaded": "{{successCount}} de {{total}} archivos subidos"
    },
    "title": "Añade archivos crudos"
  },
  "rawButton": {
    "title": "Visualizar código original"
  }
}
````

## File: client/src/i18n/locales/es/components/common/dropdowns.json
````json
{
  "baseDropdown": {
    "addNewLabel": "Añadir nuevo",
    "defaultPlaceholder": "Selecciona o escribe un valor"
  }
}
````

## File: client/src/i18n/locales/es/components/common/markdown.json
````json
{
  "mermaid": {
    "copyCode": "Copiar código Mermaid",
    "downloadPNG": "Descargar como PNG",
    "downloadSVG": "Descargar como SVG",
    "exitFullscreen": "Salir de pantalla completa",
    "fullscreen": "Pantalla completa",
    "renderError": "Error al renderizar el diagrama Mermaid:",
    "renderErrorFallback": "Error al renderizar el gráfico",
    "resetView": "Restaurar vista",
    "title": "Diagrama de Mermaid",
    "zoomIn": "Acercar",
    "zoomOut": "Alejar"
  }
}
````

## File: client/src/i18n/locales/es/components/common/modals.json
````json
{
  "changelogModal": {
    "error": {
      "default": "Error al cargar el registro de cambios. Inténtalo más tarde."
    }
  }
}
````

## File: client/src/i18n/locales/es/components/snippets/list/snippetCard.json
````json
{
  "confirmationModalDelete": {
    "confirmLabel": {
      "isRecycleView": {
        "false": "Mover a la papelera",
        "true": "Eliminar permanentemente"
      }
    },
    "message": {
      "isRecycleView": {
        "false": "¿Estás seguro de que quieres enviar \"{{title}}\" a la papelera?",
        "true": "¿Estás seguro de que quieres eliminar \"{{title}}\" de forma permanente? Esta acción no se puede deshacer."
      }
    },
    "title": {
      "isRecycleView": {
        "false": "Mover a la papelera",
        "true": "Confirmar eliminación"
      }
    }
  },
  "confirmationModalRestore": {
    "message": "¿Estás seguro de que deseas restaurar \"{{title}}\"?",
    "title": "Confirmar restauración"
  },
  "date": {
    "ago": "Hace {{date}}",
    "expiringSoon": "A punto de caducar",
    "left": "Quedan {{date}}"
  },
  "defaultDescription": "No hay descripción disponible",
  "defaultUpdateTime": "Desconocido",
  "favorite": "Favorito",
  "pinned": "Fijado",
  "public": "Público",
  "shared": "Compartido"
}
````

## File: client/src/i18n/locales/es/components/snippets/list/snippetCardMenu.json
````json
{
  "addToFavorites": "Añadir a favoritos",
  "deleteSnippet": "Eliminar fragmento",
  "duplicateSnippet": "Duplicar fragmento",
  "editSnippet": "Editar fragmento",
  "openInNewTab": "Abrir en nueva pestaña",
  "pinSnippet": "Fijar fragmento",
  "removeFromFavorites": "Quitar de favoritos",
  "shareSnippet": "Compartir código",
  "unpinSnippet": "Desfijar fragmento"
}
````

## File: client/src/i18n/locales/es/components/snippets/list/snippetList.json
````json
{
  "noSnippetsMatch": "Ningún fragmento coincide con tu búsqueda actual"
}
````

## File: client/src/i18n/locales/es/components/snippets/list/snippetRecycleCardMenu.json
````json
{
  "deleteSnippet": "Destruir fragmento",
  "restoreSnippet": "Restaurar a mi colección"
}
````

## File: client/src/i18n/locales/es/components/snippets/view/all.json
````json
{
  "fullCodeView": {
    "dateTimeAgo": "Hace {{dateTime}}",
    "defaultDescription": "Sin descripción disponible"
  },
  "files": "archivos",
  "collapseSidebar": "Contraer panel",
  "expandSidebar": "Expandir panel",
  "searchFiles": "Buscar archivos...",
  "noFilesFound": "No se encontraron archivos que coincidan con tu búsqueda",
  "filterFiles": "Filtrar archivos",
  "fileExtensions": "Extensiones de archivo",
  "noExtension": "Sin extensión",
  "snippetModal": {
    "confirmationModal": {
      "confirmLabel": {
        "isRecycleView": {
          "false": "Enviar a Papelera",
          "true": "Eliminar definitivamente"
        }
      },
      "message": {
        "isRecycleView": {
          "false": "¿Seguro que deseas enviar \"{{title}}\" a la papelera de reciclaje?",
          "true": "¿Confirmas la eliminación permanente de \"{{title}}\"? Esta acción no tiene marcha atrás."
        }
      },
      "title": {
        "isRecycleView": {
          "false": "Confirmar Papelera",
          "true": "Borrado irreversible"
        }
      }
    }
  }
}
````

## File: client/src/i18n/locales/es/components/snippets/view/common.json
````json
{
  "authAwareSnippetView": {
    "error": {
      "snippetLoad": "Error al cargar el fragmento",
      "snippetRequireAuth": "Este fragmento requiere autenticación para ser visto"
    }
  },
  "baseSnippetStorage": {
    "error": {
      "sessionExpired": "Sesión caducada. Por favor, inicia sesión de nuevo.",
      "snippetCreated": "Error al crear el fragmento",
      "snippetUpdated": "Error al actualizar el fragmento"
    },
    "success": {
      "displayAll": "Mostrando todos los fragmentos",
      "displayFavorites": "Mostrando fragmentos favoritos",
      "snippetCreated": "Nuevo fragmento creado exitosamente",
      "snippetUpdated": "Fragmento actualizado exitosamente"
    }
  },
  "browsePublicSnippets": "Explorar fragmentos públicos",
  "filter": {
    "filteredByCategories": "Filtrado por categorías"
  },
  "loadingSnippets": "Cargando fragmentos...",
  "signIn": "Iniciar sesión",
  "sippetNotFound": "Fragmento no encontrado",
  "snippetContentArea": {
    "error": {
      "duplicateSnippet": "Error al duplicar el fragmento",
      "loadSnippets": "Error al cargar los fragmentos",
      "moveSnippetToRecycleBin": "Error al mover el fragmento a la papelera. Por favor, inténtalo de nuevo.",
      "sessionExpired": "Sesión caducada. Por favor, inicia sesión de nuevo.",
      "updateFavoriteStatusAdded": "Error al actualizar estado de favorito. Por favor, inténtalo de nuevo.",
      "updateFavoriteStatusDeleted": "Error al quitar de favoritos. Por favor, inténtalo de nuevo.",
      "updatePinStatusAdded": "Error al actualizar estado de fijado. Por favor, inténtalo de nuevo.",
      "updatePinStatusDeleted": "Error al quitar fijado. Por favor, inténtalo de nuevo."
    },
    "success": {
      "duplicateSnippet": "Fragmento duplicado exitosamente",
      "moveSnippetToRecycleBin": "Fragmento movido a la papelera exitosamente",
      "updateFavoriteStatusAdded": "Fragmento agregado a favoritos exitosamente",
      "updateFavoriteStatusDeleted": "Fragmento eliminado de favoritos exitosamente",
      "updatePinStatusAdded": "Fragmento fijado exitosamente",
      "updatePinStatusDeleted": "Fragmento desfijado exitosamente"
    }
  },
  "storageHeader": {
    "private": "Estás viendo tus fragmentos privados. Solo tú puedes ver y modificar estos fragmentos.",
    "public": "Estás viendo fragmentos compartidos públicamente. Estos fragmentos son de solo lectura y visibles para todos."
  },
  "viewSwitch": {
    "private": "Privado",
    "public": "Público"
  }
}
````

## File: client/src/i18n/locales/es/components/snippets/view/public.json
````json
{
  "publicSnippetContentArea": {
    "error": {
      "addSnippetToCollection": "Error al agregar el fragmento a tu colección",
      "failedLoadSnippets": "Error al cargar los fragmentos públicos"
    },
    "filter": {
      "byCategories": "Filtrado por categorías"
    },
    "info": {
      "requireAuth": "Por favor, inicia sesión para agregar este fragmento a tu colección"
    },
    "loadingSnippets": "Cargando fragmentos...",
    "success": {
      "addSnippetToCollection": "Fragmento agregado a tu colección"
    }
  }
}
````

## File: client/src/i18n/locales/es/components/snippets/view/recycle.json
````json
{
  "recycleSnippetContentArea": {
    "error": {
      "deleteSnippet": "Error al eliminar el fragmento",
      "loadSnippets": "Error al cargar los fragmentos",
      "restoreSnippet": "Error al restaurar el fragmento",
      "sessionExpired": "Sesión caducada. Por favor, inicia sesión de nuevo."
    },
    "filter": {
      "byCategories": "Filtrado por categorías"
    },
    "loadingSnippets": "Cargando fragmentos...",
    "success": {
      "deleteSnippet": "Fragmento eliminado exitosamente",
      "restoreSnippet": "Fragmento restaurado exitosamente"
    }
  },
  "recycleSnippetStorage": {
    "backToSnippets": "Volver a fragmentos",
    "confirmationModal": {
      "message": "¿Estás seguro de que quieres eliminar permanentemente todos los fragmentos en la papelera de reciclaje? Esta acción no se puede deshacer.",
      "title": "Confirmar eliminación"
    },
    "description": "Los fragmentos en la papelera de reciclaje serán eliminados permanentemente después de 30 días",
    "error": {
      "clear": "Error al vaciar la papelera de reciclaje. Por favor, inténtalo de nuevo.",
      "sessionExpired": "Sesión caducada. Por favor, inicia sesión de nuevo."
    },
    "info": {
      "noSnippets": "No hay fragmentos en la papelera de reciclaje para vaciar"
    },
    "recycleBin": "Papelera de reciclaje",
    "success": {
      "clear": "Todos los fragmentos en la papelera de reciclaje han sido eliminados"
    }
  }
}
````

## File: client/src/i18n/locales/es/components/snippets/edit.json
````json
{
  "editSnippetModal": {
    "addSnippet": "Añadir fragmento",
    "editSnippet": "Editar fragmento",
    "error": {
      "savingFailed": "Ocurrió un error al guardar el código. Por favor, inténtalo de nuevo."
    },
    "form": {
      "categories": {
        "counter": "{{categories}}/{{max}} categorías",
        "label": "Categorías (max {{max}})",
        "placeholder": "Escribe una categoría y pulsa Enter"
      },
      "codeFragments": {
        "add": "Añadir nuevo archivo",
        "label": "Archivos o módulos ({{fragments}})"
      },
      "description": {
        "label": "Descripción",
        "placeholder": "Escribe una breve descripción para este snippet (Markdown soportado)"
      },
      "isPublic": {
        "description": "Los archivos públicos pueden ser vistos por cualquier persona mediante una URL abierta",
        "label": "Hacer fragmento público"
      },
      "title": {
        "counter": "{{characters}}/{{max}} caracteres",
        "label": "Título del paquete",
        "placeholder": "Nombra tu fragmento (max {{max}} caracteres)"
      }
    },
    "fragmentRequired": "Se requiere al menos un fragmento de código",
    "mustHaveFileNames": "Todos los fragmentos deben tener nombres de archivo referenciados",
    "unsavedChanges": "Tienes cambios sin guardar. ¿Seguro que quieres cerrar?"
  },
  "searchFiles": "Buscar archivos...",
  "noFilesFound": "No se encontraron archivos que coincidan con tu búsqueda",
  "expandSidebar": "Expandir panel",
  "filterFiles": "Filtrar archivos",
  "fileExtensions": "Extensiones de archivo",
  "noExtension": "Sin extensión",
  "fragmentEditor": {
    "action": {
      "collapse": "Colapsar",
      "delete": "Eliminar módulo",
      "expand": "Expandir"
    },
    "form": {
      "fileName": {
        "placeholder": "Nombre del archivo"
      },
      "language": {
        "placeholder": "Seleccionar lenguaje",
        "sections": {
          "other": "Otro",
          "used": "Usado"
        }
      }
    },
    "moveDown": "Mover abajo",
    "moveUp": "Mover arriba"
  }
}
````

## File: client/src/i18n/locales/es/components/snippets/embed.json
````json
{
  "embedCopyButton": {
    "title": "Copiar al portapapeles"
  },
  "embedModal": {
    "form": {
      "embedCode": "Código de Inserción",
      "fragmentToShow": {
        "all": "Todos los fragmentos",
        "label": "Fragmento a mostrar (opcional)"
      },
      "showDescription": "Mostrar descripción",
      "showFileHeaders": "Mostrar cabeceras de los archivos",
      "showPoweredBy": "Mostrar \"Desarrollado por ByteStash\"",
      "showTitle": "Mostrar título",
      "theme": "Tema"
    },
    "subTitle": "Personalizar Inserción",
    "title": "Insertar Fragmento"
  },
  "embedView": {
    "error": {
      "default": "Error al cargar el fragmento"
    }
  }
}
````

## File: client/src/i18n/locales/es/components/snippets/share.json
````json
{
  "sharedSnippetView": {
    "browsePublicSnippets": "Explorar fragmentos públicos",
    "loadingSnippet": "Cargando fragmento...",
    "snippetExpired": "Este enlace compartido ha caducado",
    "snippetNotFound": "Fragmento no encontrado"
  },
  "shareMenu": {
    "activeShareLinks": {
      "buttons": {
        "copy": "Copiar enlace",
        "delete": "Borrar enlace",
        "requiresAuth": {
          "false": "Insertar fragmento",
          "true": "Sólo los fragmentos sin autenticación pueden ser insertados"
        }
      },
      "date": {
        "expired": "Caducado",
        "neverExpires": "Nunca caduca"
      },
      "noLinks": "No hay comparticiones activas",
      "relativeExpiryTime": "Caduca en {{date}}",
      "requiresAuth": {
        "false": "Acceso público",
        "true": "Protegido - Requiere autenticación"
      },
      "title": "Enlaces Activos"
    },
    "createButtonText": "Crear enlace",
    "error": {
      "created": "Error al crear la compartición",
      "deleted": "Error al eliminar el enlace",
      "invalidDuration": "Duración inválida. Usa 1h, 2d, 30m etc.",
      "load": "Error al cargar la lista de comparticiones",
      "unknownExpiryTime": "Tiempo de caducidad desconocido"
    },
    "expiresIn": "Caduca en (ej. 1h, 2d, 30m)",
    "expiresInPlaceholder": "Nunca",
    "requiresAuth": "Requerir autenticación",
    "subTitle": "Crear un nuevo enlace compartido",
    "success": {
      "created": "Enlace creado",
      "deleted": "Enlace eliminado exitosamente"
    },
    "title": "Compartir Fragmento"
  }
}
````

## File: client/src/i18n/locales/es/components/auth.json
````json
{
  "apiKeysModal": {
    "created": "Creado",
    "createKey": "Crear clave",
    "deleteApiKey": "Eliminar clave API",
    "enterKeyName": "Introduce el nombre de la clave",
    "lastUsed": "Último uso",
    "newApiKey": "Nueva clave API (cópiala ahora, no se volverá a mostrar)",
    "notApiKeys": "No se encontraron claves API",
    "title": "Claves API",
    "yourApiKeys": "Tus Claves API"
  },
  "authProvider": {
    "error": {
      "failedCreateAnonymousSession": "Error al crear sesión anónima"
    },
    "info": {
      "logoutSuccess": "Sesión cerrada con éxito"
    }
  },
  "changePasswordModal": {
    "confirmNewPassword": "Confirmar nueva contraseña",
    "currentPassword": "Contraseña actual",
    "error": {
      "default": "Error al cambiar contraseña",
      "newPasswordMustBeAtLeastCharacters": "La nueva contraseña debe tener al menos {{minLength}} caracteres",
      "newPasswordsDoNotMatch": "Las nuevas contraseñas no coinciden"
    },
    "newPassword": "Nueva contraseña",
    "passwordChangedSuccessfully": "Contraseña cambiada con éxito",
    "process": "Cambiando contraseña...",
    "title": "Cambiar contraseña"
  },
  "login": {
    "account": "cuenta",
    "browsePublicSnippets": "explorar fragmentos públicos",
    "create": "crear una",
    "error": {
      "invalidUsernameOrPassword": "Usuario o contraseña inválidos"
    },
    "orContinueWithPassword": "O continuar con contraseña",
    "pleaseSignInToContinue": "Por favor, inicia sesión para continuar",
    "signingIn": "Iniciando sesión..."
  },
  "oidc": {
    "error": {
      "auth_failed": "Fallo de autenticación. Esto puede deberse a un intento cancelado o una sesión caducada. Por favor, inténtalo de nuevo.",
      "config_error": "Hubo un error con la configuración de SSO. Por favor, contacta a tu administrador.",
      "default": "Ocurrió un error inesperado durante la autenticación. Por favor, inténtalo de nuevo.",
      "provider_error": "El proveedor de identidad encontró un error o no está disponible. Por favor, inténtalo de nuevo más tarde.",
      "registration_disabled": "El registro de cuentas está desactivado en esta instancia. Por favor, contacta a tu administrador."
    }
  },
  "register": {
    "browsePublicSnippets": "explorar fragmentos públicos",
    "creatingAccount": "Creando cuenta...",
    "disabled": {
      "description": "El registro de nuevas cuentas está actualmente desactivado.",
      "link": {
        "text": "Volver a iniciar sesión"
      },
      "title": "Registro desactivado"
    },
    "error": {
      "default": "Error al registrar cuenta",
      "passwordsDoNotMatch": "Las contraseñas no coinciden"
    },
    "firstAccountDescription": "Esta es la primera cuenta que se creará. Todos los fragmentos existentes se migrarán automáticamente a esta cuenta.",
    "notAvailable": {
      "description": "El registro interno está desactivado y no hay proveedores de SSO configurados. Contacta a tu administrador.",
      "title": "Registro no disponible"
    },
    "signInToYourAccount": "inicia sesión en tu cuenta",
    "title": "Crear cuenta"
  },
  "signIn": {
    "completing": "Completando inicio de sesión...",
    "with": "Iniciar sesión con {{displayName}}"
  },
  "signOut": {
    "completing": "Completando cierre de sesión..."
  },
  "userDropdown": {
    "adminPanel": "Panel de administración",
    "apiKeys": "Claves API",
    "changePassword": "Cambiar contraseña",
    "signIn": "Iniciar sesión",
    "signOut": "Cerrar sesión"
  }
}
````

## File: client/src/i18n/locales/es/components/categories.json
````json
{
  "categoryList": {
    "moreCount": "{{moreCount}} más",
    "noData": "Sin categorías",
    "showLess": "Mostrar menos"
  },
  "categorySuggestions": {
    "addNewLabel": "Añadir nueva",
    "placeholder": "Buscar categorías...",
    "title": "Categorías"
  }
}
````

## File: client/src/i18n/locales/es/components/search.json
````json
{
  "action": {
    "clear": "Limpiar búsqueda",
    "newSnippet": "Nuevo fragmento",
    "openSettings": "Abrir ajustes",
    "recycleBin": "Papelera",
    "showAll": "Mostrar todos",
    "showFavorites": "Mostrar favoritos"
  },
  "categories": {
    "addNew": "Añadir nueva",
    "title": "Categorías"
  },
  "defaultPlaceholder": "Buscar fragmentos... (Escribe # para ver las categorías)",
  "filter": {
    "language": {
      "all": "Todos los lenguajes"
    }
  },
  "sort": {
    "alphaAsc": "Alfabéticamente A-Z",
    "alphaDesc": "Alfabéticamente Z-A",
    "newestFirst": "Recientes primero",
    "oldestFirst": "Antiguos primero"
  },
  "view": {
    "grid": "Vista cuadrícula",
    "list": "Vista lista"
  }
}
````

## File: client/src/i18n/locales/es/components/settings.json
````json
{
  "settingsModal": {
    "block": {
      "category": {
        "expandCategories": {
          "description": "Expandir grupos de categorías automáticamente",
          "label": "Expandir categorías"
        },
        "showCategories": {
          "description": "Mostrar etiquetas de categoría en fragmentos",
          "label": "Mostrar categorías"
        },
        "title": "Categoría"
      },
      "dataManagement": {
        "export": {
          "label": "Exportar fragmentos"
        },
        "import": {
          "errors": {
            "failed": "Fallo al importar \"{{title}}\": {{error}}",
            "occurred_one": "Ocurrió {{count, number}} error",
            "occurred_many": "Ocurrieron {{count, number}} errores",
            "occurred_other": "Ocurrieron {{count, number}} errores"
          },
          "label": "Importar fragmentos",
          "progress": "Importando fragmentos..."
        },
        "title": "Gestión de datos"
      },
      "locale": {
        "title": "Idioma"
      },
      "search": {
        "includeCodeInSearch": {
          "description": "Buscar dentro del contenido de código, no solo títulos",
          "label": "Incluir código en búsqueda"
        },
        "title": "Buscar"
      },
      "theme": {
        "title": "Tema"
      },
      "view": {
        "compactView": {
          "description": "Mostrar fragmentos de forma condensada",
          "label": "Vista compacta"
        },
        "previewLines": {
          "description": "Mostrar una vista previa del código en la lista",
          "label": "Mostrar vista previa"
        },
        "showCodePreview": {
          "description": "Número máximo de líneas en la vista previa (1-20)",
          "label": "Líneas de vista previa"
        },
        "showLineNumbers": {
          "description": "Mostrar números de línea en bloques de código",
          "label": "Mostrar números de línea"
        },
        "title": "Vista"
      }
    },
    "export": {
      "error": {
        "default": "Error al exportar fragmentos",
        "noSnippets": "No hay fragmentos para exportar"
      },
      "markdown": {
        "error": {
          "default": "Error al exportar a Markdown"
        },
        "success": {
          "default": "Exportación a Markdown exitosa"
        },
        "warning": {
          "default": "No hay fragmentos para exportar"
        }
      },
      "success": {
        "default": "{{total}} fragmentos exportados con éxito"
      }
    },
    "import": {
      "error": {
        "default": "Error al importar fragmentos"
      },
      "hasFailed": "Se importaron {{succeeded}} fragmentos, {{failed}} fallaron. Revisa la consola para detalles.",
      "successOnly_one": "Se ha importado {{succeeded}} fragmento. Cierra los ajustes para verlo.",
      "successOnly_many": "Se han importado {{succeeded}} fragmentos. Cierra los ajustes para verlos.",
      "successOnly_other": "Se han importado {{succeeded}} fragmentos. Cierra los ajustes para verlos."
    },
    "title": "Ajustes genéricos"
  }
}
````

## File: client/src/i18n/locales/es/components/utils.json
````json
{
  "config": {
    "caution": "Precaución",
    "important": "Importante",
    "note": "Nota",
    "tip": "Consejo",
    "warning": "Advertencia"
  }
}
````

## File: client/src/i18n/locales/es/files.txt
````
C:\ByteStash\client\src\i18n\locales\en\translation.json
C:\ByteStash\client\src\i18n\locales\en\components\auth.json
C:\ByteStash\client\src\i18n\locales\en\components\categories.json
C:\ByteStash\client\src\i18n\locales\en\components\search.json
C:\ByteStash\client\src\i18n\locales\en\components\settings.json
C:\ByteStash\client\src\i18n\locales\en\components\utils.json
C:\ByteStash\client\src\i18n\locales\en\components\admin\common.json
C:\ByteStash\client\src\i18n\locales\en\components\admin\modals.json
C:\ByteStash\client\src\i18n\locales\en\components\admin\selector.json
C:\ByteStash\client\src\i18n\locales\en\components\admin\tabs\apiKeys.json
C:\ByteStash\client\src\i18n\locales\en\components\admin\tabs\dashboard.json
C:\ByteStash\client\src\i18n\locales\en\components\admin\tabs\shares.json
C:\ByteStash\client\src\i18n\locales\en\components\admin\tabs\snippets.json
C:\ByteStash\client\src\i18n\locales\en\components\admin\tabs\users.json
C:\ByteStash\client\src\i18n\locales\en\components\common\buttons.json
C:\ByteStash\client\src\i18n\locales\en\components\common\dropdowns.json
C:\ByteStash\client\src\i18n\locales\en\components\common\markdown.json
C:\ByteStash\client\src\i18n\locales\en\components\common\modals.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\edit.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\embed.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\share.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\list\snippetCard.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\list\snippetCardMenu.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\list\snippetList.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\list\snippetRecycleCardMenu.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\view\all.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\view\common.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\view\public.json
C:\ByteStash\client\src\i18n\locales\en\components\snippets\view\recycle.json
````

## File: client/src/i18n/locales/es/translation.json
````json
{
  "action": {
    "addSnippet": "Añadir fragmento",
    "cancel": "Cancelar",
    "changePassword": "Cambiar contraseña",
    "clear": "Limpiar",
    "clearAll": "Limpiar todo",
    "close": "Cerrar",
    "confirm": "Confirmar",
    "createAccount": "Crear cuenta",
    "delete": "Eliminar",
    "edit": "Editar",
    "hidePassword": "Ocultar contraseña",
    "load": "Cargar",
    "maximize": "Maximizar",
    "minimize": "Minimizar",
    "restore": "Restaurar",
    "save": "Guardar",
    "saving": "Guardando...",
    "showPassword": "Mostrar contraseña",
    "signIn": "Iniciar sesión"
  },
  "confirmPassword": "Confirmar contraseña",
  "loading": "Cargando...",
  "locale": {
    "en": "Inglés",
    "es": "Español",
    "ja": "Japonés",
    "ru": "Ruso"
  },
  "no": "no",
  "or": "o",
  "pagination": {
    "next": "Siguiente",
    "pageOf": "Página {{currentPage}} de {{totalPages}}",
    "previous": "Anterior",
    "total": "{{total}} en total",
    "useSnippetPagination": {
      "error": {
        "failedSnippetsLoad": "Error al cargar fragmentos",
        "sessionExpired": "Sesión caducada. Por favor, inicia sesión de nuevo."
      }
    }
  },
  "password": "Contraseña",
  "showing": "Mostrando",
  "theme": {
    "dark": "Oscuro",
    "light": "Claro",
    "system": "Sistema"
  },
  "username": "Nombre de usuario"
}
````

## File: client/src/i18n/locales/it/components/admin/tabs/apiKeys.json
````json
{
  "apiKeyDeletedSuccessfully": "Chiave API cancellata con successo",
  "columns": {
    "labels": {
      "actions": "Azioni",
      "created": "Creata",
      "lastUsed": "Ultimo utilizzo",
      "name": "Nome",
      "owner": "Proprietario",
      "status": "Stato"
    }
  },
  "confirmationModal": {
    "message": "Sei sicuro di voler cancellare questa chiave API? Il suo proprietario non sarà più in grado di accedere all'API. L'azione non può esser annullata.",
    "title": "Cancella Chiave API"
  },
  "entityName_one": "Chiave API",
  "entityName_other": "Chiavi API",
  "error": {
    "default": "Errore cancellazione chiave API"
  },
  "filters": {
    "userId": "Filtra per ID Utente"
  },
  "status": {
    "active": "Attivo",
    "inactive": "Disattivo"
  },
  "table": {
    "emptyMessage": "Nessuna chiave API trovata",
    "loadingMessage": "Caricamento chiavi API..."
  }
}
````

## File: client/src/i18n/locales/it/components/admin/tabs/dashboard.json
````json
{
  "card": {
    "apiKeys": {
      "title": "Chiavi API"
    },
    "shares": {
      "title": "Condivisioni"
    },
    "snippets": {
      "apiKeys": {
        "active": "Attivo"
      },
      "shares": {
        "total": "Totale"
      },
      "title": "Snippets",
      "viewType": {
        "private": "Privato",
        "public": "Pubblico"
      }
    },
    "users": {
      "authType": {
        "internal": "Interno",
        "oidc": "OIDC"
      },
      "title": "Utenti"
    }
  },
  "loadingMessage": "Caricamento statistiche..."
}
````

## File: client/src/i18n/locales/it/components/admin/tabs/shares.json
````json
{
  "action": {
    "copyShareLink": "Copia link di condivisione",
    "delete": "Cancella condivisione",
    "viewSnippet": "Mostra snippet"
  },
  "columns": {
    "labels": {
      "actions": "Azioni",
      "auth": "Autenticazione necessaria",
      "created": "Creato",
      "expires": "Scade",
      "id": "ID Condivisione",
      "owner": "Proprietario",
      "title": "Titolo"
    }
  },
  "confirmationModal": {
    "message": "Sei sicuro di voler cancellare questo link di condivisione? Chiunque con il vecchio link non sarà più in grado di accedere a questo snippet. L'azione non può essere annullata.",
    "title": "Cancella condivisione"
  },
  "entityName_one": "condivisione",
  "entityName_other": "condivisioni",
  "error": {
    "delete": {
      "default": "Errore cancellazione condivisione"
    }
  },
  "filters": {
    "authType": {
      "all": "Tutti i tipi di Autenticazione",
      "public": "Pubblico",
      "requiresAuth": "Richiede Autenticazione"
    },
    "userId": "Filtra per ID Utente"
  },
  "success": {
    "copied": {
      "default": "Link di condivisione copiato negli appunti"
    },
    "delete": {
      "default": "Link di condivisione cancellato con successo"
    }
  },
  "table": {
    "emptyMessage": "Nessun Link di condivisione trovato",
    "loadingMessage": "Caricamento condivisioni..."
  }
}
````

## File: client/src/i18n/locales/it/components/admin/tabs/snippets.json
````json
{
  "action": {
    "delete": "Cancella snippet",
    "makePrivate": "Rendi privato",
    "makePublic": "Rendi pubblico",
    "scanForOffensiveContent": "Scansione per Contenuti Offensivi",
    "showAllSnippets": "Mostra tutti gli Snippet",
    "viewSnippet": "Mostra snippet"
  },
  "columns": {
    "labels": {
      "actions": "Azioni",
      "fragments": "Frammenti",
      "owner": "Proprietario",
      "title": "Titolo",
      "updated": "Aggiornato",
      "visibility": "Visibilità"
    }
  },
  "confirmationModal": {
    "message": "Sei sicuro di voler cancellare permanentemente questo snippet? L'azione non può esser annullata.",
    "title": "Cancella snippet"
  },
  "containsOffensiveWords": "Contiene paroli offensive: {{words}}",
  "entityName_one": "snippet",
  "entityName_other": "snippets",
  "error": {
    "delete": {
      "default": "Errore cancellazione snippet"
    },
    "update": {
      "default": "Errore aggiornamento visibilità snippet"
    }
  },
  "filters": {
    "search": "Ricerca snippets...",
    "userId": "ID Utente",
    "visibility": {
      "all": "Tutte le visibilità",
      "private": "Privato",
      "public": "Pubblico"
    }
  },
  "offensiveContentMessage": "Trovati {{total}} {{entityName}} con contenuto offensivo",
  "success": {
    "delete": {
      "default": "Snippet cancellato con successo"
    },
    "update": {
      "default": "Visibilità Snippet aggiornata"
    }
  },
  "table": {
    "emptyMessage": "Nessun snippet trovato",
    "loadingMessage": "Caricamento snippet..."
  }
}
````

## File: client/src/i18n/locales/it/components/admin/tabs/users.json
````json
{
  "action": {
    "activate": "Attiva Utente",
    "deactivate": "Disattiva Utente",
    "delete": "Cancella Utente"
  },
  "columns": {
    "labels": {
      "actions": "Azioni",
      "apiKeysCount": "Chiavi API",
      "authType": "Tipo Autenticazione",
      "created": "Creato",
      "email": "Email",
      "lastLogin": "Ultimo Accesso",
      "snippetsCount": "Snippets",
      "status": "Stato",
      "username": "Nome Utente"
    }
  },
  "confirmationModal": {
    "message": "Sei sicuro di voler cancellare questo utente? Questo cancellerà tutti i suoi snippet , chiavi api e link di condivisione . L'azione non può essere annullata.",
    "title": "Delete user"
  },
  "entityName_one": "utente",
  "entityName_other": "usenti",
  "error": {
    "delete": {
      "default": "Errore cancellazione utente"
    },
    "update": {
      "default": "Errore aggiornamento utente"
    }
  },
  "filters": {
    "authType": {
      "all": "Tutti i tipi di autenticazione",
      "internal": "Interno",
      "oidc": "OIDC"
    },
    "search": "Ricerca utenti...",
    "status": {
      "active": "Attivo",
      "all": "Tutti gli stati",
      "inactive": "Disattivo"
    }
  },
  "status": {
    "active": "Attivo",
    "inactive": "Disattivo"
  },
  "success": {
    "delete": {
      "default": "Utente cancellato con successo"
    },
    "update": {
      "default": "Utente Aggiornato con successo"
    }
  },
  "table": {
    "emptyMessage": "Nessun utente trovato",
    "loadingMessage": "Caricamento utenti..."
  }
}
````

## File: client/src/i18n/locales/it/components/admin/common.json
````json
{
  "adminTable": {
    "defaultEmptyMessage": "Nessun Risultato",
    "defaultLoadingMessage": "Caricamento..."
  },
  "filterInput": {
    "defaultPlaceholder": "Ricerca..."
  },
  "filterSelect": {
    "defaultPlaceholder": "Seleziona..."
  }
}
````

## File: client/src/i18n/locales/it/components/admin/modals.json
````json
{
  "snippetViewModal": {
    "error": {
      "failedLoad": "Errore caricamento snippet"
    },
    "title": "Caricamento snippet..."
  }
}
````

## File: client/src/i18n/locales/it/components/admin/selector.json
````json
{
  "apiKeys": "Chiavi API",
  "dashboard": "Dashboard",
  "shares": "Condivisioni",
  "snippets": "Snippet",
  "users": "Utenti"
}
````

## File: client/src/i18n/locales/it/components/common/buttons.json
````json
{
  "copyButton": {
    "title": "Copia negli appunti"
  },
  "downloadArchiveButton": {
    "error": {
      "failedDownload": "Errore download archivio"
    },
    "fileLabel_one": "{{count, number}} file",
    "fileLabel_other": "{{count, number}} file",
    "label": "Scarica tutto",
    "success": {
      "downloadedAll": "Tutti i frammenti di codice son stati scaricati"
    },
    "title": "Scarica tutto come archivio ZIP"
  },
  "downloadButton": {
    "error": {
      "failedDownload": "Errore download del file"
    },
    "success": {
      "downloaded": "\"{{fileName}}\" scaricato con successo"
    },
    "title": "Scarica {{fileName}}",
    "warning": {
      "nothing": "Niente da scaricare"
    }
  },
  "exportButton": {
    "title": "Esporta come immagine",
    "tooltip": "Esporta"
  },
  "exportModal": {
    "copyClipboard": "Copia",
    "downloadPng": "Scarica PNG",
    "downloadSvg": "Scarica SVG",
    "errorCopy": "Errore copia immagine",
    "errorGenerate": "Errore generazione immagine",
    "shareLinkedIn": "Condividi su LinkedIn",
    "shareTwitter": "Condividi su X",
    "successCopy": "Immagine copiata negli appunti!",
    "title": "Esporta codice"
  },
  "fileUploadButton": {
    "error": {
      "unknown": "Errore sconosciuto"
    },
    "info": {
      "duplicateDetected": "File duplicati rilevati",
      "duplicatesDetected_one": "{{count, number}} file duplicati rilevati",
      "duplicatesDetected_other": "{{count, number}} file duplicati rilevati"
    },
    "label": "Carica file di codice",
    "loadFromUrl": {
      "contentMaxSizeError": "La dimensione massima deve esser inferiore a {{max}}",
      "invalidUrl": "Inserisci un URL valido",
      "label": "Carica da URL",
      "title": "Carica il codice da un URL (e.g., raw GitHub link)"
    },
    "success": {
      "filesUploaded_one": "{{count, number}} file caricati con successo",
      "filesUploaded_other": "{{count, number}} file caricati con successo",
      "fileUploaded": "\"{{fileName}}\" caricato con successo",
      "someFilesUploaded": "{{successCount}} file su {{total}} caricati con successo"
    },
    "title": "Carica file di codice per creare automaticamente frammenti"
  },
  "rawButton": {
    "title": "Apri raw"
  }
}
````

## File: client/src/i18n/locales/it/components/common/dropdowns.json
````json
{
  "baseDropdown": {
    "addNewLabel": "Aggiungi nuovo",
    "defaultPlaceholder": "Seleziona o digita un valore"
  }
}
````

## File: client/src/i18n/locales/it/components/common/markdown.json
````json
{
  "mermaid": {
    "copyCode": "Copy Mermaid code",
    "downloadPNG": "Download as PNG",
    "downloadSVG": "Download as SVG",
    "exitFullscreen": "Exit fullscreen",
    "fullscreen": "Fullscreen",
    "renderError": "Failed to render Mermaid diagram:",
    "renderErrorFallback": "Error rendering diagram",
    "resetView": "Reset view",
    "title": "Mermaid Diagram",
    "zoomIn": "Zoom in",
    "zoomOut": "Zoom out"
  }
}
````

## File: client/src/i18n/locales/it/components/common/modals.json
````json
{
  "changelogModal": {
    "error": {
      "default": "Errore caricamento changelog. Riprova più tardi."
    }
  }
}
````

## File: client/src/i18n/locales/it/components/snippets/list/snippetCard.json
````json
{
  "confirmationModalDelete": {
    "confirmLabel": {
      "isRecycleView": {
        "false": "Sposta nel Cestino",
        "true": "Cancella permanentemente"
      }
    },
    "message": {
      "isRecycleView": {
        "false": "Sei sicuro di voler spostare \"{{title}}\" nel Cestino?",
        "true": "Sei sicuro di voler cancellare permanentemente \"{{title}}\"? L'azione non può essere annullata."
      }
    },
    "title": {
      "isRecycleView": {
        "false": "Sposta nel Cestino",
        "true": "Conferma cancellazione"
      }
    }
  },
  "confirmationModalRestore": {
    "message": "Sei sicuro di voler ripristinare \"{{title}}\"?",
    "title": "Conferma ripristino"
  },
  "date": {
    "ago": "{{date}} fa",
    "expiringSoon": "in scadenza",
    "left": "{{date}} mancanti"
  },
  "defaultDescription": "Nessuna descrizione disponibile",
  "defaultUpdateTime": "Sconosciuto",
  "favorite": "Preferito",
  "pinned": "Fissato",
  "public": "Publico",
  "shared": "Condiviso"
}
````

## File: client/src/i18n/locales/it/components/snippets/list/snippetCardMenu.json
````json
{
  "addToFavorites": "Aggiungi ai preferiti",
  "deleteSnippet": "Cancella snippet",
  "duplicateSnippet": "Duplica snippet",
  "editSnippet": "Modifica snippet",
  "openInNewTab": "Apri in una nuova scheda",
  "pinSnippet": "Fissa snippet",
  "removeFromFavorites": "Rimuovi dai preferiti",
  "shareSnippet": "Condivi snippet",
  "unpinSnippet": "Rimuovi snippet dai fissati"
}
````

## File: client/src/i18n/locales/it/components/snippets/list/snippetList.json
````json
{
  "noSnippetsMatch": "Nessun snippet corrisponde ai tuoi criteri di ricerca"
}
````

## File: client/src/i18n/locales/it/components/snippets/list/snippetRecycleCardMenu.json
````json
{
  "deleteSnippet": "Cancella snippet",
  "restoreSnippet": "Ripristina snippet"
}
````

## File: client/src/i18n/locales/it/components/snippets/view/all.json
````json
{
  "fullCodeView": {
    "dateTimeAgo": "{{dateTime}} fa",
    "defaultDescription": "Nessuna descrizione disponibile"
  },
  "files": "file",
  "collapseSidebar": "Collassa Barra Laterale",
  "expandSidebar": "Espandi Barra Laterale",
  "searchFiles": "Ricerca file...",
  "noFilesFound": "Nessun file corrisponde alla tua ricerca",
  "filterFiles": "Filtra file",
  "fileExtensions": "Estensioni file",
  "noExtension": "Nessuna Estensione",
  "snippetModal": {
    "confirmationModal": {
      "confirmLabel": {
        "isRecycleView": {
          "false": "Sposta nel Cestino",
          "true": "Cancella permanentemente"
        }
      },
      "message": {
        "isRecycleView": {
          "false": "Sei sicuro di voler spostare \"{{title}}\" nel Cestino?",
          "true": "Sei sicuro di voler cancellare permanentemente \"{{title}}\"? L'azione non può essere annullata."
        }
      },
      "title": {
        "isRecycleView": {
          "false": "Sposta nel Cestino",
          "true": "Conferma Cancellazione"
        }
      }
    }
  }
}
````

## File: client/src/i18n/locales/it/components/snippets/view/common.json
````json
{
  "authAwareSnippetView": {
    "error": {
      "snippetLoad": "Errore caricamento snippet",
      "snippetRequireAuth": "Questo snippet richiede l'autenticazione per esser mostrato"
    }
  },
  "baseSnippetStorage": {
    "error": {
      "sessionExpired": "Sessione scaduta. Effettuare nuovamente l'accesso.",
      "snippetCreated": "Errore creazione snippet",
      "snippetUpdated": "Errore aggiornamento snippet"
    },
    "success": {
      "displayAll": "Mostrando tutti gli snippet",
      "displayFavorites": "Mostrando snippet preferiti",
      "snippetCreated": "Nuovo snippet creato con successo",
      "snippetUpdated": "Snippet aggiornato con successo"
    }
  },
  "browsePublicSnippets": "Esplora snippet pubblici",
  "filter": {
    "filteredByCategories": "Filtra per categorie"
  },
  "loadingSnippets": "Caricamento snippet...",
  "signIn": "Accedi",
  "sippetNotFound": "Snippet non trovato",
  "snippetContentArea": {
    "error": {
      "duplicateSnippet": "Errore duplicazione snippet",
      "loadSnippets": "Errore caricamento snippet",
      "moveSnippetToRecycleBin": "Errore spostamento snippet nel Cestino. Riprova.",
      "sessionExpired": "Sessione scaduta. Effettua nuovamente l'accesso.",
      "updateFavoriteStatusAdded": "Errore salvataggio snippet fra i preferiti. Riprova.",
      "updateFavoriteStatusDeleted": "Errore rimozione snippet dai preferiti. Riprova.",
      "updatePinStatusAdded": "Errore fissaggio snippet. Riprova.",
      "updatePinStatusDeleted": "Errore rimozione snippet dai fissati. Riprova."
    },
    "success": {
      "duplicateSnippet": "Snippet duplicato con successo",
      "moveSnippetToRecycleBin": "Snippet spostato nel Cestino con successo",
      "updateFavoriteStatusAdded": "Snippet aggiunto ai preferiti con successo",
      "updateFavoriteStatusDeleted": "Snippet rimosso dai preferiti con successo",
      "updatePinStatusAdded": "Snippet fissatto con successo",
      "updatePinStatusDeleted": "Rimozione Snippet dai fissati eseguita con successo"
    }
  },
  "storageHeader": {
    "private": "Stai guardando i tuoi snippet privati. Solo tu puoi vedere e modificare questi snippet.",
    "public": "Stai guardando snippet pubblicamente accessibili. Questi snippet sono di sola visione e visibili a chiunque."
  },
  "viewSwitch": {
    "private": "Privato",
    "public": "Pubblico"
  }
}
````

## File: client/src/i18n/locales/it/components/snippets/view/public.json
````json
{
  "publicSnippetContentArea": {
    "error": {
      "addSnippetToCollection": "Errore aggiunta snippet alla tua collezione",
      "failedLoadSnippets": "Errore caricamento snippet pubblici"
    },
    "filter": {
      "byCategories": "Filtra per categoria"
    },
    "info": {
      "requireAuth": "Effettua l'accesso per aggiungere snippet alla tua collezione"
    },
    "loadingSnippets": "Caricamento snippet...",
    "success": {
      "addSnippetToCollection": "Snippet aggiunto alla tua collezione"
    }
  }
}
````

## File: client/src/i18n/locales/it/components/snippets/view/recycle.json
````json
{
  "recycleSnippetContentArea": {
    "error": {
      "deleteSnippet": "Errore cancellazione snippet",
      "loadSnippets": "Errore Caricamento snippet",
      "restoreSnippet": "Errore ripristino snippet",
      "sessionExpired": "Sessione Scaduta. Effettua nuovamente l'accesso."
    },
    "filter": {
      "byCategories": "Filtra per categorie"
    },
    "loadingSnippets": "Caricamento snippet...",
    "success": {
      "deleteSnippet": "Snippet cancellato con successo",
      "restoreSnippet": "Snippet ripristinato con successo"
    }
  },
  "recycleSnippetStorage": {
    "backToSnippets": "Torna agli Snippet",
    "confirmationModal": {
      "message": "Sei sicuro di voler cancellare permanentemente tutti gli snippet nel cestino? Questa azione non può esser annullata.",
      "title": "Conferma Cancellazione"
    },
    "description": "Gli Snippet nel Cestino verranno cancellati permanentemente automaticamente dopo 30 giorni",
    "error": {
      "clear": "Errore svuotamento cestino. Riprova.",
      "sessionExpired": "Sessione Scaduta. Effettua nuovamente l'accesso."
    },
    "info": {
      "noSnippets": "Cestino vuoto"
    },
    "recycleBin": "Cestino",
    "success": {
      "clear": "Il cestino è stato svuotato"
    }
  }
}
````

## File: client/src/i18n/locales/it/components/snippets/edit.json
````json
{
  "editSnippetModal": {
    "addSnippet": "Aggiungi nuovo snippet",
    "editSnippet": "Modifica snippet",
    "error": {
      "savingFailed": "Errore durante il salvataggio dello snippet. Riprova."
    },
    "form": {
      "categories": {
        "counter": "{{categories}}/{{max}} categorie",
        "label": "Categorie (massime {{max}})",
        "placeholder": "Digita una categoria e premi 'Invio' o 'Virgola'"
      },
      "codeFragments": {
        "add": "Aggiungi nuovo frammento",
        "label": "Frammenti di codice ({{fragments}})"
      },
      "description": {
        "label": "Descrizione",
        "placeholder": "Scrivi una breve descrizione del tuo snippet"
      },
      "isPublic": {
        "description": "Gli snippet pubblici possono esser visibili da chiunque, anche senza autenticazione",
        "label": "Rendi snippet pubblico"
      },
      "title": {
        "counter": "{{characters}}/{{max}} caratteri",
        "label": "Titolo",
        "placeholder": "Digita il titolo del tuo snippet (massimo {{max}} caratteri)"
      }
    },
    "fragmentRequired": "Almeno un frammento di codice è richiesto",
    "mustHaveFileNames": "Tutti i frammenti devono avere un nome",
    "unsavedChanges": "Hai modifiche non salvate. Sei sicuro di voler chiudere?"
  },
  "searchFiles": "Ricerca file...",
  "noFilesFound": "Nessun file corrisponde alla ricerca",
  "expandSidebar": "Espandi Barra Laterale",
  "filterFiles": "Filtra file",
  "fileExtensions": "Estensione File",
  "noExtension": "Nessuna estensione",
  "fragmentEditor": {
    "action": {
      "collapse": "Riduci",
      "delete": "Cancella",
      "expand": "Espandi"
    },
    "form": {
      "fileName": {
        "placeholder": "Nome File"
      },
      "language": {
        "placeholder": "Selezione Linguaggio",
        "sections": {
          "other": "Altri",
          "used": "Usati"
        }
      }
    },
    "moveDown": "Muovi sopra",
    "moveUp": "Muovi sotto"
  }
}
````

## File: client/src/i18n/locales/it/components/snippets/embed.json
````json
{
  "embedCopyButton": {
    "title": "Copia negli appunti"
  },
  "embedModal": {
    "form": {
      "embedCode": "Embed Codice",
      "fragmentToShow": {
        "all": "Tutti i frammenti",
        "label": "Frammenti da mostrare (opzionale)"
      },
      "showDescription": "Mostra descrizione",
      "showFileHeaders": "Mostra headers del file",
      "showPoweredBy": "Mostra \"Offero da ByteStash\"",
      "showTitle": "Mostra Titolo",
      "theme": "Tema"
    },
    "subTitle": "Personalizza Embed",
    "title": "Embed Snippet"
  },
  "embedView": {
    "error": {
      "default": "Errore caricamento snippet"
    }
  }
}
````

## File: client/src/i18n/locales/it/components/snippets/share.json
````json
{
  "sharedSnippetView": {
    "browsePublicSnippets": "Esplora snippet pubblici",
    "loadingSnippet": "Caricamento snippet...",
    "snippetExpired": "Questo snippet condiviso è scaduto",
    "snippetNotFound": "Snippet non trovato"
  },
  "shareMenu": {
    "activeShareLinks": {
      "buttons": {
        "copy": "Copia Link",
        "delete": "Cancella link di condivisione",
        "requiresAuth": {
          "false": "Embed snippet",
          "true": "L'azione può esser eseguita solo su snippet pubblici"
        }
      },
      "date": {
        "expired": "Scaduto",
        "neverExpires": "Senza Scadenza"
      },
      "noLinks": "Nessun link di condivisione attivo",
      "relativeExpiryTime": "Scade : {{date}}",
      "requiresAuth": {
        "false": "Accesso Pubblico",
        "true": "Protetto - Autenticazione Richiesta"
      },
      "title": "Link di condivisione attivi"
    },
    "createButtonText": "Crea Link di condivisione",
    "error": {
      "created": "Errore creazione link di condivisione",
      "deleted": "Errore cancellazione link di condivisione",
      "invalidDuration": "Formata durata non valido. Usa: 1h, 2d, 30m etc.",
      "load": "Errore caricamento snippet condivisi",
      "unknownExpiryTime": "Data di scadenza sconosciuta"
    },
    "expiresIn": "Scade tra (es. 1h, 2d, 30m)",
    "expiresInPlaceholder": "Mai",
    "requiresAuth": "Autenticazione Richiesta",
    "subTitle": "Crea nuovo link di condivisione",
    "success": {
      "created": "Link di condivisione creato",
      "deleted": "Link di condivisione cancellato"
    },
    "title": "Condividi Snippet"
  }
}
````

## File: client/src/i18n/locales/it/components/auth.json
````json
{
  "apiKeysModal": {
    "created": "Creato",
    "createKey": "Crea chiave API",
    "deleteApiKey": "Cancella chiave API ",
    "enterKeyName": "Digita nome chiave",
    "lastUsed": "Ultimo utilizzo",
    "newApiKey": "Nuova chiave API (copiala ora, non verrà più mostrata)",
    "notApiKeys": "Nessuna chiave API trovata",
    "title": "Chiavi API",
    "yourApiKeys": "Le tue chiavi API"
  },
  "authProvider": {
    "error": {
      "failedCreateAnonymousSession": "Errore inizializzazione sessione anonima"
    },
    "info": {
      "logoutSuccess": "Logout effettuato con successo"
    }
  },
  "changePasswordModal": {
    "confirmNewPassword": "Conferma nuova password",
    "currentPassword": "Password attuale",
    "error": {
      "default": "Errore cambio password",
      "newPasswordMustBeAtLeastCharacters": "La nuova password deve avere come minimo {{minLength}} caratteri",
      "newPasswordsDoNotMatch": "Le nuove password non corrispondono"
    },
    "newPassword": "Nuova password",
    "passwordChangedSuccessfully": "Password cambiata con successo",
    "process": "Cambio password in corso...",
    "title": "Cambia password"
  },
  "login": {
    "account": "account",
    "browsePublicSnippets": "esplora snippet pubblici",
    "create": "crea un",
    "error": {
      "invalidUsernameOrPassword": "Nome utente o password non valido"
    },
    "orContinueWithPassword": "O continua senza password",
    "pleaseSignInToContinue": "Accedi per continuare",
    "signingIn": "Accesso in corso..."
  },
  "oidc": {
    "error": {
      "auth_failed": "Autenticazione fallita. Può esser per un tentativo di accesso annullato o per una sessione scaduta. Riprova.",
      "config_error": "C'è un errore nella configurazione SSO. Contatta l'amministratore.",
      "default": "Errore durante l'autenticazione. Riprova.",
      "provider_error": "Il provider dell'identità ha riscontrato un errore o non è più disponibile. Riprova o contatta l'amministratore.",
      "registration_disabled": "La registrazione di nuovi account è attualmente disabilitata su questa istanza di Bytestash. Contatta l'amministratore."
    }
  },
  "register": {
    "browsePublicSnippets": "esplora snippet pubblici",
    "creatingAccount": "Creazione Account in corso...",
    "disabled": {
      "description": "La registrazione di nuovi account è attualmente disabilitata.",
      "link": {
        "text": "Ritorna al Login"
      },
      "title": "Registrazione Disabilitata"
    },
    "error": {
      "default": "Errore durante la Registrazione",
      "passwordsDoNotMatch": "Le password non corrispondono"
    },
    "firstAccountDescription": "Questo è il primo account ad esser creato. Tutti gli snippet esistenti verranno automaticamente migrati su questo account.",
    "notAvailable": {
      "description": "La registrazione dell'account è disabilitata e nessun SSO provider è stato configurato. Contatta l'amministratore.",
      "title": "Registrazione Non Disponibile"
    },
    "signInToYourAccount": "accedi col tuo account",
    "title": "Crea Account"
  },
  "signIn": {
    "completing": "Completamento accesso in corso...",
    "with": "Accesso come {{displayName}}"
  },
  "signOut": {
    "completing": "Completamento uscita in corso..."
  },
  "userDropdown": {
    "adminPanel": "Pannello Amministratore",
    "apiKeys": "Chiavi API",
    "changePassword": "Cambia Password",
    "signIn": "Accedi",
    "signOut": "Esci"
  }
}
````

## File: client/src/i18n/locales/it/components/categories.json
````json
{
  "categoryList": {
    "moreCount": "{{moreCount}} ancora",
    "noData": "Nessuna categoria",
    "showLess": "Mostra meno"
  },
  "categorySuggestions": {
    "addNewLabel": "Aggiungi nuova",
    "placeholder": "Digita per cercare categorie...",
    "title": "Categorie"
  }
}
````

## File: client/src/i18n/locales/it/components/search.json
````json
{
  "action": {
    "clear": "Cancella ricerca",
    "newSnippet": "Nuovo snippet",
    "openSettings": "Apri impostazioni",
    "recycleBin": "Cestino",
    "showAll": "Mostra tutto",
    "showFavorites": "Mostra preferiti"
  },
  "categories": {
    "addNew": "Aggiungi Nuovo",
    "title": "Categorie"
  },
  "defaultPlaceholder": "Ricerca snippet... (Digita # per vedere tutte le categorie disponibili)",
  "filter": {
    "language": {
      "all": "Tutti i linguaggi"
    }
  },
  "sort": {
    "alphaAsc": "Alfabeticamente A-Z",
    "alphaDesc": "Alfabeticamente Z-A",
    "newestFirst": "Più recenti prima",
    "oldestFirst": "Più vecchie prima"
  },
  "view": {
    "grid": "Visione a griglia",
    "list": "Visione a lista"
  }
}
````

## File: client/src/i18n/locales/it/components/settings.json
````json
{
  "settingsModal": {
    "block": {
      "category": {
        "expandCategories": {
          "description": "Espandi automaticamente i gruppi di categorie",
          "label": "Espandi Categorie"
        },
        "showCategories": {
          "description": "Mostra etichette categorie sugli snippet",
          "label": "Mostra Categorie"
        },
        "title": "Categoria"
      },
      "dataManagement": {
        "export": {
          "label": "Esporta Snippet"
        },
        "import": {
          "errors": {
            "failed": "Errore importazione snippet \"{{title}}\": {{error}}",
            "occurred_one": "{{count, number}} errori rilevati",
            "occurred_other": "{{count, number}} errori rilevati"
          },
          "label": "Importa Snippet",
          "progress": "Importazione snippet in corso..."
        },
        "title": "Gestione Dati"
      },
      "locale": {
        "title": "Locale"
      },
      "search": {
        "includeCodeInSearch": {
          "description": "Ricerca anche all'interno del contenuto del codice, non solo i titoli",
          "label": "Includi Codice nella ricerca"
        },
        "title": "Ricerca"
      },
      "theme": {
        "title": "Tema"
      },
      "view": {
        "compactView": {
          "description": "Mostra snippet in un formato più compatto",
          "label": "Visione Compatta"
        },
        "previewLines": {
          "description": "Mostra una preview del codice nella lista snippet",
          "label": "Mostra Preview Codice"
        },
        "showCodePreview": {
          "description": "Massimo numero di linee da mostrare nella preview (1-20)",
          "label": "Numero di Linee nella Preview"
        },
        "showLineNumbers": {
          "description": "Mostra numero linea nei blocchi codice",
          "label": "Mostra Numero Linee"
        },
        "title": "Mostra"
      }
    },
    "export": {
      "error": {
        "default": "Errore Esportazione snippet",
        "noSnippets": "Nessun snippet disponibile per l'esportazione"
      },
      "markdown": {
        "error": {
          "default": "Errore esportazione Markdown"
        },
        "success": {
          "default": "Markdown esportato con successo"
        },
        "warning": {
          "default": "Nessun snippet disponibile per l'esportazione"
        }
      },
      "success": {
        "default": "{{total}} snippet esportati con successo"
      }
    },
    "import": {
      "error": {
        "default": "Errore importazione snippet"
      },
      "hasFailed": "Importati {{succeeded}} snippet, {{failed}} hanno dato errore. Controlla la console per i dettagli.",
      "successOnly_one": "Importati con successo {{succeeded}} snippet. Chiudi le impostazioni per vederli.",
      "successOnly_other": "Importati con successo {{succeeded}} snippet. Chiudi le impostazioni per vederli."
    },
    "title": "Impostazioni"
  }
}
````

## File: client/src/i18n/locales/it/components/utils.json
````json
{
  "config": {
    "caution": "Attenzione",
    "important": "Importante",
    "note": "Nota",
    "tip": "Suggerimento",
    "warning": "Avviso"
  }
}
````

## File: client/src/i18n/locales/it/translation.json
````json
{
  "action": {
    "addSnippet": "Aggiungi snippet",
    "cancel": "Annulla",
    "changePassword": "Cambia password",
    "clear": "Cancella",
    "clearAll": "Cancella tutto",
    "close": "Chiudi",
    "confirm": "Conferma",
    "createAccount": "Crea account",
    "delete": "Cancella",
    "edit": "Modifica",
    "hidePassword": "Nascondi password",
    "load": "Carica",
    "maximize": "Ingrandisci",
    "minimize": "Minimizza",
    "restore": "Ripristina",
    "save": "Salva",
    "saving": "Salvataggio in corso...",
    "showPassword": "Mostra password",
    "signIn": "Accedi"
  },
  "confirmPassword": "Conferma Password",
  "loading": "Caricamento in corso...",
  "locale": {
    "en": "Inglese",
    "es": "Spagnolo",
    "ja": "Giapponese",
    "ru": "Russo",
    "it":"Italian"
  },
  "no": "no",
  "or": "oppure",
  "pagination": {
    "next": "Prossima",
    "pageOf": "Pagina {{currentPage}} di {{totalPages}}",
    "previous": "Precedente",
    "total": "{{total}} totali",
    "useSnippetPagination": {
      "error": {
        "failedSnippetsLoad": "Errore caricamento snippet",
        "sessionExpired": "Sessione scaduta. Effettua nuovamente l'accesso"
      }
    }
  },
  "password": "Password",
  "showing": "Mostrando",
  "theme": {
    "dark": "Scuro",
    "light": "Bianco",
    "system": "Sistema"
  },
  "username": "Nome Utente"
}
````

## File: client/src/i18n/locales/ja/components/admin/tabs/apiKeys.json
````json
{
  "apiKeyDeletedSuccessfully": "APIキーを削除しました",
  "columns": {
    "labels": {
      "actions": "アクション",
      "created": "作成日時",
      "lastUsed": "最終使用日時",
      "name": "名前",
      "owner": "所有者",
      "status": "ステータス"
    }
  },
  "confirmationModal": {
    "message": "このAPIキーを削除してもよろしいですか？キーの所有者はAPIにアクセスできなくなります。この操作は取り消せません。",
    "title": "APIキーを削除"
  },
  "entityName_one": "APIキー",
  "entityName_other": "APIキー",
  "error": {
    "default": "APIキーの削除に失敗しました"
  },
  "filters": {
    "userId": "ユーザーIDで絞り込み"
  },
  "status": {
    "active": "有効",
    "inactive": "無効"
  },
  "table": {
    "emptyMessage": "APIキーが見つかりません",
    "loadingMessage": "APIキーを読み込み中..."
  }
}
````

## File: client/src/i18n/locales/ja/components/admin/tabs/dashboard.json
````json
{
  "card": {
    "apiKeys": {
      "title": "APIキー"
    },
    "shares": {
      "title": "共有"
    },
    "snippets": {
      "apiKeys": {
        "active": "有効"
      },
      "shares": {
        "total": "合計"
      },
      "title": "スニペット",
      "viewType": {
        "private": "非公開",
        "public": "公開"
      }
    },
    "users": {
      "authType": {
        "internal": "内部",
        "oidc": "OIDC"
      },
      "title": "ユーザー"
    }
  },
  "loadingMessage": "統計を読み込み中..."
}
````

## File: client/src/i18n/locales/ja/components/admin/tabs/shares.json
````json
{
  "action": {
    "copyShareLink": "共有リンクをコピー",
    "delete": "共有を削除",
    "viewSnippet": "スニペットを表示"
  },
  "columns": {
    "labels": {
      "actions": "アクション",
      "auth": "認証必須",
      "created": "作成日時",
      "expires": "有効期限",
      "id": "共有ID",
      "owner": "所有者",
      "title": "タイトル"
    }
  },
  "confirmationModal": {
    "message": "この共有リンクを削除してもよろしいですか？リンクを持つ誰もスニペットにアクセスできなくなります。この操作は取り消せません。",
    "title": "共有を削除"
  },
  "entityName_one": "共有",
  "entityName_other": "共有",
  "error": {
    "delete": {
      "default": "共有の削除に失敗しました"
    }
  },
  "filters": {
    "authType": {
      "all": "すべての認証タイプ",
      "public": "公開",
      "requiresAuth": "認証必須"
    },
    "userId": "ユーザーIDで絞り込み"
  },
  "success": {
    "copied": {
      "default": "共有リンクをクリップボードにコピーしました"
    },
    "delete": {
      "default": "共有を削除しました"
    }
  },
  "table": {
    "emptyMessage": "共有が見つかりません",
    "loadingMessage": "共有を読み込み中..."
  }
}
````

## File: client/src/i18n/locales/ja/components/admin/tabs/snippets.json
````json
{
  "action": {
    "delete": "スニペットを削除",
    "makePrivate": "非公開にする",
    "makePublic": "公開する",
    "scanForOffensiveContent": "不適切なコンテンツをスキャン",
    "showAllSnippets": "すべてのスニペットを表示",
    "viewSnippet": "スニペットを表示"
  },
  "columns": {
    "labels": {
      "actions": "アクション",
      "fragments": "フラグメント",
      "owner": "所有者",
      "title": "タイトル",
      "updated": "更新日時",
      "visibility": "公開状態"
    }
  },
  "confirmationModal": {
    "message": "このスニペットを完全に削除してもよろしいですか？この操作は取り消せません。",
    "title": "スニペットを削除"
  },
  "containsOffensiveWords": "不適切な言葉を含んでいます: {{words}}",
  "entityName_one": "スニペット",
  "entityName_other": "スニペット",
  "error": {
    "delete": {
      "default": "スニペットの削除に失敗しました"
    },
    "update": {
      "default": "スニペットの公開状態の更新に失敗しました"
    }
  },
  "filters": {
    "search": "スニペットを検索...",
    "userId": "ユーザーID",
    "visibility": {
      "all": "すべての公開状態",
      "private": "非公開",
      "public": "公開"
    }
  },
  "offensiveContentMessage": "不適切なコンテンツを含む{{total}}件の{{entityName}}が見つかりました",
  "success": {
    "delete": {
      "default": "スニペットを削除しました"
    },
    "update": {
      "default": "スニペットの公開状態を更新しました"
    }
  },
  "table": {
    "emptyMessage": "スニペットが見つかりません",
    "loadingMessage": "スニペットを読み込み中..."
  }
}
````

## File: client/src/i18n/locales/ja/components/admin/tabs/users.json
````json
{
  "action": {
    "activate": "ユーザーを有効化",
    "deactivate": "ユーザーを無効化",
    "delete": "ユーザーを削除"
  },
  "columns": {
    "labels": {
      "actions": "アクション",
      "apiKeysCount": "APIキー",
      "authType": "認証タイプ",
      "created": "作成日時",
      "email": "メールアドレス",
      "lastLogin": "最終ログイン",
      "snippetsCount": "スニペット",
      "status": "ステータス",
      "username": "ユーザー名"
    }
  },
  "confirmationModal": {
    "message": "このユーザーを削除してもよろしいですか？すべてのスニペット、APIキー、共有が完全に削除されます。この操作は取り消せません。",
    "title": "ユーザーを削除"
  },
  "entityName_one": "ユーザー",
  "entityName_other": "ユーザー",
  "error": {
    "delete": {
      "default": "ユーザーの削除に失敗しました"
    },
    "update": {
      "default": "ユーザーの更新に失敗しました"
    }
  },
  "filters": {
    "authType": {
      "all": "すべての認証タイプ",
      "internal": "内部",
      "oidc": "OIDC"
    },
    "search": "ユーザーを検索...",
    "status": {
      "active": "有効",
      "all": "すべてのステータス",
      "inactive": "無効"
    }
  },
  "status": {
    "active": "有効",
    "inactive": "無効"
  },
  "success": {
    "delete": {
      "default": "ユーザーを削除しました"
    },
    "update": {
      "default": "ユーザーのステータスを更新しました"
    }
  },
  "table": {
    "emptyMessage": "ユーザーが見つかりません",
    "loadingMessage": "ユーザーを読み込み中..."
  }
}
````

## File: client/src/i18n/locales/ja/components/admin/common.json
````json
{
  "adminTable": {
    "defaultEmptyMessage": "データが見つかりません",
    "defaultLoadingMessage": "読み込み中..."
  },
  "filterInput": {
    "defaultPlaceholder": "検索..."
  },
  "filterSelect": {
    "defaultPlaceholder": "選択..."
  }
}
````

## File: client/src/i18n/locales/ja/components/admin/modals.json
````json
{
  "snippetViewModal": {
    "error": {
      "failedLoad": "スニペットの読み込みに失敗しました"
    },
    "title": "スニペットを読み込み中..."
  }
}
````

## File: client/src/i18n/locales/ja/components/admin/selector.json
````json
{
  "apiKeys": "APIキー",
  "dashboard": "ダッシュボード",
  "shares": "共有",
  "snippets": "スニペット",
  "users": "ユーザー"
}
````

## File: client/src/i18n/locales/ja/components/common/buttons.json
````json
{
  "copyButton": {
    "title": "クリップボードにコピー"
  },
  "downloadArchiveButton": {
    "error": {
      "failedDownload": "アーカイブのダウンロードに失敗しました"
    },
    "fileLabel_one": "{{count, number}}ファイル",
    "fileLabel_other": "{{count, number}}ファイル",
    "label": "すべてダウンロード",
    "success": {
      "downloadedAll": "すべてのコードフラグメントをダウンロードしました"
    },
    "title": "すべてのファイルをZIPアーカイブとしてダウンロード"
  },
  "downloadButton": {
    "error": {
      "failedDownload": "ファイルのダウンロードに失敗しました"
    },
    "success": {
      "downloaded": "\"{{fileName}}\"をダウンロードしました"
    },
    "title": "{{fileName}}をダウンロード",
    "warning": {
      "nothing": "ダウンロードするものがありません"
    }
  },
  "exportButton": {
    "tooltip": "エクスポート"
  },
  "exportModal": {
    "copyClipboard": "コピー",
    "downloadPng": "PNGをダウンロード",
    "downloadSvg": "SVGをダウンロード",
    "errorCopy": "画像のコピーに失敗しました",
    "errorGenerate": "画像の生成に失敗しました",
    "shareLinkedIn": "LinkedInで共有",
    "shareTwitter": "Xで共有",
    "successCopy": "画像がクリップボードにコピーされました！",
    "title": "コードをエクスポート"
  },
  "fileUploadButton": {
    "error": {
      "unknown": "不明なエラー"
    },
    "info": {
      "duplicateDetected": "重複ファイルが検出されました",
      "duplicatesDetected_one": "{{count, number}}個の重複ファイルが検出されました",
      "duplicatesDetected_other": "{{count, number}}個の重複ファイルが検出されました"
    },
    "label": "コードファイルをアップロード",
    "loadFromUrl": {
      "contentMaxSizeError": "コンテンツサイズは{{max}}未満である必要があります",
      "invalidUrl": "有効なURLを入力してください",
      "label": "URLから読み込み",
      "title": "URLからコードを読み込み（例: GitHubの生のリンク）"
    },
    "success": {
      "filesUploaded_one": "{{count, number}}個のファイルをアップロードしました",
      "filesUploaded_other": "{{count, number}}個のファイルをアップロードしました",
      "fileUploaded": "\"{{fileName}}\"をアップロードしました",
      "someFilesUploaded": "{{total}}個のファイルのうち{{successCount}}個をアップロードしました"
    },
    "title": "フラグメントを自動作成するためにコードファイルをアップロード"
  },
  "rawButton": {
    "title": "生データを開く"
  }
}
````

## File: client/src/i18n/locales/ja/components/common/dropdowns.json
````json
{
  "baseDropdown": {
    "addNewLabel": "新規追加",
    "defaultPlaceholder": "値を選択または入力"
  }
}
````

## File: client/src/i18n/locales/ja/components/common/markdown.json
````json
{
  "mermaid": {
    "copyCode": "Mermaidコードをコピー",
    "downloadPNG": "PNGとしてダウンロード",
    "downloadSVG": "SVGとしてダウンロード",
    "exitFullscreen": "全画面を終了",
    "fullscreen": "全画面",
    "renderError": "Mermaidダイアグラムのレンダリングに失敗しました:",
    "renderErrorFallback": "ダイアグラムのレンダリングエラー",
    "resetView": "ビューをリセット",
    "title": "Mermaidダイアグラム",
    "zoomIn": "ズームイン",
    "zoomOut": "ズームアウト"
  }
}
````

## File: client/src/i18n/locales/ja/components/common/modals.json
````json
{
  "changelogModal": {
    "error": {
      "default": "変更ログの読み込みに失敗しました。後でもう一度お試しください。"
    }
  }
}
````

## File: client/src/i18n/locales/ja/components/snippets/list/snippetCard.json
````json
{
  "confirmationModalDelete": {
    "confirmLabel": {
      "isRecycleView": {
        "false": "ゴミ箱に移動",
        "true": "完全に削除"
      }
    },
    "message": {
      "isRecycleView": {
        "false": "\"{{title}}\"をゴミ箱に移動してもよろしいですか？",
        "true": "\"{{title}}\"を完全に削除してもよろしいですか？この操作は取り消せません。"
      }
    },
    "title": {
      "isRecycleView": {
        "false": "ゴミ箱に移動",
        "true": "削除の確認"
      }
    }
  },
  "confirmationModalRestore": {
    "message": "\"{{title}}\"を復元してもよろしいですか？",
    "title": "復元の確認"
  },
  "date": {
    "ago": "{{date}}前",
    "expiringSoon": "まもなく期限切れ",
    "left": "残り{{date}}"
  },
  "defaultDescription": "説明なし",
  "defaultUpdateTime": "不明",
  "favorite": "お気に入り",
  "pinned": "固定",
  "public": "公開",
  "shared": "共有中"
}
````

## File: client/src/i18n/locales/ja/components/snippets/list/snippetCardMenu.json
````json
{
  "addToFavorites": "お気に入りに追加",
  "deleteSnippet": "スニペットを削除",
  "duplicateSnippet": "スニペットを複製",
  "editSnippet": "スニペットを編集",
  "openInNewTab": "新しいタブで開く",
  "pinSnippet": "スニペットを固定",
  "removeFromFavorites": "お気に入りから削除",
  "shareSnippet": "スニペットを共有",
  "unpinSnippet": "固定を解除"
}
````

## File: client/src/i18n/locales/ja/components/snippets/list/snippetList.json
````json
{
  "noSnippetsMatch": "検索条件に一致するスニペットがありません"
}
````

## File: client/src/i18n/locales/ja/components/snippets/list/snippetRecycleCardMenu.json
````json
{
  "deleteSnippet": "スニペットを削除",
  "restoreSnippet": "スニペットを復元"
}
````

## File: client/src/i18n/locales/ja/components/snippets/view/all.json
````json
{
  "collapseSidebar": "サイドバーを折りたたむ",
  "defaultUpdateTime": "不明",
  "expandSidebar": "サイドバーを展開する",
  "fileExtensions": "ファイル拡張子",
  "files": "ファイル",
  "filterFiles": "ファイルを絞り込む",
  "fullCodeView": {
    "dateTimeAgo": "{{dateTime}}前",
    "defaultDescription": "説明なし"
  },
  "noExtension": "拡張子なし",
  "noFilesFound": "ファイルが見つかりません",
  "searchFiles": "ファイルを検索する",
  "snippetModal": {
    "confirmationModal": {
      "confirmLabel": {
        "isRecycleView": {
          "false": "ゴミ箱に移動",
          "true": "完全に削除"
        }
      },
      "message": {
        "isRecycleView": {
          "false": "\"{{title}}\"をゴミ箱に移動してもよろしいですか？",
          "true": "\"{{title}}\"を完全に削除してもよろしいですか？この操作は取り消せません。"
        }
      },
      "title": {
        "isRecycleView": {
          "false": "ゴミ箱に移動",
          "true": "削除の確認"
        }
      }
    }
  }
}
````

## File: client/src/i18n/locales/ja/components/snippets/view/common.json
````json
{
  "authAwareSnippetView": {
    "error": {
      "snippetLoad": "スニペットの読み込みに失敗しました",
      "snippetRequireAuth": "このスニペットを表示するには認証が必要です"
    }
  },
  "baseSnippetStorage": {
    "error": {
      "sessionExpired": "セッションの有効期限が切れました。再度サインインしてください。",
      "snippetCreated": "スニペットの作成に失敗しました",
      "snippetUpdated": "スニペットの更新に失敗しました"
    },
    "success": {
      "displayAll": "すべてのスニペットを表示中",
      "displayFavorites": "お気に入りのスニペットを表示中",
      "snippetCreated": "新しいスニペットを作成しました",
      "snippetUpdated": "スニペットを更新しました"
    }
  },
  "browsePublicSnippets": "公開スニペットを閲覧",
  "filter": {
    "filteredByCategories": "カテゴリで絞り込み"
  },
  "loadingSnippets": "スニペットを読み込み中...",
  "signIn": "サインイン",
  "sippetNotFound": "スニペットが見つかりません",
  "snippetContentArea": {
    "error": {
      "duplicateSnippet": "スニペットの複製に失敗しました",
      "loadSnippets": "スニペットの読み込みに失敗しました",
      "moveSnippetToRecycleBin": "スニペットをゴミ箱に移動できませんでした。もう一度お試しください。",
      "sessionExpired": "セッションの有効期限が切れました。再度サインインしてください。",
      "updateFavoriteStatusAdded": "お気に入りのステータスを更新できませんでした。もう一度お試しください。",
      "updateFavoriteStatusDeleted": "お気に入りのステータスを更新できませんでした。もう一度お試しください。",
      "updatePinStatusAdded": "固定のステータスを更新できませんでした。もう一度お試しください。",
      "updatePinStatusDeleted": "固定のステータスを更新できませんでした。もう一度お試しください。"
    },
    "success": {
      "duplicateSnippet": "スニペットを複製しました",
      "moveSnippetToRecycleBin": "スニペットをゴミ箱に移動しました",
      "updateFavoriteStatusAdded": "スニペットをお気に入りに追加しました",
      "updateFavoriteStatusDeleted": "スニペットをお気に入りから削除しました",
      "updatePinStatusAdded": "スニペットを固定しました",
      "updatePinStatusDeleted": "スニペットの固定を解除しました"
    }
  },
  "storageHeader": {
    "private": "非公開スニペットを表示しています。あなたのみがこれらのスニペットを表示・変更できます。",
    "public": "公開スニペットを表示しています。これらのスニペットは読み取り専用で、誰でも閲覧できます。"
  },
  "viewSwitch": {
    "private": "非公開",
    "public": "公開"
  }
}
````

## File: client/src/i18n/locales/ja/components/snippets/view/public.json
````json
{
  "publicSnippetContentArea": {
    "error": {
      "addSnippetToCollection": "スニペットをコレクションに追加できませんでした",
      "failedLoadSnippets": "公開スニペットの読み込みに失敗しました"
    },
    "filter": {
      "byCategories": "カテゴリで絞り込み"
    },
    "info": {
      "requireAuth": "このスニペットをコレクションに追加するにはサインインしてください"
    },
    "loadingSnippets": "スニペットを読み込み中...",
    "success": {
      "addSnippetToCollection": "スニペットをコレクションに追加しました"
    }
  }
}
````

## File: client/src/i18n/locales/ja/components/snippets/view/recycle.json
````json
{
  "recycleSnippetContentArea": {
    "error": {
      "deleteSnippet": "スニペットの削除に失敗しました",
      "loadSnippets": "スニペットの読み込みに失敗しました",
      "restoreSnippet": "スニペットの復元に失敗しました",
      "sessionExpired": "セッションの有効期限が切れました。再度サインインしてください。"
    },
    "filter": {
      "byCategories": "カテゴリで絞り込み"
    },
    "loadingSnippets": "スニペットを読み込み中...",
    "success": {
      "deleteSnippet": "スニペットを削除しました",
      "restoreSnippet": "スニペットを復元しました"
    }
  },
  "recycleSnippetStorage": {
    "backToSnippets": "スニペットに戻る",
    "confirmationModal": {
      "message": "ゴミ箱のすべてのスニペットを完全にクリアしてもよろしいですか？この操作は取り消せません。",
      "title": "削除の確認"
    },
    "description": "ゴミ箱のスニペットは30日後に完全に削除されます",
    "error": {
      "clear": "ゴミ箱をクリアできませんでした。もう一度お試しください。",
      "sessionExpired": "セッションの有効期限が切れました。再度サインインしてください。"
    },
    "info": {
      "noSnippets": "クリアするゴミ箱のスニペットがありません"
    },
    "recycleBin": "ゴミ箱",
    "success": {
      "clear": "ゴミ箱のすべてのスニペットをクリアしました"
    }
  }
}
````

## File: client/src/i18n/locales/ja/components/snippets/edit.json
````json
{
  "editSnippetModal": {
    "addSnippet": "新しいスニペットを追加",
    "editSnippet": "スニペットを編集",
    "error": {
      "savingFailed": "スニペットの保存中にエラーが発生しました。もう一度お試しください。"
    },
    "form": {
      "categories": {
        "counter": "{{categories}}/{{max}}カテゴリ",
        "label": "カテゴリ（最大{{max}}）",
        "placeholder": "カテゴリを入力してEnterまたはカンマを押してください"
      },
      "codeFragments": {
        "add": "新しいフラグメントを追加",
        "label": "コードフラグメント（{{fragments}}）"
      },
      "description": {
        "label": "説明",
        "placeholder": "スニペットの簡単な説明を書いてください"
      },
      "isPublic": {
        "description": "公開スニペットは認証なしで誰でも閲覧できます",
        "label": "スニペットを公開する"
      },
      "title": {
        "counter": "{{characters}}/{{max}}文字",
        "label": "タイトル",
        "placeholder": "スニペットのタイトルを入力してください（最大{{max}}文字）"
      }
    },
    "fragmentRequired": "少なくとも1つのコードフラグメントが必要です",
    "mustHaveFileNames": "すべてのフラグメントにはファイル名が必要です",
    "unsavedChanges": "保存されていない変更があります。閉じてもよろしいですか？"
  },
  "expandSidebar": "サイドバーを展開する",
  "fileExtensions": "ファイル拡張子",
  "filterFiles": "ファイルを絞り込む",
  "fragmentEditor": {
    "action": {
      "collapse": "折りたたむ",
      "delete": "削除",
      "expand": "展開"
    },
    "form": {
      "fileName": {
        "placeholder": "ファイル名"
      },
      "language": {
        "placeholder": "言語を選択",
        "sections": {
          "other": "その他",
          "used": "使用済み"
        }
      }
    },
    "moveDown": "下に移動",
    "moveUp": "上に移動"
  },
  "noExtension": "拡張子なし",
  "noFilesFound": "ファイルが見つかりません",
  "searchFiles": "ファイルを検索する"
}
````

## File: client/src/i18n/locales/ja/components/snippets/embed.json
````json
{
  "embedCopyButton": {
    "title": "クリップボードにコピー"
  },
  "embedModal": {
    "form": {
      "embedCode": "埋め込みコード",
      "fragmentToShow": {
        "all": "すべてのフラグメント",
        "label": "表示するフラグメント（オプション）"
      },
      "showDescription": "説明を表示",
      "showFileHeaders": "ファイルヘッダーを表示",
      "showPoweredBy": "\"Powered by ByteStash\"を表示",
      "showTitle": "タイトルを表示",
      "theme": "テーマ"
    },
    "subTitle": "埋め込みをカスタマイズ",
    "title": "スニペットを埋め込む"
  },
  "embedView": {
    "error": {
      "default": "スニペットの読み込みに失敗しました"
    }
  }
}
````

## File: client/src/i18n/locales/ja/components/snippets/share.json
````json
{
  "sharedSnippetView": {
    "browsePublicSnippets": "公開スニペットを閲覧",
    "loadingSnippet": "スニペットを読み込み中...",
    "snippetExpired": "この共有スニペットの有効期限が切れています",
    "snippetNotFound": "スニペットが見つかりません"
  },
  "shareMenu": {
    "activeShareLinks": {
      "buttons": {
        "copy": "リンクをコピー",
        "delete": "共有リンクを削除",
        "requiresAuth": {
          "false": "スニペットを埋め込む",
          "true": "認証不要のスニペットのみ埋め込み可能"
        }
      },
      "date": {
        "expired": "期限切れ",
        "neverExpires": "有効期限なし"
      },
      "noLinks": "有効な共有リンクなし",
      "relativeExpiryTime": "{{date}}後に期限切れ",
      "requiresAuth": {
        "false": "公開アクセス",
        "true": "保護済み - 認証が必要"
      },
      "title": "有効な共有リンク"
    },
    "createButtonText": "共有リンクを作成",
    "error": {
      "created": "共有リンクの作成に失敗しました",
      "deleted": "共有リンクの削除に失敗しました",
      "invalidDuration": "期間の形式が無効です。1h、2d、30mなどを使用してください。",
      "load": "共有の読み込みに失敗しました",
      "unknownExpiryTime": "有効期限が不明です"
    },
    "expiresIn": "有効期限（例: 1h、2d、30m）",
    "expiresInPlaceholder": "無期限",
    "requiresAuth": "認証を要求",
    "subTitle": "新しい共有リンクを作成",
    "success": {
      "created": "共有リンクを作成しました",
      "deleted": "共有リンクを削除しました"
    },
    "title": "スニペットを共有"
  }
}
````

## File: client/src/i18n/locales/ja/components/auth.json
````json
{
  "apiKeysModal": {
    "created": "作成日時",
    "createKey": "キーを作成",
    "deleteApiKey": "APIキーを削除",
    "enterKeyName": "キー名を入力",
    "lastUsed": "最終使用日時",
    "newApiKey": "新しいAPIキー（今すぐコピーしてください。再表示されません）",
    "notApiKeys": "APIキーが見つかりません",
    "title": "APIキー",
    "yourApiKeys": "あなたのAPIキー"
  },
  "authProvider": {
    "error": {
      "failedCreateAnonymousSession": "匿名セッションの初期化に失敗しました"
    },
    "info": {
      "logoutSuccess": "ログアウトしました"
    }
  },
  "changePasswordModal": {
    "confirmNewPassword": "新しいパスワード（確認用）",
    "currentPassword": "現在のパスワード",
    "error": {
      "default": "パスワードの変更に失敗しました",
      "newPasswordMustBeAtLeastCharacters": "新しいパスワードは最低{{minLength}}文字以上である必要があります",
      "newPasswordsDoNotMatch": "新しいパスワードが一致しません"
    },
    "newPassword": "新しいパスワード",
    "passwordChangedSuccessfully": "パスワードを変更しました",
    "process": "パスワードを変更中...",
    "title": "パスワードを変更"
  },
  "login": {
    "account": "アカウント",
    "browsePublicSnippets": "公開スニペットを閲覧",
    "create": "アカウントを作成",
    "error": {
      "invalidUsernameOrPassword": "ユーザー名またはパスワードが正しくありません"
    },
    "orContinueWithPassword": "またはパスワードで続行",
    "pleaseSignInToContinue": "続行するにはサインインしてください",
    "signingIn": "サインイン中..."
  },
  "oidc": {
    "error": {
      "auth_failed": "認証に失敗しました。ログイン試行がキャンセルされたか、セッションの有効期限が切れている可能性があります。もう一度お試しください。",
      "config_error": "SSO設定でエラーが発生しました。管理者にお問い合わせください。",
      "default": "認証中に予期しないエラーが発生しました。もう一度お試しください。",
      "provider_error": "アイデンティティプロバイダーでエラーが発生したか、利用できません。後でもう一度お試しください、または管理者にお問い合わせください。",
      "registration_disabled": "このByteStashインスタンスでは、新しいアカウントの登録が現在無効になっています。管理者にお問い合わせください。"
    }
  },
  "register": {
    "browsePublicSnippets": "公開スニペットを閲覧",
    "creatingAccount": "アカウントを作成中...",
    "disabled": {
      "description": "新しいアカウントの登録は現在無効になっています。",
      "link": {
        "text": "ログインに戻る"
      },
      "title": "登録無効"
    },
    "error": {
      "default": "登録に失敗しました",
      "passwordsDoNotMatch": "パスワードが一致しません"
    },
    "firstAccountDescription": "これが作成される最初のアカウントです。既存のすべてのスニペットがこのアカウントに自動的に移行されます。",
    "notAvailable": {
      "description": "内部アカウント登録が無効になっており、SSOプロバイダーが設定されていません。管理者にお問い合わせください。",
      "title": "登録利用不可"
    },
    "signInToYourAccount": "アカウントにサインイン",
    "title": "アカウントを作成"
  },
  "signIn": {
    "completing": "サインインを完了中...",
    "with": "{{displayName}}でサインイン"
  },
  "signOut": {
    "completing": "サインアウトを完了中..."
  },
  "userDropdown": {
    "adminPanel": "管理パネル",
    "apiKeys": "APIキー",
    "changePassword": "パスワードを変更",
    "signIn": "サインイン",
    "signOut": "サインアウト"
  }
}
````

## File: client/src/i18n/locales/ja/components/categories.json
````json
{
  "categoryList": {
    "moreCount": "他{{moreCount}}件",
    "noData": "カテゴリなし",
    "showLess": "折りたたむ"
  },
  "categorySuggestions": {
    "addNewLabel": "新規追加",
    "placeholder": "カテゴリを検索...",
    "title": "カテゴリ"
  }
}
````

## File: client/src/i18n/locales/ja/components/search.json
````json
{
  "action": {
    "clear": "検索をクリア",
    "newSnippet": "新しいスニペット",
    "openSettings": "設定を開く",
    "recycleBin": "ゴミ箱",
    "showAll": "すべて表示",
    "showFavorites": "お気に入りを表示"
  },
  "categories": {
    "addNew": "新規追加",
    "title": "カテゴリ"
  },
  "defaultPlaceholder": "スニペットを検索...（#を入力して利用可能なすべてのカテゴリを表示）",
  "filter": {
    "language": {
      "all": "すべての言語"
    }
  },
  "sort": {
    "alphaAsc": "アルファベット順 A-Z",
    "alphaDesc": "アルファベット順 Z-A",
    "newestFirst": "新しい順",
    "oldestFirst": "古い順"
  },
  "view": {
    "grid": "グリッド表示",
    "list": "リスト表示"
  }
}
````

## File: client/src/i18n/locales/ja/components/settings.json
````json
{
  "settingsModal": {
    "block": {
      "category": {
        "expandCategories": {
          "description": "カテゴリグループを自動的に展開",
          "label": "カテゴリを展開"
        },
        "showCategories": {
          "description": "スニペットのカテゴリラベルを表示",
          "label": "カテゴリを表示"
        },
        "title": "カテゴリ"
      },
      "dataManagement": {
        "export": {
          "label": "スニペットをエクスポート"
        },
        "import": {
          "errors": {
            "failed": "\"{{title}}\"のインポートに失敗しました: {{error}}",
            "occurred_one": "{{count, number}}件のエラーが発生しました",
            "occurred_other": "{{count, number}}件のエラーが発生しました"
          },
          "label": "スニペットをインポート",
          "progress": "スニペットをインポート中..."
        },
        "title": "データ管理"
      },
      "locale": {
        "title": "ロケール"
      },
      "search": {
        "includeCodeInSearch": {
          "description": "タイトルだけでなくコード内容も検索",
          "label": "検索にコードを含める"
        },
        "title": "検索"
      },
      "theme": {
        "title": "テーマ"
      },
      "view": {
        "compactView": {
          "description": "スニペットをよりコンパクトな形式で表示",
          "label": "コンパクト表示"
        },
        "previewLines": {
          "description": "スニペットリストにコードのプレビューを表示",
          "label": "コードプレビューを表示"
        },
        "showCodePreview": {
          "description": "プレビューに表示する最大行数（1-20）",
          "label": "プレビュー行数"
        },
        "showLineNumbers": {
          "description": "コードブロックに行番号を表示",
          "label": "行番号を表示"
        },
        "title": "表示"
      }
    },
    "export": {
      "error": {
        "default": "スニペットのエクスポートに失敗しました",
        "noSnippets": "エクスポート可能なスニペットがありません"
      },
      "markdown": {
        "error": {
          "default": "Markdownのエクスポートに失敗しました"
        },
        "success": {
          "default": "Markdownのエクスポートが成功しました"
        },
        "warning": {
          "default": "エクスポート可能なスニペットがありません"
        }
      },
      "success": {
        "default": "{{total}}件のスニペットをエクスポートしました"
      }
    },
    "import": {
      "error": {
        "default": "スニペットのインポートに失敗しました"
      },
      "hasFailed": "{{succeeded}}件のスニペットをインポートしましたが、{{failed}}件失敗しました。詳細はコンソールを確認してください。",
      "successOnly_one": "{{succeeded}}件のスニペットをインポートしました。設定を閉じて確認してください。",
      "successOnly_other": "{{succeeded}}件のスニペットをインポートしました。設定を閉じて確認してください。"
    },
    "title": "設定"
  }
}
````

## File: client/src/i18n/locales/ja/components/utils.json
````json
{
  "config": {
    "caution": "注意",
    "important": "重要",
    "note": "注",
    "tip": "ヒント",
    "warning": "警告"
  }
}
````

## File: client/src/i18n/locales/ja/translation.json
````json
{
  "action": {
    "addSnippet": "スニペットを追加",
    "cancel": "キャンセル",
    "changePassword": "パスワードを変更",
    "clear": "クリア",
    "clearAll": "すべてクリア",
    "close": "閉じる",
    "confirm": "確認",
    "createAccount": "アカウントを作成",
    "delete": "削除",
    "edit": "編集",
    "hidePassword": "パスワードを非表示",
    "load": "読み込み",
    "maximize": "最大化",
    "minimize": "最小化",
    "restore": "復元",
    "save": "保存",
    "saving": "保存中...",
    "showPassword": "パスワードを表示",
    "signIn": "サインイン"
  },
  "confirmPassword": "パスワード（確認用）",
  "loading": "読み込み中...",
  "locale": {
    "en": "英語",
    "es": "スペイン語",
    "ja": "日本語",
    "ru": "ロシア語"
  },
  "no": "いいえ",
  "or": "または",
  "pagination": {
    "next": "次へ",
    "pageOf": "{{totalPages}}ページ中{{currentPage}}ページ目",
    "previous": "前へ",
    "total": "全{{total}}件",
    "useSnippetPagination": {
      "error": {
        "failedSnippetsLoad": "スニペットの読み込みに失敗しました",
        "sessionExpired": "セッションの有効期限が切れました。再度サインインしてください。"
      }
    }
  },
  "password": "パスワード",
  "showing": "表示中",
  "theme": {
    "dark": "ダーク",
    "light": "ライト",
    "system": "システム"
  },
  "username": "ユーザー名"
}
````

## File: client/src/i18n/locales/ru/components/admin/tabs/apiKeys.json
````json
{
  "apiKeyDeletedSuccessfully": "Ключ API успешно удалён",
  "columns": {
    "labels": {
      "actions": "Действия",
      "created": "Дата создания",
      "lastUsed": "Последнее использование",
      "name": "Имя",
      "owner": "Владелец",
      "status": "Статус"
    }
  },
  "confirmationModal": {
    "message": "Вы уверены, что хотите удалить этот ключ API? Владелец ключа больше не сможет использовать его для доступа к API. Это действие невозможно отменить.",
    "title": "Удалить ключ API"
  },
  "entityName_one": "API ключ",
  "entityName_few": "API ключа",
  "entityName_many": "API ключей",
  "entityName_other": "API ключей",
  "error": {
    "default": "Ошибка удаления ключа API"
  },
  "filters": {
    "userId": "Отфильтровать по ID пользователя"
  },
  "status": {
    "active": "Активный",
    "inactive": "Неактивный"
  },
  "table": {
    "emptyMessage": "Ключи API не найдены",
    "loadingMessage": "Загрузка ключей API..."
  }
}
````

## File: client/src/i18n/locales/ru/components/admin/tabs/dashboard.json
````json
{
  "card": {
    "apiKeys": {
      "title": "Ключи API"
    },
    "shares": {
      "title": "Общие ресурсы"
    },
    "snippets": {
      "apiKeys": {
        "active": "Активный"
      },
      "shares": {
        "total": "Всего"
      },
      "title": "Снипеты",
      "viewType": {
        "private": "Приватный",
        "public": "Публичный"
      }
    },
    "users": {
      "authType": {
        "internal": "Логин/пароль",
        "oidc": "OIDC"
      },
      "title": "Пользователи"
    }
  },
  "loadingMessage": "Загрузка статистики..."
}
````

## File: client/src/i18n/locales/ru/components/admin/tabs/shares.json
````json
{
  "action": {
    "copyShareLink": "Копировать ссылку доступа",
    "delete": "Удалить ресурс",
    "viewSnippet": "Просмотр снипета"
  },
  "columns": {
    "labels": {
      "actions": "Действия",
      "auth": "Требует авторизацию",
      "created": "Дата создания",
      "expires": "Срок жизни",
      "id": "ID ресурса",
      "owner": "Владелец",
      "title": "Заголовок"
    }
  },
  "confirmationModal": {
    "message": "Вы уверены, что хотите удалить эту ссылку для общего доступа? Любой, у кого есть ссылка, больше не сможет получить доступ к снипету. Это действие невозможно отменить.",
    "title": "Удалить общий ресурс"
  },
  "entityName_one": "общий ресурс",
  "entityName_few": "общих ресурса",
  "entityName_many": "общих ресурсов",
  "entityName_other": "общих ресурсов",
  "error": {
    "delete": {
      "default": "Не удалось удалить ресурс"
    }
  },
  "filters": {
    "authType": {
      "all": "Все типы доступа",
      "public": "Публичный",
      "requiresAuth": "Требует авторизацию"
    },
    "userId": "Отфильтровать по ID пользователя"
  },
  "success": {
    "copied": {
      "default": "Ссылка скопирована в буфер обмена"
    },
    "delete": {
      "default": "Ресурс успешно удалён"
    }
  },
  "table": {
    "emptyMessage": "Общие ресурсы не найдены",
    "loadingMessage": "Загрузка общих ресурсов..."
  }
}
````

## File: client/src/i18n/locales/ru/components/admin/tabs/snippets.json
````json
{
  "action": {
    "delete": "Удалить снипет",
    "makePrivate": "Сделать приватным",
    "makePublic": "Сделать публичным",
    "scanForOffensiveContent": "С неприемлемым содержимым",
    "showAllSnippets": "Показать все снипеты",
    "viewSnippet": "Просмотр снипета"
  },
  "columns": {
    "labels": {
      "actions": "Действия",
      "fragments": "Фрагменты",
      "owner": "Владелец",
      "title": "Заголовок",
      "updated": "Обновлён",
      "visibility": "Видимость"
    }
  },
  "confirmationModal": {
    "message": "Вы уверены, что хотите навсегда удалить этот снипет? Это действие невозможно отменить.",
    "title": "Удалить снипет"
  },
  "containsOffensiveWords": "Содержит неприемлемые слова: {{words}}",
  "entityName_one": "снипет",
  "entityName_few": "снипета",
  "entityName_many": "снипетов",
  "entityName_other": "снипетов",
  "error": {
    "delete": {
      "default": "Не удалось удалить снипет"
    },
    "update": {
      "default": "Не удалось обновить видимость снипета"
    }
  },
  "filters": {
    "search": "Поиск снипетов...",
    "userId": "ID пользователя",
    "visibility": {
      "all": "Все типы",
      "private": "Приватный",
      "public": "Публичный"
    }
  },
  "offensiveContentMessage": "Обнаружено {{total}} {{entityName}} с неприемлемым содержимым",
  "success": {
    "delete": {
      "default": "Снипет успешно удалён"
    },
    "update": {
      "default": "Видимость снипета обновлена"
    }
  },
  "table": {
    "emptyMessage": "Снипеты не найдены",
    "loadingMessage": "Загрузка снипетов..."
  }
}
````

## File: client/src/i18n/locales/ru/components/admin/tabs/users.json
````json
{
  "action": {
    "activate": "Активировать пользователя",
    "deactivate": "Деактивировать пользователя",
    "delete": "Удалить пользователя"
  },
  "columns": {
    "labels": {
      "actions": "Действия",
      "apiKeysCount": "Ключи API",
      "authType": "Способ авторизации",
      "created": "Дата создания",
      "email": "Email",
      "lastLogin": "Последний вход",
      "snippetsCount": "Снипеты",
      "status": "Статус",
      "username": "Имя"
    }
  },
  "confirmationModal": {
    "message": "Вы уверены, что хотите удалить этого пользователя? Это приведет к безвозвратному удалению всех его снипетов, ключей API и общих ресурсов. Это действие невозможно отменить.",
    "title": "Удалить пользователя"
  },
  "entityName_one": "пользователь",
  "entityName_few": "пользователя",
  "entityName_many": "пользователей",
  "entityName_other": "пользователей",
  "error": {
    "delete": {
      "default": "Не удалось удалить пользователя"
    },
    "update": {
      "default": "Не удалось обновить пользователя"
    }
  },
  "filters": {
    "authType": {
      "all": "Все способы авторизации",
      "internal": "Логин/пароль",
      "oidc": "OIDC"
    },
    "search": "Поиск пользователей...",
    "status": {
      "active": "Активный",
      "all": "Все статусы",
      "inactive": "Неактивный"
    }
  },
  "status": {
    "active": "Активный",
    "inactive": "Неактивный"
  },
  "success": {
    "delete": {
      "default": "Пользователь успешно удален"
    },
    "update": {
      "default": "Статус пользователя обновлен"
    }
  },
  "table": {
    "emptyMessage": "Пользователи не найдены",
    "loadingMessage": "Загрузка пользователей..."
  }
}
````

## File: client/src/i18n/locales/ru/components/admin/common.json
````json
{
  "adminTable": {
    "defaultEmptyMessage": "Нет данных",
    "defaultLoadingMessage": "Загрузка..."
  },
  "filterInput": {
    "defaultPlaceholder": "Поиск..."
  },
  "filterSelect": {
    "defaultPlaceholder": "Выбрать..."
  }
}
````

## File: client/src/i18n/locales/ru/components/admin/modals.json
````json
{
  "snippetViewModal": {
    "error": {
      "failedLoad": "Не удалось загрузить снипет"
    },
    "title": "Загрузка снипета..."
  }
}
````

## File: client/src/i18n/locales/ru/components/admin/selector.json
````json
{
  "apiKeys": "Ключи API",
  "dashboard": "Статистика",
  "shares": "Общие ресурсы",
  "snippets": "Снипеты",
  "users": "Пользователи"
}
````

## File: client/src/i18n/locales/ru/components/common/buttons.json
````json
{
  "copyButton": {
    "title": "Скопировать в буфер обмена"
  },
  "downloadArchiveButton": {
    "error": {
      "failedDownload": "Не удалось скачать архив"
    },
    "fileLabel_one": "{{count, number}} файл",
    "fileLabel_few": "{{count, number}} файла",
    "fileLabel_many": "{{count, number}} файлов",
    "fileLabel_other": "{{count, number}} файлов",
    "label": "Скачать все",
    "success": {
      "downloadedAll": "Скачаны все фрагменты кода"
    },
    "title": "Скачать все файлы в виде ZIP-архива"
  },
  "downloadButton": {
    "error": {
      "failedDownload": "Не удалось загрузить файл"
    },
    "success": {
      "downloaded": "\"{{fileName}}\" успешно загружен"
    },
    "title": "Загрузить {{fileName}}",
    "warning": {
      "nothing": "Нечего скачивать"
    }
  },
  "exportButton": {
    "tooltip": "Экспорт"
  },
  "exportModal": {
    "copyClipboard": "Копировать",
    "downloadPng": "Скачать PNG",
    "downloadSvg": "Скачать SVG",
    "errorCopy": "Не удалось скопировать изображение",
    "errorGenerate": "Не удалось сгенерировать изображение",
    "shareLinkedIn": "Поделиться в LinkedIn",
    "shareTwitter": "Поделиться в X",
    "successCopy": "Изображение скопировано в буфер обмена!",
    "title": "Экспорт кода"
  },
  "fileUploadButton": {
    "error": {
      "unknown": "Неизвестная ошибка"
    },
    "info": {
      "duplicateDetected": "Обнаружен дубликат файла",
      "duplicatesDetected_one": "{{count, number}} дубликат обнаружен",
      "duplicatesDetected_few": "{{count, number}} дубликата обнаружено",
      "duplicatesDetected_many": "{{count, number}} дубликатов обнаружено",
      "duplicatesDetected_other": "{{count, number}} дубликатов обнаружено"
    },
    "label": "Загрузить файл(ы) с кодом",
    "loadFromUrl": {
      "contentMaxSizeError": "Размер контента должен быть меньше {{max}}",
      "invalidUrl": "Пожалуйста, введите действительный URL-адрес",
      "label": "Загрузить по ссылке",
      "title": "Загрузите код с URL-адреса (например, необработанной ссылки GitHub)"
    },
    "success": {
      "filesUploaded_one": "{{count, number}} файл успешно загружен",
      "filesUploaded_few": "{{count, number}} файла успешно загружено",
      "filesUploaded_many": "{{count, number}} файлов успешно загружено",
      "filesUploaded_other": "{{count, number}} файлов успешно загружено",
      "fileUploaded": "\"{{fileName}}\" успешно загружен",
      "someFilesUploaded": "{{successCount}} из {{total}} файлов успешно загружено"
    },
    "title": "Загрузите файл(ы) с кодом для автоматического создания фрагментов"
  },
  "rawButton": {
    "title": "Открыть исходник"
  }
}
````

## File: client/src/i18n/locales/ru/components/common/dropdowns.json
````json
{
  "baseDropdown": {
    "addNewLabel": "Добавить",
    "defaultPlaceholder": "Выберите или введите значение"
  }
}
````

## File: client/src/i18n/locales/ru/components/common/markdown.json
````json
{
  "mermaid": {
    "copyCode": "Копировать код Mermaid",
    "downloadPNG": "Скачать как PNG",
    "downloadSVG": "Скачать как SVG",
    "exitFullscreen": "Выйти из полноэкранного режима",
    "fullscreen": "Полный экран",
    "renderError": "Не удалось отрисовать диаграмму Mermaid:",
    "renderErrorFallback": "Ошибка отрисовки диаграммы",
    "resetView": "Сбросить вид",
    "title": "Диаграмма Mermaid",
    "zoomIn": "Приблизить",
    "zoomOut": "Отдалить"
  }
}
````

## File: client/src/i18n/locales/ru/components/common/modals.json
````json
{
  "changelogModal": {
    "error": {
      "default": "Не удалось загрузить Changelog. Пожалуйста, повторите попытку позже."
    }
  }
}
````

## File: client/src/i18n/locales/ru/components/snippets/list/snippetCard.json
````json
{
  "confirmationModalDelete": {
    "confirmLabel": {
      "isRecycleView": {
        "false": "Переместить в корзину",
        "true": "Удалить навсегда"
      }
    },
    "message": {
      "isRecycleView": {
        "false": "Вы уверены, что хотите переместить \"{{title}}\" в корзину?",
        "true": "Вы уверены, что хотите навсегда удалить \"{{title}}\"? Это действие невозможно отменить."
      }
    },
    "title": {
      "isRecycleView": {
        "false": "Переместить в корзину",
        "true": "Подтвердить удаление"
      }
    }
  },
  "confirmationModalRestore": {
    "message": "Вы уверены, что хотите восстановить \"{{title}}\"?",
    "title": "Подтвердить восстановление"
  },
  "date": {
    "ago": "{{date}} назад",
    "expiringSoon": "Срок действия скоро истекает",
    "left": "осталось {{date}}"
  },
  "defaultDescription": "Нет описания",
  "defaultUpdateTime": "Неизвестно",
  "favorite": "В избранном",
  "pinned": "Закреплённый",
  "public": "Публичный",
  "shared": "Общедоступный"
}
````

## File: client/src/i18n/locales/ru/components/snippets/list/snippetCardMenu.json
````json
{
  "addToFavorites": "Добавить в избранное",
  "deleteSnippet": "Удалить снипет",
  "duplicateSnippet": "Дублировать снипет",
  "editSnippet": "Редактировать снипет",
  "openInNewTab": "В новой вкладке",
  "pinSnippet": "Закрепить снипет",
  "removeFromFavorites": "Удалить из избранного",
  "shareSnippet": "Поделиться",
  "unpinSnippet": "Открепить снипет"
}
````

## File: client/src/i18n/locales/ru/components/snippets/list/snippetList.json
````json
{
  "noSnippetsMatch": "Нет снипетов, соответствующих вашим критериям поиска"
}
````

## File: client/src/i18n/locales/ru/components/snippets/list/snippetRecycleCardMenu.json
````json
{
  "deleteSnippet": "Удалить снипет",
  "restoreSnippet": "Восстановить снипет"
}
````

## File: client/src/i18n/locales/ru/components/snippets/view/all.json
````json
{
  "fullCodeView": {
    "dateTimeAgo": "{{dateTime}} назад",
    "defaultDescription": "Нет описания"
  },
  "files": "файлов",
  "collapseSidebar": "Свернуть панель",
  "expandSidebar": "Развернуть панель",
  "searchFiles": "Поиск файлов...",
  "noFilesFound": "Файлы не найдены",
  "filterFiles": "Фильтр файлов",
  "fileExtensions": "Расширения файлов",
  "noExtension": "Без расширения",
  "defaultUpdateTime": "Неизвестно",
  "snippetModal": {
    "confirmationModal": {
      "confirmLabel": {
        "isRecycleView": {
          "false": "Переместить в корзину",
          "true": "Удалить навсегда"
        }
      },
      "message": {
        "isRecycleView": {
          "false": "Вы уверены, что хотите переместить \"{{title}}\" в корзину?",
          "true": "Вы уверены, что хотите навсегда удалить \"{{title}}\"? Это действие невозможно отменить."
        }
      },
      "title": {
        "isRecycleView": {
          "false": "Переместить в корзину",
          "true": "Подтвердить удаление"
        }
      }
    }
  }
}
````

## File: client/src/i18n/locales/ru/components/snippets/view/common.json
````json
{
  "authAwareSnippetView": {
    "error": {
      "snippetLoad": "Не удалось загрузить снипет",
      "snippetRequireAuth": "Для просмотра этого снипета требуется аутентификация"
    }
  },
  "baseSnippetStorage": {
    "error": {
      "sessionExpired": "Сессия истекла. Пожалуйста, войдите снова.",
      "snippetCreated": "Не удалось создать снипет",
      "snippetUpdated": "Не удалось обновить снипет"
    },
    "success": {
      "displayAll": "Все снипеты",
      "displayFavorites": "Избранные снипеты",
      "snippetCreated": "Снипет успешно создан",
      "snippetUpdated": "Снипет успешно обновлён"
    }
  },
  "browsePublicSnippets": "Просмотр общедоступных снипетов",
  "filter": {
    "filteredByCategories": "Отфильтровано по категориям"
  },
  "loadingSnippets": "Загрузка снипетов...",
  "signIn": "Войти",
  "sippetNotFound": "Снипет не найден",
  "snippetContentArea": {
    "error": {
      "duplicateSnippet": "Не удалось дублировать снипет",
      "loadSnippets": "Не удалось загрузить снипеты",
      "moveSnippetToRecycleBin": "Не удалось переместить снипет в корзину. Пожалуйста, попробуйте еще раз.",
      "sessionExpired": "Сессия истекла. Пожалуйста, войдите снова.",
      "updateFavoriteStatusAdded": "Не удалось добавить снипет в избранное. Пожалуйста, попробуйте еще раз.",
      "updateFavoriteStatusDeleted": "Не удалось удалить снипет из избранного. Пожалуйста, попробуйте еще раз.",
      "updatePinStatusAdded": "Не удалось закрепить снипет. Пожалуйста, попробуйте еще раз.",
      "updatePinStatusDeleted": "Не удалось открепить снипет. Пожалуйста, попробуйте еще раз."
    },
    "success": {
      "duplicateSnippet": "Снипет успешно продублирован",
      "moveSnippetToRecycleBin": "Снипет успешно перемещён в корзину",
      "updateFavoriteStatusAdded": "Снипет успешно добавлен в избранное",
      "updateFavoriteStatusDeleted": "Снипет успешно удален из избранного",
      "updatePinStatusAdded": "Снипет успешно закреплён",
      "updatePinStatusDeleted": "Снипет успешно откреплён"
    }
  },
  "storageHeader": {
    "private": "Вы просматриваете свои личные снипеты. Только вы можете просматривать и изменять эти снипеты.",
    "public": "Вы просматриваете общедоступные снипеты. Эти снипеты доступны только для чтения и видны всем."
  },
  "viewSwitch": {
    "private": "Приватные",
    "public": "Публичные"
  }
}
````

## File: client/src/i18n/locales/ru/components/snippets/view/public.json
````json
{
  "publicSnippetContentArea": {
    "error": {
      "addSnippetToCollection": "Не удалось добавить снипет в коллекцию",
      "failedLoadSnippets": "Не удалось загрузить общедоступные снипеты"
    },
    "filter": {
      "byCategories": "Отфильтровано по категориям"
    },
    "info": {
      "requireAuth": "Пожалуйста, войдите в систему, чтобы добавить этот снипет в свою коллекцию"
    },
    "loadingSnippets": "Загрузка снипетов...",
    "success": {
      "addSnippetToCollection": "Снипет добавлен в вашу коллекцию"
    }
  }
}
````

## File: client/src/i18n/locales/ru/components/snippets/view/recycle.json
````json
{
  "recycleSnippetContentArea": {
    "error": {
      "deleteSnippet": "Не удалось удалить снипет",
      "loadSnippets": "Не удалось загрузить снипеты",
      "restoreSnippet": "Не удалось восстановить снипет",
      "sessionExpired": "Сессия истекла. Пожалуйста, войдите снова."
    },
    "filter": {
      "byCategories": "Отфильтровано по категориям"
    },
    "loadingSnippets": "Загрузка снипетов...",
    "success": {
      "deleteSnippet": "Снипет успешно удалён",
      "restoreSnippet": "Снипет успешно восстановлен"
    }
  },
  "recycleSnippetStorage": {
    "backToSnippets": "Назад к снипетам",
    "confirmationModal": {
      "message": "Вы уверены, что хотите навсегда удалить все снипеты из корзины? Это действие невозможно отменить.",
      "title": "Подтвердить удаление"
    },
    "description": "Снипеты из корзины будут удалены без возможности восстановления через 30 дней",
    "error": {
      "clear": "Не удалось очистить корзину. Пожалуйста, попробуйте еще раз.",
      "sessionExpired": "Сессия истекла. Пожалуйста, войдите снова."
    },
    "info": {
      "noSnippets": "В корзине нет снипетов, которые нужно очистить"
    },
    "recycleBin": "Корзина",
    "success": {
      "clear": "Все снипеты в корзине удалены"
    }
  }
}
````

## File: client/src/i18n/locales/ru/components/snippets/edit.json
````json
{
  "editSnippetModal": {
    "addSnippet": "Добавить снипет",
    "editSnippet": "Редактировать снипет",
    "error": {
      "savingFailed": "Произошла ошибка при сохранении снипета. Пожалуйста, попробуйте еще раз."
    },
    "form": {
      "categories": {
        "counter": "{{categories}}/{{max}} категорий",
        "label": "Категории (максимум {{max}})",
        "placeholder": "Введите категорию и нажмите Enter или запятую"
      },
      "codeFragments": {
        "add": "Добавить фрагмент кода",
        "label": "Фрагменты кода ({{fragments}})"
      },
      "description": {
        "label": "Описание",
        "placeholder": "Напишите краткое описание снипета"
      },
      "isPublic": {
        "description": "Публичные снипеты могут быть просмотрены кем угодно без аутентификации",
        "label": "Сделать публичным"
      },
      "title": {
        "counter": "{{characters}}/{{max}} символов",
        "label": "Заголовок",
        "placeholder": "Введите заголовок снипета (максимум {{max}} символов)"
      }
    },
    "fragmentRequired": "Требуется хотя бы один фрагмент кода",
    "mustHaveFileNames": "Все фрагменты должны иметь имя файла",
    "unsavedChanges": "У вас есть несохраненные изменения. Вы уверены, что хотите закрыть?"
  },
  "searchFiles": "Поиск файлов...",
  "noFilesFound": "Файлы не найдены",
  "expandSidebar": "Развернуть панель",
  "filterFiles": "Фильтр файлов",
  "fileExtensions": "Расширения файлов",
  "noExtension": "Без расширения",
  "fragmentEditor": {
    "action": {
      "collapse": "Свернуть",
      "delete": "Удалить",
      "expand": "Развернуть"
    },
    "form": {
      "fileName": {
        "placeholder": "Имя файла"
      },
      "language": {
        "placeholder": "Выберите язык",
        "sections": {
          "other": "Другие",
          "used": "Использованные"
        }
      }
    },
    "moveDown": "Переместить вниз",
    "moveUp": "Переместить вверх"
  }
}
````

## File: client/src/i18n/locales/ru/components/snippets/embed.json
````json
{
  "embedCopyButton": {
    "title": "Скопировать в буфер обмена"
  },
  "embedModal": {
    "form": {
      "embedCode": "Встроить код",
      "fragmentToShow": {
        "all": "Все фрагменты",
        "label": "Фрагмент для отображения (необязательно)"
      },
      "showDescription": "Показать описание",
      "showFileHeaders": "Показать заголовки файлов",
      "showPoweredBy": "Показать \"Powered by ByteStash\"",
      "showTitle": "Показать заголовок",
      "theme": "Тема"
    },
    "subTitle": "Настроить вставку",
    "title": "Вставить фрагмент"
  },
  "embedView": {
    "error": {
      "default": "Не удалось загрузить фрагмент"
    }
  }
}
````

## File: client/src/i18n/locales/ru/components/snippets/share.json
````json
{
  "sharedSnippetView": {
    "browsePublicSnippets": "Посмотрите публичные снипеты",
    "loadingSnippet": "Загрузка снипета...",
    "snippetExpired": "Срок действия этого снипета истек",
    "snippetNotFound": "Снипет не найден"
  },
  "shareMenu": {
    "activeShareLinks": {
      "buttons": {
        "copy": "Копировать ссылку",
        "delete": "Удалить ссылку на общий доступ",
        "requiresAuth": {
          "false": "Вставить снипет",
          "true": "Можно вставлять только неаутентифицированные снипеты"
        }
      },
      "date": {
        "expired": "Срок жизни истёк",
        "neverExpires": "Без срока жизни"
      },
      "noLinks": "Нет активных ссылок для обмена",
      "relativeExpiryTime": "Срок жизни {{date}}",
      "requiresAuth": {
        "false": "Публичный доступ",
        "true": "Защищено – требуется аутентификация"
      },
      "title": "Активные ссылки для обмена"
    },
    "createButtonText": "Создать ссылку для общего доступа",
    "error": {
      "created": "Не удалось создать ссылку для общего доступа",
      "deleted": "Не удалось удалить ссылку для общего доступа",
      "invalidDuration": "Неверный формат продолжительности жизни. Используйте 1h, 2d, 30m и т.д.",
      "load": "Не удалось загрузить ссылки общего доступа",
      "unknownExpiryTime": "Неизвестный срок действия"
    },
    "expiresIn": "Срок действия истекает через (например 1h, 2d, 30m)",
    "expiresInPlaceholder": "Никогда",
    "requiresAuth": "Требовать аутентификацию",
    "subTitle": "Создать новую ссылку для общего доступа",
    "success": {
      "created": "Ссылка для общего доступа создана",
      "deleted": "Ссылка для общего доступа удалена"
    },
    "title": "Поделиться снипетом"
  }
}
````

## File: client/src/i18n/locales/ru/components/auth.json
````json
{
  "apiKeysModal": {
    "created": "Дата создания",
    "createKey": "Создать ключ",
    "deleteApiKey": "Удалить ключ API",
    "enterKeyName": "Введите имя ключа",
    "lastUsed": "Использовался",
    "newApiKey": "Новый ключ API (скопируйте его сейчас, он больше не будет отображаться)",
    "notApiKeys": "Ключи API не найдены",
    "title": "Ключи API",
    "yourApiKeys": "Ваши ключи API"
  },
  "authProvider": {
    "error": {
      "failedCreateAnonymousSession": "Не удалось инициализировать анонимный сеанс"
    },
    "info": {
      "logoutSuccess": "Выход из системы произошёл успешно"
    }
  },
  "changePasswordModal": {
    "confirmNewPassword": "Подтверждение пароля",
    "currentPassword": "Текущий пароль",
    "error": {
      "default": "Ошибка изменения пароля",
      "newPasswordMustBeAtLeastCharacters": "Новый пароль должен содержать не менее {{minLength}} символов",
      "newPasswordsDoNotMatch": "Новые пароль не совпадает с подтверждением"
    },
    "newPassword": "Новый пароль",
    "passwordChangedSuccessfully": "Пароль успешно изменён",
    "process": "Изменение пароля...",
    "title": "Изменить пароль"
  },
  "login": {
    "account": "аккаунт",
    "browsePublicSnippets": "посмотрите публичные снипеты",
    "create": "создать",
    "error": {
      "invalidUsernameOrPassword": "Неверное имя пользователя или пароль"
    },
    "orContinueWithPassword": "Или войдите с паролем",
    "pleaseSignInToContinue": "Пожалуйста, войдите в систему, чтобы продолжить",
    "signingIn": "Вход в систему..."
  },
  "oidc": {
    "error": {
      "auth_failed": "Сбой аутентификации. Это может быть связано с отмененной попыткой входа в систему или истекшей сессией. Пожалуйста, попробуйте еще раз.",
      "config_error": "Произошла ошибка в конфигурации SSO. Пожалуйста, свяжитесь с администратором.",
      "default": "Во время аутентификации произошла непредвиденная ошибка. Пожалуйста, попробуйте еще раз.",
      "provider_error": "Поставщик идентификации столкнулся с ошибкой или недоступен. Пожалуйста, попробуйте позже или свяжитесь с администратором.",
      "registration_disabled": "Регистрация новых учетных записей в настоящее время отключена в этом экземпляре ByteStash. Пожалуйста, свяжитесь с администратором."
    }
  },
  "register": {
    "browsePublicSnippets": "посмотрите публичные снипеты",
    "creatingAccount": "Создание аккаунта...",
    "disabled": {
      "description": "Регистрация новых учетных записей в настоящее время отключена.",
      "link": {
        "text": "Вернуться на форму входа"
      },
      "title": "Регистрация отключена"
    },
    "error": {
      "default": "Ошибка регистрации",
      "passwordsDoNotMatch": "Пароли не совпадают"
    },
    "firstAccountDescription": "Это первая учетная запись, которая будет создана. Все существующие снипеты будут автоматически перенесены в этот аккаунт.",
    "notAvailable": {
      "description": "Регистрация учетной записи отключена и поставщики SSO не настроены. Пожалуйста, свяжитесь с администратором.",
      "title": "Регистрация недоступна"
    },
    "signInToYourAccount": "войдите в свою учетную запись",
    "title": "Создать аккаунт"
  },
  "signIn": {
    "completing": "Завершение входа в систему...",
    "with": "Войти с помощью {{displayName}}"
  },
  "signOut": {
    "completing": "Завершение процесса выхода из системы..."
  },
  "userDropdown": {
    "adminPanel": "Панель администратора",
    "apiKeys": "Ключи API",
    "changePassword": "Изменить пароль",
    "signIn": "Войти",
    "signOut": "Выйти"
  }
}
````

## File: client/src/i18n/locales/ru/components/categories.json
````json
{
  "categoryList": {
    "moreCount": "более {{moreCount}}",
    "noData": "Нет категорий",
    "showLess": "Показать меньше"
  },
  "categorySuggestions": {
    "addNewLabel": "Добавить",
    "placeholder": "Начните ввод для поиска категорий...",
    "title": "Категории"
  }
}
````

## File: client/src/i18n/locales/ru/components/search.json
````json
{
  "action": {
    "clear": "Очистить поиск",
    "newSnippet": "Создать",
    "openSettings": "Настройки",
    "recycleBin": "Корзина",
    "showAll": "Показать все",
    "showFavorites": "Избранное"
  },
  "categories": {
    "addNew": "Создать категорию",
    "title": "Категории"
  },
  "defaultPlaceholder": "Поиск снипетов... (Наберите # чтобы просмотреть все доступные категории)",
  "filter": {
    "language": {
      "all": "Все языки"
    }
  },
  "sort": {
    "alphaAsc": "А-Я",
    "alphaDesc": "Я-А",
    "newestFirst": "Сначала новые",
    "oldestFirst": "Сначала старые"
  },
  "view": {
    "grid": "Карточки",
    "list": "Список"
  }
}
````

## File: client/src/i18n/locales/ru/components/settings.json
````json
{
  "settingsModal": {
    "block": {
      "category": {
        "expandCategories": {
          "description": "Автоматическое разворачивание групп категорий",
          "label": "Развернуть категории"
        },
        "showCategories": {
          "description": "Отображение меток категорий для сниппетов",
          "label": "Показать категории"
        },
        "title": "Категории"
      },
      "dataManagement": {
        "export": {
          "label": "Экспорт сниппетов"
        },
        "import": {
          "errors": {
            "failed": "Не удалось импортировать \"{{title}}\": {{error}}",
            "occurred_one": "Произошла {{count, number}} ошибка",
            "occurred_few": "Произошло {{count, number}} ошибки",
            "occurred_many": "Произошло {{count, number}} ошибок",
            "occurred_other": "Произошло {{count, number}} ошибок"
          },
          "label": "Импорт сниппетов",
          "progress": "Идёт импорт сниппетов..."
        },
        "title": "Управление данными"
      },
      "locale": {
        "title": "Язык"
      },
      "search": {
        "includeCodeInSearch": {
          "description": "Поиск осуществляется внутри содержимого кода, а не только в заголовках.",
          "label": "Включить код в поиск"
        },
        "title": "Поиск"
      },
      "theme": {
        "title": "Тема"
      },
      "view": {
        "compactView": {
          "description": "Отображение сниппетов в более сжатом формате",
          "label": "Компактный вид"
        },
        "previewLines": {
          "description": "Отобразить предварительный просмотр кода в списке сниппетов",
          "label": "Предварительный просмотр кода"
        },
        "showCodePreview": {
          "description": "Максимальное количество строк для отображения в предварительном просмотре (1-20)",
          "label": "Количество строк предварительного просмотра"
        },
        "showLineNumbers": {
          "description": "Отобразить номера строк в блоках кода",
          "label": "Показать номера строк"
        },
        "title": "Просмотр"
      }
    },
    "export": {
      "error": {
        "default": "Произошла ошибка экспорта",
        "noSnippets": "Нет снипетов, доступных для экспорта"
      },
      "markdown": {
        "error": {
          "default": "Не удалось экспортировать в Markdown"
        },
        "success": {
          "default": "Экспорт в Markdown выполнен успешно"
        },
        "warning": {
          "default": "Нет снипетов, доступных для экспорта"
        }
      },
      "success": {
        "default": "Успешно экспортировано снипетов: {{total}}"
      }
    },
    "import": {
      "error": {
        "default": "Произошла ошибка импорта"
      },
      "hasFailed": "Импортировано успешно: {{succeeded}}, с ошибками: {{failed}}. Проверьте консоль браузера для получения подробной информации.",
      "successOnly_one": "Успешно импортирован {{succeeded}} снипет. Закройте настройки, чтобы их увидеть.",
      "successOnly_few": "Успешно импортировано {{succeeded}} снипета. Закройте настройки, чтобы их увидеть.",
      "successOnly_many": "Успешно импортировано {{succeeded}} снипетов. Закройте настройки, чтобы их увидеть.",
      "successOnly_other": "Успешно импортировано {{succeeded}} снипетов. Закройте настройки, чтобы их увидеть."
    },
    "title": "Настройки"
  }
}
````

## File: client/src/i18n/locales/ru/components/utils.json
````json
{
  "config": {
    "caution": "Осторожно",
    "important": "Важно",
    "note": "Примечание",
    "tip": "Совет",
    "warning": "Предупреждение"
  }
}
````

## File: client/src/i18n/locales/ru/translation.json
````json
{
  "action": {
    "addSnippet": "Добавить снипет",
    "cancel": "Отменить",
    "changePassword": "Изменить пароль",
    "clear": "Очистить",
    "clearAll": "Очистить всё",
    "close": "Закрыть",
    "confirm": "Подтвердить",
    "createAccount": "Создать аккаунт",
    "delete": "Удалить",
    "edit": "Редактировать",
    "hidePassword": "Скрыть пароль",
    "load": "Загрузить",
    "maximize": "Развернуть",
    "minimize": "Свернуть",
    "restore": "Восстановить",
    "save": "Сохранить",
    "saving": "Сохранение...",
    "showPassword": "Показать пароль",
    "signIn": "Войти"
  },
  "confirmPassword": "Подтверждение пароля",
  "loading": "Загрузка...",
  "locale": {
    "en": "Английский",
    "es": "Испанский",
    "ja": "Японский",
    "ru": "Русский"
  },
  "no": "нет",
  "or": "или",
  "pagination": {
    "next": "Следующая",
    "pageOf": "Страница {{currentPage}} из {{totalPages}}",
    "previous": "Предыдущая",
    "total": "{{total}} всего",
    "useSnippetPagination": {
      "error": {
        "failedSnippetsLoad": "Не удалось загрузить снипеты",
        "sessionExpired": "Сессия истекла. Пожалуйста, войдите снова."
      }
    }
  },
  "password": "Пароль",
  "showing": "Показано",
  "theme": {
    "dark": "Тёмная",
    "light": "Светлая",
    "system": "Системная"
  },
  "username": "Имя пользователя"
}
````

## File: client/src/i18n/locales/zh/components/admin/tabs/apiKeys.json
````json
{
  "apiKeyDeletedSuccessfully": "API 密钥删除成功",
  "columns": {
    "labels": {
      "actions": "操作",
      "created": "创建时间",
      "lastUsed": "最后使用时间",
      "name": "名称",
      "owner": "所有者",
      "status": "状态"
    }
  },
  "confirmationModal": {
    "message": "确定要删除这个 API 密钥吗？删除后，该密钥所有者将无法再使用它访问 API。此操作无法撤销。",
    "title": "删除 API 密钥"
  },
  "entityName_one": "API 密钥",
  "entityName_other": "API 密钥",
  "error": {
    "default": "删除 API 密钥失败"
  },
  "filters": {
    "userId": "按用户 ID 筛选"
  },
  "status": {
    "active": "启用",
    "inactive": "停用"
  },
  "table": {
    "emptyMessage": "未找到 API 密钥",
    "loadingMessage": "正在加载 API 密钥..."
  }
}
````

## File: client/src/i18n/locales/zh/components/admin/tabs/dashboard.json
````json
{
  "card": {
    "apiKeys": {
      "title": "API 密钥"
    },
    "shares": {
      "title": "分享"
    },
    "snippets": {
      "apiKeys": {
        "active": "启用"
      },
      "shares": {
        "total": "总数"
      },
      "title": "代码片段",
      "viewType": {
        "private": "私有",
        "public": "公开"
      }
    },
    "users": {
      "authType": {
        "internal": "内部",
        "oidc": "OIDC"
      },
      "title": "用户"
    }
  },
  "loadingMessage": "正在加载统计信息..."
}
````

## File: client/src/i18n/locales/zh/components/admin/tabs/shares.json
````json
{
  "action": {
    "copyShareLink": "复制分享链接",
    "delete": "删除分享",
    "viewSnippet": "查看代码片段"
  },
  "columns": {
    "labels": {
      "actions": "操作",
      "auth": "需要认证",
      "created": "创建时间",
      "expires": "过期时间",
      "id": "分享 ID",
      "owner": "所有者",
      "title": "标题"
    }
  },
  "confirmationModal": {
    "message": "确定要删除这个分享链接吗？拥有该链接的任何人都将无法再访问此代码片段。此操作无法撤销。",
    "title": "删除分享"
  },
  "entityName_one": "分享",
  "entityName_other": "分享",
  "error": {
    "delete": {
      "default": "删除分享失败"
    }
  },
  "filters": {
    "authType": {
      "all": "所有认证类型",
      "public": "公开",
      "requiresAuth": "需要认证"
    },
    "userId": "按用户 ID 筛选"
  },
  "success": {
    "copied": {
      "default": "分享链接已复制到剪贴板"
    },
    "delete": {
      "default": "分享删除成功"
    }
  },
  "table": {
    "emptyMessage": "未找到分享",
    "loadingMessage": "正在加载分享..."
  }
}
````

## File: client/src/i18n/locales/zh/components/admin/tabs/snippets.json
````json
{
  "action": {
    "delete": "删除代码片段",
    "makePrivate": "设为私有",
    "makePublic": "设为公开",
    "scanForOffensiveContent": "扫描冒犯性内容",
    "showAllSnippets": "显示全部代码片段",
    "viewSnippet": "查看代码片段"
  },
  "columns": {
    "labels": {
      "actions": "操作",
      "fragments": "片段数",
      "owner": "所有者",
      "title": "标题",
      "updated": "更新时间",
      "visibility": "可见性"
    }
  },
  "confirmationModal": {
    "message": "确定要永久删除这个代码片段吗？此操作无法撤销。",
    "title": "删除代码片段"
  },
  "containsOffensiveWords": "包含冒犯性词汇：{{words}}",
  "entityName_one": "代码片段",
  "entityName_other": "代码片段",
  "error": {
    "delete": {
      "default": "删除代码片段失败"
    },
    "update": {
      "default": "更新代码片段可见性失败"
    }
  },
  "filters": {
    "search": "搜索代码片段...",
    "userId": "用户 ID",
    "visibility": {
      "all": "全部可见性",
      "private": "私有",
      "public": "公开"
    }
  },
  "offensiveContentMessage": "发现 {{total}} 个{{entityName}}包含冒犯性内容",
  "success": {
    "delete": {
      "default": "代码片段删除成功"
    },
    "update": {
      "default": "代码片段可见性已更新"
    }
  },
  "table": {
    "emptyMessage": "未找到代码片段",
    "loadingMessage": "正在加载代码片段..."
  }
}
````

## File: client/src/i18n/locales/zh/components/admin/tabs/users.json
````json
{
  "action": {
    "activate": "启用用户",
    "deactivate": "停用用户",
    "delete": "删除用户"
  },
  "columns": {
    "labels": {
      "actions": "操作",
      "apiKeysCount": "API 密钥",
      "authType": "认证类型",
      "created": "创建时间",
      "email": "邮箱",
      "lastLogin": "最后登录",
      "snippetsCount": "代码片段",
      "status": "状态",
      "username": "用户名"
    }
  },
  "confirmationModal": {
    "message": "确定要删除此用户吗？这将永久删除其所有代码片段、API 密钥和分享。此操作无法撤销。",
    "title": "删除用户"
  },
  "entityName_one": "用户",
  "entityName_other": "用户",
  "error": {
    "delete": {
      "default": "删除用户失败"
    },
    "update": {
      "default": "更新用户失败"
    }
  },
  "filters": {
    "authType": {
      "all": "所有认证类型",
      "internal": "内部",
      "oidc": "OIDC"
    },
    "search": "搜索用户...",
    "status": {
      "active": "启用",
      "all": "全部状态",
      "inactive": "停用"
    }
  },
  "status": {
    "active": "启用",
    "inactive": "停用"
  },
  "success": {
    "delete": {
      "default": "用户删除成功"
    },
    "update": {
      "default": "用户状态已更新"
    }
  },
  "table": {
    "emptyMessage": "未找到用户",
    "loadingMessage": "正在加载用户..."
  }
}
````

## File: client/src/i18n/locales/zh/components/admin/common.json
````json
{
  "adminTable": {
    "defaultEmptyMessage": "未找到数据",
    "defaultLoadingMessage": "加载中..."
  },
  "filterInput": {
    "defaultPlaceholder": "搜索..."
  },
  "filterSelect": {
    "defaultPlaceholder": "请选择..."
  }
}
````

## File: client/src/i18n/locales/zh/components/admin/modals.json
````json
{
  "snippetViewModal": {
    "error": {
      "failedLoad": "加载代码片段失败"
    },
    "title": "正在加载代码片段..."
  }
}
````

## File: client/src/i18n/locales/zh/components/admin/selector.json
````json
{
  "apiKeys": "API 密钥",
  "dashboard": "仪表盘",
  "shares": "分享",
  "snippets": "代码片段",
  "users": "用户"
}
````

## File: client/src/i18n/locales/zh/components/common/buttons.json
````json
{
  "copyButton": {
    "title": "复制到剪贴板"
  },
  "downloadArchiveButton": {
    "error": {
      "failedDownload": "下载压缩包失败"
    },
    "fileLabel_one": "{{count, number}} 个文件",
    "fileLabel_other": "{{count, number}} 个文件",
    "label": "全部下载",
    "success": {
      "downloadedAll": "已下载全部代码片段"
    },
    "title": "将所有文件下载为 ZIP 压缩包"
  },
  "downloadButton": {
    "error": {
      "failedDownload": "下载文件失败"
    },
    "success": {
      "downloaded": "“{{fileName}}” 下载成功"
    },
    "title": "下载 {{fileName}}",
    "warning": {
      "nothing": "没有可下载的内容"
    }
  },
  "fileUploadButton": {
    "error": {
      "unknown": "未知错误"
    },
    "info": {
      "duplicateDetected": "检测到重复文件",
      "duplicatesDetected_one": "检测到 {{count, number}} 个重复文件",
      "duplicatesDetected_other": "检测到 {{count, number}} 个重复文件"
    },
    "label": "上传代码文件",
    "loadFromUrl": {
      "contentMaxSizeError": "内容大小必须小于 {{max}}",
      "invalidUrl": "请输入有效的 URL",
      "label": "从 URL 加载",
      "title": "从 URL 加载代码（例如 GitHub 原始链接）"
    },
    "success": {
      "filesUploaded_one": "{{count, number}} 个文件上传成功",
      "filesUploaded_other": "{{count, number}} 个文件上传成功",
      "fileUploaded": "“{{fileName}}” 上传成功",
      "someFilesUploaded": "{{total}} 个文件中有 {{successCount}} 个上传成功"
    },
    "title": "上传代码文件以自动创建片段"
  },
  "rawButton": {
    "title": "打开原始内容"
  }
}
````

## File: client/src/i18n/locales/zh/components/common/dropdowns.json
````json
{
  "baseDropdown": {
    "addNewLabel": "新增",
    "defaultPlaceholder": "选择或输入一个值"
  }
}
````

## File: client/src/i18n/locales/zh/components/common/markdown.json
````json
{
  "mermaid": {
    "copyCode": "复制 Mermaid 代码",
    "downloadPNG": "下载为 PNG",
    "downloadSVG": "下载为 SVG",
    "exitFullscreen": "退出全屏",
    "fullscreen": "全屏",
    "renderError": "渲染 Mermaid 图表失败：",
    "renderErrorFallback": "图表渲染出错",
    "resetView": "重置视图",
    "title": "Mermaid 图表",
    "zoomIn": "放大",
    "zoomOut": "缩小"
  }
}
````

## File: client/src/i18n/locales/zh/components/common/modals.json
````json
{
  "changelogModal": {
    "error": {
      "default": "加载更新日志失败。请稍后再试。"
    }
  }
}
````

## File: client/src/i18n/locales/zh/components/snippets/list/snippetCard.json
````json
{
  "confirmationModalDelete": {
    "confirmLabel": {
      "isRecycleView": {
        "false": "移至回收站",
        "true": "永久删除"
      }
    },
    "message": {
      "isRecycleView": {
        "false": "确定要将 “{{title}}” 移至回收站吗？",
        "true": "确定要永久删除 “{{title}}” 吗？此操作无法撤销。"
      }
    },
    "title": {
      "isRecycleView": {
        "false": "移至回收站",
        "true": "确认删除"
      }
    }
  },
  "confirmationModalRestore": {
    "message": "确定要恢复 “{{title}}” 吗？",
    "title": "确认恢复"
  },
  "date": {
    "ago": "{{date}} 前",
    "expiringSoon": "即将过期",
    "left": "剩余 {{date}}"
  },
  "defaultDescription": "暂无描述",
  "defaultUpdateTime": "未知",
  "favorite": "已收藏",
  "pinned": "已置顶",
  "public": "公开",
  "shared": "已分享"
}
````

## File: client/src/i18n/locales/zh/components/snippets/list/snippetCardMenu.json
````json
{
  "addToFavorites": "加入收藏",
  "deleteSnippet": "删除代码片段",
  "duplicateSnippet": "复制代码片段",
  "editSnippet": "编辑代码片段",
  "openInNewTab": "在新标签页打开",
  "pinSnippet": "置顶代码片段",
  "removeFromFavorites": "移出收藏",
  "shareSnippet": "分享代码片段",
  "unpinSnippet": "取消置顶"
}
````

## File: client/src/i18n/locales/zh/components/snippets/list/snippetList.json
````json
{
  "noSnippetsMatch": "没有符合搜索条件的代码片段"
}
````

## File: client/src/i18n/locales/zh/components/snippets/list/snippetRecycleCardMenu.json
````json
{
  "deleteSnippet": "删除代码片段",
  "restoreSnippet": "恢复代码片段"
}
````

## File: client/src/i18n/locales/zh/components/snippets/view/all.json
````json
{
  "defaultUpdateTime": "未知",
  "fullCodeView": {
    "dateTimeAgo": "{{dateTime}} 前",
    "defaultDescription": "暂无描述"
  },
  "files": "个文件",
  "collapseSidebar": "收起侧边栏",
  "expandSidebar": "展开侧边栏",
  "searchFiles": "搜索文件...",
  "noFilesFound": "没有与搜索匹配的文件",
  "filterFiles": "筛选文件",
  "fileExtensions": "文件扩展名",
  "noExtension": "无扩展名",
  "snippetModal": {
    "confirmationModal": {
      "confirmLabel": {
        "isRecycleView": {
          "false": "移至回收站",
          "true": "永久删除"
        }
      },
      "message": {
        "isRecycleView": {
          "false": "确定要将 “{{title}}” 移至回收站吗？",
          "true": "确定要永久删除 “{{title}}” 吗？此操作无法撤销。"
        }
      },
      "title": {
        "isRecycleView": {
          "false": "移至回收站",
          "true": "确认删除"
        }
      }
    }
  }
}
````

## File: client/src/i18n/locales/zh/components/snippets/view/common.json
````json
{
  "authAwareSnippetView": {
    "error": {
      "snippetLoad": "加载代码片段失败",
      "snippetRequireAuth": "此代码片段需要认证后才能查看"
    }
  },
  "baseSnippetStorage": {
    "error": {
      "sessionExpired": "会话已过期，请重新登录。",
      "snippetCreated": "创建代码片段失败",
      "snippetUpdated": "更新代码片段失败"
    },
    "success": {
      "displayAll": "正在显示所有代码片段",
      "displayFavorites": "正在显示收藏的代码片段",
      "snippetCreated": "新代码片段创建成功",
      "snippetUpdated": "代码片段更新成功"
    }
  },
  "browsePublicSnippets": "浏览公开代码片段",
  "filter": {
    "filteredByCategories": "已按分类筛选"
  },
  "loadingSnippets": "正在加载代码片段...",
  "signIn": "登录",
  "sippetNotFound": "未找到代码片段",
  "snippetContentArea": {
    "error": {
      "duplicateSnippet": "复制代码片段失败",
      "loadSnippets": "加载代码片段失败",
      "moveSnippetToRecycleBin": "将代码片段移至回收站失败。请重试。",
      "sessionExpired": "会话已过期，请重新登录。",
      "updateFavoriteStatusAdded": "更新收藏状态失败。请重试。",
      "updateFavoriteStatusDeleted": "更新收藏状态失败。请重试。",
      "updatePinStatusAdded": "更新置顶状态失败。请重试。",
      "updatePinStatusDeleted": "更新置顶状态失败。请重试。"
    },
    "success": {
      "duplicateSnippet": "代码片段复制成功",
      "moveSnippetToRecycleBin": "代码片段已成功移至回收站",
      "updateFavoriteStatusAdded": "代码片段已成功加入收藏",
      "updateFavoriteStatusDeleted": "代码片段已成功移出收藏",
      "updatePinStatusAdded": "代码片段已成功置顶",
      "updatePinStatusDeleted": "代码片段已成功取消置顶"
    }
  },
  "storageHeader": {
    "private": "你正在查看自己的私有代码片段。只有你可以查看和修改这些代码片段。",
    "public": "你正在查看公开分享的代码片段。这些代码片段为只读，所有人都可见。"
  },
  "viewSwitch": {
    "private": "私有",
    "public": "公开"
  }
}
````

## File: client/src/i18n/locales/zh/components/snippets/view/public.json
````json
{
  "publicSnippetContentArea": {
    "error": {
      "addSnippetToCollection": "将代码片段添加到你的收藏失败",
      "failedLoadSnippets": "加载公开代码片段失败"
    },
    "filter": {
      "byCategories": "已按分类筛选"
    },
    "info": {
      "requireAuth": "请登录后将此代码片段添加到你的收藏"
    },
    "loadingSnippets": "正在加载代码片段...",
    "success": {
      "addSnippetToCollection": "代码片段已添加到你的收藏"
    }
  }
}
````

## File: client/src/i18n/locales/zh/components/snippets/view/recycle.json
````json
{
  "recycleSnippetContentArea": {
    "error": {
      "deleteSnippet": "删除代码片段失败",
      "loadSnippets": "加载代码片段失败",
      "restoreSnippet": "恢复代码片段失败",
      "sessionExpired": "会话已过期，请重新登录。"
    },
    "filter": {
      "byCategories": "已按分类筛选"
    },
    "loadingSnippets": "正在加载代码片段...",
    "success": {
      "deleteSnippet": "代码片段删除成功",
      "restoreSnippet": "代码片段恢复成功"
    }
  },
  "recycleSnippetStorage": {
    "backToSnippets": "返回代码片段",
    "confirmationModal": {
      "message": "确定要永久清空回收站中的所有代码片段吗？此操作无法撤销。",
      "title": "确认删除"
    },
    "description": "回收站中的代码片段将在 30 天后被永久删除",
    "error": {
      "clear": "清空回收站失败。请重试。",
      "sessionExpired": "会话已过期，请重新登录。"
    },
    "info": {
      "noSnippets": "回收站中没有可清空的代码片段"
    },
    "recycleBin": "回收站",
    "success": {
      "clear": "回收站中的所有代码片段已清空"
    }
  }
}
````

## File: client/src/i18n/locales/zh/components/snippets/edit.json
````json
{
  "editSnippetModal": {
    "addSnippet": "添加新片段",
    "editSnippet": "编辑片段",
    "error": {
      "savingFailed": "保存代码片段时发生错误。请重试。"
    },
    "form": {
      "categories": {
        "counter": "{{categories}}/{{max}} 个分类",
        "label": "分类（最多 {{max}} 个）",
        "placeholder": "输入分类并按 Enter 或逗号"
      },
      "codeFragments": {
        "add": "添加新片段",
        "label": "代码片段（{{fragments}}）"
      },
      "description": {
        "label": "描述",
        "placeholder": "为该代码片段写一个简短描述"
      },
      "isPublic": {
        "description": "公开代码片段可被任何人查看，无需认证",
        "label": "将代码片段设为公开"
      },
      "title": {
        "counter": "{{characters}}/{{max}} 个字符",
        "label": "标题",
        "placeholder": "输入代码片段标题（最多 {{max}} 个字符）"
      }
    },
    "fragmentRequired": "至少需要一个代码片段",
    "mustHaveFileNames": "所有片段都必须填写文件名",
    "unsavedChanges": "你有未保存的更改。确定要关闭吗？"
  },
  "searchFiles": "搜索文件...",
  "noFilesFound": "没有与搜索匹配的文件",
  "expandSidebar": "展开侧边栏",
  "filterFiles": "筛选文件",
  "fileExtensions": "文件扩展名",
  "noExtension": "无扩展名",
  "fragmentEditor": {
    "action": {
      "collapse": "折叠",
      "delete": "删除",
      "expand": "展开"
    },
    "form": {
      "fileName": {
        "placeholder": "文件名"
      },
      "language": {
        "placeholder": "选择语言",
        "sections": {
          "other": "其他",
          "used": "常用"
        }
      }
    },
    "moveDown": "下移",
    "moveUp": "上移"
  }
}
````

## File: client/src/i18n/locales/zh/components/snippets/embed.json
````json
{
  "embedCopyButton": {
    "title": "复制到剪贴板"
  },
  "embedModal": {
    "form": {
      "embedCode": "嵌入代码",
      "fragmentToShow": {
        "all": "所有片段",
        "label": "要显示的片段（可选）"
      },
      "showDescription": "显示描述",
      "showFileHeaders": "显示文件头",
      "showPoweredBy": "显示 “Powered by ByteStash”",
      "showTitle": "显示标题",
      "theme": "主题"
    },
    "subTitle": "自定义嵌入内容",
    "title": "嵌入代码片段"
  },
  "embedView": {
    "error": {
      "default": "加载代码片段失败"
    }
  }
}
````

## File: client/src/i18n/locales/zh/components/snippets/share.json
````json
{
  "sharedSnippetView": {
    "browsePublicSnippets": "浏览公开代码片段",
    "loadingSnippet": "正在加载代码片段...",
    "snippetExpired": "此分享的代码片段已过期",
    "snippetNotFound": "未找到代码片段"
  },
  "shareMenu": {
    "activeShareLinks": {
      "buttons": {
        "copy": "复制链接",
        "delete": "删除分享链接",
        "requiresAuth": {
          "false": "嵌入代码片段",
          "true": "只有无需认证的代码片段才可嵌入"
        }
      },
      "date": {
        "expired": "已过期",
        "neverExpires": "永不过期"
      },
      "noLinks": "没有有效的分享链接",
      "relativeExpiryTime": "{{date}} 后过期",
      "requiresAuth": {
        "false": "公开访问",
        "true": "受保护 - 需要认证"
      },
      "title": "有效的分享链接"
    },
    "createButtonText": "创建分享链接",
    "error": {
      "created": "创建分享链接失败",
      "deleted": "删除分享链接失败",
      "invalidDuration": "时长格式无效。请使用 1h、2d、30m 等格式。",
      "load": "加载分享失败",
      "unknownExpiryTime": "未知过期时间"
    },
    "expiresIn": "过期时间（例如 1h、2d、30m）",
    "expiresInPlaceholder": "永不过期",
    "requiresAuth": "需要认证",
    "subTitle": "创建新的分享链接",
    "success": {
      "created": "分享链接已创建",
      "deleted": "分享链接已删除"
    },
    "title": "分享代码片段"
  }
}
````

## File: client/src/i18n/locales/zh/components/auth.json
````json
{
  "apiKeysModal": {
    "created": "创建时间",
    "createKey": "创建密钥",
    "deleteApiKey": "删除 API 密钥",
    "enterKeyName": "输入密钥名称",
    "lastUsed": "最后使用时间",
    "newApiKey": "新的 API 密钥（请立即复制，之后将不再显示）",
    "notApiKeys": "未找到 API 密钥",
    "title": "API 密钥",
    "yourApiKeys": "你的 API 密钥"
  },
  "authProvider": {
    "error": {
      "failedCreateAnonymousSession": "初始化匿名会话失败"
    },
    "info": {
      "logoutSuccess": "已成功退出登录"
    }
  },
  "changePasswordModal": {
    "confirmNewPassword": "确认新密码",
    "currentPassword": "当前密码",
    "error": {
      "default": "修改密码失败",
      "newPasswordMustBeAtLeastCharacters": "新密码至少需要 {{minLength}} 个字符",
      "newPasswordsDoNotMatch": "两次输入的新密码不一致"
    },
    "newPassword": "新密码",
    "passwordChangedSuccessfully": "密码修改成功",
    "process": "正在修改密码...",
    "title": "修改密码"
  },
  "login": {
    "account": "账户",
    "browsePublicSnippets": "浏览公开代码片段",
    "create": "创建一个",
    "error": {
      "invalidUsernameOrPassword": "用户名或密码无效"
    },
    "orContinueWithPassword": "或继续使用密码",
    "pleaseSignInToContinue": "请登录后继续",
    "signingIn": "登录中..."
  },
  "oidc": {
    "error": {
      "auth_failed": "认证失败。这可能是由于取消登录或会话过期导致的。请重试。",
      "config_error": "单点登录配置出现错误。请联系管理员。",
      "default": "认证过程中发生意外错误。请重试。",
      "provider_error": "身份提供商发生错误或当前不可用。请稍后重试或联系管理员。",
      "registration_disabled": "当前这个 ByteStash 实例已禁用新账户注册。请联系管理员。"
    }
  },
  "register": {
    "browsePublicSnippets": "浏览公开代码片段",
    "creatingAccount": "创建账户中...",
    "disabled": {
      "description": "当前已禁用新账户注册。",
      "link": {
        "text": "返回登录页"
      },
      "title": "注册已禁用"
    },
    "error": {
      "default": "注册失败",
      "passwordsDoNotMatch": "两次输入的密码不一致"
    },
    "firstAccountDescription": "这是将要创建的第一个账户。所有现有代码片段都会自动迁移到该账户。",
    "notAvailable": {
      "description": "内部账户注册已禁用，且未配置任何 SSO 提供商。请联系管理员。",
      "title": "注册不可用"
    },
    "signInToYourAccount": "登录到你的账户",
    "title": "创建账户"
  },
  "signIn": {
    "completing": "正在完成登录...",
    "with": "使用 {{displayName}} 登录"
  },
  "signOut": {
    "completing": "正在完成退出登录..."
  },
  "userDropdown": {
    "adminPanel": "管理面板",
    "apiKeys": "API 密钥",
    "changePassword": "修改密码",
    "signIn": "登录",
    "signOut": "退出登录"
  }
}
````

## File: client/src/i18n/locales/zh/components/categories.json
````json
{
  "categoryList": {
    "moreCount": "还有 {{moreCount}} 个",
    "noData": "没有分类",
    "showLess": "收起"
  },
  "categorySuggestions": {
    "addNewLabel": "新增",
    "placeholder": "输入以搜索分类...",
    "title": "分类"
  }
}
````

## File: client/src/i18n/locales/zh/components/search.json
````json
{
  "action": {
    "clear": "清空搜索",
    "newSnippet": "新建片段",
    "openSettings": "打开设置",
    "recycleBin": "回收站",
    "showAll": "显示全部",
    "showFavorites": "显示收藏"
  },
  "categories": {
    "addNew": "新增",
    "title": "分类"
  },
  "defaultPlaceholder": "搜索代码片段...（输入 # 查看所有可用分类）",
  "filter": {
    "language": {
      "all": "所有语言"
    }
  },
  "sort": {
    "alphaAsc": "按字母升序 A-Z",
    "alphaDesc": "按字母降序 Z-A",
    "newestFirst": "最新优先",
    "oldestFirst": "最早优先"
  },
  "view": {
    "grid": "网格视图",
    "list": "列表视图"
  }
}
````

## File: client/src/i18n/locales/zh/components/settings.json
````json
{
  "settingsModal": {
    "block": {
      "category": {
        "expandCategories": {
          "description": "自动展开分类分组",
          "label": "展开分类"
        },
        "showCategories": {
          "description": "为代码片段显示分类标签",
          "label": "显示分类"
        },
        "title": "分类"
      },
      "dataManagement": {
        "export": {
          "label": "导出代码片段"
        },
        "import": {
          "errors": {
            "failed": "导入 “{{title}}” 失败：{{error}}",
            "occurred_one": "发生了 {{count, number}} 个错误",
            "occurred_other": "发生了 {{count, number}} 个错误"
          },
          "label": "导入代码片段",
          "progress": "正在导入代码片段..."
        },
        "title": "数据管理"
      },
      "locale": {
        "title": "语言"
      },
      "search": {
        "includeCodeInSearch": {
          "description": "在代码内容中搜索，而不仅仅是标题",
          "label": "搜索代码内容"
        },
        "title": "搜索"
      },
      "theme": {
        "title": "主题"
      },
      "view": {
        "compactView": {
          "description": "以更紧凑的格式显示代码片段",
          "label": "紧凑视图"
        },
        "previewLines": {
          "description": "在代码片段列表中显示代码预览",
          "label": "显示代码预览"
        },
        "showCodePreview": {
          "description": "预览中显示的最大行数（1-20）",
          "label": "预览行数"
        },
        "showLineNumbers": {
          "description": "在代码块中显示行号",
          "label": "显示行号"
        },
        "title": "视图"
      }
    },
    "export": {
      "error": {
        "default": "导出代码片段失败",
        "noSnippets": "没有可导出的代码片段"
      },
      "markdown": {
        "error": {
          "default": "导出 Markdown 失败"
        },
        "success": {
          "default": "Markdown 导出成功"
        },
        "warning": {
          "default": "没有可导出的代码片段"
        }
      },
      "success": {
        "default": "成功导出 {{total}} 个代码片段"
      }
    },
    "import": {
      "error": {
        "default": "导入代码片段失败"
      },
      "hasFailed": "已导入 {{succeeded}} 个代码片段，{{failed}} 个失败。详情请查看控制台。",
      "successOnly_one": "成功导入 {{succeeded}} 个代码片段。关闭设置后即可查看。",
      "successOnly_other": "成功导入 {{succeeded}} 个代码片段。关闭设置后即可查看。"
    },
    "title": "设置"
  }
}
````

## File: client/src/i18n/locales/zh/components/utils.json
````json
{
  "config": {
    "caution": "注意",
    "important": "重要",
    "note": "备注",
    "tip": "提示",
    "warning": "警告"
  }
}
````

## File: client/src/i18n/locales/zh/translation.json
````json
{
  "action": {
    "addSnippet": "添加片段",
    "cancel": "取消",
    "changePassword": "修改密码",
    "clear": "清除",
    "clearAll": "全部清除",
    "close": "关闭",
    "confirm": "确认",
    "createAccount": "创建账户",
    "delete": "删除",
    "edit": "编辑",
    "hidePassword": "隐藏密码",
    "load": "加载",
    "maximize": "最大化",
    "minimize": "最小化",
    "restore": "还原",
    "save": "保存",
    "saving": "保存中...",
    "showPassword": "显示密码",
    "signIn": "登录"
  },
  "confirmPassword": "确认密码",
  "loading": "加载中...",
  "locale": {
    "en": "English",
    "es": "Español",
    "ru": "Русский",
    "ja": "日本語",
    "zh": "简体中文"
  },
  "no": "否",
  "or": "或",
  "pagination": {
    "next": "下一页",
    "pageOf": "第 {{currentPage}} 页，共 {{totalPages}} 页",
    "previous": "上一页",
    "total": "共 {{total}} 条",
    "useSnippetPagination": {
      "error": {
        "failedSnippetsLoad": "加载代码片段失败",
        "sessionExpired": "会话已过期，请重新登录。"
      }
    }
  },
  "password": "密码",
  "showing": "显示中",
  "theme": {
    "dark": "深色",
    "light": "浅色",
    "system": "跟随系统"
  },
  "username": "用户名"
}
````

## File: client/src/i18n/resources/en.ts
````typescript
import translation from '../locales/en/translation.json'
import componentsAdminCommon from '../locales/en/components/admin/common.json'
import componentsAdminModals from '../locales/en/components/admin/modals.json'
import componentsAdminSelector from '../locales/en/components/admin/selector.json'
import componentsAdminApiKeysTab from '../locales/en/components/admin/tabs/apiKeys.json'
import componentsAdminUsersTab from '../locales/en/components/admin/tabs/users.json'
import componentsAdminSharesTab from '../locales/en/components/admin/tabs/shares.json'
import componentsAdminSnippetsTab from '../locales/en/components/admin/tabs/snippets.json'
import componentsAdminDashboardTab from '../locales/en/components/admin/tabs/dashboard.json'
import componentsAuth from '../locales/en/components/auth.json'
import componentsCategories from '../locales/en/components/categories.json'
import componentsCommonButtons from '../locales/en/components/common/buttons.json'
import componentsCommonDropdowns from '../locales/en/components/common/dropdowns.json'
import componentsCommonModals from '../locales/en/components/common/modals.json'
import componentsSearch from '../locales/en/components/search.json'
import componentsSettings from '../locales/en/components/settings.json'
import componentsSnippetsEdit from '../locales/en/components/snippets/edit.json'
import componentsSnippetsEmbed from '../locales/en/components/snippets/embed.json'
import componentsSnippetsListSnippetCard from '../locales/en/components/snippets/list/snippetCard.json'
import componentsSnippetsListSnippetCardMenu from '../locales/en/components/snippets/list/snippetCardMenu.json'
import componentsSnippetsListSnippetList from '../locales/en/components/snippets/list/snippetList.json'
import componentsSnippetsListSnippetRecycleCardMenu from '../locales/en/components/snippets/list/snippetRecycleCardMenu.json'
import componentsSnippetsShare from '../locales/en/components/snippets/share.json'
import componentsSnippetsViewAll from '../locales/en/components/snippets/view/all.json'
import componentsSnippetsViewCommon from '../locales/en/components/snippets/view/common.json'
import componentsSnippetsViewPublic from '../locales/en/components/snippets/view/public.json'
import componentsSnippetsViewRecycle from '../locales/en/components/snippets/view/recycle.json'
import componentsCommonMarkdown from '../locales/en/components/common/markdown.json'
import componentsUtils from '../locales/en/components/utils.json'

export const resources = {
  translation,
  'components/admin/common': componentsAdminCommon,
  'components/admin/modals': componentsAdminModals,
  'components/admin/selector': componentsAdminSelector,
  'components/admin/tabs/apiKeys': componentsAdminApiKeysTab,
  'components/admin/tabs/users': componentsAdminUsersTab,
  'components/admin/tabs/shares': componentsAdminSharesTab,
  'components/admin/tabs/snippets': componentsAdminSnippetsTab,
  'components/admin/tabs/dashboard': componentsAdminDashboardTab,
  'components/auth': componentsAuth,
  'components/categories': componentsCategories,
  'components/common/buttons': componentsCommonButtons,
  'components/common/dropdowns': componentsCommonDropdowns,
  'components/common/markdown': componentsCommonMarkdown,
  'components/common/modals': componentsCommonModals,
  'components/search': componentsSearch,
  'components/settings': componentsSettings,
  'components/snippets/edit': componentsSnippetsEdit,
  'components/snippets/embed': componentsSnippetsEmbed,
  'components/snippets/list/snippetCard': componentsSnippetsListSnippetCard,
  'components/snippets/list/snippetCardMenu': componentsSnippetsListSnippetCardMenu,
  'components/snippets/list/snippetList': componentsSnippetsListSnippetList,
  'components/snippets/list/snippetRecycleCardMenu': componentsSnippetsListSnippetRecycleCardMenu,
  'components/snippets/share': componentsSnippetsShare,
  'components/snippets/view/all': componentsSnippetsViewAll,
  'components/snippets/view/common': componentsSnippetsViewCommon,
  'components/snippets/view/public': componentsSnippetsViewPublic,
  'components/snippets/view/recycle': componentsSnippetsViewRecycle,
  'components/utils': componentsUtils,
};
````

## File: client/src/i18n/resources/es.ts
````typescript
import translation from '../locales/es/translation.json'
import componentsAdminCommon from '../locales/es/components/admin/common.json'
import componentsAdminModals from '../locales/es/components/admin/modals.json'
import componentsAdminSelector from '../locales/es/components/admin/selector.json'
import componentsAdminApiKeysTab from '../locales/es/components/admin/tabs/apiKeys.json'
import componentsAdminUsersTab from '../locales/es/components/admin/tabs/users.json'
import componentsAdminSharesTab from '../locales/es/components/admin/tabs/shares.json'
import componentsAdminSnippetsTab from '../locales/es/components/admin/tabs/snippets.json'
import componentsAdminDashboardTab from '../locales/es/components/admin/tabs/dashboard.json'
import componentsAuth from '../locales/es/components/auth.json'
import componentsCategories from '../locales/es/components/categories.json'
import componentsCommonButtons from '../locales/es/components/common/buttons.json'
import componentsCommonDropdowns from '../locales/es/components/common/dropdowns.json'
import componentsCommonModals from '../locales/es/components/common/modals.json'
import componentsSearch from '../locales/es/components/search.json'
import componentsSettings from '../locales/es/components/settings.json'
import componentsSnippetsEdit from '../locales/es/components/snippets/edit.json'
import componentsSnippetsEmbed from '../locales/es/components/snippets/embed.json'
import componentsSnippetsListSnippetCard from '../locales/es/components/snippets/list/snippetCard.json'
import componentsSnippetsListSnippetCardMenu from '../locales/es/components/snippets/list/snippetCardMenu.json'
import componentsSnippetsListSnippetList from '../locales/es/components/snippets/list/snippetList.json'
import componentsSnippetsListSnippetRecycleCardMenu from '../locales/es/components/snippets/list/snippetRecycleCardMenu.json'
import componentsSnippetsShare from '../locales/es/components/snippets/share.json'
import componentsSnippetsViewAll from '../locales/es/components/snippets/view/all.json'
import componentsSnippetsViewCommon from '../locales/es/components/snippets/view/common.json'
import componentsSnippetsViewPublic from '../locales/es/components/snippets/view/public.json'
import componentsSnippetsViewRecycle from '../locales/es/components/snippets/view/recycle.json'
import componentsCommonMarkdown from '../locales/es/components/common/markdown.json'
import componentsUtils from '../locales/es/components/utils.json'

export const resources = {
  translation,
  'components/admin/common': componentsAdminCommon,
  'components/admin/modals': componentsAdminModals,
  'components/admin/selector': componentsAdminSelector,
  'components/admin/tabs/apiKeys': componentsAdminApiKeysTab,
  'components/admin/tabs/users': componentsAdminUsersTab,
  'components/admin/tabs/shares': componentsAdminSharesTab,
  'components/admin/tabs/snippets': componentsAdminSnippetsTab,
  'components/admin/tabs/dashboard': componentsAdminDashboardTab,
  'components/auth': componentsAuth,
  'components/categories': componentsCategories,
  'components/common/buttons': componentsCommonButtons,
  'components/common/dropdowns': componentsCommonDropdowns,
  'components/common/markdown': componentsCommonMarkdown,
  'components/common/modals': componentsCommonModals,
  'components/search': componentsSearch,
  'components/settings': componentsSettings,
  'components/snippets/edit': componentsSnippetsEdit,
  'components/snippets/embed': componentsSnippetsEmbed,
  'components/snippets/list/snippetCard': componentsSnippetsListSnippetCard,
  'components/snippets/list/snippetCardMenu': componentsSnippetsListSnippetCardMenu,
  'components/snippets/list/snippetList': componentsSnippetsListSnippetList,
  'components/snippets/list/snippetRecycleCardMenu': componentsSnippetsListSnippetRecycleCardMenu,
  'components/snippets/share': componentsSnippetsShare,
  'components/snippets/view/all': componentsSnippetsViewAll,
  'components/snippets/view/common': componentsSnippetsViewCommon,
  'components/snippets/view/public': componentsSnippetsViewPublic,
  'components/snippets/view/recycle': componentsSnippetsViewRecycle,
  'components/utils': componentsUtils,
};
````

## File: client/src/i18n/resources/index.ts
````typescript
import { resources as enResources } from './en';
import { resources as ruResources } from './ru';
import { resources as esResources } from './es';
import { resources as jaResources } from './ja';
import { resources as zhResources } from './zh';
import { resources as itResources } from './it';

export const resources = {
  en: enResources,
  ru: ruResources,
  es: esResources,
  ja: jaResources,
  zh: zhResources,
  it: itResources
};
````

## File: client/src/i18n/resources/it.ts
````typescript
import translation from '../locales/it/translation.json'
import componentsAdminCommon from '../locales/it/components/admin/common.json'
import componentsAdminModals from '../locales/it/components/admin/modals.json'
import componentsAdminSelector from '../locales/it/components/admin/selector.json'
import componentsAdminApiKeysTab from '../locales/it/components/admin/tabs/apiKeys.json'
import componentsAdminUsersTab from '../locales/it/components/admin/tabs/users.json'
import componentsAdminSharesTab from '../locales/it/components/admin/tabs/shares.json'
import componentsAdminSnippetsTab from '../locales/it/components/admin/tabs/snippets.json'
import componentsAdminDashboardTab from '../locales/it/components/admin/tabs/dashboard.json'
import componentsAuth from '../locales/it/components/auth.json'
import componentsCategories from '../locales/it/components/categories.json'
import componentsCommonButtons from '../locales/it/components/common/buttons.json'
import componentsCommonDropdowns from '../locales/it/components/common/dropdowns.json'
import componentsCommonModals from '../locales/it/components/common/modals.json'
import componentsSearch from '../locales/it/components/search.json'
import componentsSettings from '../locales/it/components/settings.json'
import componentsSnippetsEdit from '../locales/it/components/snippets/edit.json'
import componentsSnippetsEmbed from '../locales/it/components/snippets/embed.json'
import componentsSnippetsListSnippetCard from '../locales/it/components/snippets/list/snippetCard.json'
import componentsSnippetsListSnippetCardMenu from '../locales/it/components/snippets/list/snippetCardMenu.json'
import componentsSnippetsListSnippetList from '../locales/it/components/snippets/list/snippetList.json'
import componentsSnippetsListSnippetRecycleCardMenu from '../locales/it/components/snippets/list/snippetRecycleCardMenu.json'
import componentsSnippetsShare from '../locales/it/components/snippets/share.json'
import componentsSnippetsViewAll from '../locales/it/components/snippets/view/all.json'
import componentsSnippetsViewCommon from '../locales/it/components/snippets/view/common.json'
import componentsSnippetsViewPublic from '../locales/it/components/snippets/view/public.json'
import componentsSnippetsViewRecycle from '../locales/it/components/snippets/view/recycle.json'
import componentsCommonMarkdown from '../locales/it/components/common/markdown.json'
import componentsUtils from '../locales/it/components/utils.json'

export const resources = {
  translation,
  'components/admin/common': componentsAdminCommon,
  'components/admin/modals': componentsAdminModals,
  'components/admin/selector': componentsAdminSelector,
  'components/admin/tabs/apiKeys': componentsAdminApiKeysTab,
  'components/admin/tabs/users': componentsAdminUsersTab,
  'components/admin/tabs/shares': componentsAdminSharesTab,
  'components/admin/tabs/snippets': componentsAdminSnippetsTab,
  'components/admin/tabs/dashboard': componentsAdminDashboardTab,
  'components/auth': componentsAuth,
  'components/categories': componentsCategories,
  'components/common/buttons': componentsCommonButtons,
  'components/common/dropdowns': componentsCommonDropdowns,
  'components/common/markdown': componentsCommonMarkdown,
  'components/common/modals': componentsCommonModals,
  'components/search': componentsSearch,
  'components/settings': componentsSettings,
  'components/snippets/edit': componentsSnippetsEdit,
  'components/snippets/embed': componentsSnippetsEmbed,
  'components/snippets/list/snippetCard': componentsSnippetsListSnippetCard,
  'components/snippets/list/snippetCardMenu': componentsSnippetsListSnippetCardMenu,
  'components/snippets/list/snippetList': componentsSnippetsListSnippetList,
  'components/snippets/list/snippetRecycleCardMenu': componentsSnippetsListSnippetRecycleCardMenu,
  'components/snippets/share': componentsSnippetsShare,
  'components/snippets/view/all': componentsSnippetsViewAll,
  'components/snippets/view/common': componentsSnippetsViewCommon,
  'components/snippets/view/public': componentsSnippetsViewPublic,
  'components/snippets/view/recycle': componentsSnippetsViewRecycle,
  'components/utils': componentsUtils,
};
````

## File: client/src/i18n/resources/ja.ts
````typescript
import translation from '../locales/ja/translation.json'
import componentsAdminCommon from '../locales/ja/components/admin/common.json'
import componentsAdminModals from '../locales/ja/components/admin/modals.json'
import componentsAdminSelector from '../locales/ja/components/admin/selector.json'
import componentsAdminApiKeysTab from '../locales/ja/components/admin/tabs/apiKeys.json'
import componentsAdminUsersTab from '../locales/ja/components/admin/tabs/users.json'
import componentsAdminSharesTab from '../locales/ja/components/admin/tabs/shares.json'
import componentsAdminSnippetsTab from '../locales/ja/components/admin/tabs/snippets.json'
import componentsAdminDashboardTab from '../locales/ja/components/admin/tabs/dashboard.json'
import componentsAuth from '../locales/ja/components/auth.json'
import componentsCategories from '../locales/ja/components/categories.json'
import componentsCommonButtons from '../locales/ja/components/common/buttons.json'
import componentsCommonDropdowns from '../locales/ja/components/common/dropdowns.json'
import componentsCommonModals from '../locales/ja/components/common/modals.json'
import componentsSearch from '../locales/ja/components/search.json'
import componentsSettings from '../locales/ja/components/settings.json'
import componentsSnippetsEdit from '../locales/ja/components/snippets/edit.json'
import componentsSnippetsEmbed from '../locales/ja/components/snippets/embed.json'
import componentsSnippetsListSnippetCard from '../locales/ja/components/snippets/list/snippetCard.json'
import componentsSnippetsListSnippetCardMenu from '../locales/ja/components/snippets/list/snippetCardMenu.json'
import componentsSnippetsListSnippetList from '../locales/ja/components/snippets/list/snippetList.json'
import componentsSnippetsListSnippetRecycleCardMenu from '../locales/ja/components/snippets/list/snippetRecycleCardMenu.json'
import componentsSnippetsShare from '../locales/ja/components/snippets/share.json'
import componentsSnippetsViewAll from '../locales/ja/components/snippets/view/all.json'
import componentsSnippetsViewCommon from '../locales/ja/components/snippets/view/common.json'
import componentsSnippetsViewPublic from '../locales/ja/components/snippets/view/public.json'
import componentsSnippetsViewRecycle from '../locales/ja/components/snippets/view/recycle.json'
import componentsCommonMarkdown from '../locales/ja/components/common/markdown.json'
import componentsUtils from '../locales/ja/components/utils.json'

export const resources = {
  translation,
  'components/admin/common': componentsAdminCommon,
  'components/admin/modals': componentsAdminModals,
  'components/admin/selector': componentsAdminSelector,
  'components/admin/tabs/apiKeys': componentsAdminApiKeysTab,
  'components/admin/tabs/users': componentsAdminUsersTab,
  'components/admin/tabs/shares': componentsAdminSharesTab,
  'components/admin/tabs/snippets': componentsAdminSnippetsTab,
  'components/admin/tabs/dashboard': componentsAdminDashboardTab,
  'components/auth': componentsAuth,
  'components/categories': componentsCategories,
  'components/common/buttons': componentsCommonButtons,
  'components/common/dropdowns': componentsCommonDropdowns,
  'components/common/markdown': componentsCommonMarkdown,
  'components/common/modals': componentsCommonModals,
  'components/search': componentsSearch,
  'components/settings': componentsSettings,
  'components/snippets/edit': componentsSnippetsEdit,
  'components/snippets/embed': componentsSnippetsEmbed,
  'components/snippets/list/snippetCard': componentsSnippetsListSnippetCard,
  'components/snippets/list/snippetCardMenu': componentsSnippetsListSnippetCardMenu,
  'components/snippets/list/snippetList': componentsSnippetsListSnippetList,
  'components/snippets/list/snippetRecycleCardMenu': componentsSnippetsListSnippetRecycleCardMenu,
  'components/snippets/share': componentsSnippetsShare,
  'components/snippets/view/all': componentsSnippetsViewAll,
  'components/snippets/view/common': componentsSnippetsViewCommon,
  'components/snippets/view/public': componentsSnippetsViewPublic,
  'components/snippets/view/recycle': componentsSnippetsViewRecycle,
  'components/utils': componentsUtils,
};
````

## File: client/src/i18n/resources/ru.ts
````typescript
import translation from '../locales/ru/translation.json'
import componentsAdminCommon from '../locales/ru/components/admin/common.json'
import componentsAdminModals from '../locales/ru/components/admin/modals.json'
import componentsAdminSelector from '../locales/ru/components/admin/selector.json'
import componentsAdminApiKeysTab from '../locales/ru/components/admin/tabs/apiKeys.json'
import componentsAdminUsersTab from '../locales/ru/components/admin/tabs/users.json'
import componentsAdminSharesTab from '../locales/ru/components/admin/tabs/shares.json'
import componentsAdminSnippetsTab from '../locales/ru/components/admin/tabs/snippets.json'
import componentsAdminDashboardTab from '../locales/ru/components/admin/tabs/dashboard.json'
import componentsAuth from '../locales/ru/components/auth.json'
import componentsCategories from '../locales/ru/components/categories.json'
import componentsCommonButtons from '../locales/ru/components/common/buttons.json'
import componentsCommonDropdowns from '../locales/ru/components/common/dropdowns.json'
import componentsCommonModals from '../locales/ru/components/common/modals.json'
import componentsSearch from '../locales/ru/components/search.json'
import componentsSettings from '../locales/ru/components/settings.json'
import componentsSnippetsEdit from '../locales/ru/components/snippets/edit.json'
import componentsSnippetsEmbed from '../locales/ru/components/snippets/embed.json'
import componentsSnippetsListSnippetCard from '../locales/ru/components/snippets/list/snippetCard.json'
import componentsSnippetsListSnippetCardMenu from '../locales/ru/components/snippets/list/snippetCardMenu.json'
import componentsSnippetsListSnippetList from '../locales/ru/components/snippets/list/snippetList.json'
import componentsSnippetsListSnippetRecycleCardMenu from '../locales/ru/components/snippets/list/snippetRecycleCardMenu.json'
import componentsSnippetsShare from '../locales/ru/components/snippets/share.json'
import componentsSnippetsViewAll from '../locales/ru/components/snippets/view/all.json'
import componentsSnippetsViewCommon from '../locales/ru/components/snippets/view/common.json'
import componentsSnippetsViewPublic from '../locales/ru/components/snippets/view/public.json'
import componentsSnippetsViewRecycle from '../locales/ru/components/snippets/view/recycle.json'
import componentsCommonMarkdown from '../locales/ru/components/common/markdown.json'
import componentsUtils from '../locales/ru/components/utils.json'

export const resources = {
  translation,
  'components/admin/common': componentsAdminCommon,
  'components/admin/modals': componentsAdminModals,
  'components/admin/selector': componentsAdminSelector,
  'components/admin/tabs/apiKeys': componentsAdminApiKeysTab,
  'components/admin/tabs/users': componentsAdminUsersTab,
  'components/admin/tabs/shares': componentsAdminSharesTab,
  'components/admin/tabs/snippets': componentsAdminSnippetsTab,
  'components/admin/tabs/dashboard': componentsAdminDashboardTab,
  'components/auth': componentsAuth,
  'components/categories': componentsCategories,
  'components/common/buttons': componentsCommonButtons,
  'components/common/dropdowns': componentsCommonDropdowns,
  'components/common/markdown': componentsCommonMarkdown,
  'components/common/modals': componentsCommonModals,
  'components/search': componentsSearch,
  'components/settings': componentsSettings,
  'components/snippets/edit': componentsSnippetsEdit,
  'components/snippets/embed': componentsSnippetsEmbed,
  'components/snippets/list/snippetCard': componentsSnippetsListSnippetCard,
  'components/snippets/list/snippetCardMenu': componentsSnippetsListSnippetCardMenu,
  'components/snippets/list/snippetList': componentsSnippetsListSnippetList,
  'components/snippets/list/snippetRecycleCardMenu': componentsSnippetsListSnippetRecycleCardMenu,
  'components/snippets/share': componentsSnippetsShare,
  'components/snippets/view/all': componentsSnippetsViewAll,
  'components/snippets/view/common': componentsSnippetsViewCommon,
  'components/snippets/view/public': componentsSnippetsViewPublic,
  'components/snippets/view/recycle': componentsSnippetsViewRecycle,
  'components/utils': componentsUtils,
};
````

## File: client/src/i18n/resources/zh.ts
````typescript
import translation from '../locales/zh/translation.json'
import componentsAdminCommon from '../locales/zh/components/admin/common.json'
import componentsAdminModals from '../locales/zh/components/admin/modals.json'
import componentsAdminSelector from '../locales/zh/components/admin/selector.json'
import componentsAdminApiKeysTab from '../locales/zh/components/admin/tabs/apiKeys.json'
import componentsAdminUsersTab from '../locales/zh/components/admin/tabs/users.json'
import componentsAdminSharesTab from '../locales/zh/components/admin/tabs/shares.json'
import componentsAdminSnippetsTab from '../locales/zh/components/admin/tabs/snippets.json'
import componentsAdminDashboardTab from '../locales/zh/components/admin/tabs/dashboard.json'
import componentsAuth from '../locales/zh/components/auth.json'
import componentsCategories from '../locales/zh/components/categories.json'
import componentsCommonButtons from '../locales/zh/components/common/buttons.json'
import componentsCommonDropdowns from '../locales/zh/components/common/dropdowns.json'
import componentsCommonModals from '../locales/zh/components/common/modals.json'
import componentsSearch from '../locales/zh/components/search.json'
import componentsSettings from '../locales/zh/components/settings.json'
import componentsSnippetsEdit from '../locales/zh/components/snippets/edit.json'
import componentsSnippetsEmbed from '../locales/zh/components/snippets/embed.json'
import componentsSnippetsListSnippetCard from '../locales/zh/components/snippets/list/snippetCard.json'
import componentsSnippetsListSnippetCardMenu from '../locales/zh/components/snippets/list/snippetCardMenu.json'
import componentsSnippetsListSnippetList from '../locales/zh/components/snippets/list/snippetList.json'
import componentsSnippetsListSnippetRecycleCardMenu from '../locales/zh/components/snippets/list/snippetRecycleCardMenu.json'
import componentsSnippetsShare from '../locales/zh/components/snippets/share.json'
import componentsSnippetsViewAll from '../locales/zh/components/snippets/view/all.json'
import componentsSnippetsViewCommon from '../locales/zh/components/snippets/view/common.json'
import componentsSnippetsViewPublic from '../locales/zh/components/snippets/view/public.json'
import componentsSnippetsViewRecycle from '../locales/zh/components/snippets/view/recycle.json'
import componentsCommonMarkdown from '../locales/zh/components/common/markdown.json'
import componentsUtils from '../locales/zh/components/utils.json'

export const resources = {
  translation,
  'components/admin/common': componentsAdminCommon,
  'components/admin/modals': componentsAdminModals,
  'components/admin/selector': componentsAdminSelector,
  'components/admin/tabs/apiKeys': componentsAdminApiKeysTab,
  'components/admin/tabs/users': componentsAdminUsersTab,
  'components/admin/tabs/shares': componentsAdminSharesTab,
  'components/admin/tabs/snippets': componentsAdminSnippetsTab,
  'components/admin/tabs/dashboard': componentsAdminDashboardTab,
  'components/auth': componentsAuth,
  'components/categories': componentsCategories,
  'components/common/buttons': componentsCommonButtons,
  'components/common/dropdowns': componentsCommonDropdowns,
  'components/common/markdown': componentsCommonMarkdown,
  'components/common/modals': componentsCommonModals,
  'components/search': componentsSearch,
  'components/settings': componentsSettings,
  'components/snippets/edit': componentsSnippetsEdit,
  'components/snippets/embed': componentsSnippetsEmbed,
  'components/snippets/list/snippetCard': componentsSnippetsListSnippetCard,
  'components/snippets/list/snippetCardMenu': componentsSnippetsListSnippetCardMenu,
  'components/snippets/list/snippetList': componentsSnippetsListSnippetList,
  'components/snippets/list/snippetRecycleCardMenu': componentsSnippetsListSnippetRecycleCardMenu,
  'components/snippets/share': componentsSnippetsShare,
  'components/snippets/view/all': componentsSnippetsViewAll,
  'components/snippets/view/common': componentsSnippetsViewCommon,
  'components/snippets/view/public': componentsSnippetsViewPublic,
  'components/snippets/view/recycle': componentsSnippetsViewRecycle,
  'components/utils': componentsUtils,
};
````

## File: client/src/i18n/config.ts
````typescript
import i18n from 'i18next'
import { initReactI18next } from 'react-i18next'
import LanguageDetector from 'i18next-browser-languagedetector'
import { setDefaultOptions, type Locale as DateFnsLocale } from 'date-fns'
import { DEFAULT_LOCALE } from './constants';
import { resources } from './resources';

const DATE_FNS_LOCALE_MAP: Record<string, string> = {
  en: 'enUS',
  es: 'es',
  ru: 'ru',
  zh: 'zhCN',
  it: 'it'
};

async function setDateFnsDefaultOptions(language?: string) {
  const rawLocale = language || i18n.language;
  const baseLocale = rawLocale.split('-')[0];
  const dateFnsKey = DATE_FNS_LOCALE_MAP[baseLocale] ?? baseLocale;

  const localeModule = (await import(`date-fns/locale`) as any);
  const currentDateFnsLocale: DateFnsLocale = localeModule[dateFnsKey];

  if (currentDateFnsLocale) {
    setDefaultOptions({ locale: currentDateFnsLocale });
  }
}

i18n
  .use(LanguageDetector)
  .use(initReactI18next)
  .init({
    fallbackLng: DEFAULT_LOCALE,
    debug: process.env.NODE_ENV === 'development',
    saveMissing: process.env.NODE_ENV === 'development',
    saveMissingPlurals: process.env.NODE_ENV === 'development',
    defaultNS: 'translation',
    fallbackNS: 'translation',
    interpolation: {
      escapeValue: false,
    },
    resources,
  }, () => {
    setDateFnsDefaultOptions();
  });

i18n
  .on('languageChanged', (language) => {
    setDateFnsDefaultOptions(language);
  });
````

## File: client/src/i18n/constants.ts
````typescript
import { Locale } from './types'

export const LOCALE_ISO_CODES: Record<Locale, string> = {
  [Locale.en]: 'en-US',
  [Locale.ru]: 'ru-RU',
  [Locale.es]: 'es-ES',
  [Locale.ja]: 'ja-JP',
  [Locale.zh]: 'zh-CN',
  [Locale.it]: 'it-IT',
};
export const DEFAULT_LOCALE: Locale = Locale.en;
export const DEFAULT_LOCALE_ISO_CODE = LOCALE_ISO_CODES[Locale.en];
````

## File: client/src/i18n/types.ts
````typescript
export enum Locale {
  en = 'en',
  ru = 'ru',
  es = 'es',
  ja = 'ja',
  zh = 'zh',
  it = 'it'
}
````

## File: client/src/service/authService.ts
````typescript
import { apiClient } from '../utils/api/apiClient';
import { API_ENDPOINTS } from '../constants/api';

interface AuthConfig {
  authRequired: boolean;
}

interface LoginResponse {
  token: string;
}

export const authService = {
  async getConfig(): Promise<AuthConfig> {
    return apiClient.get<AuthConfig>(`${API_ENDPOINTS.AUTH}/config`);
  },

  async verifyToken(): Promise<boolean> {
    try {
      const response = await apiClient.get<{ valid: boolean }>(`${API_ENDPOINTS.AUTH}/verify`, { requiresAuth: true });
      return response.valid;
    } catch {
      return false;
    }
  },

  async login(username: string, password: string): Promise<string> {
    const response = await apiClient.post<LoginResponse>(`${API_ENDPOINTS.AUTH}/login`, { username, password });
    return response.token;
  }
};
````

## File: client/src/service/index.ts
````typescript
export { snippetService } from './snippetService';
export { shareService } from './shareService';
export { authService } from './authService';
````

## File: client/src/service/shareService.ts
````typescript
import { apiClient } from '../utils/api/apiClient';
import { Share, ShareSettings, Snippet } from '../types/snippets';
import { API_ENDPOINTS } from '../constants/api';

export const shareService = {
  async createShare(snippetId: string, settings: ShareSettings): Promise<Share> {
    return apiClient.post<Share>(API_ENDPOINTS.SHARE, { snippetId, ...settings }, { requiresAuth: true });
  },

  async getSharesBySnippetId(snippetId: string): Promise<Share[]> {
    return apiClient.get<Share[]>(`${API_ENDPOINTS.SHARE}/snippet/${snippetId}`, { requiresAuth: true });
  },

  async deleteShare(shareId: string): Promise<void> {
    return apiClient.delete(`${API_ENDPOINTS.SHARE}/${shareId}`, { requiresAuth: true });
  },

  async getSharedSnippet(shareId: string): Promise<Snippet> {
    return apiClient.get<Snippet>(`${API_ENDPOINTS.SHARE}/${shareId}`, { requiresAuth: true });
  }
};
````

## File: client/src/service/snippetService.ts
````typescript
import { apiClient } from "../utils/api/apiClient";
import { Snippet } from "../types/snippets";
import { API_ENDPOINTS } from "../constants/api";

export const snippetService = {
  async getAllSnippets(): Promise<Snippet[]> {
    // Fetch all snippets using pagination
    const allSnippets: Snippet[] = [];
    let offset = 0;
    const limit = 100;
    let hasMore = true;

    while (hasMore) {
      const response = await this.getSnippetsPaginated({ limit, offset });
      allSnippets.push(...response.data);
      hasMore = response.pagination.hasMore;
      offset += limit;
    }

    return allSnippets;
  },

  async getSnippetById(id: string): Promise<Snippet> {
    return apiClient.get<Snippet>(`${API_ENDPOINTS.SNIPPETS}/${id}`, {
      requiresAuth: true,
    });
  },

  async createSnippet(
    snippet: Omit<Snippet, "id" | "updated_at">
  ): Promise<Snippet> {
    return apiClient.post<Snippet>(API_ENDPOINTS.SNIPPETS, snippet, {
      requiresAuth: true,
    });
  },

  async updateSnippet(
    id: string,
    snippet: Omit<Snippet, "id" | "updated_at">
  ): Promise<Snippet> {
    return apiClient.put<Snippet>(`${API_ENDPOINTS.SNIPPETS}/${id}`, snippet, {
      requiresAuth: true,
    });
  },

  async deleteSnippet(id: string): Promise<void> {
    return apiClient.delete(`${API_ENDPOINTS.SNIPPETS}/${id}`, {
      requiresAuth: true,
    });
  },

  async restoreSnippet(id: string): Promise<void> {
    return apiClient.patch(
      `${API_ENDPOINTS.SNIPPETS}/${id}/restore`,
      {},
      { requiresAuth: true }
    );
  },

  async moveToRecycleBin(id: string): Promise<void> {
    return apiClient.patch(
      `${API_ENDPOINTS.SNIPPETS}/${id}/recycle`,
      {},
      { requiresAuth: true }
    );
  },

  async setPinned(id: string, is_pinned: boolean): Promise<Snippet> {
    return apiClient.patch<Snippet>(
      `${API_ENDPOINTS.SNIPPETS}/${id}/pin`,
      { is_pinned },
      { requiresAuth: true }
    );
  },

  async setFavorite(id: string, is_favorite: boolean): Promise<Snippet> {
    return apiClient.patch<Snippet>(
      `${API_ENDPOINTS.SNIPPETS}/${id}/favorite`,
      { is_favorite },
      { requiresAuth: true }
    );
  },

  async getSnippetsPaginated(params: {
    limit?: number;
    offset?: number;
    search?: string;
    searchCode?: boolean;
    language?: string;
    category?: string;  // comma-separated
    favorites?: boolean;
    pinned?: boolean;
    recycled?: boolean;
    sort?: string;
  }): Promise<{
    data: Snippet[];
    pagination: {
      total: number;
      offset: number;
      limit: number;
      hasMore: boolean;
    };
  }> {
    const queryString = new URLSearchParams(
      Object.entries(params)
        .filter(([_, v]) => v !== undefined && v !== null && v !== '')
        .map(([k, v]) => [k, String(v)])
    ).toString();

    return apiClient.get<any>(
      `${API_ENDPOINTS.SNIPPETS}${queryString ? '?' + queryString : ''}`,
      { requiresAuth: true }
    );
  },

  async getSnippetsMetadata(): Promise<{
    categories: string[];
    languages: string[];
    counts: { total: number };
  }> {
    return apiClient.get<any>(
      `${API_ENDPOINTS.SNIPPETS}/metadata`,
      { requiresAuth: true }
    );
  },

  async getPublicSnippetsPaginated(params: {
    limit?: number;
    offset?: number;
    search?: string;
    searchCode?: boolean;
    language?: string;
    category?: string;
    sort?: string;
  }): Promise<{
    data: Snippet[];
    pagination: {
      total: number;
      offset: number;
      limit: number;
      hasMore: boolean;
    };
  }> {
    const queryString = new URLSearchParams(
      Object.entries(params)
        .filter(([_, v]) => v !== undefined && v !== null && v !== '')
        .map(([k, v]) => [k, String(v)])
    ).toString();

    return apiClient.get<any>(
      `${API_ENDPOINTS.PUBLIC}${queryString ? '?' + queryString : ''}`
    );
  },

  async getPublicSnippetsMetadata(): Promise<{
    categories: string[];
    languages: string[];
    counts: { total: number };
  }> {
    return apiClient.get<any>(
      `${API_ENDPOINTS.PUBLIC}/metadata`
    );
  },
};
````

## File: client/src/styles/markdown.css
````css
.markdown-content {
  color: white;
  background-color: #1E1E1E;
  padding: 1rem;
  border-radius: 0.5rem;
  position: relative;
}

.markdown-content > :first-child {
  margin-top: 0 !important;
}

.markdown-content > :last-child {
  margin-bottom: 0 !important;
}

.markdown-content blockquote {
  border-left: 3px solid #4a5568;
  padding-left: 1rem;
  margin: 1rem 0;
  color: #a0aec0;
}

.markdown-content table {
  width: 100%;
  border-collapse: collapse;
  margin: 1rem 0;
}

.markdown-content th,
.markdown-content td {
  border: 1px solid #4a5568;
  padding: 0.5rem;
  text-align: left;
}

.markdown-content th {
  background-color: #2d3748;
}

.markdown-content hr {
  border: 0;
  border-top: 1px solid #4a5568;
  margin: 1rem 0;
}

.markdown.prose > :first-child {
  margin-top: 0 !important;
}

.markdown.prose > * {
  margin-top: 1rem !important;
  margin-bottom: 1rem !important;
}

.markdown.prose > :last-child {
  margin-bottom: 0 !important;
}

.mermaid-container:not(.mermaid-fullscreen) > svg {
  width: 100% !important;
  max-width: 100% !important;
  height: auto !important;
  max-height: 600px !important;
  min-height: 200px !important;
}

.mermaid-container.mermaid-fullscreen > svg {
  width: auto !important;
  height: auto !important;
  max-width: 100vw !important;
  max-height: calc(100vh - 50px) !important;
}
````

## File: client/src/types/apiKey.ts
````typescript
export interface ApiKey {
  id: string;
  name: string;
  key: string;
  last_used?: string;
  created_at: string;
}

export interface CreateApiKeyRequest {
  name: string;
}

export interface CreateApiKeyResponse {
  id: string;
  name: string;
  key: string;
  created_at: string;
}
````

## File: client/src/types/auth.ts
````typescript
export interface OIDCConfig {
  enabled: boolean;
  displayName: string;
  logged_in: boolean;
}
````

## File: client/src/types/common.ts
````typescript
export interface BaseResponse {
  success: boolean;
  message?: string;
}

export interface PaginatedResponse<T> extends BaseResponse {
  data: T[];
  total: number;
  page: number;
  pageSize: number;
}

export interface ApiError extends Error {
  status?: number;
  code?: string;
}
````

## File: client/src/types/global.d.ts
````typescript
interface Window {
  __BASE_PATH__?: string;
}
````

## File: client/src/types/snippets.ts
````typescript
export interface CodeFragment {
  id?: string;
  file_name: string;
  code: string;
  language: string;
  position: number;
}

export interface Snippet {
  id: string;
  title: string;
  description: string;
  updated_at: string;
  expiry_date?: string;
  categories: string[];
  fragments: CodeFragment[];
  share_count?: number;
  is_public: number;
  is_pinned: number;
  is_favorite: number;
  username?: string;
}

export interface ShareSettings {
  requiresAuth: boolean;
  expiresIn?: number;
}

export interface Share {
  id: string;
  snippet_id: number;
  requires_auth: number;
  view_limit: number | null;
  view_count: number;
  expires_at: string;
  created_at: string;
  expired: number;
}
````

## File: client/src/types/user.ts
````typescript
export interface User {
  id: number;
  username: string;
  created_at: string;
  oidc_id?: string;
  is_admin?: number | boolean;
  is_active?: number | boolean;
  last_login_at?: string;
}

export interface AuthResponse {
  token: string;
  user: User;
  error?: string;
}

export interface AuthConfig {
  authRequired: boolean;
  allowNewAccounts: boolean;
  hasUsers: boolean;
  disableAccounts: boolean;
  disableInternalAccounts: boolean;
  allowPasswordChanges: boolean;
}
````

## File: client/src/utils/api/admin.ts
````typescript
import { apiClient } from './apiClient';

const BASE_URL = '/api/admin';

// Helper to build query string
const buildQueryString = (params: Record<string, any>): string => {
  const queryString = new URLSearchParams(
    Object.entries(params)
      .filter(([_, v]) => v !== undefined && v !== null && v !== '')
      .map(([k, v]) => [k, String(v)])
  ).toString();
  return queryString ? `?${queryString}` : '';
};

export const adminApi = {
  // Dashboard
  getStats: () => apiClient.get<any>(`${BASE_URL}/stats`, { requiresAuth: true }),

  // Users
  getUsers: (params: {
    offset?: number;
    limit?: number;
    search?: string;
    authType?: string;
    isActive?: string;
  } = {}) =>
    apiClient.get<any>(`${BASE_URL}/users${buildQueryString(params)}`, {
      requiresAuth: true,
    }),

  getUserDetails: (id: number) =>
    apiClient.get<any>(`${BASE_URL}/users/${id}`, { requiresAuth: true }),

  deleteUser: (id: number) =>
    apiClient.delete<any>(`${BASE_URL}/users/${id}`, { requiresAuth: true }),

  toggleUserActive: (id: number) =>
    apiClient.patch<any>(`${BASE_URL}/users/${id}/toggle-active`, {}, { requiresAuth: true }),

  // Snippets
  getSnippets: (params: {
    offset?: number;
    limit?: number;
    search?: string;
    userId?: string;
    isPublic?: string;
    language?: string;
    category?: string;
  } = {}) =>
    apiClient.get<any>(`${BASE_URL}/snippets${buildQueryString(params)}`, {
      requiresAuth: true,
    }),

  getSnippetDetails: (id: number) =>
    apiClient.get<any>(`${BASE_URL}/snippets/${id}`, { requiresAuth: true }),

  deleteSnippet: (id: number) =>
    apiClient.delete<any>(`${BASE_URL}/snippets/${id}`, { requiresAuth: true }),

  changeSnippetOwner: (id: number, newUserId: number) =>
    apiClient.patch<any>(
      `${BASE_URL}/snippets/${id}/owner`,
      { newUserId },
      { requiresAuth: true }
    ),

  toggleSnippetPublic: (id: number) =>
    apiClient.patch<any>(`${BASE_URL}/snippets/${id}/toggle-public`, {}, { requiresAuth: true }),

  scanSnippetsForOffensive: () =>
    apiClient.get<any>(`${BASE_URL}/snippets/scan/offensive`, { requiresAuth: true }),

  // API Keys
  getApiKeys: (params: {
    offset?: number;
    limit?: number;
    userId?: string;
  } = {}) =>
    apiClient.get<any>(`${BASE_URL}/api-keys${buildQueryString(params)}`, {
      requiresAuth: true,
    }),

  deleteApiKey: (id: number) =>
    apiClient.delete<any>(`${BASE_URL}/api-keys/${id}`, { requiresAuth: true }),

  // Shares
  getShares: (params: {
    offset?: number;
    limit?: number;
    userId?: string;
    requiresAuth?: string;
  } = {}) =>
    apiClient.get<any>(`${BASE_URL}/shares${buildQueryString(params)}`, {
      requiresAuth: true,
    }),

  deleteShare: (id: string) =>
    apiClient.delete<any>(`${BASE_URL}/shares/${id}`, { requiresAuth: true }),
};
````

## File: client/src/utils/api/apiClient.ts
````typescript
import { EVENTS } from '../../constants/events';

interface RequestOptions extends RequestInit {
  requiresAuth?: boolean;
}

export class ApiClient {
  private static instance: ApiClient;
  private basePath: string;

  private constructor() {
    this.basePath = (window as any).__BASE_PATH__ || '';
  }

  static getInstance(): ApiClient {
    if (!ApiClient.instance) {
      ApiClient.instance = new ApiClient();
    }
    return ApiClient.instance;
  }

  private getHeaders(options: RequestOptions = {}): Headers {
    const headers = new Headers(options.headers);
    headers.set('Content-Type', 'application/json');

    if (options.requiresAuth) {
      const token = localStorage.getItem('token');
      if (token) {
        headers.set('bytestashauth', `Bearer ${token}`);
      }
    }

    return headers;
  }

  private handleError(error: any): never {
    if (error instanceof Response) {
      if (error.status === 401 || error.status === 403) {
        window.dispatchEvent(new CustomEvent(EVENTS.AUTH_ERROR));
      }
    }
    throw error;
  }

  async request<T>(endpoint: string, options: RequestOptions = {}): Promise<T> {
    try {
      const response = await fetch(`${this.basePath}${endpoint}`, {
        ...options,
        headers: this.getHeaders(options),
      });

      if (!response.ok) {
        if (response.status === 401 || response.status === 403) {
          window.dispatchEvent(new CustomEvent(EVENTS.AUTH_ERROR));
        }
        const error = await response.json().catch(() => ({}));
        error.status = response.status;
        throw error;
      }

      return response.json();
    } catch (error) {
      this.handleError(error);
    }
  }

  async get<T>(endpoint: string, options: RequestOptions = {}): Promise<T> {
    return this.request<T>(endpoint, { ...options, method: 'GET' });
  }

  async post<T>(endpoint: string, data: any, options: RequestOptions = {}): Promise<T> {
    return this.request<T>(endpoint, {
      ...options,
      method: 'POST',
      body: JSON.stringify(data),
    });
  }

  async put<T>(endpoint: string, data: any, options: RequestOptions = {}): Promise<T> {
    return this.request<T>(endpoint, {
      ...options,
      method: 'PUT',
      body: JSON.stringify(data),
    });
  }
  async patch<T>(endpoint: string, data: any, options: RequestOptions = {}): Promise<T> {
    return this.request<T>(endpoint, {
      ...options,
      method: 'PATCH',
      body: JSON.stringify(data),
    });
  }

  async delete<T>(endpoint: string, options: RequestOptions = {}): Promise<T> {
    return this.request<T>(endpoint, { ...options, method: 'DELETE' });
  }
}

export const apiClient = ApiClient.getInstance();
````

## File: client/src/utils/api/apiKeys.ts
````typescript
import { ApiKey, CreateApiKeyRequest, CreateApiKeyResponse } from '../../types/apiKey';
import { apiClient } from './apiClient';

export const getApiKeys = async (): Promise<ApiKey[]> => {
  return apiClient.get<ApiKey[]>('/api/keys', { requiresAuth: true });
};

export const createApiKey = async (request: CreateApiKeyRequest): Promise<CreateApiKeyResponse> => {
  return apiClient.post<CreateApiKeyResponse>('/api/keys', request, { requiresAuth: true });
};

export const deleteApiKey = async (id: string): Promise<void> => {
  await apiClient.delete(`/api/keys/${id}`, { requiresAuth: true });
};
````

## File: client/src/utils/api/auth.ts
````typescript
import { apiClient } from './apiClient';
import type { AuthResponse, AuthConfig } from '../../types/user';
import { API_ENDPOINTS } from '../../constants/api';

export const getAuthConfig = async () => {
  return apiClient.get<AuthConfig>(`${API_ENDPOINTS.AUTH}/config`);
};

export const verifyToken = async () => {
  return apiClient.get<{ valid: boolean; user?: any }>(`${API_ENDPOINTS.AUTH}/verify`, { requiresAuth: true });
};

export const login = async (username: string, password: string): Promise<AuthResponse> => {
  return apiClient.post<AuthResponse>(`${API_ENDPOINTS.AUTH}/login`, { username, password });
};

export const register = async (username: string, password: string): Promise<AuthResponse> => {
  return apiClient.post<AuthResponse>(`${API_ENDPOINTS.AUTH}/register`, { username, password });
};

export const anonymous = async (): Promise<AuthResponse> => {
  return apiClient.post<AuthResponse>(`${API_ENDPOINTS.AUTH}/anonymous`, {});
}

export const changePassword = async (currentPassword: string, newPassword: string): Promise<{ success: boolean; message: string }> => {
  return apiClient.post<{ success: boolean; message: string }>(`${API_ENDPOINTS.AUTH}/change-password`, { 
    currentPassword, 
    newPassword 
  }, { requiresAuth: true });
};
````

## File: client/src/utils/api/basePath.ts
````typescript
interface WindowWithBasePath extends Window {
  __BASE_PATH__?: string;
}

const getBasePath = (): string => {
  const win = window as WindowWithBasePath;
  return win.__BASE_PATH__ || '';
};

export const basePath = getBasePath();
````

## File: client/src/utils/api/share.ts
````typescript
import { shareService } from '../../service/shareService';
import type { Share, ShareSettings, Snippet } from '../../types/snippets';
import { createCustomEvent, EVENTS } from '../../constants/events';

export const createShare = async (
  snippetId: string, 
  settings: ShareSettings
): Promise<Share> => {
  try {
    const share = await shareService.createShare(snippetId, settings);
    window.dispatchEvent(createCustomEvent(EVENTS.SHARE_CREATED));
    return share;
  } catch (error) {
    console.error('Error creating share:', error);
    throw error;
  }
};

export const getSharesBySnippetId = async (snippetId: string): Promise<Share[]> => {
  try {
    return await shareService.getSharesBySnippetId(snippetId);
  } catch (error) {
    console.error('Error fetching shares:', error);
    throw error;
  }
};

export const deleteShare = async (shareId: string): Promise<void> => {
  try {
    await shareService.deleteShare(shareId);
    window.dispatchEvent(createCustomEvent(EVENTS.SHARE_DELETED));
  } catch (error) {
    console.error('Error deleting share:', error);
    throw error;
  }
};

export const getSharedSnippet = async (shareId: string): Promise<Snippet> => {
  try {
    return await shareService.getSharedSnippet(shareId);
  } catch (error) {
    console.error('Error fetching shared snippet:', error);
    throw error;
  }
};
````

## File: client/src/utils/api/snippets.ts
````typescript
import { snippetService } from "../../service/snippetService";
import type { Snippet } from "../../types/snippets";
import { apiClient } from "./apiClient";
import { API_ENDPOINTS } from "../../constants/api";
import { createCustomEvent, EVENTS } from "../../constants/events";

export const createSnippet = async (
  snippet: Omit<Snippet, "id" | "updated_at">
): Promise<Snippet> => {
  try {
    const newSnippet = await snippetService.createSnippet(snippet);
    window.dispatchEvent(createCustomEvent(EVENTS.SNIPPET_UPDATED));
    return newSnippet;
  } catch (error) {
    console.error("Error creating snippet:", error);
    throw error;
  }
};

export const deleteSnippet = async (id: string): Promise<void> => {
  try {
    await snippetService.deleteSnippet(id);
    window.dispatchEvent(createCustomEvent(EVENTS.SNIPPET_DELETED));
  } catch (error) {
    console.error("Error deleting snippet:", error);
    throw error;
  }
};

export const editSnippet = async (
  id: string,
  snippet: Omit<Snippet, "id" | "updated_at">
): Promise<Snippet> => {
  try {
    const updatedSnippet = await snippetService.updateSnippet(id, snippet);
    window.dispatchEvent(createCustomEvent(EVENTS.SNIPPET_UPDATED));
    return updatedSnippet;
  } catch (error) {
    console.error("Error updating snippet:", error);
    throw error;
  }
};

export const getSnippetById = async (id: string): Promise<Snippet> => {
  try {
    return await snippetService.getSnippetById(id);
  } catch (error) {
    console.error("Error fetching snippet:", error);
    throw error;
  }
};

export const getPublicSnippetById = async (id: string): Promise<Snippet> => {
  try {
    return await apiClient.get<Snippet>(`${API_ENDPOINTS.PUBLIC}/${id}`);
  } catch (error) {
    console.error("Error fetching public snippet:", error);
    throw error;
  }
};

export const restoreSnippetById = async (id: string): Promise<void> => {
  try {
    await snippetService.restoreSnippet(id);
  } catch (error) {
    console.error("Error restoring snippet:", error);
    throw error;
  }
};

export const moveToRecycleBin = async (id: string): Promise<void> => {
  try {
    await snippetService.moveToRecycleBin(id);
  } catch (error) {
    console.error("Error moving snippet to recycle bin:", error);
    throw error;
  }
};

export const setPinnedSnippet = async (
  id: string,
  is_pinned: boolean
): Promise<Snippet> => {
  try {
    const updatedSnippet = await snippetService.setPinned(id, is_pinned);
    window.dispatchEvent(createCustomEvent(EVENTS.SNIPPET_UPDATED));
    return updatedSnippet;
  } catch (error) {
    console.error("Error setting snippet pinned status:", error);
    throw error;
  }
};

export const setFavoriteSnippet = async (
  id: string,
  is_favorite: boolean
): Promise<Snippet> => {
  try {
    const updatedSnippet = await snippetService.setFavorite(id, is_favorite);
    window.dispatchEvent(createCustomEvent(EVENTS.SNIPPET_UPDATED));
    return updatedSnippet;
  } catch (error) {
    console.error("Error setting snippet favorite status:", error);
    throw error;
  }
};
````

## File: client/src/utils/helpers/apiUtils.ts
````typescript
import { ApiError } from '../../types/common';

export const createApiError = (message: string, status?: number, code?: string): ApiError => {
  const error = new Error(message) as ApiError;
  if (status) error.status = status;
  if (code) error.code = code;
  return error;
};

export const handleApiResponse = async <T>(response: Response): Promise<T> => {
  if (!response.ok) {
    const error = await response.json().catch(() => ({}));
    throw createApiError(
      error.message || 'An error occurred',
      response.status,
      error.code
    );
  }

  return response.json();
};
````

## File: client/src/utils/helpers/changeCaseUtils.ts
````typescript
export function capitalizeFirstLetter(strValue: string) {
  if (!strValue) {
    return '';
  }

  const trimmedValue = strValue.trim();

  return trimmedValue.charAt(0).toUpperCase() + trimmedValue.slice(1);
}
````

## File: client/src/utils/helpers/colourUtils.ts
````typescript
export const colorUtils = {
  getContrastColor: (hexcolor: string): string => {
    const r = parseInt(hexcolor.slice(1, 3), 16);
    const g = parseInt(hexcolor.slice(3, 5), 16);
    const b = parseInt(hexcolor.slice(5, 7), 16);
    const yiq = (r * 299 + g * 587 + b * 114) / 1000;
    return yiq >= 128 ? '#000000' : '#FFFFFF';
  },

  adjustBrightness: (hex: string, percent: number): string => {
    const num = parseInt(hex.replace('#', ''), 16);
    const amt = Math.round(2.55 * percent);
    const R = (num >> 16) + amt;
    const G = (num >> 8 & 0x00FF) + amt;
    const B = (num & 0x0000FF) + amt;
    return `#${(
      0x1000000 +
      (R < 255 ? (R < 1 ? 0 : R) : 255) * 0x10000 +
      (G < 255 ? (G < 1 ? 0 : G) : 255) * 0x100 +
      (B < 255 ? (B < 1 ? 0 : B) : 255)
    ).toString(16).slice(1)}`;
  }
};
````

## File: client/src/utils/helpers/debounce.ts
````typescript
export function debounce<T extends (...args: any[]) => any>(
  func: T,
  wait: number
): T & { cancel: () => void } {
  let timeout: ReturnType<typeof setTimeout> | null = null;

  const debounced = function (this: any, ...args: Parameters<T>) {
    if (timeout) {
      clearTimeout(timeout);
    }
    timeout = setTimeout(() => {
      func.apply(this, args);
    }, wait);
  } as T & { cancel: () => void };

  debounced.cancel = () => {
    if (timeout) {
      clearTimeout(timeout);
      timeout = null;
    }
  };

  return debounced;
}
````

## File: client/src/utils/helpers/embedUtils.ts
````typescript
interface EmbedParams {
  shareId: string;
  showTitle: boolean;
  showDescription: boolean;
  showFileHeaders: boolean;
  showPoweredBy: boolean;
  theme: string;
  fragmentIndex?: number;
}

export const generateEmbedId = (params: EmbedParams): string => {
  const paramsString = `${params.shareId}-${params.showTitle}-${params.showDescription}-${params.showFileHeaders}-${params.showPoweredBy}-${params.fragmentIndex ?? 'all'}`;
  
  let hash = 0;
  for (let i = 0; i < paramsString.length; i++) {
    const char = paramsString.charCodeAt(i);
    hash = ((hash << 5) - hash) + char;
    hash = hash & hash;
  }
  
  const hashStr = Math.abs(hash).toString(16).padStart(16, '0').slice(0, 16);
  return hashStr;
};
````

## File: client/src/utils/language/languageUtils.tsx
````typescript
import { CodeFragment, Snippet } from "../../types/snippets";
import * as monaco from "monaco-editor";
import { 
  FileJson, 
  FileText, 
  FileImage, 
  Globe
} from 'lucide-react';
import { 
  JavascriptOriginalIcon,
  TypescriptOriginalIcon,
  PythonOriginalIcon,
  Html5OriginalIcon,
  Css3OriginalIcon,
  PhpOriginalIcon,
  JavaOriginalIcon,
  CsharpOriginalIcon,
  CplusplusOriginalIcon,
  COriginalIcon,
  GoOriginalIcon,
  RustOriginalIcon,
  RubyOriginalIcon,
  SwiftOriginalIcon,
  KotlinOriginalIcon,
  DartOriginalIcon,
  ReactOriginalIcon,
  VuejsOriginalIcon,
  SvelteOriginalIcon,
  MysqlOriginalIcon,
  PostgresqlOriginalIcon,
  YamlPlainIcon,
  BashOriginalIcon,
  MarkdownOriginalIcon
} from '@devicon/react';

interface DropdownSections {
  used: string[];
  other: string[];
}

interface LanguageConfig {
  aliases: string[];
  monacoAlias: string;
  label: string;
}

type LanguageMapping = {
  [key: string]: LanguageConfig;
};

const LANGUAGE_MAPPING: LanguageMapping = {
  // Web Development Languages
  javascript: {
    aliases: [
      "js",
      "node",
      "nodejs",
      "jsx",
      "mjs",
      "cjs",
      "node.js",
      "ecmascript",
      "es6",
      "es2015",
      "es2016",
      "es2017",
      "es2018",
      "es2019",
      "es2020",
    ],
    monacoAlias: "javascript",
    label: "javascript",
  },
  typescript: {
    aliases: [
      "ts",
      "tsx",
      "typescript-next",
      "typescriptreact",
      "ts-next",
      "tsx",
      "tsc",
    ],
    monacoAlias: "typescript",
    label: "typescript",
  },
  html: {
    aliases: ["html5", "htm", "xhtml", "markup", "shtml", "dhtml", "html4"],
    monacoAlias: "html",
    label: "html",
  },
  css: {
    aliases: [
      "css3",
      "styles",
      "stylesheet",
      "scss",
      "sass",
      "less",
      "postcss",
      "style",
    ],
    monacoAlias: "css",
    label: "css",
  },
  php: {
    aliases: [
      "php3",
      "php4",
      "php5",
      "php7",
      "php8",
      "phps",
      "phtml",
      "laravel",
      "symfony",
    ],
    monacoAlias: "php",
    label: "php",
  },
  webassembly: {
    aliases: ["wasm", "wat", "wasmer", "wasmtime"],
    monacoAlias: "wasm",
    label: "webassembly",
  },

  // System Programming Languages
  c: {
    aliases: ["h", "ansi-c", "c99", "c11", "c17", "c23"],
    monacoAlias: "c",
    label: "c",
  },
  cpp: {
    aliases: [
      "c++",
      "cc",
      "cxx",
      "hpp",
      "h++",
      "cplusplus",
      "c++11",
      "c++14",
      "c++17",
      "c++20",
      "c++23",
    ],
    monacoAlias: "cpp",
    label: "c++",
  },
  csharp: {
    aliases: [
      "cs",
      "c#",
      "dotnet",
      "net",
      "dotnetcore",
      "net6",
      "net7",
      "net8",
      "aspnet",
    ],
    monacoAlias: "csharp",
    label: "c#",
  },
  vba: {
    aliases: [
      "vb",
      "visualbasic",
      "visual-basic",
      "vbscript",
      "vbs",
      "excel-vba",
      "word-vba",
      "access-vba",
      "office-vba",
    ],
    monacoAlias: "vb",
    label: "vba",
  },
  rust: {
    aliases: ["rs", "rust-lang", "rustlang", "cargo", "rustc"],
    monacoAlias: "rust",
    label: "rust",
  },
  go: {
    aliases: ["golang", "go-lang", "gopher", "gocode"],
    monacoAlias: "go",
    label: "go",
  },

  // JVM Languages
  java: {
    aliases: ["jsp", "jvm", "spring", "javase", "javaee", "jakarta"],
    monacoAlias: "java",
    label: "java",
  },
  kotlin: {
    aliases: ["kt", "kts", "kotlinx", "ktor", "spring-kotlin"],
    monacoAlias: "kotlin",
    label: "kotlin",
  },
  scala: {
    aliases: ["sc", "scala2", "scala3", "dotty", "akka", "play"],
    monacoAlias: "scala",
    label: "scala",
  },
  groovy: {
    aliases: ["gvy", "gy", "gsh", "gradle", "grails"],
    monacoAlias: "groovy",
    label: "groovy",
  },

  // Scripting Languages
  python: {
    aliases: [
      "py",
      "py3",
      "pyc",
      "pyd",
      "pyo",
      "pyw",
      "pyz",
      "django",
      "flask",
      "fastapi",
      "jupyter",
    ],
    monacoAlias: "python",
    label: "python",
  },
  ruby: {
    aliases: [
      "rb",
      "rbw",
      "rake",
      "gemspec",
      "podspec",
      "thor",
      "irb",
      "rails",
      "sinatra",
    ],
    monacoAlias: "ruby",
    label: "ruby",
  },
  perl: {
    aliases: ["pl", "pm", "pod", "t", "prl", "perl5", "perl6", "raku"],
    monacoAlias: "perl",
    label: "perl",
  },
  lua: {
    aliases: ["luac", "luajit", "moonscript", "lua5"],
    monacoAlias: "lua",
    label: "lua",
  },

  // Shell Scripting
  bash: {
    aliases: [
      "sh",
      "shell",
      "zsh",
      "ksh",
      "csh",
      "tcsh",
      "shellscript",
      "bash-script",
      "bashrc",
      "zshrc",
    ],
    monacoAlias: "shell",
    label: "bash",
  },
  powershell: {
    aliases: [
      "ps",
      "ps1",
      "psd1",
      "psm1",
      "pwsh",
      "psc1",
      "pssc",
      "windows-powershell",
    ],
    monacoAlias: "powershell",
    label: "powershell",
  },
  batch: {
    aliases: ["bat", "cmd", "command", "dos", "windows-batch"],
    monacoAlias: "bat",
    label: "batch",
  },

  // Database Languages
  sql: {
    aliases: [
      "mysql",
      "postgresql",
      "psql",
      "pgsql",
      "plsql",
      "tsql",
      "mssql",
      "sqlite",
      "oracle",
      "mariadb",
    ],
    monacoAlias: "sql",
    label: "sql",
  },
  mongodb: {
    aliases: ["mongo", "mongoose", "nosql", "mongosh"],
    monacoAlias: "javascript",
    label: "mongodb",
  },

  // Markup & Configuration Languages
  markdown: {
    aliases: [
      "md",
      "mkd",
      "mkdown",
      "mdwn",
      "mdown",
      "markd",
      "mdx",
      "rmd",
      "commonmark",
    ],
    monacoAlias: "markdown",
    label: "markdown",
  },
  yaml: {
    aliases: [
      "yml",
      "yaml-frontmatter",
      "docker-compose",
      "k8s",
      "kubernetes",
      "ansible",
    ],
    monacoAlias: "yaml",
    label: "yaml",
  },
  json: {
    aliases: [
      "json5",
      "jsonc",
      "jsonl",
      "geojson",
      "json-ld",
      "composer",
      "package.json",
      "tsconfig",
      "jsonnet",
    ],
    monacoAlias: "json",
    label: "json",
  },
  xml: {
    aliases: [
      "rss",
      "atom",
      "xhtml",
      "xsl",
      "plist",
      "svg",
      "xmlns",
      "xsd",
      "dtd",
      "maven",
    ],
    monacoAlias: "xml",
    label: "xml",
  },
  toml: {
    aliases: ["cargo.toml", "poetry.toml"],
    monacoAlias: "ini",
    label: "toml",
  },
  ini: {
    aliases: ["cfg", "properties", "config", "ini-file", "windows-ini"],
    monacoAlias: "ini",
    label: "ini",
  },
  conf: {
    aliases: ["config-file", "configuration", "nginx", "apache", "httpd.conf"],
    monacoAlias: "ini",
    label: "conf",
  },
  vimscript: {
    aliases: ["vim", "vimrc", ".vimrc", "viml", "nvim", "neovim"],
    monacoAlias: "plaintext",
    label: "vimscript",
  },

  // Cloud & Infrastructure
  terraform: {
    aliases: ["tf", "hcl", "tfvars", "terraform-config"],
    monacoAlias: "hcl",
    label: "terraform",
  },
  dockerfile: {
    aliases: ["docker", "containerfile", "docker-compose"],
    monacoAlias: "dockerfile",
    label: "dockerfile",
  },
  kubernetes: {
    aliases: ["k8s", "helm", "kustomize"],
    monacoAlias: "yaml",
    label: "kubernetes",
  },

  // Other Programming Languages
  swift: {
    aliases: ["swiftc", "swift5", "swift-lang", "apple-swift"],
    monacoAlias: "swift",
    label: "swift",
  },
  r: {
    aliases: ["rlang", "rscript", "r-stats", "r-project"],
    monacoAlias: "r",
    label: "r",
  },
  julia: {
    aliases: ["jl", "julia-lang", "julialang"],
    monacoAlias: "julia",
    label: "julia",
  },
  dart: {
    aliases: ["flutter", "dart-lang", "dart2", "dart3"],
    monacoAlias: "dart",
    label: "dart",
  },
  elm: {
    aliases: ["elm-lang", "elm-format"],
    monacoAlias: "elm",
    label: "elm",
  },
  apex: {
    aliases: [],
    monacoAlias: "apex",
    label: "apex",
  },

  // Smart Contract Languages
  solidity: {
    aliases: ["sol", "ethereum", "smart-contract", "evm"],
    monacoAlias: "sol",
    label: "solidity",
  },
  vyper: {
    aliases: ["vy", "ethereum-vyper"],
    monacoAlias: "python",
    label: "vyper",
  },

  // Hardware Description Languages
  verilog: {
    aliases: ['v', 'vh', 'verilog-hdl', 'hdl'],
    monacoAlias: 'systemverilog',
    label: 'verilog'
  },
  systemverilog: {
    aliases: ['sv', 'svh', 'systemverilog-hdl', 'sv-hdl'],
    monacoAlias: 'systemverilog',
    label: 'systemverilog'
  },

  // Scientific & Math
  latex: {
    aliases: ["tex", "context", "ltx", "bibtex", "texinfo"],
    monacoAlias: "latex",
    label: "latex",
  },
  matlab: {
    aliases: ["octave", "m", "mat"],
    monacoAlias: "matlab",
    label: "matlab",
  },

  // Query Languages
  graphql: {
    aliases: ["gql", "graphqlschema", "apollo"],
    monacoAlias: "graphql",
    label: "graphql",
  },
  cypher: {
    aliases: ["neo4j", "neo4j-cypher"],
    monacoAlias: "cypher",
    label: "cypher",
  },

  // Other
  abap: {
    aliases: [],
    monacoAlias: "abap",
    label: "abap",
  },

  // Fallback
  plaintext: {
    aliases: ["text", "txt", "plain", "log", "raw"],
    monacoAlias: "plaintext",
    label: "plaintext",
  },
};

const getAllLanguageIdentifiers = (): Set<string> => {
  const identifiers = new Set<string>();

  Object.entries(LANGUAGE_MAPPING).forEach(([key, config]) => {
    identifiers.add(key.toLowerCase());
    config.aliases.forEach((alias) => identifiers.add(alias.toLowerCase()));
  });

  return identifiers;
};

const LANGUAGE_IDENTIFIERS = getAllLanguageIdentifiers();

export const normalizeLanguage = (lang: string): string => {
  if (!lang || typeof lang !== "string") return "plaintext";

  const normalized = lang.toLowerCase().trim();

  if (LANGUAGE_MAPPING[normalized]) {
    return normalized;
  }

  for (const [language, config] of Object.entries(LANGUAGE_MAPPING)) {
    if (config.aliases.includes(normalized)) {
      return language;
    }
  }

  return lang;
};

export const getMonacoLanguage = (lang: string): string => {
  const normalized = normalizeLanguage(lang);
  return LANGUAGE_MAPPING[normalized]?.monacoAlias || lang;
};

export const getLanguageLabel = (lang: string): string => {
  const normalized = normalizeLanguage(lang);
  return LANGUAGE_MAPPING[normalized]?.label || lang;
};

export interface LanguageInfo {
  language: string;
  aliases: string[];
  label: string;
}

export const getSupportedLanguages = (): LanguageInfo[] => {
  return Object.entries(LANGUAGE_MAPPING).map(([lang, config]) => ({
    language: lang,
    aliases: [...config.aliases],
    label: config.label,
  }));
};

export const isLanguageSupported = (lang: string): boolean => {
  const normalized = lang?.toLowerCase().trim() || "";
  return LANGUAGE_IDENTIFIERS.has(normalized);
};

export const getLanguageAliases = (lang: string): string[] => {
  const normalized = normalizeLanguage(lang);
  return LANGUAGE_MAPPING[normalized]?.aliases || [];
};

export const getAllLanguageAliases = (): Record<string, string[]> => {
  return Object.entries(LANGUAGE_MAPPING).reduce((acc, [lang, config]) => {
    acc[lang] = [...config.aliases];
    return acc;
  }, {} as Record<string, string[]>);
};

export const getUniqueLanguages = (fragments: CodeFragment[]): string => {
  if (!fragments || fragments.length === 0) {
    return "";
  }

  const uniqueLanguages = [
    ...new Set(
      fragments
        .map((fragment) => getLanguageLabel(fragment.language))
        .filter((lang) => lang && lang !== "plaintext")
    ),
  ];

  return uniqueLanguages.join(", ");
};

export const configureMonaco = () => {
  monaco.editor.defineTheme("bytestash-dark", {
    base: "vs-dark",
    inherit: true,
    rules: [
      { token: "comment", foreground: "6A9955" },
      { token: "keyword", foreground: "569CD6" },
      { token: "string", foreground: "CE9178" },
      { token: "number", foreground: "B5CEA8" },
      { token: "regexp", foreground: "D16969" },
      { token: "type", foreground: "4EC9B0" },
      { token: "class", foreground: "4EC9B0" },
      { token: "function", foreground: "DCDCAA" },
      { token: "variable", foreground: "9CDCFE" },
      { token: "constant", foreground: "4FC1FF" },
      { token: "parameter", foreground: "9CDCFE" },
      { token: "builtin", foreground: "4EC9B0" },
      { token: "operator", foreground: "D4D4D4" },
    ],
    colors: {
      "editor.background": "#1E1E1E",
      "editor.foreground": "#D4D4D4",
      "editor.lineHighlightBackground": "#2F2F2F",
      "editorLineNumber.foreground": "#858585",
      "editorLineNumber.activeForeground": "#C6C6C6",
      "editor.selectionBackground": "#264F78",
      "editor.inactiveSelectionBackground": "#3A3D41",
      "editorBracketMatch.background": "#0D3A58",
      "editorBracketMatch.border": "#888888",
    },
  });
};

export const initializeMonaco = () => {
  configureMonaco();
};

export const getLanguagesUsage = (
  snippets: Snippet[]
): Record<string, number> => {
  const languageCount: Record<string, number> = {};

  for (const snippet of snippets || []) {
    for (const fragment of snippet.fragments || []) {
      const lang = fragment.language?.trim().toLowerCase();
      if (!lang) continue;
      languageCount[lang] = (languageCount[lang] || 0) + 1;
    }
  }
  return languageCount;
};

export const saveLanguagesUsage = (snippets: Snippet[]): void => {
  const usage = getLanguagesUsage(snippets);
  localStorage.setItem("languagesUsage", JSON.stringify(usage));
  getLanguageDropdownSections();
};

export const getLanguageDropdownSections = (): DropdownSections => {
  let languageUsage: Record<string, number> = {};

  try {
    const stored = localStorage.getItem("languagesUsage");
    if (stored) {
      const parsed = JSON.parse(stored);
      if (parsed && typeof parsed === "object") {
        languageUsage = parsed as Record<string, number>;
      }
    }
  } catch {
    languageUsage = {};
  }

  const allLanguages: string[] = Object.keys(LANGUAGE_MAPPING);

  // Used languages sorted by usage count (descending) then alphabetically
  const used: string[] = allLanguages
    .filter((lang) => (languageUsage[lang] ?? 0) > 0)
    .sort((a, b) => {
      const countA = languageUsage[a] ?? 0;
      const countB = languageUsage[b] ?? 0;
      return countB - countA || a.localeCompare(b);
    });

  // Other languages sorted alphabetically
  const other: string[] = allLanguages
    .filter((lang) => !used.includes(lang))
    .sort((a, b) => a.localeCompare(b));

  return { used, other };
};

export const languageMapping = LANGUAGE_MAPPING;

export const detectLanguageFromFileName = (fileName: string): string | null => {
  if (!fileName || typeof fileName !== "string") return null;

  const parts = fileName.split(".");
  if (parts.length < 2) return null; // No extension found

  const extension = parts.pop()?.toLowerCase() || "";
  if (!extension) return null;

  // First, check direct matches with language keys
  if (LANGUAGE_MAPPING[extension]) {
    return extension;
  }

  // Then, search through aliases
  for (const [key, config] of Object.entries(LANGUAGE_MAPPING)) {
    if (config.aliases.includes(extension)) {
      return key;
    }
  }

  return null;
};

export const getFullFileName = (fileName: string, language?: string): string => {
  if (!fileName) return "";
  
  if (fileName.includes('.')) return fileName;

  if (!language || normalizeLanguage(language) === 'plaintext') return fileName;

  const normalized = normalizeLanguage(language);
  const aliases = LANGUAGE_MAPPING[normalized]?.aliases;
  
  if (aliases && aliases.length > 0) {
    return `${fileName}.${aliases[0]}`;
  }

  return fileName;
};

export const getFileIcon = (fileName: string, language?: string, className?: string) => {
  const fullName = getFullFileName(fileName, language);
  if (!fullName) return <FileText className={className} />;
  
  const ext = fullName.split('.').pop()?.toLowerCase() || '';
  const monacoKey = getMonacoLanguage(language || ext);
  
  // Unified mapping based on Monaco's master key
  switch (monacoKey) {
    case 'javascript':
    case 'jsx':
      return <JavascriptOriginalIcon className={className} size={16} />;
    case 'typescript':
    case 'tsx':
      return <TypescriptOriginalIcon className={className} size={16} />;
    case 'python':
      return <PythonOriginalIcon className={className} size={16} />;
    case 'html':
      return <Html5OriginalIcon className={className} size={16} />;
    case 'css':
    case 'less':
    case 'scss':
      return <Css3OriginalIcon className={className} size={16} />;
    case 'php':
      return <PhpOriginalIcon className={className} size={16} />;
    case 'java':
      return <JavaOriginalIcon className={className} size={16} />;
    case 'csharp':
      return <CsharpOriginalIcon className={className} size={16} />;
    case 'cpp':
      return <CplusplusOriginalIcon className={className} size={16} />;
    case 'c':
      return <COriginalIcon className={className} size={16} />;
    case 'go':
      return <GoOriginalIcon className={className} size={16} />;
    case 'rust':
      return <RustOriginalIcon className={className} size={16} />;
    case 'ruby':
      return <RubyOriginalIcon className={className} size={16} />;
    case 'swift':
      return <SwiftOriginalIcon className={className} size={16} />;
    case 'kotlin':
      return <KotlinOriginalIcon className={className} size={16} />;
    case 'dart':
      return <DartOriginalIcon className={className} size={16} />;
    case 'sql':
    case 'mysql':
      return <MysqlOriginalIcon className={className} size={16} />;
    case 'postgresql':
      return <PostgresqlOriginalIcon className={className} size={16} />;
    case 'yaml':
    case 'ini':
      return <YamlPlainIcon className={className} size={16} />;
    case 'shell':
    case 'bat':
    case 'powershell':
    case 'bash':
      return <BashOriginalIcon className={className} size={16} />;
    case 'markdown':
      return <MarkdownOriginalIcon className={className} size={16} />;
    case 'xml':
      return <Globe className={className} />;
    case 'plaintext':
      return <FileText className={className} />;
  }

  // Fallback map extensions directly to specific frameworks/variants that Monaco might umbrella
  switch (ext) {
    case 'json':
      return <FileJson className={className} />;
    case 'jsx':
    case 'tsx':
      return <ReactOriginalIcon className={className} size={16} />;
    case 'vue':
      return <VuejsOriginalIcon className={className} size={16} />;
    case 'svelte':
      return <SvelteOriginalIcon className={className} size={16} />;
    case 'png':
    case 'jpg':
    case 'jpeg':
    case 'gif':
    case 'webp':
    case 'svg':
      return <FileImage className={className} />;
    case 'csv':
    case 'txt':
    case 'log':
      return <FileText className={className} />;
    default:
      return <FileText className={className} />;
  }
};
````

## File: client/src/utils/downloadUtils.ts
````typescript
import JSZip from "jszip";

// Get file extension based on language
export const getFileExtension = (language: string): string => {
  const extensionMap: Record<string, string> = {
    javascript: "js",
    typescript: "ts",
    python: "py",
    java: "java",
    cpp: "cpp",
    "c++": "cpp",
    c: "c",
    csharp: "cs",
    "c#": "cs",
    php: "php",
    ruby: "rb",
    go: "go",
    rust: "rs",
    swift: "swift",
    kotlin: "kt",
    scala: "scala",
    perl: "pl",
    lua: "lua",
    r: "r",
    matlab: "m",
    shell: "sh",
    bash: "sh",
    powershell: "ps1",
    html: "html",
    css: "css",
    scss: "scss",
    sass: "sass",
    less: "less",
    xml: "xml",
    json: "json",
    yaml: "yml",
    yml: "yml",
    markdown: "md",
    sql: "sql",
    dockerfile: "dockerfile",
    vim: "vim",
    ini: "ini",
    toml: "toml",
    makefile: "makefile",
    gitignore: "gitignore",
    plaintext: "txt",
    text: "txt",
  };
  const normalizedLanguage = language.toLowerCase().replace(/[^a-z0-9]/g, "");
  return extensionMap[normalizedLanguage] || "txt";
};

// Download a file with given content and filename
export const downloadFile = (
  content: string | Blob,
  filename: string,
  mimeType: string = "text/plain"
): void => {
  const blob =
    content instanceof Blob ? content : new Blob([content], { type: mimeType });
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  link.href = url;
  link.download = filename;
  link.style.display = "none";
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  URL.revokeObjectURL(url);
};

// Download a code fragment with appropriate filename and extension
export const downloadFragment = (
  code: string,
  fileName: string,
  language: string
): void => {
  const hasExtension = fileName.includes(".");
  const finalFileName = hasExtension
    ? fileName
    : `${fileName}.${getFileExtension(language)}`;
  downloadFile(code, finalFileName);
};

// Create and download a zip file containing multiple code fragments
export const downloadSnippetArchive = async (
  snippetTitle: string,
  fragments: Array<{
    code: string;
    file_name: string;
    language: string;
  }>
): Promise<void> => {
  try {
    const zip = new JSZip();
    const folderName =
      snippetTitle.replace(/[^a-zA-Z0-9-_\s]/g, "").trim() || "snippet";
    const folder = zip.folder(folderName);
    const usedFilenames = new Set<string>();
    fragments.forEach((fragment) => {
      const hasExtension = fragment.file_name.includes(".");
      const baseFileName = hasExtension
        ? fragment.file_name
        : `${fragment.file_name}.${getFileExtension(fragment.language)}`;
      let uniqueFileName = baseFileName;
      let counter = 1;
      while (usedFilenames.has(uniqueFileName)) {
        const nameWithoutExt = baseFileName.replace(/\.[^/.]+$/, "");
        const ext = baseFileName.includes(".")
          ? baseFileName.split(".").pop()
          : "";
        uniqueFileName = ext
          ? `${nameWithoutExt}_${counter}.${ext}`
          : `${nameWithoutExt}_${counter}`;
        counter++;
      }
      usedFilenames.add(uniqueFileName);
      folder?.file(uniqueFileName, fragment.code);
    });
    const content = await zip.generateAsync({ type: "blob" });
    const zipFileName = `${folderName}.zip`;
    downloadFile(content, zipFileName, "application/zip");
  } catch (error) {
    console.error("Error creating zip file:", error);
    throw new Error(
      "Failed to create archive. Please try downloading files individually."
    );
  }
};
````

## File: client/src/utils/fileUploadUtils.ts
````typescript
// Accepted file extensions for code upload
export const ACCEPTED_FILE_EXTENSIONS = [
  // JavaScript/TypeScript
  ".js",
  ".jsx",
  ".ts",
  ".tsx",
  ".mjs",
  ".cjs",
  // Python
  ".py",
  ".pyw",
  ".pyi",
  // Java/JVM languages
  ".java",
  ".kt",
  ".kts",
  ".scala",
  ".groovy",
  // C/C++
  ".c",
  ".cpp",
  ".cxx",
  ".cc",
  ".c++",
  ".h",
  ".hpp",
  ".hxx",
  // C#
  ".cs",
  // Web languages
  ".html",
  ".htm",
  ".css",
  ".scss",
  ".sass",
  ".less",
  // PHP
  ".php",
  ".phtml",
  // Ruby
  ".rb",
  ".rbw",
  // Go
  ".go",
  // Rust
  ".rs",
  // Swift
  ".swift",
  // Shell scripts
  ".sh",
  ".bash",
  ".zsh",
  ".fish",
  ".ps1",
  // Data formats
  ".json",
  ".xml",
  ".yaml",
  ".yml",
  ".toml",
  ".ini",
  // SQL
  ".sql",
  // Markup
  ".md",
  ".markdown",
  ".tex",
  // Config files
  ".dockerfile",
  ".gitignore",
  ".makefile",
  // Other
  ".r",
  ".R",
  ".m",
  ".pl",
  ".lua",
  ".vim",
  ".txt",
].join(",");

// Detect programming language from file extension
export const detectLanguageFromFilename = (filename: string): string => {
  const extensionMap: Record<string, string> = {
    // JavaScript/TypeScript
    js: "javascript",
    jsx: "javascript",
    ts: "typescript",
    tsx: "typescript",
    mjs: "javascript",
    cjs: "javascript",

    // Python
    py: "python",
    pyw: "python",
    pyi: "python",

    // Java/JVM languages
    java: "java",
    kt: "kotlin",
    kts: "kotlin",
    scala: "scala",
    groovy: "groovy",

    // C/C++
    c: "c",
    cpp: "cpp",
    cxx: "cpp",
    cc: "cpp",
    "c++": "cpp",
    h: "c",
    hpp: "cpp",
    hxx: "cpp",

    // C#
    cs: "csharp",

    // Web languages
    html: "html",
    htm: "html",
    css: "css",
    scss: "scss",
    sass: "sass",
    less: "less",

    // PHP
    php: "php",
    phtml: "php",

    // Ruby
    rb: "ruby",
    rbw: "ruby",

    // Go
    go: "go",

    // Rust
    rs: "rust",

    // Swift
    swift: "swift",

    // Shell scripts
    sh: "shell",
    bash: "bash",
    zsh: "shell",
    fish: "shell",
    ps1: "powershell",

    // Data formats
    json: "json",
    xml: "xml",
    yaml: "yaml",
    yml: "yaml",
    toml: "toml",
    ini: "ini",

    // SQL
    sql: "sql",

    // Markup
    md: "markdown",
    markdown: "markdown",
    tex: "latex",

    // Config files
    dockerfile: "dockerfile",
    gitignore: "gitignore",
    makefile: "makefile",

    // Other
    r: "r",
    R: "r",
    m: "matlab",
    pl: "perl",
    lua: "lua",
    vim: "vim",
    txt: "plaintext",
  };

  const extension = filename.split(".").pop()?.toLowerCase();
  return extension ? extensionMap[extension] || "plaintext" : "plaintext";
};

// Read file content as text
export const readFileAsText = (file: File): Promise<string> => {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();

    reader.onload = (e) => {
      const result = e.target?.result;
      if (typeof result === "string") {
        resolve(result);
      } else {
        reject(new Error("Failed to read file as text"));
      }
    };

    reader.onerror = () => {
      reject(new Error("Error reading file"));
    };

    reader.readAsText(file);
  });
};

// Validate file for code upload
export const validateCodeFile = (
  file: File
): { isValid: boolean; error?: string } => {
  // Check file size (max 1MB)
  const maxSize = 1024 * 1024;
  if (file.size > maxSize) {
    return {
      isValid: false,
      error: "File size must be less than 1MB",
    };
  }

  // Check if it's a text file
  if (
    !file.type.startsWith("text/") &&
    file.type !== "application/json" &&
    file.type !== ""
  ) {
    // Allow files without MIME type (common for code files)
    const allowedExtensions = ACCEPTED_FILE_EXTENSIONS.split(",").map((ext) =>
      ext.replace(".", "")
    );

    const extension = file.name.split(".").pop()?.toLowerCase();
    if (!extension || !allowedExtensions.includes(extension)) {
      return {
        isValid: false,
        error: "Please upload a valid code file",
      };
    }
  }

  return { isValid: true };
};

// Process uploaded file and return code fragment data
export const processUploadedFile = async (
  file: File
): Promise<{
  file_name: string;
  code: string;
  language: string;
  position: number;
}> => {
  const validation = validateCodeFile(file);
  if (!validation.isValid) {
    throw new Error(validation.error);
  }

  const code = await readFileAsText(file);
  const language = detectLanguageFromFilename(file.name);

  return {
    file_name: file.name?.split(".")[0],
    code: code,
    language: language,
    position: 0,
  };
};
````

## File: client/src/utils/getCurrentLocale.ts
````typescript
import i18n from 'i18next'
import { LOCALE_ISO_CODES, DEFAULT_LOCALE_ISO_CODE } from '../i18n/constants'
import { Locale } from '../i18n/types'

export function getCurrentLocale() {
  const { language } = i18n;

  return {
    locale: language,
    isoCode: LOCALE_ISO_CODES[language as Locale] || DEFAULT_LOCALE_ISO_CODE,
  };
}
````

## File: client/src/utils/markdownUtils.ts
````typescript
import { ReactNode } from "react";

export const flattenToText = (node: ReactNode): string => {
  if (!node) return "";

  if (typeof node === "string" || typeof node === "number") {
    return String(node);
  }

  if (Array.isArray(node)) {
    return node.reduce((text, child) => text + flattenToText(child), "");
  }

  if (typeof node === "object" && "props" in node) {
    return flattenToText(node.props?.children);
  }

  return "";
};
````

## File: client/src/utils/paths.ts
````typescript
export const getAssetPath = (path: string) => {
  const basePath = (window as any).__BASE_PATH__ || '';
  return `${basePath}${path}`;
};
````

## File: client/src/App.tsx
````typescript
import React from 'react';
import { BrowserRouter as Router, Route, Routes, Navigate, useParams } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { AuthProvider } from './contexts/AuthContext';
import { ThemeProvider } from './contexts/ThemeContext';
import { useAuth } from './hooks/useAuth';
import { LoginPage } from './components/auth/LoginPage';
import { RegisterPage } from './components/auth/RegisterPage';
import { OIDCCallback } from './components/auth/oidc/OIDCCallback';
import { ROUTES } from './constants/routes';
import { PageContainer } from './components/common/layout/PageContainer';
import { ToastProvider } from './contexts/ToastContext';
import SnippetStorage from './components/snippets/view/SnippetStorage';
import SharedSnippetView from './components/snippets/share/SharedSnippetView';
import SnippetPage from './components/snippets/view/SnippetPage';
import PublicSnippetStorage from './components/snippets/view/public/PublicSnippetStorage';
import EmbedView from './components/snippets/embed/EmbedView';
import RecycleSnippetStorage from './components/snippets/view/recycle/RecycleSnippetStorage';
import { OIDCLogoutCallback } from './components/auth/oidc/OIDCLogoutCallback';
import { AdminPage } from './components/admin/AdminPage';

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
      retry: 1,
      staleTime: 30000,
    },
  },
});

const AuthenticatedApp: React.FC = () => {
  const { isAuthenticated, isLoading } = useAuth();

  if (isLoading) {
    return (
      <PageContainer>
        <div className="flex items-center justify-center min-h-[60vh]">
          <div className="text-dark-text dark:text-dark-text text-xl">Loading...</div>
        </div>
      </PageContainer>
    );
  }

  if (!isAuthenticated) {
    return <Navigate to={ROUTES.LOGIN} replace />;
  }

  return <SnippetStorage />;
};

const EmbedViewWrapper: React.FC = () => {
  const { shareId } = useParams();
  const searchParams = new URLSearchParams(window.location.search);
  
  if (!shareId) {
    return <div>Invalid share ID</div>;
  }

  const theme = searchParams.get('theme') as 'light' | 'dark' | 'system' | null;

  return (
    <EmbedView
      shareId={shareId}
      showTitle={searchParams.get('showTitle') === 'true'}
      showDescription={searchParams.get('showDescription') === 'true'}
      showFileHeaders={searchParams.get('showFileHeaders') !== 'false'}
      showPoweredBy={searchParams.get('showPoweredBy') !== 'false'}
      theme={theme || 'system'}
      fragmentIndex={searchParams.get('fragmentIndex') ? parseInt(searchParams.get('fragmentIndex')!, 10) : undefined}
    />
  );
};

const App: React.FC = () => {
  return (
    <QueryClientProvider client={queryClient}>
      <Router basename={window.__BASE_PATH__} future={{ v7_relativeSplatPath: true }}>
        <ThemeProvider>
          <div className="min-h-screen bg-light-bg dark:bg-dark-bg text-light-text dark:text-dark-text">
            <ToastProvider>
              <AuthProvider>
                <Routes>
                  <Route path={ROUTES.LOGIN} element={<LoginPage />} />
                  <Route path={ROUTES.REGISTER} element={<RegisterPage />} />
                  <Route path={ROUTES.AUTH_CALLBACK} element={<OIDCCallback />} />
                  <Route path={ROUTES.LOGOUT_CALLBACK} element={<OIDCLogoutCallback />} />
                  <Route path={ROUTES.SHARED_SNIPPET} element={<SharedSnippetView />} />
                  <Route path={ROUTES.PUBLIC_SNIPPETS} element={<PublicSnippetStorage />} />
                  <Route path={ROUTES.RECYCLE} element={<RecycleSnippetStorage />} />
                  <Route path={ROUTES.EMBED} element={<EmbedViewWrapper />} />
                  <Route path={ROUTES.SNIPPET} element={<SnippetPage />} />
                  <Route path="/admin/*" element={<AdminPage />} />
                  <Route path={ROUTES.HOME} element={<AuthenticatedApp />} />
                </Routes>
              </AuthProvider>
            </ToastProvider>
          </div>
        </ThemeProvider>
      </Router>
    </QueryClientProvider>
  );
};

export default App;
````

## File: client/src/index.css
````css
@tailwind base;
@tailwind components;
@tailwind utilities;

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New',
    monospace;
}

.markdown > * {
  all: revert;
}

.markdown p {
  margin: revert;
}

.markdown a {
  @apply text-blue-600 dark:text-blue-400 no-underline hover:underline;
}

.markdown ul {
  list-style-type: disc;
  padding-left: 1.5rem;
}

.markdown ul ul {
  list-style-type: disc;
  padding-left: 1.5rem;
}

.markdown ol {
  list-style-type: decimal;
  padding-left: 1.5rem;
}

.markdown ol ol {
  list-style-type: lower-alpha;
  padding-left: 1.5rem;
}

/* Markdown styles */
.markdown pre {
  @apply bg-[#ebebeb] dark:bg-[#2d2d2d];
  padding: 0.2rem 0.4rem;
  border-radius: 0.25rem;
  @apply text-light-text dark:text-dark-text;
}
.markdown code {
  @apply bg-[#ebebeb] dark:bg-[#2d2d2d];
  padding: 0.2rem 0.4rem;
  border-radius: 0.25rem;
  @apply text-light-text dark:text-dark-text;
}

.markdown pre code {
  padding: 0;
  background-color: transparent;
  border: none;
  box-shadow: none;
}

/* Light theme scrollbars */
.light ::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

.light ::-webkit-scrollbar-track {
  @apply bg-light-surface;
  border-radius: 4px;
}

.light ::-webkit-scrollbar-thumb {
  @apply bg-slate-400;
  border-radius: 4px;
  transition: background 0.2s ease;
}

.light ::-webkit-scrollbar-thumb:hover {
  @apply bg-slate-500;
}

.light ::-webkit-scrollbar-corner {
  background: transparent;
}

/* Dark theme scrollbars */
.dark ::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

.dark ::-webkit-scrollbar-track {
  @apply bg-dark-surface;
  border-radius: 4px;
}

.dark ::-webkit-scrollbar-thumb {
  @apply bg-slate-600;
  border-radius: 4px;
  transition: background 0.2s ease;
}

.dark ::-webkit-scrollbar-thumb:hover {
  @apply bg-slate-500;
}

.dark ::-webkit-scrollbar-corner {
  background: transparent;
}

/* Firefox scrollbars */
.light * {
  scrollbar-width: thin;
  scrollbar-color: var(--light-scrollbar) var(--light-scrollbar-track);
}

.dark * {
  scrollbar-width: thin;
  scrollbar-color: var(--dark-scrollbar) var(--dark-scrollbar-track);
}

.light .modal-content,
.light [role="dialog"],
.light [role="complementary"],
.light .overflow-auto,
.light .overflow-y-auto,
.light .overflow-x-auto {
  scrollbar-width: thin;
  scrollbar-color: var(--light-scrollbar) var(--light-scrollbar-track);
}

.dark .modal-content,
.dark [role="dialog"],
.dark [role="complementary"],
.dark .overflow-auto,
.dark .overflow-y-auto,
.dark .overflow-x-auto {
  scrollbar-width: thin;
  scrollbar-color: var(--dark-scrollbar) var(--dark-scrollbar-track);
}

:root {
  --dark-scrollbar-track: rgb(30, 41, 59);  /* slate-800 */
}
````

## File: client/src/index.tsx
````typescript
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import './index.css'
import './styles/markdown.css';

import './i18n/config'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
````

## File: client/.gitignore
````
# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*
````

## File: client/.prettierignore
````
**/*
````

## File: client/i18next.config.ts
````typescript
import { defineConfig } from 'i18next-cli'
import { DEFAULT_LOCALE } from './src/i18n/constants';
import { Locale } from './src/i18n/types';

export default defineConfig({
  locales: [
    Locale.en,
    Locale.ru,
    Locale.es,
    Locale.ja,
    Locale.zh,
    Locale.it
  ],
  extract: {
    input: 'src/**/*.{js,jsx,ts,tsx}',
    output: 'src/i18n/locales/{{language}}/{{namespace}}.json',
    primaryLanguage: DEFAULT_LOCALE,
    defaultValue: '__TRANSLATE_ME__',
    removeUnusedKeys: false,
  }
});
````

## File: client/index.html
````html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="ByteStash - Code Snippet Manager"
    />
    <link rel="apple-touch-icon" href="/logo192.png" />
    <link rel="manifest" href="/manifest.json" />
    <title>ByteStash</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
    <script type="module" src="/src/index.tsx"></script>
  </body>
</html>
````

## File: client/package.json
````json
{
  "name": "bytestash-client",
  "version": "0.1.0",
  "license": "ISC",
  "dependencies": {
    "@devicon/react": "^0.0.3",
    "@monaco-editor/react": "^4.6.0",
    "@tanstack/react-query": "^5.90.20",
    "date-fns": "^4.1.0",
    "framer-motion": "^11.11.9",
    "html-to-image": "^1.11.13",
    "i18next": "^25.8.0",
    "i18next-browser-languagedetector": "^8.2.0",
    "jszip": "^3.10.1",
    "lucide-react": "^0.513.0",
    "mermaid": "^11.12.3",
    "monaco-editor": "^0.52.0",
    "parse-duration": "^1.1.0",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-i18next": "^16.5.4",
    "react-markdown": "^9.0.1",
    "react-router-dom": "^6.28.0",
    "react-syntax-highlighter": "^15.6.1",
    "react-zoom-pan-pinch": "^3.7.0",
    "remark-gfm": "^4.0.1",
    "vite-plugin-monaco-editor": "^1.1.0"
  },
  "devDependencies": {
    "@tailwindcss/typography": "^0.5.19",
    "@types/node": "^20.11.28",
    "@types/prismjs": "^1.26.5",
    "@types/react": "^18.3.11",
    "@types/react-dom": "^18.3.1",
    "@types/react-syntax-highlighter": "^15.5.13",
    "@vitejs/plugin-react": "^4.5.1",
    "autoprefixer": "^10.4.20",
    "i18next-cli": "^1.39.6",
    "postcss": "^8.4.47",
    "prismjs": "^1.30.0",
    "tailwindcss": "^3.4.14",
    "typescript": "^5.9.3",
    "vite": "^6.3.5"
  },
  "scripts": {
    "start": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview",
    "i18n:extract": "i18next-cli extract --sync-all"
  },
  "engines": {
    "node": ">=22"
  }
}
````

## File: client/postcss.config.js
````javascript
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
````

## File: client/tailwind.config.js
````javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
    "./public/index.html"
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        'light-bg': '#f1f5f9',
        'light-surface': '#e2e8f0',
        'light-border': '#cbd5e1',
        'light-text': '#1e293b',
        'light-text-secondary': '#475569',
        'light-primary': '#2563eb',
        'light-hover': '#cbd5e1',
        'light-hover-more': '#eff2f6',

        'dark-bg': '#0f172a',
        'dark-surface': '#1e293b',
        'dark-border': '#334155',
        'dark-text': '#e2e8f0',
        'dark-text-secondary': '#94a3b8',
        'dark-primary': '#2563eb',
        'dark-hover': '#334155',
        'dark-hover-more': '#4d6280',
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
````

## File: client/tsconfig.json
````json
{
  "compilerOptions": {
    "target": "ES2020",
    "lib": ["DOM", "DOM.Iterable", "ES2020"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "node",
    "allowSyntheticDefaultImports": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "baseUrl": ".",
    "types": ["node"],
    "paths": {
      "@/*": ["./src/*"]
    },
    "typeRoots": [
      "./node_modules/@types",
      "./src/types"
    ]
  },
  "include": ["src/**/*"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
````

## File: client/tsconfig.node.json
````json
{
    "compilerOptions": {
      "composite": true,
      "skipLibCheck": true,
      "module": "ESNext",
      "moduleResolution": "node",
      "allowSyntheticDefaultImports": true
    },
    "include": ["vite.config.ts"]
  }
````

## File: client/vite.config.ts
````typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import monacoEditorPlugin from 'vite-plugin-monaco-editor';

// Parse allowed hosts from environment variable
const allowedHosts = process.env.ALLOWED_HOSTS
  ? process.env.ALLOWED_HOSTS.split(',').map(host => host.trim()).filter(Boolean)
  : undefined;

export default defineConfig({
  plugins: [
    react(),
    monacoEditorPlugin({ globalAPI: true }),
  ],
  server: {
    allowedHosts: allowedHosts,
    proxy: {
      '/api': {
        target: 'http://localhost:5000',
        changeOrigin: true,
      },
    },
    port: 3000,
  },
  build: {
    outDir: 'build'
  }
});
````

## File: helm-charts/bytestash/templates/_helpers.tpl
````
{{/*
Expand the name of the chart.
*/}}
{{- define "bytestash.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bytestash.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "bytestash.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "bytestash.labels" -}}
helm.sh/chart: {{ include "bytestash.chart" . }}
{{ include "bytestash.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "bytestash.selectorLabels" -}}
app.kubernetes.io/name: {{ include "bytestash.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "bytestash.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "bytestash.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
````

## File: helm-charts/bytestash/templates/deployment.yaml
````yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "bytestash.fullname" . }}
  labels:
    {{- include "bytestash.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  {{- with .Values.strategy }}
  strategy:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  selector:
    matchLabels:
      {{- include "bytestash.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      {{- with .Values.podAnnotations }}
      annotations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
        {{- include "bytestash.labels" . | nindent 8 }}
        {{- with .Values.podLabels }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
    spec:
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      serviceAccountName: {{ include "bytestash.serviceAccountName" . }}
      securityContext:
        {{- toYaml .Values.podSecurityContext | nindent 8 }}
      containers:
        - name: {{ .Chart.Name }}
          securityContext:
            {{- toYaml .Values.containerSecurityContext | nindent 12 }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          env:
          {{- with .Values.bytestash.baseUrl  }}
          - name: BASE_PATH
            value: {{ . }}
          {{- end }}
          {{- with .Values.extraEnv }}
          {{- toYaml . | nindent 10 }}
          {{- end }}
          {{- range $key, $value := .Values.extraEnvSecrets }}
          - name: {{ $key }}
            valueFrom:
              secretKeyRef:
                name: {{ $value.name | quote }}
                key: {{ $value.key | quote }}
          {{- end }}
          - name: DEBUG
            value: {{ .Values.bytestash.debug | quote }}
          - name: DISABLE_ACCOUNTS
            value: {{ .Values.bytestash.disableAccount | quote }}
          - name: DISABLE_INTERNAL_ACCOUNTS
            value: {{ .Values.bytestash.disableAllAccount | quote }}
          - name: ALLOW_NEW_ACCOUNTS
            value: {{ .Values.bytestash.allowNewAccount | quote }}
          {{- if ( ne .Values.bytestash.existingJwtSecret.secretName "" ) }}
          - name: JWT_SECRET
            valueFrom:
              secretKeyRef:
                name: {{ .Values.bytestash.existingJwtSecret.secretName | quote }}
                key: {{ .Values.bytestash.existingJwtSecret.jwtKey | quote }}
          - name: TOKEN_EXPIRY
            valueFrom:
              secretKeyRef:
                name: {{ .Values.bytestash.existingJwtSecret.secretName | quote }}
                key: {{ .Values.bytestash.existingJwtSecret.expirityKey | quote }}
          {{- else }}
          - name: JWT_SECRET
            value: {{ .Values.bytestash.jwtSecret | quote }}
          - name: TOKEN_EXPIRY
            value: {{ .Values.bytestash.jwtExpirity | quote }}
          {{- end }}
          {{- if .Values.oidc.enabled }}
          - name: OIDC_ENABLED
            value: "true"
          - name: OIDC_DISPLAY_NAME
            value: {{ .Values.oidc.name | quote }}
          - name: OIDC_ISSUER_URL
            value: {{ .Values.oidc.issuerUrl | quote }}
          - name: OIDC_CLIENT_ID
            value: {{ .Values.oidc.clientId | quote }}
          - name: OIDC_CLIENT_SECRET
            value: {{ .Values.oidc.clientSecret | quote }}
          - name: OIDC_SCOPES
            value: {{ .Values.oidc.scopes | quote }}
          {{- end }}
          ports:
            - name: http
              containerPort: {{ .Values.service.port }}
              protocol: TCP
          livenessProbe:
            httpGet:
              {{- $contextPath := .Values.bytestash.baseUrl | default "/" | printf "%s" | urlParse }}
              path: {{ get $contextPath "path" }}
              port: {{ .Values.livenessProbe.httpGet.port }}
            initialDelaySeconds: {{ .Values.livenessProbe.initialDelaySeconds }}
            periodSeconds: {{ .Values.livenessProbe.periodSeconds }}
            timeoutSeconds: {{ .Values.livenessProbe.timeoutSeconds }}
            failureThreshold: {{ .Values.livenessProbe.failureThreshold }}
            successThreshold: {{ .Values.livenessProbe.successThreshold }}
          readinessProbe:
            httpGet:
              {{- $contextPath := .Values.bytestash.baseUrl | default "/" | printf "%s" | urlParse }}
              path: {{ get $contextPath "path" }}
              port: {{ .Values.readinessProbe.httpGet.port }}
            initialDelaySeconds: {{ .Values.readinessProbe.initialDelaySeconds }}
            periodSeconds: {{ .Values.readinessProbe.periodSeconds }}
            timeoutSeconds: {{ .Values.readinessProbe.timeoutSeconds }}
            failureThreshold: {{ .Values.readinessProbe.failureThreshold }}
            successThreshold: {{ .Values.readinessProbe.successThreshold }}
          resources:
            {{- toYaml .Values.resources | nindent 12 }}
          {{- if .Values.persistence.enabled }}
          volumeMounts:
            - name: data
              mountPath: /data
              subPath: snippets
          {{- end }}
      {{- if .Values.persistence.enabled }}
      volumes:
        - name: data
          persistentVolumeClaim:
            claimName: {{ include "bytestash.fullname" . }}-data
      {{- end }}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
````

## File: helm-charts/bytestash/templates/ingress.yaml
````yaml
{{- if .Values.ingress.enabled -}}
{{- $fullName := include "bytestash.fullname" . -}}
{{- $svcPort := .Values.service.port -}}
{{- if and .Values.ingress.className (not (semverCompare ">=1.18-0" .Capabilities.KubeVersion.GitVersion)) }}
  {{- if not (hasKey .Values.ingress.annotations "kubernetes.io/ingress.class") }}
  {{- $_ := set .Values.ingress.annotations "kubernetes.io/ingress.class" .Values.ingress.className}}
  {{- end }}
{{- end }}
{{- if semverCompare ">=1.19-0" .Capabilities.KubeVersion.GitVersion -}}
apiVersion: networking.k8s.io/v1
{{- else if semverCompare ">=1.14-0" .Capabilities.KubeVersion.GitVersion -}}
apiVersion: networking.k8s.io/v1beta1
{{- else -}}
apiVersion: extensions/v1beta1
{{- end }}
kind: Ingress
metadata:
  name: {{ $fullName }}
  labels:
    {{- include "bytestash.labels" . | nindent 4 }}
  {{- with .Values.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  {{- if and .Values.ingress.className (semverCompare ">=1.18-0" .Capabilities.KubeVersion.GitVersion) }}
  ingressClassName: {{ .Values.ingress.className }}
  {{- end }}
  {{- if .Values.ingress.tls }}
  tls:
    {{- range .Values.ingress.tls }}
    - hosts:
        {{- range .hosts }}
        - {{ . | quote }}
        {{- end }}
      secretName: {{ .secretName }}
    {{- end }}
  {{- end }}
  rules:
    - host: {{ .Values.ingress.host | quote }}
      http:
        paths:
          - path: {{ .Values.ingress.path }}
            pathType: {{ .Values.ingress.pathType }}
            backend:
              service:
                name: {{ $fullName }}
                port:
                  number: {{ $svcPort }}
{{- end }}
````

## File: helm-charts/bytestash/templates/NOTES.txt
````
1. Get the application URL by running these commands:
{{- if .Values.ingress.enabled }}
{{- range $host := .Values.ingress.hosts }}
  {{- range .paths }}
  http{{ if $.Values.ingress.tls }}s{{ end }}://{{ $host.host }}{{ .path }}
  {{- end }}
{{- end }}
{{- else if contains "NodePort" .Values.service.type }}
  export NODE_PORT=$(kubectl get --namespace {{ .Release.Namespace }} -o jsonpath="{.spec.ports[0].nodePort}" services {{ include "bytestash.fullname" . }})
  export NODE_IP=$(kubectl get nodes --namespace {{ .Release.Namespace }} -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT
{{- else if contains "LoadBalancer" .Values.service.type }}
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get --namespace {{ .Release.Namespace }} svc -w {{ include "bytestash.fullname" . }}'
  export SERVICE_IP=$(kubectl get svc --namespace {{ .Release.Namespace }} {{ include "bytestash.fullname" . }} --template "{{"{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}"}}")
  echo http://$SERVICE_IP:{{ .Values.service.port }}
{{- else if contains "ClusterIP" .Values.service.type }}
  export POD_NAME=$(kubectl get pods --namespace {{ .Release.Namespace }} -l "app.kubernetes.io/name={{ include "bytestash.name" . }},app.kubernetes.io/instance={{ .Release.Name }}" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace {{ .Release.Namespace }} $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace {{ .Release.Namespace }} port-forward $POD_NAME 8080:$CONTAINER_PORT
{{- end }}
````

## File: helm-charts/bytestash/templates/pvc.yaml
````yaml
{{- if .Values.persistence.enabled -}}
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: {{ include "bytestash.fullname" . }}-data
  labels:
    {{- include "bytestash.labels" . | nindent 4 }}
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: {{ .Values.persistence.size | quote }}
{{- if .Values.persistence.storageClassName }}
{{- if (eq "-" .Values.persistence.storageClassName) }}
  storageClassName: ""
{{- else }}
  storageClassName: "{{ .Values.persistence.storageClassName }}"
{{- end }}
{{- end }}
{{- end }}
````

## File: helm-charts/bytestash/templates/service.yaml
````yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ include "bytestash.fullname" . }}
  labels:
    {{- include "bytestash.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  {{- if .Values.service.externalIPs }}
  externalIPs:
    {{- toYaml .Values.service.externalIPs | nindent 4 }}
  {{- end }}
  {{- if .Values.service.loadBalancerIP }}
  loadBalancerIP: "{{ .Values.service.loadBalancerIP }}"
  {{- end }}
  {{- if .Values.service.loadBalancerSourceRanges }}
  loadBalancerSourceRanges:
    {{- toYaml .Values.service.loadBalancerSourceRanges | nindent 4 }}
  {{- end }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "bytestash.selectorLabels" . | nindent 4 }}
````

## File: helm-charts/bytestash/templates/serviceaccount.yaml
````yaml
{{- if .Values.serviceAccount.create -}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "bytestash.serviceAccountName" . }}
  labels:
    {{- include "bytestash.labels" . | nindent 4 }}
  {{- with .Values.serviceAccount.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
````

## File: helm-charts/bytestash/.example.yaml
````yaml
persistence:
  enabled: true
  storageClassName: some-class
  size: 10Gi
bytestash:
  baseUrl: /bytestash
  allowNewAccount: true
  existingJwtSecret:
    secretName: name-of-existing-secret
    jwtKey: key-a-in-secret
    expirityKey: key-b-in-secret
resources:
  requests:
    cpu: 50m
    memory: 64Mi
ingress:
  enabled: true
  className: nginx
  host: org.example.com
  path: /bytestash
  pathType: Prefix
````

## File: helm-charts/bytestash/.helmignore
````
# Patterns to ignore when building packages.
# This supports shell glob matching, relative path matching, and
# negation (prefixed with !). Only one pattern per line.
.DS_Store
# Common VCS dirs
.git/
.gitignore
.bzr/
.bzrignore
.hg/
.hgignore
.svn/
# Common backup files
*.swp
*.bak
*.tmp
*.orig
*~
# Various IDEs
.project
.idea/
*.tmproj
.vscode/
````

## File: helm-charts/bytestash/Chart.yaml
````yaml
apiVersion: v2
name: bytestash
description: A Helm chart for deploying ByteStash to Kubernetes

type: application
version: 0.1.1
appVersion: "1.5.7"
````

## File: helm-charts/bytestash/README.md
````markdown
# ByteStash Helm Chart for Kubernetes

## Before you begin

This [Helm](https://github.com/kubernetes/helm) chart supports installation of [ByteStash](https://github.com/jordan-dalby/ByteStash) - A code snippet storage solution written in React & node.js

The prerequisites for this Helm chart is a working **Kubernetes Cluster** and **Helm** installed.

If you don't have a Kubernetes Cluster, create one with [minikube](https://minikube.sigs.k8s.io/docs/start/).

To install Helm, see [Helm Installation guide](https://helm.sh/docs/intro/install/).

<br>

## Installation and Configuration

To add the ByteStash helm repository, run command:

```bash
helm repo add bytestash https://jordan-dalby.github.io/ByteStash/
```

To install the ByteStash helm chart with a release name `my-release` in `ns` namespace, run command:

```bash
helm install -n ns --create-namespace my-release bytestash/bytestash
```

To update latest changes of the charts from the Helm repository, run commands:

```bash
helm repo update

helm -n ns upgrade my-release bytestash/bytestash

```

To configure the Helm chart deployment, the configurable parameters can be found in `values.yaml` values file. Those parameters can be set via `--set` flag during installation or configured by editing the `values.yaml` directly. An example configuration can be found at [example](./.example.yaml)

To uninstall/delete the `my-release` deployment, run command:

```bash
helm delete my-release
```
````

## File: helm-charts/bytestash/values.yaml
````yaml
### ByteStash Helm Chart for Kubernetes
### Maintainer: Tin Trung Ngo - trungtinth1011@gmail.com

## Strings for naming overrides
##
nameOverride: ""
fullnameOverride: ""

## ServiceAccount configuration
##
serviceAccount:
  # Specifies whether a service account should be created
  create: false
  # Annotations to add to the service account
  annotations: {}
  # The name of the service account to use.
  # If not set and create is true, a name is generated using the fullname template
  name: ""

### ByteStash configs
### ref: https://github.com/jordan-dalby/ByteStash/wiki
###
replicaCount: 1

### Deployment strategy (default: RollingUpdate)
### Set to Recreate if using persistence with ReadWriteOnce volumes
strategy:
  type: Recreate

### Enabling this will persist the `/data` directory with a Persistent Volume
persistence:
  enabled: false
  storageClassName: ""
  size: 10Gi

### Basic configs
bytestash:
  baseUrl: ""
  debug: false
  disableAccount: false
  disableAllAccount: false
  allowNewAccount: false
  jwtSecret: ""
  jwtExpirity: ""

  ### Existing Kubernetes Secret that contains JWT secret and JWT expiration time
  ### This will override the `bytestash.jwtSecret` and `bytestash.jwtExpirity`
  existingJwtSecret:
    secretName: ""
    jwtKey: ""
    expirityKey: ""

### Ref: https://github.com/jordan-dalby/ByteStash/wiki/Single-Sign%E2%80%90on-Setup
oidc:
  enabled: false
  name: "Single Sign-on"
  issuerUrl: "" # Authentik, Authelia, or Keycloak
  clientId: ""
  clientSecret: ""
  scopes: ""

imagePullSecrets: []
image:
  repository: ghcr.io/jordan-dalby/bytestash
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: 1.5.7

## Array with extra environment variables to add to the pod. For example:
## extraEnv:
##   - name: ENV01
##     value: "value01"
##
extraEnv: []

## Map with extra environment variables fetched from existing secrets. For example:
## extraEnvSecrets:
##   ENV02:
##     name: extra-secret
##     key: username
extraEnvSecrets: {}

## Configure resource requests and limits
## ref: http://kubernetes.io/docs/user-guide/compute-resources/
##
resources: {}

## Configure liveness and readiness probes
## ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
##
livenessProbe:
  httpGet:
    port: http
  initialDelaySeconds: 10
  periodSeconds: 10
  timeoutSeconds: 10
  failureThreshold: 3
  successThreshold: 1

readinessProbe:
  httpGet:
    port: http
  initialDelaySeconds: 10
  periodSeconds: 10
  timeoutSeconds: 10
  failureThreshold: 3
  successThreshold: 1

## Extra annotations for pods
## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
##
podAnnotations: {}

## Extra labels for pods
## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
##
podLabels: {}

## Configure Pods Security Context
## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
##
podSecurityContext:
  {}
  # fsGroup: 1000
  # runAsGroup: 1000
  # runAsNonRoot: true
  # runAsUser: 1000

## Configure Container Security Context
## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container
##
containerSecurityContext:
  {}
  # capabilities:
  #   drop:
  #   - ALL
  # readOnlyRootFilesystem: true
  # runAsNonRoot: true
  # runAsUser: 1000

## ByteStash service parameters
##
service:
  type: ClusterIP
  port: 5000
  annotations: {}
  externalIPs: []
  loadBalancerIP: ""
  loadBalancerSourceRanges: []

## ByteStash ingress parameters
##
ingress:
  enabled: false
  className: ""
  annotations:
    {}
    # kubernetes.io/tls-acme: "true"
  host: chart-example.local
  path: /
  pathType: ImplementationSpecific
  tls: []

## Node labels selector for pods assignment
## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/
##
nodeSelector: {}

## Tolerations for pods assignment
## ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
##
tolerations: []

## Affinity for pods assignment
## ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
##
affinity: {}
````

## File: server/docs/swagger.yaml
````yaml
openapi: 3.0.0
info:
  title: ByteStash API
  version: "1.0.0"
  description: API documentation for ByteStash snippet storage service.
servers:
  - url: /
    description: Local server
components:
  securitySchemes:
    JwtAuth:
      type: apiKey
      in: header
      name: bytestashauth
      description: JWT token obtained from /api/auth/login. Must be prefixed with "bearer TOKEN"
    ApiKeyAuth:
      type: apiKey
      in: header
      name: x-api-key
      description: API key for CLI access
  schemas:
    Fragment:
      type: object
      properties:
        id:
          type: integer
        file_name:
          type: string
        code:
          type: string
        language:
          type: string
        position:
          type: integer
    Snippet:
      type: object
      properties:
        id:
          type: integer
        title:
          type: string
        description:
          type: string
        categories:
          type: array
          items:
            type: string
        fragments:
          type: array
          items:
            $ref: '#/components/schemas/Fragment'
        updated_at:
          type: string
        share_count:
          type: integer
    Share:
      type: object
      properties:
        id:
          type: string
        snippetId:
          type: integer
        requiresAuth:
          type: boolean
        expiresIn:
          type: integer
    ApiKey:
      type: object
      properties:
        id:
          type: string
        name:
          type: string
        key:
          type: string
        created_at:
          type: string
paths:
  /api/auth/login:
    post:
      summary: Authenticate a user
      tags:
        - Authentication
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                username:
                  type: string
                password:
                  type: string
      responses:
        '200':
          description: Logged in
          content:
            application/json:
              schema:
                type: object
                properties:
                  token:
                    type: string
                  user:
                    type: object
                    properties:
                      id:
                        type: integer
                      username:
                        type: string
                      created_at:
                        type: string
        '401':
          description: Invalid credentials
  /api/auth/register:
    post:
      summary: Register a new user
      tags:
        - Authentication
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                username:
                  type: string
                password:
                  type: string
      responses:
        '200':
          description: Successfully registered
          content:
            application/json:
              schema:
                type: object
                properties:
                  token:
                    type: string
                  user:
                    type: object
                    properties:
                      id:
                        type: integer
                      username:
                        type: string
                      created_at:
                        type: string
        '400':
          description: Validation error
  /api/auth/config:
    get:
      summary: Get authentication configuration
      tags:
        - Authentication
      responses:
        '200':
          description: Auth config object
          content:
            application/json:
              schema:
                type: object
                properties:
                  authRequired:
                    type: boolean
                  allowNewAccounts:
                    type: boolean
                  hasUsers:
                    type: boolean
                  disableAccounts:
                    type: boolean
                  disableInternalAccounts:
                    type: boolean
  /api/auth/verify:
    get:
      summary: Verify a JWT token
      tags:
        - Authentication
      security:
        - JwtAuth: []
      responses:
        '200':
          description: Token is valid
          content:
            application/json:
              schema:
                type: object
                properties:
                  valid:
                    type: boolean
                  user:
                    type: object
                    properties:
                      id:
                        type: integer
                      username:
                        type: string
                      created_at:
                        type: string
        '401':
          description: Invalid token
  /api/auth/anonymous:
    post:
      summary: Create an anonymous session
      tags:
        - Authentication
      responses:
        '200':
          description: Anonymous session created
          content:
            application/json:
              schema:
                type: object
                properties:
                  token:
                    type: string
                  user:
                    type: object
                    properties:
                      id:
                        type: integer
                      username:
                        type: string
                      created_at:
                        type: string
        '403':
          description: Anonymous login not allowed
  /api/snippets:
    get:
      summary: Get all snippets for current user
      tags:
        - Snippets
      security:
        - JwtAuth: []
        - ApiKeyAuth: []
      responses:
        '200':
          description: List of snippets
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Snippet'
        '401':
          description: Authentication required
    post:
      summary: Create a new snippet
      tags:
        - Snippets
      security:
        - JwtAuth: []
        - ApiKeyAuth: []
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Snippet'
      responses:
        '201':
          description: Snippet created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Snippet'
        '401':
          description: Authentication required
  /api/snippets/{id}:
    get:
      summary: Get snippet by id
      tags:
        - Snippets
      security:
        - JwtAuth: []
        - ApiKeyAuth: []
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
      responses:
        '200':
          description: Snippet
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Snippet'
        '401':
          description: Authentication required
        '404':
          description: Snippet not found
    put:
      summary: Update snippet by id
      tags:
        - Snippets
      security:
        - JwtAuth: []
        - ApiKeyAuth: []
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Snippet'
      responses:
        '200':
          description: Updated snippet
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Snippet'
        '401':
          description: Authentication required
        '404':
          description: Snippet not found
    delete:
      summary: Delete snippet
      tags:
        - Snippets
      security:
        - JwtAuth: []
        - ApiKeyAuth: []
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
      responses:
        '200':
          description: Snippet deleted
          content:
            application/json:
              schema:
                type: object
                properties:
                  id:
                    type: integer
        '401':
          description: Authentication required
        '404':
          description: Snippet not found
  /api/public/snippets:
    get:
      summary: Get all public snippets
      tags:
        - Public
      responses:
        '200':
          description: List of public snippets
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Snippet'
        '500':
          description: Internal server error
  /api/public/snippets/{id}:
    get:
      summary: Get a public snippet
      tags:
        - Public
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
      responses:
        '200':
          description: A public snippet
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Snippet'
        '404':
          description: Snippet not found
        '500':
          description: Internal server error
  /api/share:
    post:
      summary: Create share link
      tags:
        - Sharing
      security:
        - JwtAuth: []
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Share'
      responses:
        '201':
          description: Share link created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Share'
        '400':
          description: Invalid snippet ID
        '401':
          description: Authentication required
        '403':
          description: Permission denied
  /api/share/{id}:
    get:
      summary: Retrieve a share
      tags:
        - Sharing
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: string
      responses:
        '200':
          description: Snippet with share data
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Snippet'
        '401':
          description: Authentication required for protected share
        '404':
          description: Share not found
        '410':
          description: Share has expired
    delete:
      summary: Delete a share
      tags:
        - Sharing
      security:
        - JwtAuth: []
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: string
      responses:
        '200':
          description: Share deleted
          content:
            application/json:
              schema:
                type: object
                properties:
                  success:
                    type: boolean
        '401':
          description: Authentication required
        '500':
          description: Failed to delete share
  /api/share/snippet/{snippetId}:
    get:
      summary: Get all shares for a snippet
      tags:
        - Sharing
      security:
        - JwtAuth: []
      parameters:
        - name: snippetId
          in: path
          required: true
          schema:
            type: integer
      responses:
        '200':
          description: List of shares for the snippet
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Share'
        '401':
          description: Authentication required
  /api/keys:
    get:
      summary: List all API keys for the authenticated user
      tags:
        - API Keys
      security:
        - JwtAuth: []
      responses:
        '200':
          description: List of API keys
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/ApiKey'
        '401':
          description: Authentication required
        '500':
          description: Failed to fetch API keys
    post:
      summary: Create a new API key
      tags:
        - API Keys
      security:
        - JwtAuth: []
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                name:
                  type: string
      responses:
        '201':
          description: API key created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ApiKey'
        '400':
          description: Name is required
        '401':
          description: Authentication required
        '500':
          description: Failed to create API key
  /api/keys/{id}:
    delete:
      summary: Delete an API key
      tags:
        - API Keys
      security:
        - JwtAuth: []
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: string
      responses:
        '200':
          description: API key deleted
          content:
            application/json:
              schema:
                type: object
                properties:
                  sucess:
                    type: boolean
        '401':
          description: Authentication required
        '404':
          description: API key not found
        '500':
          description: Failed to delete API key
  /api/auth/oidc/config:
    get:
      summary: Get OIDC configuration
      tags:
        - OIDC
      responses:
        '200':
          description: OIDC configuration
          content:
            application/json:
              schema:
                type: object
                properties:
                  enabled:
                    type: boolean
                  displayName:
                    type: string
        '500':
          description: Failed to fetch OIDC configuration
  /api/auth/oidc/auth:
    get:
      summary: Initiate OIDC authentication
      tags:
        - OIDC
      responses:
        '302':
          description: Redirect to OIDC provider
        '500':
          description: OIDC authentication error
  /api/auth/oidc/callback:
    get:
      summary: Handle OIDC callback
      tags:
        - OIDC
      parameters:
        - name: code
          in: query
          schema:
            type: string
        - name: state
          in: query
          schema:
            type: string
      responses:
        '302':
          description: Redirect with token
        '404':
          description: OIDC not enabled
        '500':
          description: OIDC callback error
  /api/embed/{shareId}:
    get:
      summary: Get a snippet for embedding
      tags:
        - Embed
      parameters:
        - name: shareId
          in: path
          required: true
          schema:
            type: string
        - name: showTitle
          in: query
          schema:
            type: boolean
        - name: showDescription
          in: query
          schema:
            type: boolean
        - name: fragmentIndex
          in: query
          schema:
            type: integer
      security:
        - JwtAuth: []
      responses:
        '200':
          description: Snippet data for embedding
          content:
            application/json:
              schema:
                type: object
                properties:
                  id:
                    type: integer
                  title:
                    type: string
                  description:
                    type: string
                  language:
                    type: string
                  fragments:
                    type: array
                    items:
                      $ref: '#/components/schemas/Fragment'
                  created_at:
                    type: string
                  updated_at:
                    type: string
        '401':
          description: Authentication required for protected share
        '404':
          description: Snippet not found
        '500':
          description: Internal server error
  /api/v1/snippets:
    get:
      summary: Get all snippets for current user (API)
      tags:
        - API Snippets
      security:
        - ApiKeyAuth: []
      responses:
        '200':
          description: List of snippets
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Snippet'
        '401':
          description: API key required
        '500':
          description: Internal server error
  /api/v1/snippets/push:
    post:
      summary: Create a new snippet with file uploads (API)
      tags:
        - API Snippets
      security:
        - ApiKeyAuth: []
      requestBody:
        required: true
        content:
          multipart/form-data:
            schema:
              type: object
              properties:
                title:
                  type: string
                description:
                  type: string
                is_public:
                  type: boolean
                categories:
                  type: string
                  description: Comma-separated list of categories
                files:
                  type: array
                  items:
                    type: string
                    format: binary
                fragments:
                  type: string
                  description: JSON array of fragments
      responses:
        '201':
          description: Snippet created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Snippet'
        '400':
          description: At least one fragment is required
        '401':
          description: API key required
        '500':
          description: Internal server error
  /api/v1/snippets/search:
    get:
      summary: Search snippets (API)
      tags:
        - API Snippets
      security:
        - ApiKeyAuth: []
      parameters:
        - name: q
          in: query
          required: false
          schema:
            type: string
          description: Search term to filter snippets
        - name: sort
          in: query
          required: false
          schema:
            type: string
            enum: [newest, oldest, alpha-asc, alpha-desc]
          description: Sort order for results
        - name: searchCode
          in: query
          required: false
          schema:
            type: boolean
          description: Whether to search within code fragments
      responses:
        '200':
          description: Filtered and sorted list of snippets
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Snippet'
        '401':
          description: API key required
        '500':
          description: Internal server error
  /api/v1/snippets/{id}:
    get:
      summary: Get snippet by id (API)
      tags:
        - API Snippets
      security:
        - ApiKeyAuth: []
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
      responses:
        '200':
          description: Snippet
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Snippet'
        '401':
          description: API key required
        '404':
          description: Snippet not found
        '500':
          description: Internal server error
    put:
      summary: Update snippet by id (API)
      tags:
        - API Snippets
      security:
        - ApiKeyAuth: []
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
      requestBody:
        required: true
        content:
          multipart/form-data:
            schema:
              type: object
              properties:
                title:
                  type: string
                description:
                  type: string
                is_public:
                  type: boolean
                categories:
                  type: string
                  description: Comma-separated list of categories
                files:
                  type: array
                  items:
                    type: string
                    format: binary
                fragments:
                  type: string
                  description: JSON array of fragments
      responses:
        '200':
          description: Updated snippet
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Snippet'
        '400':
          description: At least one fragment is required
        '401':
          description: API key required
        '404':
          description: Snippet not found
        '500':
          description: Internal server error
    delete:
      summary: Delete snippet (API)
      tags:
        - API Snippets
      security:
        - ApiKeyAuth: []
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
      responses:
        '200':
          description: Snippet deleted
          content:
            application/json:
              schema:
                type: object
                properties:
                  id:
                    type: integer
        '401':
          description: API key required
        '404':
          description: Snippet not found
        '500':
          description: Internal server error
````

## File: server/src/config/migrations/20241111-migration.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  const hasCodeColumn = db.prepare(`
    SELECT COUNT(*) as count 
    FROM pragma_table_info('snippets') 
    WHERE name = 'code'
  `).get().count > 0;

  return hasCodeColumn;
}

async function up_v1_4_0(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.4.0 - Migration not necessary');
    return;
  }
  
  Logger.debug('v1.4.0 - Starting migration to fragments...');
  
  db.pragma('foreign_keys = OFF');
  
  try {
    db.transaction(() => {
      db.exec(`
        CREATE TABLE IF NOT EXISTS fragments (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          snippet_id INTEGER NOT NULL,
          file_name TEXT NOT NULL,
          code TEXT NOT NULL,
          language TEXT NOT NULL,
          position INTEGER NOT NULL,
          FOREIGN KEY (snippet_id) REFERENCES snippets(id) ON DELETE CASCADE
        );

        CREATE INDEX IF NOT EXISTS idx_fragments_snippet_id ON fragments(snippet_id);
      
        CREATE TABLE IF NOT EXISTS shared_snippets (
          id TEXT PRIMARY KEY,
          snippet_id INTEGER NOT NULL,
          requires_auth BOOLEAN NOT NULL DEFAULT false,
          expires_at DATETIME,
          created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
          FOREIGN KEY (snippet_id) REFERENCES snippets(id) ON DELETE CASCADE
        );
      
        CREATE INDEX IF NOT EXISTS idx_shared_snippets_snippet_id ON shared_snippets(snippet_id);
      `);

      const snippets = db.prepare('SELECT id, code, language FROM snippets').all();
      const insertFragment = db.prepare(
        'INSERT INTO fragments (snippet_id, file_name, code, language, position) VALUES (?, ?, ?, ?, ?)'
      );

      for (const snippet of snippets) {
        insertFragment.run(snippet.id, 'main', snippet.code || '', snippet.language || 'plaintext', 0);
      }

      db.exec(`
        CREATE TABLE snippets_new (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT,
          updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );

        INSERT INTO snippets_new (id, title, description, updated_at)
        SELECT id, title, description, updated_at FROM snippets;

        DROP TABLE snippets;
        ALTER TABLE snippets_new RENAME TO snippets;
      `);
    })();

    Logger.debug('v1.4.0 - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.4.0 - Migration failed:', error);
    throw error;
  } finally {
    db.pragma('foreign_keys = ON');
  }
}

export { up_v1_4_0 };
````

## File: server/src/config/migrations/20241117-migration.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  try {
    const hasUsersTable = db.prepare(`
      SELECT name 
      FROM sqlite_master 
      WHERE type='table' AND name='users'
    `).get();

    if (!hasUsersTable) {
      Logger.debug('v1.5.0 - Users table does not exist, migration needed');
      return true;
    }

    const hasUserIdColumn = db.prepare(`
      SELECT COUNT(*) as count 
      FROM pragma_table_info('snippets') 
      WHERE name = 'user_id'
    `).get();

    if (hasUserIdColumn.count === 0) {
      Logger.debug('v1.5.0 - Snippets table missing user_id column, migration needed');
      return true;
    }

    const hasUserIdIndex = db.prepare(`
      SELECT COUNT(*) as count 
      FROM sqlite_master 
      WHERE type='index' AND name='idx_snippets_user_id'
    `).get();

    if (hasUserIdIndex.count === 0) {
      Logger.debug('v1.5.0 - Missing user_id index, migration needed');
      return true;
    }

    Logger.debug('v1.5.0 - Database schema is up to date, no migration needed');
    return false;
  } catch (error) {
    Logger.error('v1.5.0 - Error checking migration status:', error);
    throw error;
  }
}

async function up_v1_5_0(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.5.0 - Migration is not needed, database is up to date');
    return;
  }
  
  Logger.debug('v1.5.0 - Starting migration: Adding users table and updating snippets...');

  try {
    db.exec(`
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE NOT NULL,
        password_hash TEXT NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
      );

      CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
    `);

    db.exec(`
      ALTER TABLE snippets ADD COLUMN user_id INTEGER REFERENCES users(id);
      CREATE INDEX idx_snippets_user_id ON snippets(user_id);
    `);

    Logger.debug('v1.5.0 - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.5.0 - Migration failed:', error);
    throw error;
  }
}

async function up_v1_5_0_snippets(db, userId) {
  try {
    Logger.debug(`v1.5.0 - Migrating orphaned snippets to user ${userId}...`);
    
    const updateSnippets = db.prepare(`
      UPDATE snippets SET user_id = ? WHERE user_id IS NULL
    `);

    const result = updateSnippets.run(userId);
    Logger.debug(`v1.5.0 - Successfully migrated ${result.changes} snippets to user ${userId}`);
    
    return result.changes;
  } catch (error) {
    Logger.error('v1.5.0 - Snippet migration failed:', error);
    throw error;
  }
}

export { up_v1_5_0, up_v1_5_0_snippets };
````

## File: server/src/config/migrations/20241119-migration.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  try {
    const hasPublicColumn = db.prepare(`
      SELECT COUNT(*) as count 
      FROM pragma_table_info('snippets') 
      WHERE name = 'is_public'
    `).get();

    if (hasPublicColumn.count === 0) {
      Logger.debug('v1.5.0-public - Snippets table missing is_public column, migration needed');
      return true;
    }

    const hasPublicIndex = db.prepare(`
      SELECT COUNT(*) as count 
      FROM sqlite_master 
      WHERE type='index' AND name='idx_snippets_is_public'
    `).get();

    if (hasPublicIndex.count === 0) {
      Logger.debug('v1.5.0-public - Missing is_public index, migration needed');
      return true;
    }

    Logger.debug('v1.5.0-public - Database schema is up to date, no migration needed');
    return false;
  } catch (error) {
    Logger.error('v1.5.0-public - Error checking migration status:', error);
    throw error;
  }
}

async function up_v1_5_0_public(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.5.0-public - Migration is not needed, database is up to date');
    return;
  }
  
  Logger.debug('v1.5.0-public - Starting migration: Adding public snippets support...');

  try {
    db.exec(`
      ALTER TABLE snippets ADD COLUMN is_public BOOLEAN DEFAULT FALSE;
      CREATE INDEX idx_snippets_is_public ON snippets(is_public);
    `);

    Logger.debug('v1.5.0-public - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.5.0-public - Migration failed:', error);
    throw error;
  }
}

export { up_v1_5_0_public };
````

## File: server/src/config/migrations/20241120-migration.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  try {
    const hasOIDCColumns = db.prepare(`
      SELECT COUNT(*) as count 
      FROM pragma_table_info('users') 
      WHERE name IN ('oidc_id', 'oidc_provider', 'email', 'name')
    `).get();

    return hasOIDCColumns.count !== 4;
  } catch (error) {
    Logger.error('v1.5.0-oidc - Error checking migration status:', error);
    throw error;
  }
}

async function up_v1_5_0_oidc(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.5.0-oidc - Migration not needed');
    return;
  }
  
  Logger.debug('v1.5.0-oidc - Starting migration...');

  try {
    db.exec(`
      ALTER TABLE users ADD COLUMN oidc_id TEXT;
      ALTER TABLE users ADD COLUMN oidc_provider TEXT;
      ALTER TABLE users ADD COLUMN email TEXT;
      ALTER TABLE users ADD COLUMN name TEXT;
      
      CREATE UNIQUE INDEX IF NOT EXISTS idx_users_oidc 
      ON users(oidc_id, oidc_provider) 
      WHERE oidc_id IS NOT NULL AND oidc_provider IS NOT NULL;
    `);

    Logger.debug('v1.5.0-oidc - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.5.0-oidc - Migration failed:', error);
    throw error;
  }
}

export { up_v1_5_0_oidc };
````

## File: server/src/config/migrations/20241121-migration.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  try {
    const hasNormalizedColumn = db.prepare(`
      SELECT COUNT(*) as count 
      FROM pragma_table_info('users') 
      WHERE name = 'username_normalized'
    `).get();

    return hasNormalizedColumn.count === 0;
  } catch (error) {
    Logger.error('v1.5.0-usernames - Error checking migration status:', error);
    throw error;
  }
}

async function up_v1_5_0_usernames(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.5.0-usernames - Migration not needed');
    return;
  }
  
  Logger.debug('v1.5.0-usernames - Starting migration...');

  try {
    db.transaction(() => {
      db.exec(`
        ALTER TABLE users ADD COLUMN username_normalized TEXT;
        CREATE UNIQUE INDEX IF NOT EXISTS idx_users_username_normalized 
        ON users(username_normalized COLLATE NOCASE);
      `);

      const users = db.prepare('SELECT id, username FROM users').all();
      const updateStmt = db.prepare(
        'UPDATE users SET username_normalized = ? WHERE id = ?'
      );

      for (const user of users) {
        updateStmt.run(user.username.toLowerCase(), user.id);
      }
    })();

    Logger.debug('v1.5.0-usernames - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.5.0-usernames - Migration failed:', error);
    throw error;
  }
}

export { up_v1_5_0_usernames };
````

## File: server/src/config/migrations/20241122-migration.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  try {
    const tableExists = db.prepare(`
      SELECT COUNT(*) as count 
      FROM sqlite_master 
      WHERE type='table' AND name='api_keys'
    `).get();

    return tableExists.count === 0;
  } catch (error) {
    Logger.error('v1.5.1-api-keys - Error checking migration status:', error);
    throw error;
  }
}

function up_v1_5_1_api_keys(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.5.1-api-keys - Migration not needed');
    return;
  }

  Logger.debug('v1.5.1-api-keys - Starting migration...');

  try {
    db.transaction(() => {
      db.exec(`
        CREATE TABLE api_keys (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER NOT NULL,
          key TEXT NOT NULL UNIQUE,
          name TEXT NOT NULL,
          created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
          last_used_at DATETIME,
          is_active BOOLEAN DEFAULT TRUE,
          FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
        );

        CREATE INDEX idx_api_keys_user_id ON api_keys(user_id);
        CREATE INDEX idx_api_keys_key ON api_keys(key);
      `);
    })();

    Logger.debug('v1.5.1-api-keys - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.5.1-api-keys - Migration failed:', error);
    throw error;
  }
}

export { up_v1_5_1_api_keys };
````

## File: server/src/config/migrations/20250601-migration.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  try {
    const hasExpiryColumn = db
      .prepare(`
        SELECT COUNT(*) as count 
        FROM pragma_table_info('snippets') 
        WHERE name = 'expiry_date'
      `)
      .get();

    return hasExpiryColumn.count === 0;
  } catch (error) {
    Logger.error('v1.6.0-snippet-expiry - Error checking migration status:', error);
    throw error;
  }
}

async function up_v1_6_0_snippet_expiry(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.6.0-snippet-expiry - Migration not needed');
    return;
  }

  Logger.debug('v1.6.0-snippet-expiry - Starting migration...');

  try {
    db.exec(`
      ALTER TABLE snippets ADD COLUMN expiry_date DATETIME DEFAULT NULL;
    `);

    Logger.debug('v1.6.0-snippet-expiry - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.6.0-snippet-expiry - Migration failed:', error);
    throw error;
  }
}

export { up_v1_6_0_snippet_expiry };
````

## File: server/src/config/migrations/20250905-migration.js
````javascript
import Logger from "../../logger.js";

function needsMigration(db) {
  try {
    const hasPinnedColumn = db
      .prepare(
        `SELECT COUNT(*) as count FROM pragma_table_info('snippets') WHERE name = 'is_pinned'`
      )
      .get();
    const hasFavoriteColumn = db
      .prepare(
        `SELECT COUNT(*) as count FROM pragma_table_info('snippets') WHERE name = 'is_favorite'`
      )
      .get();
    return hasPinnedColumn.count === 0 || hasFavoriteColumn.count === 0;
  } catch (error) {
    Logger.error(
      "v1.7.0-snippet-pin-favorite - Error checking migration status:",
      error
    );
    throw error;
  }
}

async function up_v1_7_0_snippet_pin_favorite(db) {
  if (!needsMigration(db)) {
    Logger.debug("v1.7.0-snippet-pin-favorite - Migration not needed");
    return;
  }

  Logger.debug("v1.7.0-snippet-pin-favorite - Starting migration...");

  try {
    // Add is_pinned column if not exists
    const hasPinnedColumn = db
      .prepare(
        `SELECT COUNT(*) as count FROM pragma_table_info('snippets') WHERE name = 'is_pinned'`
      )
      .get();
    if (hasPinnedColumn.count === 0) {
      db.exec(`ALTER TABLE snippets ADD COLUMN is_pinned INTEGER DEFAULT 0;`);
      Logger.debug("v1.7.0-snippet-pin-favorite - Added is_pinned column");
    }

    // Add is_favorite column if not exists
    const hasFavoriteColumn = db
      .prepare(
        `SELECT COUNT(*) as count FROM pragma_table_info('snippets') WHERE name = 'is_favorite'`
      )
      .get();
    if (hasFavoriteColumn.count === 0) {
      db.exec(`ALTER TABLE snippets ADD COLUMN is_favorite INTEGER DEFAULT 0;`);
      Logger.debug("v1.7.0-snippet-pin-favorite - Added is_favorite column");
    }

    Logger.debug(
      "v1.7.0-snippet-pin-favorite - Migration completed successfully"
    );
  } catch (error) {
    Logger.error("v1.7.0-snippet-pin-favorite - Migration failed:", error);
    throw error;
  }
}

export { up_v1_7_0_snippet_pin_favorite };
````

## File: server/src/config/migrations/20260123-pagination.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  try {
    // Check if indexes already exist
    const indexCheck = db
      .prepare(`
        SELECT COUNT(*) as count
        FROM sqlite_master
        WHERE type = 'index' AND name = 'idx_fragments_language'
      `)
      .get();

    return indexCheck.count === 0;
  } catch (error) {
    Logger.error('v1.8.0-pagination - Error checking migration status:', error);
    throw error;
  }
}

export function up_v1_8_0_pagination(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.8.0-pagination - Migration not needed');
    return;
  }

  Logger.debug('v1.8.0-pagination - Starting migration...');

  try {
    db.exec(`
      -- Optimize language filtering
      CREATE INDEX IF NOT EXISTS idx_fragments_language ON fragments(language);

      -- Optimize category filtering
      CREATE INDEX IF NOT EXISTS idx_categories_name ON categories(name);

      -- Optimize common filter combinations
      CREATE INDEX IF NOT EXISTS idx_snippets_user_expiry ON snippets(user_id, expiry_date);
      CREATE INDEX IF NOT EXISTS idx_snippets_user_favorite ON snippets(user_id, is_favorite);
      CREATE INDEX IF NOT EXISTS idx_snippets_user_pinned ON snippets(user_id, is_pinned);

      -- Optimize sorting by date
      CREATE INDEX IF NOT EXISTS idx_snippets_updated_at ON snippets(updated_at DESC);
      CREATE INDEX IF NOT EXISTS idx_snippets_user_updated ON snippets(user_id, updated_at DESC);
    `);

    Logger.debug('v1.8.0-pagination - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.8.0-pagination - Migration failed:', error);
    throw error;
  }
}
````

## File: server/src/config/migrations/20260124-admin-fields.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  try {
    // Check if is_admin column already exists in users table
    const tableInfo = db.prepare('PRAGMA table_info(users)').all();
    const hasIsAdmin = tableInfo.some(col => col.name === 'is_admin');

    return !hasIsAdmin;
  } catch (error) {
    Logger.error('v1.9.0-admin-fields - Error checking migration status:', error);
    throw error;
  }
}

export function up_v1_9_0_admin_fields(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.9.0-admin-fields - Migration not needed');
    return;
  }

  Logger.debug('v1.9.0-admin-fields - Starting migration...');

  try {
    db.exec(`
      -- Add admin and activity tracking fields to users table
      ALTER TABLE users ADD COLUMN is_admin BOOLEAN DEFAULT FALSE;
      ALTER TABLE users ADD COLUMN last_login_at DATETIME;
      ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
    `);

    Logger.debug('v1.9.0-admin-fields - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.9.0-admin-fields - Migration failed:', error);
    throw error;
  }
}
````

## File: server/src/config/migrations/20260124-cascade-delete.js
````javascript
import Logger from '../../logger.js';

function needsMigration(db) {
  try {
    // Check the foreign key constraint on snippets table
    // SQLite doesn't have an easy way to check FK constraints directly
    // We'll check if a marker column exists that we add after the migration
    const tableInfo = db.prepare('PRAGMA table_info(snippets)').all();
    const hasMigrationMarker = tableInfo.some(col => col.name === '_cascade_migration_marker');

    // If the marker exists, migration is already done
    if (hasMigrationMarker) {
      // Remove the marker column if it exists
      return false;
    }

    // Check if the table was created fresh (has the correct schema)
    // Fresh installs won't need this migration
    const foreignKeys = db.prepare('PRAGMA foreign_key_list(snippets)').all();
    const userIdFK = foreignKeys.find(fk => fk.from === 'user_id');

    // If there's no FK at all, or if it exists, we need to check the schema
    // Since we can't directly check for ON DELETE CASCADE, we'll use the table SQL
    const tableSql = db.prepare(
      "SELECT sql FROM sqlite_master WHERE type='table' AND name='snippets'"
    ).get();

    // If the table was created with ON DELETE CASCADE, skip migration
    if (tableSql && tableSql.sql.includes('ON DELETE CASCADE')) {
      return false;
    }

    // Need migration
    return true;
  } catch (error) {
    Logger.error('v1.9.0-cascade-delete - Error checking migration status:', error);
    throw error;
  }
}

export function up_v1_9_0_cascade_delete(db) {
  if (!needsMigration(db)) {
    Logger.debug('v1.9.0-cascade-delete - Migration not needed');
    return;
  }

  Logger.debug('v1.9.0-cascade-delete - Starting migration...');

  try {
    // Disable foreign key constraints temporarily
    db.pragma('foreign_keys = OFF');

    db.exec(`
      BEGIN TRANSACTION;

      -- Create new snippets table with ON DELETE CASCADE
      CREATE TABLE snippets_new (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        expiry_date DATETIME DEFAULT NULL,
        user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
        is_public BOOLEAN DEFAULT FALSE,
        is_pinned BOOLEAN DEFAULT FALSE,
        is_favorite BOOLEAN DEFAULT FALSE
      );

      -- Copy all data from old table to new table
      INSERT INTO snippets_new (id, title, description, updated_at, expiry_date, user_id, is_public, is_pinned, is_favorite)
      SELECT id, title, description, updated_at, expiry_date, user_id, is_public, is_pinned, is_favorite
      FROM snippets;

      -- Drop old table
      DROP TABLE snippets;

      -- Rename new table to original name
      ALTER TABLE snippets_new RENAME TO snippets;

      -- Recreate indexes for snippets table
      CREATE INDEX IF NOT EXISTS idx_snippets_user_id ON snippets (user_id);
      CREATE INDEX IF NOT EXISTS idx_snippets_is_public ON snippets (is_public);
      CREATE INDEX IF NOT EXISTS idx_snippets_user_expiry ON snippets(user_id, expiry_date);
      CREATE INDEX IF NOT EXISTS idx_snippets_user_favorite ON snippets(user_id, is_favorite);
      CREATE INDEX IF NOT EXISTS idx_snippets_user_pinned ON snippets(user_id, is_pinned);
      CREATE INDEX IF NOT EXISTS idx_snippets_updated_at ON snippets(updated_at DESC);
      CREATE INDEX IF NOT EXISTS idx_snippets_user_updated ON snippets(user_id, updated_at DESC);

      COMMIT;
    `);

    // Re-enable foreign key constraints
    db.pragma('foreign_keys = ON');

    Logger.debug('v1.9.0-cascade-delete - Migration completed successfully');
  } catch (error) {
    Logger.error('v1.9.0-cascade-delete - Migration failed:', error);
    // Try to rollback
    try {
      db.exec('ROLLBACK;');
      db.pragma('foreign_keys = ON');
    } catch (rollbackError) {
      Logger.error('v1.9.0-cascade-delete - Rollback failed:', rollbackError);
    }
    throw error;
  }
}
````

## File: server/src/config/schema/init.sql
````sql
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    username_normalized TEXT,
    password_hash TEXT NOT NULL,
    oidc_id TEXT,
    oidc_provider TEXT,
    email TEXT,
    name TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_admin BOOLEAN DEFAULT FALSE,
    last_login_at DATETIME,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS snippets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    expiry_date DATETIME DEFAULT NULL,
    user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
    is_public BOOLEAN DEFAULT FALSE,
    is_pinned BOOLEAN DEFAULT FALSE,
    is_favorite BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    snippet_id INTEGER,
    name TEXT NOT NULL,
    FOREIGN KEY (snippet_id) REFERENCES snippets (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS fragments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    snippet_id INTEGER NOT NULL,
    file_name TEXT NOT NULL,
    code TEXT NOT NULL,
    language TEXT NOT NULL,
    position INTEGER NOT NULL,
    FOREIGN KEY (snippet_id) REFERENCES snippets (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS shared_snippets (
    id TEXT PRIMARY KEY,
    snippet_id INTEGER NOT NULL,
    requires_auth BOOLEAN NOT NULL DEFAULT false,
    expires_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (snippet_id) REFERENCES snippets (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS api_keys (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_used_at DATETIME,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_users_username ON users (username);

CREATE INDEX IF NOT EXISTS idx_snippets_user_id ON snippets (user_id);

CREATE INDEX IF NOT EXISTS idx_categories_snippet_id ON categories (snippet_id);

CREATE INDEX IF NOT EXISTS idx_fragments_snippet_id ON fragments (snippet_id);

CREATE INDEX IF NOT EXISTS idx_shared_snippets_snippet_id ON shared_snippets (snippet_id);

CREATE INDEX idx_snippets_is_public ON snippets (is_public);

CREATE UNIQUE INDEX IF NOT EXISTS idx_users_username_normalized ON users (
    username_normalized COLLATE NOCASE
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_users_oidc ON users (oidc_id, oidc_provider)
WHERE
    oidc_id IS NOT NULL
    AND oidc_provider IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_api_keys_user_id ON api_keys (user_id);

CREATE INDEX IF NOT EXISTS idx_api_keys_key ON api_keys (key);
````

## File: server/src/config/database.js
````javascript
import Database from "better-sqlite3";
import { dirname, join } from "path";
import fs from "fs";
import { up_v1_4_0 } from "./migrations/20241111-migration.js";
import { up_v1_5_0 } from "./migrations/20241117-migration.js";
import Logger from "../logger.js";
import { up_v1_5_0_public } from "./migrations/20241119-migration.js";
import { up_v1_5_0_oidc } from "./migrations/20241120-migration.js";
import { fileURLToPath } from "url";
import { up_v1_5_0_usernames } from "./migrations/20241121-migration.js";
import { up_v1_5_1_api_keys } from "./migrations/20241122-migration.js";
import { up_v1_6_0_snippet_expiry } from "./migrations/20250601-migration.js";
import { up_v1_7_0_snippet_pin_favorite } from "./migrations/20250905-migration.js";
import { up_v1_8_0_pagination } from "./migrations/20260123-pagination.js";
import { up_v1_9_0_admin_fields } from "./migrations/20260124-admin-fields.js";
import { up_v1_9_0_cascade_delete } from "./migrations/20260124-cascade-delete.js";
import path from "path";
let db = null;
let checkpointInterval = null;

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

function getDatabasePath() {
  const dbPath = join(__dirname, "../../../data/snippets");
  if (!fs.existsSync(dbPath)) {
    fs.mkdirSync(dbPath, { recursive: true });
  }
  return join(dbPath, "snippets.db");
}

function checkpointDatabase() {
  if (!db) return;

  try {
    Logger.debug("Starting database checkpoint...");
    const start = Date.now();

    db.pragma("wal_checkpoint(PASSIVE)");

    const duration = Date.now() - start;
    Logger.debug(`Database checkpoint completed in ${duration}ms`);
  } catch (error) {
    Logger.error("Error during database checkpoint:", error);
  }
}

function startCheckpointInterval() {
  const CHECKPOINT_INTERVAL = 5 * 60 * 1000;

  if (checkpointInterval) {
    clearInterval(checkpointInterval);
  }

  checkpointInterval = setInterval(checkpointDatabase, CHECKPOINT_INTERVAL);
}

function stopCheckpointInterval() {
  if (checkpointInterval) {
    clearInterval(checkpointInterval);
    checkpointInterval = null;
  }
}

function backupDatabase(dbPath) {
  const baseBackupPath = `${dbPath}.backup`;
  checkpointDatabase();

  try {
    if (fs.existsSync(dbPath)) {
      const dbBackupPath = `${baseBackupPath}.db`;
      fs.copyFileSync(dbPath, dbBackupPath);
      Logger.debug(`Database backed up to: ${dbBackupPath}`);
    } else {
      Logger.error(`Database file not found: ${dbPath}`);
      return false;
    }
    return true;
  } catch (error) {
    Logger.error("Failed to create database backup:", error);
    throw error;
  }
}

function createInitialSchema(db) {
  const initSQL = fs.readFileSync(
    path.join(__dirname, "schema/init.sql"),
    "utf8"
  );
  Logger.debug("Init SQL Path:", path.join(__dirname, "schema/init.sql"));
  db.exec(initSQL);
  Logger.debug("✅ Initial schema executed");
}

function initializeDatabase() {
  try {
    const dbPath = getDatabasePath();
    Logger.debug(`Initializing SQLite database at: ${dbPath}`);

    const dbExists = fs.existsSync(dbPath);

    db = new Database(dbPath, {
      verbose: Logger.debug,
      fileMustExist: false,
    });

    db.pragma("foreign_keys = ON");
    db.pragma("journal_mode = WAL");

    backupDatabase(dbPath);

    if (!dbExists) {
      Logger.debug("Creating new database with initial schema...");
      createInitialSchema(db);
    } else {
      Logger.debug("Database file exists, checking for needed migrations...");
      up_v1_4_0(db);
      up_v1_5_0(db);
      up_v1_5_0_public(db);
      up_v1_5_0_oidc(db);
      up_v1_5_0_usernames(db);
      up_v1_5_1_api_keys(db);
      up_v1_6_0_snippet_expiry(db);
      up_v1_7_0_snippet_pin_favorite(db);
      up_v1_8_0_pagination(db);
      up_v1_9_0_admin_fields(db);
      up_v1_9_0_cascade_delete(db);
      Logger.debug("All migrations applied successfully");
    }

    startCheckpointInterval();

    Logger.debug("Database initialization completed successfully");
    return db;
  } catch (error) {
    Logger.error("Database initialization error:", error);
    throw error;
  }
}

function getDb() {
  if (!db) {
    throw new Error(
      "Database not initialized. Call initializeDatabase() first."
    );
  }
  return db;
}

function shutdownDatabase() {
  if (db) {
    try {
      Logger.debug("Performing final database checkpoint...");
      db.pragma("wal_checkpoint(TRUNCATE)");

      stopCheckpointInterval();
      db.close();
      db = null;

      Logger.debug("Database shutdown completed successfully");
    } catch (error) {
      Logger.error("Error during database shutdown:", error);
      throw error;
    }
  }
}

export { initializeDatabase, getDb, shutdownDatabase, checkpointDatabase };
````

## File: server/src/middleware/adminAuth.js
````javascript
import Logger from '../logger.js';

const adminUsernames = (process.env.ADMIN_USERNAMES || '')
  .split(',')
  .map(u => u.trim().toLowerCase())
  .filter(Boolean);

Logger.debug('Admin usernames configured:', adminUsernames.length > 0 ? adminUsernames : 'none');

export const requireAdmin = (req, res, next) => {
  if (!req.user) {
    return res.status(401).json({ message: 'Authentication required' });
  }

  const isAdmin = adminUsernames.includes(req.user.username.toLowerCase());
  if (!isAdmin) {
    Logger.debug(`Admin access denied for user: ${req.user.username}`);
    return res.status(403).json({ message: 'Admin access required' });
  }

  Logger.debug(`Admin access granted for user: ${req.user.username}`);
  next();
};

export const isAdmin = (username) => {
  if (!username) return false;
  return adminUsernames.includes(username.toLowerCase());
};
````

## File: server/src/middleware/apiKeyAuth.js
````javascript
import Logger from '../logger.js';
import { validateApiKey } from '../repositories/apiKeyRepository.js';

export function authenticateApiKey(req, res, next) {
  const apiKey = req.headers['x-api-key'];
  
  if (!apiKey) {
    return next();
  }
  
  try {
    const result = validateApiKey(apiKey);
    
    if (result) {
      req.user = { id: result.userId };
      req.apiKey = { id: result.keyId };
      Logger.debug(`Request authenticated via API key ${result.keyId}`);
      return next();
    }
    
    // Invalid API key
    Logger.info('Invalid API key provided');
    res.status(401).json({ error: 'Invalid API key' });
  } catch (error) {
    Logger.error('Error validating API key:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
}
````

## File: server/src/middleware/auth.js
````javascript
import fs from 'fs';
import jwt from 'jsonwebtoken';
import crypto from 'crypto';
import Logger from '../logger.js';
import userRepository from '../repositories/userRepository.js';

function getJwtSecret() {
  if (process.env.JWT_SECRET_FILE) {
    try {
      return fs.readFileSync(process.env.JWT_SECRET_FILE, 'utf8').trim();
    } catch (error) {
      console.error('Error reading JWT secret file:', error);
      process.exit(1);
    }
  }
  return process.env.JWT_SECRET || 'your-secret-key';
}

const JWT_SECRET = getJwtSecret();
const ALLOW_NEW_ACCOUNTS = process.env.ALLOW_NEW_ACCOUNTS === 'true';
const TOKEN_EXPIRY = process.env.TOKEN_EXPIRY || '24h';
const DISABLE_ACCOUNTS = process.env.DISABLE_ACCOUNTS === 'true';
const DISABLE_INTERNAL_ACCOUNTS = process.env.DISABLE_INTERNAL_ACCOUNTS === 'true';
const ALLOW_PASSWORD_CHANGES = process.env.ALLOW_PASSWORD_CHANGES === 'true';

function generateAnonymousUsername() {
  return `anon-${crypto.randomBytes(8).toString('hex')}`;
}

async function getOrCreateAnonymousUser() {
  try {
    let existingUser = await userRepository.findById(0);
    
    if (existingUser) {
      return existingUser;
    }

    return await userRepository.createAnonymousUser(generateAnonymousUsername());
  } catch (error) {
    Logger.error('Error getting/creating anonymous user:', error);
    throw error;
  }
}

const authenticateToken = async (req, res, next) => {
  if (DISABLE_ACCOUNTS) {
    try {
      const anonymousUser = await getOrCreateAnonymousUser();
      req.user = anonymousUser;
      return next();
    } catch (error) {
      Logger.error('Error in anonymous authentication:', error);
      return res.status(500).json({ error: 'Internal server error' });
    }
  }

  // Try to get token from header first (for API calls)
  const authHeader = req.headers['bytestashauth'];
  let token = authHeader && authHeader.split(' ')[1];

  // If no header token, try to get from cookie (for browser access)
  if (!token && req.cookies) {
    token = req.cookies.bytestash_token;
  }

  if (!token) {
    return res.status(401).json({ error: 'Authentication required' });
  }

  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) {
      return res.status(403).json({ error: 'Invalid token' });
    }
    req.user = user;
    next();
  });
};

export { 
  authenticateToken, 
  JWT_SECRET, 
  TOKEN_EXPIRY, 
  ALLOW_NEW_ACCOUNTS, 
  DISABLE_ACCOUNTS,
  DISABLE_INTERNAL_ACCOUNTS,
  ALLOW_PASSWORD_CHANGES,
  getOrCreateAnonymousUser,
};
````

## File: server/src/oidc/oidcConfig.js
````javascript
import * as client from 'openid-client';
import Logger from '../logger.js';
import { URL } from 'url';
import jwt from 'jsonwebtoken';
import { JWT_SECRET } from '../middleware/auth.js';
class OIDCConfig {
  static instance = null;
  static loggedIn = false;
  #stateMap = new Map();

  static async getInstance() {
    if (!OIDCConfig.instance) {
      OIDCConfig.instance = new OIDCConfig();
      await OIDCConfig.instance.initialize();
    }
    return OIDCConfig.instance;
  }

  getCallbackUrl(baseUrl) {
    // Ensure baseUrl doesn't end with a slash
    const normalizedBaseUrl = baseUrl.endsWith('/') ? baseUrl.slice(0, -1) : baseUrl;
    return `${normalizedBaseUrl}/api/auth/oidc/callback`;
  }

  getCallbackLogoutUrl(baseUrl) {
    // Ensure baseUrl doesn't end with a slash
    const normalizedBaseUrl = baseUrl.endsWith('/') ? baseUrl.slice(0, -1) : baseUrl;
    return `${normalizedBaseUrl}/auth/logout_callback`;
  }

  async initialize() {
    if (process.env.OIDC_ENABLED !== 'true') {
      Logger.debug('OIDC is disabled');
      return;
    }

    try {
      const discoveryUrl = process.env.OIDC_ISSUER_URL;
      if (!discoveryUrl) {
        throw new Error('OIDC_ISSUER_URL environment variable is not set');
      }

      Logger.debug(`Discovering OIDC configuration from ${discoveryUrl}`);

      try {
        const issuerUrl = new URL(discoveryUrl);

        this.config = await client.discovery(
          issuerUrl,
          process.env.OIDC_CLIENT_ID,
          process.env.OIDC_CLIENT_SECRET
        );

        Logger.debug('Discovery successful');
        const metadata = this.config.serverMetadata();
        Logger.debug('Discovered issuer:', metadata.issuer);

        this.startStateCleanup();

      } catch (discoveryError) {
        Logger.error('Discovery request failed:', {
          error: discoveryError.message,
          code: discoveryError.code,
          expected: discoveryError?.cause?.expected,
          actual: discoveryError?.cause?.body?.issuer,
          attribute: discoveryError?.cause?.attribute
        });
        throw discoveryError;
      }

      Logger.debug('OIDC client configured successfully');
    } catch (error) {
      Logger.error('Failed to initialize OIDC:', error);
      throw error;
    }
  }

  startStateCleanup() {
    setInterval(() => {
      const now = Date.now();
      for (const [state, data] of this.#stateMap) {
        if (now - data.timestamp > 5 * 60 * 1000) {
          this.#stateMap.delete(state);
        }
      }
    }, 5 * 60 * 1000);
  }

  async generateAuthParameters() {
    const code_verifier = client.randomPKCECodeVerifier();
    const code_challenge = await client.calculatePKCECodeChallenge(code_verifier);
    const state = client.randomState();
    const nonce = client.randomNonce();

    this.#stateMap.set(state, {
      code_verifier,
      nonce,
      timestamp: Date.now()
    });

    return {
      code_challenge,
      state,
      nonce
    };
  }

  async getAuthorizationUrl(baseUrl, scope = 'openid profile email') {
    const callback_url = this.getCallbackUrl(baseUrl);
    const { code_challenge, state, nonce } = await this.generateAuthParameters();

    const parameters = {
      redirect_uri: callback_url,
      scope,
      state,
      nonce,
      response_type: 'code',
      client_id: process.env.OIDC_CLIENT_ID,
      code_challenge,
      code_challenge_method: 'S256'
    };

    if (!this.config.serverMetadata().supportsPKCE) {
      delete parameters.code_challenge;
      delete parameters.code_challenge_method;
    }

    return client.buildAuthorizationUrl(this.config, parameters);
  }

  async getLogoutUrl(baseUrl, id_token) {
    const metadata = this.config.serverMetadata();

    if (!metadata.end_session_endpoint) {
      Logger.debug('Provider does not support end_session_endpoint, using local-only logout');
      return null;
    }

    const callback_url = this.getCallbackLogoutUrl(baseUrl);
    const decoded = jwt.verify(id_token, JWT_SECRET);

    if (!decoded.id_token) {
      Logger.debug('No id_token found in JWT, using local-only logout');
      return null;
    }
    Logger.debug(callback_url);

    const parameters = {
      post_logout_redirect_uri: callback_url,
      client_id: process.env.OIDC_CLIENT_ID,
      state: client.randomState(),
      id_token_hint: decoded.id_token
    };

    return client.buildEndSessionUrl(this.config, parameters);
  }

  async handleCallback(currentUrl, callbackUrl) {
    Logger.debug('Handling callback with:', { currentUrl, callbackUrl });

    const urlParams = new URL(currentUrl).searchParams;
    const state = urlParams.get('state');

    if (!state || !this.#stateMap.has(state)) {
      throw new Error('Invalid or expired state parameter');
    }

    const { code_verifier, nonce } = this.#stateMap.get(state);
    this.#stateMap.delete(state);

    const checks = {
      pkceCodeVerifier: code_verifier,
      expectedState: state,
      expectedNonce: nonce,
      idTokenExpected: true,
      redirect_uri: callbackUrl
    };

    try {
      const tokens = await client.authorizationCodeGrant(
        this.config,
        new URL(currentUrl),
        checks
      );

      if (!tokens.access_token) {
        throw new Error('No access token received');
      }

      const claims = tokens.claims();

      Logger.debug('Token claims received:', {
        sub: claims.sub,
        scope: tokens.scope,
        token_type: tokens.token_type
      });

      try {
        const userInfo = await client.fetchUserInfo(
          this.config,
          tokens.access_token,
          claims.sub,
          {
            headers: {
              'bytestashauth': `Bearer ${tokens.access_token}`,
              'Accept': 'application/json'
            }
          }
        );

        return {
          tokens,
          userInfo
        };

      } catch (userInfoError) {
        Logger.error('Failed to fetch user info:', {
          error: userInfoError.message,
          code: userInfoError.code,
          status: userInfoError?.cause?.state?.status,
          statusText: userInfoError?.cause?.state?.statusText
        });

        return {
          tokens,
          userInfo: {
            sub: claims.sub,
            email: claims.email,
            name: claims.name,
            preferred_username: claims.preferred_username
          }
        };
      }

    } catch (error) {
      Logger.error('Token exchange failed:', {
        error: error.message,
        code: error.code,
        state: state
      });
      throw error;
    }
  }

  getDisplayName() {
    return process.env.OIDC_DISPLAY_NAME || 'Single Sign-On';
  }

  isEnabled() {
    return process.env.OIDC_ENABLED === 'true';
  }

  getScopes() {
    return process.env.OIDC_SCOPES?.split(' ') || ['openid', 'profile', 'email'];
  }

  getConfig() {
    return {
      enabled: this.isEnabled(),
      logged_in: this.loggedIn,
      displayName: this.getDisplayName(),
    };
  }
}

export { OIDCConfig };
````

## File: server/src/repositories/adminRepository.js
````javascript
import { getDb } from '../config/database.js';
import Logger from '../logger.js';

class AdminRepository {
  constructor() {
    this.statements = {};
  }

  #initializeStatements() {
    if (Object.keys(this.statements).length > 0) return;

    const db = getDb();

    // Dashboard stats
    this.statements.getTotalUsers = db.prepare(`
      SELECT COUNT(*) as count FROM users WHERE id != 0
    `);

    this.statements.getInternalUsers = db.prepare(`
      SELECT COUNT(*) as count FROM users WHERE id != 0 AND oidc_id IS NULL
    `);

    this.statements.getOIDCUsers = db.prepare(`
      SELECT COUNT(*) as count FROM users WHERE id != 0 AND oidc_id IS NOT NULL
    `);

    this.statements.getTotalSnippets = db.prepare(`
      SELECT COUNT(*) as count FROM snippets
    `);

    this.statements.getPublicSnippets = db.prepare(`
      SELECT COUNT(*) as count FROM snippets WHERE is_public = 1
    `);

    this.statements.getActiveApiKeys = db.prepare(`
      SELECT COUNT(*) as count FROM api_keys WHERE is_active = 1
    `);

    this.statements.getTotalShares = db.prepare(`
      SELECT COUNT(*) as count FROM shared_snippets
    `);

    // User management - get user details
    this.statements.getUserDetails = db.prepare(`
      SELECT
        id, username, email, name, created_at,
        oidc_id, oidc_provider, is_admin, is_active, last_login_at
      FROM users
      WHERE id = ?
    `);

    // Delete user
    this.statements.deleteUser = db.prepare(`
      DELETE FROM users WHERE id = ? AND id != 0
    `);

    // Toggle user active status
    this.statements.toggleUserActive = db.prepare(`
      UPDATE users
      SET is_active = NOT is_active
      WHERE id = ? AND id != 0
    `);

    // Get user snippet count
    this.statements.getUserSnippetCount = db.prepare(`
      SELECT COUNT(*) as count FROM snippets WHERE user_id = ?
    `);

    // Get user API key count
    this.statements.getUserApiKeyCount = db.prepare(`
      SELECT COUNT(*) as count FROM api_keys WHERE user_id = ?
    `);

    // Delete snippet permanently
    this.statements.deleteSnippet = db.prepare(`
      DELETE FROM snippets WHERE id = ?
    `);

    // Change snippet owner
    this.statements.changeSnippetOwner = db.prepare(`
      UPDATE snippets SET user_id = ? WHERE id = ?
    `);

    // Toggle snippet public status
    this.statements.toggleSnippetPublic = db.prepare(`
      UPDATE snippets SET is_public = NOT is_public WHERE id = ?
    `);

    // Delete API key
    this.statements.deleteApiKey = db.prepare(`
      DELETE FROM api_keys WHERE id = ?
    `);

    // Delete share
    this.statements.deleteShare = db.prepare(`
      DELETE FROM shared_snippets WHERE id = ?
    `);
  }

  async getStats() {
    this.#initializeStatements();

    try {
      const totalUsers = this.statements.getTotalUsers.get().count;
      const internalUsers = this.statements.getInternalUsers.get().count;
      const oidcUsers = this.statements.getOIDCUsers.get().count;
      const totalSnippets = this.statements.getTotalSnippets.get().count;
      const publicSnippets = this.statements.getPublicSnippets.get().count;
      const activeApiKeys = this.statements.getActiveApiKeys.get().count;
      const totalShares = this.statements.getTotalShares.get().count;

      return {
        users: {
          total: totalUsers,
          internal: internalUsers,
          oidc: oidcUsers
        },
        snippets: {
          total: totalSnippets,
          public: publicSnippets,
          private: totalSnippets - publicSnippets
        },
        apiKeys: {
          active: activeApiKeys
        },
        shares: {
          total: totalShares
        }
      };
    } catch (error) {
      Logger.error('Error getting admin stats:', error);
      throw error;
    }
  }

  async getAllUsers({ offset = 0, limit = 50, search = '', authType = '', isActive = '' }) {
    this.#initializeStatements();

    try {
      const db = getDb();
      let query = `
        SELECT
          u.id, u.username, u.email, u.name, u.created_at, u.last_login_at,
          u.oidc_id, u.oidc_provider, u.is_admin, u.is_active,
          (SELECT COUNT(*) FROM snippets WHERE user_id = u.id) as snippet_count,
          (SELECT COUNT(*) FROM api_keys WHERE user_id = u.id) as api_key_count
        FROM users u
        WHERE u.id != 0
      `;

      const params = [];

      if (search) {
        query += ` AND (u.username LIKE ? OR u.email LIKE ? OR u.name LIKE ?)`;
        const searchPattern = `%${search}%`;
        params.push(searchPattern, searchPattern, searchPattern);
      }

      if (authType === 'internal') {
        query += ` AND u.oidc_id IS NULL`;
      } else if (authType === 'oidc') {
        query += ` AND u.oidc_id IS NOT NULL`;
      }

      if (isActive !== '') {
        query += ` AND u.is_active = ?`;
        params.push(isActive === 'true' ? 1 : 0);
      }

      query += ` ORDER BY u.created_at DESC LIMIT ? OFFSET ?`;
      params.push(limit, offset);

      const users = db.prepare(query).all(...params);

      let countQuery = `SELECT COUNT(*) as count FROM users u WHERE u.id != 0`;
      const countParams = [];

      if (search) {
        countQuery += ` AND (u.username LIKE ? OR u.email LIKE ? OR u.name LIKE ?)`;
        const searchPattern = `%${search}%`;
        countParams.push(searchPattern, searchPattern, searchPattern);
      }

      if (authType === 'internal') {
        countQuery += ` AND u.oidc_id IS NULL`;
      } else if (authType === 'oidc') {
        countQuery += ` AND u.oidc_id IS NOT NULL`;
      }

      if (isActive !== '') {
        countQuery += ` AND u.is_active = ?`;
        countParams.push(isActive === 'true' ? 1 : 0);
      }

      const total = db.prepare(countQuery).get(...countParams).count;

      return { users, total };
    } catch (error) {
      Logger.error('Error getting all users:', error);
      throw error;
    }
  }

  async getUserDetails(userId) {
    this.#initializeStatements();

    try {
      const user = this.statements.getUserDetails.get(userId);
      if (!user) return null;

      const snippetCount = this.statements.getUserSnippetCount.get(userId).count;
      const apiKeyCount = this.statements.getUserApiKeyCount.get(userId).count;

      return {
        ...user,
        snippet_count: snippetCount,
        api_key_count: apiKeyCount
      };
    } catch (error) {
      Logger.error('Error getting user details:', error);
      throw error;
    }
  }

  async deleteUser(userId) {
    this.#initializeStatements();

    try {
      const result = this.statements.deleteUser.run(userId);
      return result.changes > 0;
    } catch (error) {
      Logger.error('Error deleting user:', error);
      throw error;
    }
  }

  async toggleUserActive(userId) {
    this.#initializeStatements();

    try {
      const result = this.statements.toggleUserActive.run(userId);
      if (result.changes === 0) {
        throw new Error('User not found or cannot be modified');
      }
      return this.getUserDetails(userId);
    } catch (error) {
      Logger.error('Error toggling user active status:', error);
      throw error;
    }
  }

  async getAllSnippets({ offset = 0, limit = 50, search = '', userId = '', isPublic = '', language = '', category = '' }) {
    this.#initializeStatements();

    try {
      const db = getDb();
      let query = `
        SELECT
          s.id, s.title, s.description, s.updated_at, s.is_public,
          s.user_id, u.username,
          (SELECT COUNT(*) FROM fragments WHERE snippet_id = s.id) as fragment_count
        FROM snippets s
        LEFT JOIN users u ON s.user_id = u.id
        WHERE 1=1
      `;

      const params = [];

      if (search) {
        query += ` AND (s.title LIKE ? OR s.description LIKE ?)`;
        const searchPattern = `%${search}%`;
        params.push(searchPattern, searchPattern);
      }

      if (userId) {
        query += ` AND s.user_id = ?`;
        params.push(userId);
      }

      if (isPublic !== '') {
        query += ` AND s.is_public = ?`;
        params.push(isPublic === 'true' ? 1 : 0);
      }

      if (language) {
        query += ` AND s.id IN (SELECT snippet_id FROM fragments WHERE language = ?)`;
        params.push(language);
      }

      if (category) {
        query += ` AND s.id IN (SELECT snippet_id FROM categories WHERE name = ?)`;
        params.push(category);
      }

      query += ` ORDER BY s.updated_at DESC LIMIT ? OFFSET ?`;
      params.push(limit, offset);

      const snippets = db.prepare(query).all(...params);

      let countQuery = `
        SELECT COUNT(*) as count FROM snippets s
        WHERE 1=1
      `;
      const countParams = [];

      if (search) {
        countQuery += ` AND (s.title LIKE ? OR s.description LIKE ?)`;
        const searchPattern = `%${search}%`;
        countParams.push(searchPattern, searchPattern);
      }

      if (userId) {
        countQuery += ` AND s.user_id = ?`;
        countParams.push(userId);
      }

      if (isPublic !== '') {
        countQuery += ` AND s.is_public = ?`;
        countParams.push(isPublic === 'true' ? 1 : 0);
      }

      if (language) {
        countQuery += ` AND s.id IN (SELECT snippet_id FROM fragments WHERE language = ?)`;
        countParams.push(language);
      }

      if (category) {
        countQuery += ` AND s.id IN (SELECT snippet_id FROM categories WHERE name = ?)`;
        countParams.push(category);
      }

      const total = db.prepare(countQuery).get(...countParams).count;

      return { snippets, total };
    } catch (error) {
      Logger.error('Error getting all snippets:', error);
      throw error;
    }
  }

  async deleteSnippetPermanently(snippetId) {
    this.#initializeStatements();

    try {
      const result = this.statements.deleteSnippet.run(snippetId);
      return result.changes > 0;
    } catch (error) {
      Logger.error('Error deleting snippet:', error);
      throw error;
    }
  }

  async changeSnippetOwner(snippetId, newUserId) {
    this.#initializeStatements();

    try {
      const result = this.statements.changeSnippetOwner.run(newUserId, snippetId);
      if (result.changes === 0) {
        throw new Error('Snippet not found');
      }
      return true;
    } catch (error) {
      Logger.error('Error changing snippet owner:', error);
      throw error;
    }
  }

  async toggleSnippetPublic(snippetId) {
    this.#initializeStatements();

    try {
      const result = this.statements.toggleSnippetPublic.run(snippetId);
      if (result.changes === 0) {
        throw new Error('Snippet not found');
      }
      return true;
    } catch (error) {
      Logger.error('Error toggling snippet public status:', error);
      throw error;
    }
  }

  async getAllApiKeys({ offset = 0, limit = 50, userId = '' }) {
    this.#initializeStatements();

    try {
      const db = getDb();
      let query = `
        SELECT
          ak.id, ak.name, ak.created_at, ak.last_used_at, ak.is_active,
          ak.user_id, u.username
        FROM api_keys ak
        LEFT JOIN users u ON ak.user_id = u.id
        WHERE 1=1
      `;

      const params = [];

      if (userId) {
        query += ` AND ak.user_id = ?`;
        params.push(userId);
      }

      query += ` ORDER BY ak.created_at DESC LIMIT ? OFFSET ?`;
      params.push(limit, offset);

      const apiKeys = db.prepare(query).all(...params);

      let countQuery = `SELECT COUNT(*) as count FROM api_keys WHERE 1=1`;
      const countParams = [];

      if (userId) {
        countQuery += ` AND user_id = ?`;
        countParams.push(userId);
      }

      const total = db.prepare(countQuery).get(...countParams).count;

      return { apiKeys, total };
    } catch (error) {
      Logger.error('Error getting all API keys:', error);
      throw error;
    }
  }

  async deleteApiKey(keyId) {
    this.#initializeStatements();

    try {
      const result = this.statements.deleteApiKey.run(keyId);
      return result.changes > 0;
    } catch (error) {
      Logger.error('Error deleting API key:', error);
      throw error;
    }
  }

  async getAllShares({ offset = 0, limit = 50, userId = '', requiresAuth = '' }) {
    this.#initializeStatements();

    try {
      const db = getDb();
      let query = `
        SELECT
          ss.id, ss.requires_auth, ss.expires_at, ss.created_at,
          ss.snippet_id, s.title as snippet_title,
          s.user_id, u.username
        FROM shared_snippets ss
        LEFT JOIN snippets s ON ss.snippet_id = s.id
        LEFT JOIN users u ON s.user_id = u.id
        WHERE 1=1
      `;

      const params = [];

      if (userId) {
        query += ` AND s.user_id = ?`;
        params.push(userId);
      }

      if (requiresAuth !== '') {
        query += ` AND ss.requires_auth = ?`;
        params.push(requiresAuth === 'true' ? 1 : 0);
      }

      query += ` ORDER BY ss.created_at DESC LIMIT ? OFFSET ?`;
      params.push(limit, offset);

      const shares = db.prepare(query).all(...params);

      let countQuery = `
        SELECT COUNT(*) as count
        FROM shared_snippets ss
        LEFT JOIN snippets s ON ss.snippet_id = s.id
        WHERE 1=1
      `;
      const countParams = [];

      if (userId) {
        countQuery += ` AND s.user_id = ?`;
        countParams.push(userId);
      }

      if (requiresAuth !== '') {
        countQuery += ` AND ss.requires_auth = ?`;
        countParams.push(requiresAuth === 'true' ? 1 : 0);
      }

      const total = db.prepare(countQuery).get(...countParams).count;

      return { shares, total };
    } catch (error) {
      Logger.error('Error getting all shares:', error);
      throw error;
    }
  }

  async deleteShare(shareId) {
    this.#initializeStatements();

    try {
      const result = this.statements.deleteShare.run(shareId);
      return result.changes > 0;
    } catch (error) {
      Logger.error('Error deleting share:', error);
      throw error;
    }
  }

  async scanSnippetsForOffensiveContent(badWordsChecker) {
    this.#initializeStatements();

    try {
      const db = getDb();

      // Get all snippets with their fragments
      const query = `
        SELECT
          s.id, s.title, s.description, s.updated_at, s.is_public,
          s.user_id, u.username,
          GROUP_CONCAT(f.code || ' ' || f.file_name, '|||') as fragments_content
        FROM snippets s
        LEFT JOIN users u ON s.user_id = u.id
        LEFT JOIN fragments f ON s.id = f.snippet_id
        GROUP BY s.id
        ORDER BY s.updated_at DESC
      `;

      const snippets = db.prepare(query).all();
      const flaggedSnippets = [];

      for (const snippet of snippets) {
        const textToCheck = [
          snippet.title || '',
          snippet.description || '',
          snippet.fragments_content || ''
        ].join(' ');

        const foundWords = badWordsChecker.findBadWords(textToCheck);

        if (foundWords.length > 0) {
          // Get fragment count for display
          const fragmentCount = db.prepare(
            'SELECT COUNT(*) as count FROM fragments WHERE snippet_id = ?'
          ).get(snippet.id).count;

          flaggedSnippets.push({
            id: snippet.id,
            title: snippet.title,
            description: snippet.description,
            updated_at: snippet.updated_at,
            is_public: snippet.is_public,
            user_id: snippet.user_id,
            username: snippet.username,
            fragment_count: fragmentCount,
            flagged_words: foundWords
          });
        }
      }

      return {
        snippets: flaggedSnippets,
        total: flaggedSnippets.length
      };
    } catch (error) {
      Logger.error('Error scanning snippets for offensive content:', error);
      throw error;
    }
  }

  async getSnippetDetails(snippetId) {
    this.#initializeStatements();

    try {
      const db = getDb();

      // Get snippet with full details (bypassing permission checks for admin)
      const query = `
        SELECT
          s.id,
          s.title,
          s.description,
          datetime(s.updated_at) || 'Z' as updated_at,
          s.user_id,
          s.is_public,
          s.is_pinned,
          s.is_favorite,
          u.username,
          GROUP_CONCAT(DISTINCT c.name) as categories,
          (SELECT COUNT(*) FROM shared_snippets WHERE snippet_id = s.id) as share_count
        FROM snippets s
        LEFT JOIN categories c ON s.id = c.snippet_id
        LEFT JOIN users u ON s.user_id = u.id
        WHERE s.id = ?
        GROUP BY s.id
      `;

      const snippet = db.prepare(query).get(snippetId);

      if (!snippet) {
        return null;
      }

      // Get fragments
      const fragments = db.prepare(`
        SELECT id, file_name, code, language, position
        FROM fragments
        WHERE snippet_id = ?
        ORDER BY position
      `).all(snippetId);

      return {
        ...snippet,
        categories: snippet.categories ? snippet.categories.split(',') : [],
        fragments: fragments.sort((a, b) => a.position - b.position),
        share_count: snippet.share_count || 0,
      };
    } catch (error) {
      Logger.error('Error getting snippet details:', error);
      throw error;
    }
  }
}

export default new AdminRepository();
````

## File: server/src/repositories/apiKeyRepository.js
````javascript
import { getDb } from '../config/database.js';
import crypto from 'crypto';
import Logger from '../logger.js';

function generateApiKey() {
  return crypto.randomBytes(32).toString('hex');
}

export function createApiKey(userId, name) {
  const db = getDb();
  const key = generateApiKey();
  
  try {
    const stmt = db.prepare(`
      INSERT INTO api_keys (user_id, key, name)
      VALUES (?, ?, ?)
    `);
    
    const result = stmt.run(userId, key, name);
    
    if (result.changes === 1) {
      Logger.debug(`Created new API key for user ${userId}`);
      return {
        id: result.lastInsertRowid,
        key,
        name,
        created_at: new Date().toISOString(),
        is_active: true
      };
    }
    return null;
  } catch (error) {
    Logger.error('Error creating API key:', error);
    throw error;
  }
}

export function getApiKeys(userId) {
  const db = getDb();
  try {
    const stmt = db.prepare(`
      SELECT id, name, created_at, last_used_at, is_active
      FROM api_keys
      WHERE user_id = ?
      ORDER BY created_at DESC
    `);
    
    return stmt.all(userId);
  } catch (error) {
    Logger.error('Error fetching API keys:', error);
    throw error;
  }
}

export function deleteApiKey(userId, keyId) {
  const db = getDb();
  try {
    const stmt = db.prepare(`
      DELETE FROM api_keys
      WHERE id = ? AND user_id = ?
    `);
    
    const result = stmt.run(keyId, userId);
    if (result.changes === 1) {
      Logger.debug(`Deleted API key ${keyId} for user ${userId}`);
    }
    return result.changes === 1;
  } catch (error) {
    Logger.error('Error deleting API key:', error);
    throw error;
  }
}

export function validateApiKey(key) {
  const db = getDb();
  try {
    const stmt = db.prepare(`
      SELECT ak.*, u.id as user_id
      FROM api_keys ak
      JOIN users u ON ak.user_id = u.id
      WHERE ak.key = ? AND ak.is_active = TRUE
    `);
    
    const apiKey = stmt.get(key);
    
    if (apiKey) {
      // Update last_used_at
      db.prepare(`
        UPDATE api_keys
        SET last_used_at = CURRENT_TIMESTAMP
        WHERE id = ?
      `).run(apiKey.id);
      
      Logger.debug(`Validated API key ${apiKey.id} for user ${apiKey.user_id}`);
      return {
        userId: apiKey.user_id,
        keyId: apiKey.id
      };
    }
    
    return null;
  } catch (error) {
    Logger.error('Error validating API key:', error);
    throw error;
  }
}
````

## File: server/src/repositories/shareRepository.js
````javascript
import { getDb } from '../config/database.js';
import crypto from 'crypto';
import Logger from '../logger.js';

class ShareRepository {
  constructor() {
    this.createShareStmt = null;
    this.getShareStmt = null;
    this.getSharesBySnippetIdStmt = null;
    this.deleteShareStmt = null;
    this.getSnippetOwnerStmt = null;
  }

  #initializeStatements() {
    const db = getDb();
    
    if (!this.createShareStmt) {
      this.createShareStmt = db.prepare(`
        INSERT INTO shared_snippets (
          id,
          snippet_id,
          requires_auth,
          expires_at
        ) VALUES (?, ?, ?, datetime('now', '+' || ? || ' seconds'))
      `);

      this.getShareStmt = db.prepare(`
        SELECT 
          ss.id as share_id,
          ss.requires_auth,
          ss.expires_at,
          ss.created_at,
          datetime(ss.expires_at) < datetime('now') as expired,
          s.id,
          s.title,
          s.description,
          s.user_id,
          datetime(s.updated_at) || 'Z' as updated_at,
          GROUP_CONCAT(DISTINCT c.name) as categories
        FROM shared_snippets ss
        JOIN snippets s ON s.id = ss.snippet_id
        LEFT JOIN categories c ON s.id = c.snippet_id
        WHERE ss.id = ? AND s.expiry_date IS NULL
        GROUP BY s.id
      `);

      this.getSharesBySnippetIdStmt = db.prepare(`
        SELECT 
          ss.*,
          datetime(ss.expires_at) < datetime('now') as expired
        FROM shared_snippets ss
        JOIN snippets s ON s.id = ss.snippet_id
        WHERE ss.snippet_id = ? AND s.user_id = ? AND s.expiry_date IS NULL
        ORDER BY ss.created_at DESC
      `);

      this.deleteShareStmt = db.prepare(`
        DELETE FROM shared_snippets 
        WHERE id = ? 
        AND snippet_id IN (
          SELECT id FROM snippets WHERE user_id = ?
        )
      `);

      this.getSnippetOwnerStmt = db.prepare(`
        SELECT user_id FROM snippets WHERE id = ?
      `);

      this.getFragmentsStmt = db.prepare(`
        SELECT id, file_name, code, language, position
        FROM fragments
        WHERE snippet_id = ?
        ORDER BY position
      `);
    }
  }

  #processShare(share) {
    if (!share) return null;

    const fragments = this.getFragmentsStmt.all(share.id);
    
    return {
      id: share.id,
      title: share.title,
      description: share.description,
      updated_at: share.updated_at,
      categories: share.categories ? share.categories.split(',') : [],
      fragments: fragments.sort((a, b) => a.position - b.position),
      share: {
        id: share.share_id,
        requiresAuth: !!share.requires_auth,
        expiresAt: share.expires_at,
        createdAt: share.created_at,
        expired: !!share.expired,
      }
    };
  }

  async createShare({ snippetId, requiresAuth, expiresIn }, userId) {
    this.#initializeStatements();
    
    const snippetIdInt = parseInt(snippetId, 10);
    if (isNaN(snippetIdInt)) {
      throw new Error('Invalid snippet ID');
    }
    
    const owner = this.getSnippetOwnerStmt.get(snippetIdInt);
    if (!owner || owner.user_id !== userId) {
      throw new Error('Unauthorized');
    }

    const shareId = crypto.randomBytes(16).toString('hex');
    
    try {
      this.createShareStmt.run(
        shareId,
        snippetIdInt,
        requiresAuth ? 1 : 0,
        expiresIn
      );
      
      return {
        id: shareId,
        snippetId: snippetIdInt,
        requiresAuth,
        expiresIn
      };
    } catch (error) {
      Logger.error('Error in createShare:', error);
      throw error;
    }
  }

  async getShare(id) {
    this.#initializeStatements();
    try {
      const share = this.getShareStmt.get(id);
      return this.#processShare(share);
    } catch (error) {
      Logger.error('Error in getShare:', error);
      throw error;
    }
  }

  async getSharesBySnippetId(snippetId, userId) {
    this.#initializeStatements();
    try {
      const snippetIdInt = parseInt(snippetId, 10);
      if (isNaN(snippetIdInt)) {
        throw new Error('Invalid snippet ID');
      }
      return this.getSharesBySnippetIdStmt.all(snippetIdInt, userId);
    } catch (error) {
      Logger.error('Error in getSharesBySnippetId:', error);
      throw error;
    }
  }

  async deleteShare(id, userId) {
    this.#initializeStatements();
    try {
      return this.deleteShareStmt.run(id, userId);
    } catch (error) {
      Logger.error('Error in deleteShare:', error);
      throw error;
    }
  }
}

export default new ShareRepository();
````

## File: server/src/repositories/snippetRepository.js
````javascript
import { getDb } from "../config/database.js";
import Logger from "../logger.js";

class SnippetRepository {
  constructor() {
    this.selectAllStmt = null;
    this.selectPublicStmt = null;
    this.insertSnippetStmt = null;
    this.insertFragmentStmt = null;
    this.insertCategoryStmt = null;
    this.updateSnippetStmt = null;
    this.deleteFragmentsStmt = null;
    this.deleteCategoriesStmt = null;
    this.selectByIdStmt = null;
    this.selectPublicByIdStmt = null;
    this.moveToRecycleBinStmt = null;
    this.deleteSnippetStmt = null;
    this.selectFragmentsStmt = null;
    this.selectAllDeletedStmt = null;
    this.deleteExpiredSnippetsStmt = null;
    this.restoreSnippetStmt = null;
    this.setPinnedStmt = null;
    this.setFavoriteStmt = null;
  }

  #initializeStatements() {
    const db = getDb();

    if (!this.selectAllStmt) {
      this.selectAllStmt = db.prepare(`
        SELECT 
          s.id,
          s.title,
          s.description,
          datetime(s.updated_at) || 'Z' as updated_at,
          s.user_id,
          s.is_public,
          s.is_pinned,
          s.is_favorite,
          u.username,
          GROUP_CONCAT(DISTINCT c.name) as categories,
          (SELECT COUNT(*) FROM shared_snippets WHERE snippet_id = s.id) as share_count
        FROM snippets s
        LEFT JOIN categories c ON s.id = c.snippet_id
        LEFT JOIN users u ON s.user_id = u.id
        WHERE s.user_id = ? AND s.expiry_date IS NULL
        GROUP BY s.id
        ORDER BY s.updated_at DESC
      `);

      this.selectPublicStmt = db.prepare(`
        SELECT 
          s.id,
          s.title,
          s.description,
          datetime(s.updated_at) || 'Z' as updated_at,
          s.user_id,
          s.is_public,
          s.is_pinned,
          s.is_favorite,
          u.username,
          GROUP_CONCAT(DISTINCT c.name) as categories,
          (SELECT COUNT(*) FROM shared_snippets WHERE snippet_id = s.id) as share_count
        FROM snippets s
        LEFT JOIN categories c ON s.id = c.snippet_id
        LEFT JOIN users u ON s.user_id = u.id
        WHERE s.is_public = 1 AND s.expiry_date IS NULL 
        GROUP BY s.id
        ORDER BY s.updated_at DESC
      `);

      this.insertSnippetStmt = db.prepare(`
        INSERT INTO snippets (
          title, 
          description, 
          updated_at,
          expiry_date,
          user_id,
          is_public
        ) VALUES (?, ?, datetime('now', 'utc'),NULL, ?, ?)
      `);

      this.insertFragmentStmt = db.prepare(`
        INSERT INTO fragments (
          snippet_id,
          file_name,
          code,
          language,
          position
        ) VALUES (?, ?, ?, ?, ?)
      `);

      this.insertCategoryStmt = db.prepare(`
        INSERT INTO categories (snippet_id, name) VALUES (?, ?)
      `);

      this.updateSnippetStmt = db.prepare(`
        UPDATE snippets 
        SET title = ?, 
            description = ?,
            updated_at = datetime('now', 'utc'),
            is_public = ?
        WHERE id = ? AND user_id = ?
      `);

      this.restoreSnippetStmt = db.prepare(`
        UPDATE snippets
        SET expiry_date = NULL
        WHERE id = ? AND user_id = ?
      `);

      this.deleteFragmentsStmt = db.prepare(`
        DELETE FROM fragments 
        WHERE snippet_id = ? 
        AND EXISTS (
          SELECT 1 FROM snippets 
          WHERE snippets.id = fragments.snippet_id 
          AND snippets.user_id = ?
        )
      `);

      this.deleteCategoriesStmt = db.prepare(`
        DELETE FROM categories 
        WHERE snippet_id = ?
        AND EXISTS (
          SELECT 1 FROM snippets 
          WHERE snippets.id = categories.snippet_id 
          AND snippets.user_id = ?
        )
      `);

      this.selectAllDeletedStmt = db.prepare(`
        SELECT 
          s.id,
          s.title,
          s.description,
          datetime(s.updated_at) || 'Z' as updated_at,
          datetime(s.expiry_date) || 'Z' as expiry_date,
          s.user_id,
          s.is_public,
          s.is_pinned,
          s.is_favorite,
          u.username,
          GROUP_CONCAT(DISTINCT c.name) as categories,
          (SELECT COUNT(*) FROM shared_snippets WHERE snippet_id = s.id) as share_count
        FROM snippets s
        LEFT JOIN categories c ON s.id = c.snippet_id
        LEFT JOIN users u ON s.user_id = u.id
        WHERE s.user_id = ? AND s.expiry_date IS NOT NULL
        GROUP BY s.id
        ORDER BY s.updated_at DESC
      `);

      this.deleteExpiredSnippetsStmt = db.prepare(`
        DELETE FROM snippets
        WHERE expiry_date IS NOT NULL AND datetime(expiry_date) <= datetime(?, 'utc')
      `);

      this.selectByIdStmt = db.prepare(`
        SELECT 
          s.id,
          s.title,
          s.description,
          datetime(s.updated_at) || 'Z' as updated_at,
          s.user_id,
          s.is_public,
          s.is_pinned,
          s.is_favorite,
          u.username,
          GROUP_CONCAT(DISTINCT c.name) as categories,
          (SELECT COUNT(*) FROM shared_snippets WHERE snippet_id = s.id) as share_count
        FROM snippets s
        LEFT JOIN categories c ON s.id = c.snippet_id
        LEFT JOIN users u ON s.user_id = u.id
        WHERE s.id = ? AND (s.user_id = ? OR s.is_public = 1) AND s.expiry_date IS NULL
        GROUP BY s.id
      `);

      this.selectPublicByIdStmt = db.prepare(`
        SELECT 
          s.id,
          s.title,
          s.description,
          datetime(s.updated_at) || 'Z' as updated_at,
          s.user_id,
          s.is_public,
          s.is_pinned,
          s.is_favorite,
          u.username,
          GROUP_CONCAT(DISTINCT c.name) as categories,
          (SELECT COUNT(*) FROM shared_snippets WHERE snippet_id = s.id) as share_count
        FROM snippets s
        LEFT JOIN categories c ON s.id = c.snippet_id
        LEFT JOIN users u ON s.user_id = u.id
        WHERE s.id = ? AND s.is_public = TRUE AND s.expiry_date IS NULL
        GROUP BY s.id
      `);

      this.moveToRecycleBinStmt = db.prepare(`
        UPDATE snippets
        SET expiry_date = datetime('now', '+30 days')
        WHERE id = ? AND user_id = ?
      `);

      this.deleteSnippetStmt = db.prepare(`
        DELETE FROM snippets 
        WHERE id = ? AND user_id = ?
        RETURNING *                            
      `); // returns the deleted snippet

      this.selectFragmentsStmt = db.prepare(`
        SELECT id, file_name, code, language, position 
        FROM fragments
        WHERE snippet_id = ?
        ORDER BY position
      `);

      this.setPinnedStmt = db.prepare(`
        UPDATE snippets
        SET is_pinned = ?
        WHERE id = ? AND user_id = ?
      `);

      this.setFavoriteStmt = db.prepare(`
        UPDATE snippets
        SET is_favorite = ?
        WHERE id = ? AND user_id = ?
      `);
    }
  }

  #processSnippet(snippet) {
    if (!snippet) return null;

    const fragments = this.selectFragmentsStmt.all(snippet.id);

    return {
      ...snippet,
      categories: snippet.categories ? snippet.categories.split(",") : [],
      fragments: fragments.sort((a, b) => a.position - b.position),
      share_count: snippet.share_count || 0,
    };
  }

  findAll(userId) {
    this.#initializeStatements();
    try {
      const snippets = this.selectAllStmt.all(userId);
      return snippets.map(this.#processSnippet.bind(this));
    } catch (error) {
      Logger.error("Error in findAll:", error);
      throw error;
    }
  }

  findAllPublic() {
    this.#initializeStatements();
    try {
      const snippets = this.selectPublicStmt.all();
      return snippets.map(this.#processSnippet.bind(this));
    } catch (error) {
      Logger.error("Error in findAllPublic:", error);
      throw error;
    }
  }

  create({
    title,
    description,
    categories = [],
    fragments = [],
    userId,
    isPublic = 0,
  }) {
    this.#initializeStatements();
    try {
      const db = getDb();

      return db.transaction(() => {
        const insertResult = this.insertSnippetStmt.run(
          title,
          description,
          userId,
          isPublic ? 1 : 0
        );
        const snippetId = insertResult.lastInsertRowid;

        fragments.forEach((fragment, index) => {
          this.insertFragmentStmt.run(
            snippetId,
            fragment.file_name || `file${index + 1}`,
            fragment.code || "",
            fragment.language || "plaintext",
            fragment.position || index
          );
        });

        if (categories.length > 0) {
          for (const category of categories) {
            if (category.trim()) {
              this.insertCategoryStmt.run(
                snippetId,
                category.trim().toLowerCase()
              );
            }
          }
        }

        const created = this.selectByIdStmt.get(snippetId, userId);
        return this.#processSnippet(created);
      })();
    } catch (error) {
      Logger.error("Error in create:", error);
      throw error;
    }
  }

  update(
    id,
    { title, description, categories = [], fragments = [], isPublic = 0 },
    userId
  ) {
    this.#initializeStatements();
    try {
      const db = getDb();

      return db.transaction(() => {
        this.updateSnippetStmt.run(
          title,
          description,
          isPublic ? 1 : 0,
          id,
          userId
        );

        this.deleteFragmentsStmt.run(id, userId);
        fragments.forEach((fragment, index) => {
          this.insertFragmentStmt.run(
            id,
            fragment.file_name || `file${index + 1}`,
            fragment.code || "",
            fragment.language || "plaintext",
            fragment.position || index
          );
        });

        this.deleteCategoriesStmt.run(id, userId);
        for (const category of categories) {
          if (category.trim()) {
            this.insertCategoryStmt.run(id, category.trim().toLowerCase());
          }
        }

        const updated = this.selectByIdStmt.get(id, userId);
        return this.#processSnippet(updated);
      })();
    } catch (error) {
      Logger.error("Error in update:", error);
      throw error;
    }
  }

  restore(id, userId) {
    this.#initializeStatements();
    try {
      const db = getDb();
      return db.transaction(() => {
        this.restoreSnippetStmt.run(id, userId);
      })();
    } catch (error) {
      Logger.error("Error in restore:", error);
      throw error;
    }
  }

  moveToRecycle(id, userId) {
    this.#initializeStatements();
    try {
      const db = getDb();
      return db.transaction(() => {
        const snippet = this.selectByIdStmt.get(id, userId);
        if (snippet) {
          this.moveToRecycleBinStmt.run(id, userId);
          return this.#processSnippet(snippet);
        }
        return null;
      })();
    } catch (error) {
      Logger.error("Error in moving to recycle:", error);
      throw error;
    }
  }

  findAllDeleted(userId) {
    this.#initializeStatements();
    try {
      const deletedSnippets = this.selectAllDeletedStmt.all(userId);
      return deletedSnippets.map(this.#processSnippet.bind(this));
    } catch (error) {
      Logger.error("Error in findAllDeleted:", error);
      throw error;
    }
  }

  delete(id, userId) {
    this.#initializeStatements();
    try {
      const db = getDb();

      return db.transaction(() => {
        const deletedSnippet = this.deleteSnippetStmt.get(id, userId); // get() will return deleted row
        return deletedSnippet ? this.#processSnippet(deletedSnippet) : null;
      })();
    } catch (error) {
      Logger.error("Error in delete:", error);
      throw error;
    }
  }

  deleteExpired() {
    this.#initializeStatements();
    try {
      const db = getDb();
      const currentTime = new Date().toISOString();
      db.transaction(() => {
        this.deleteExpiredSnippetsStmt.run(currentTime);
      })();
    } catch (error) {
      Logger.error("Error in deleteExpired:", error);
      throw error;
    }
  }

  findById(id, userId = null) {
    this.#initializeStatements();
    try {
      if (userId != null) {
        const snippet = this.selectByIdStmt.get(id, userId);
        return this.#processSnippet(snippet);
      }

      const snippet = this.selectPublicByIdStmt.get(id);
      return this.#processSnippet(snippet);
    } catch (error) {
      Logger.error("Error in findById:", error);
      throw error;
    }
  }

  setPinned(id, value, userId) {
    this.#initializeStatements();
    try {
      const result = this.setPinnedStmt.run(value ? 1 : 0, id, userId);
      if (result.changes === 0) return null;
      const updated = this.selectByIdStmt.get(id, userId);
      return this.#processSnippet(updated);
    } catch (error) {
      Logger.error("Error in setPinned:", error);
      throw error;
    }
  }

  setFavorite(id, value, userId) {
    this.#initializeStatements();
    try {
      const result = this.setFavoriteStmt.run(value ? 1 : 0, id, userId);
      if (result.changes === 0) {
        return null;
      }
      const updated = this.selectByIdStmt.get(id, userId);
      return this.#processSnippet(updated);
    } catch (error) {
      Logger.error("Error in setFavorite:", error);
      throw error;
    }
  }

  findAllPaginated({
    userId = null,
    filters = {},
    sort = 'newest',
    limit = 50,
    offset = 0
  }) {
    this.#initializeStatements();

    try {
      // Build base query
      let sql = `
        SELECT
          s.id,
          s.title,
          s.description,
          datetime(s.updated_at) || 'Z' as updated_at,
          CASE WHEN s.expiry_date IS NOT NULL THEN datetime(s.expiry_date) || 'Z' ELSE NULL END as expiry_date,
          s.user_id,
          s.is_public,
          s.is_pinned,
          s.is_favorite,
          u.username,
          GROUP_CONCAT(DISTINCT c.name) as categories,
          (SELECT COUNT(*) FROM shared_snippets WHERE snippet_id = s.id) as share_count,
          COUNT(*) OVER() as total_count
        FROM snippets s
        LEFT JOIN categories c ON s.id = c.snippet_id
        LEFT JOIN users u ON s.user_id = u.id
        WHERE 1=1
      `;

      const params = [];

      // Apply filters dynamically
      if (userId !== null) {
        sql += ` AND s.user_id = ?`;
        params.push(userId);
      } else {
        sql += ` AND s.is_public = 1`;
      }

      if (filters.recycled) {
        sql += ` AND s.expiry_date IS NOT NULL`;
      } else {
        sql += ` AND s.expiry_date IS NULL`;
      }

      if (filters.favorites) {
        sql += ` AND s.is_favorite = 1`;
      }

      if (filters.pinned) {
        sql += ` AND s.is_pinned = 1`;
      }

      if (filters.search) {
        sql += ` AND (s.title LIKE ? OR s.description LIKE ?`;
        params.push(`%${filters.search}%`, `%${filters.search}%`);

        if (filters.searchCode) {
          sql += ` OR EXISTS (
            SELECT 1 FROM fragments f
            WHERE f.snippet_id = s.id AND f.code LIKE ?
          )`;
          params.push(`%${filters.search}%`);
        }
        sql += `)`;
      }

      if (filters.language) {
        sql += ` AND EXISTS (
          SELECT 1 FROM fragments f
          WHERE f.snippet_id = s.id AND f.language = ?
        )`;
        params.push(filters.language);
      }

      sql += ` GROUP BY s.id`;

      // Category AND logic: must have ALL selected categories
      if (filters.categories && filters.categories.length > 0) {
        sql += ` HAVING COUNT(DISTINCT CASE WHEN c.name IN (${filters.categories.map(() => '?').join(',')}) THEN c.name END) = ?`;
        params.push(...filters.categories, filters.categories.length);
      }

      // Apply sorting - pinned snippets always come first
      sql += ` ORDER BY s.is_pinned DESC, `;
      switch (sort) {
        case 'oldest':
          sql += `s.updated_at ASC`;
          break;
        case 'alpha-asc':
          sql += `s.title ASC`;
          break;
        case 'alpha-desc':
          sql += `s.title DESC`;
          break;
        case 'newest':
        default:
          sql += `s.updated_at DESC`;
      }

      sql += ` LIMIT ? OFFSET ?`;
      params.push(limit, offset);

      const db = getDb();
      const stmt = db.prepare(sql);
      const rows = stmt.all(...params);

      const total = rows.length > 0 ? rows[0].total_count : 0;
      const snippets = rows.map(this.#processSnippet.bind(this));

      return { snippets, total };
    } catch (error) {
      Logger.error("Error in findAllPaginated:", error);
      throw error;
    }
  }

  getMetadata(userId = null) {
    this.#initializeStatements();
    const db = getDb();

    try {
      // Get unique categories
      let categorySql = `
        SELECT DISTINCT c.name
        FROM categories c
        INNER JOIN snippets s ON c.snippet_id = s.id
        WHERE s.expiry_date IS NULL
      `;
      const categoryParams = [];

      if (userId !== null) {
        categorySql += ` AND s.user_id = ?`;
        categoryParams.push(userId);
      } else {
        categorySql += ` AND s.is_public = 1`;
      }
      categorySql += ` ORDER BY c.name`;

      const categories = db.prepare(categorySql).all(...categoryParams).map(r => r.name);

      // Get unique languages
      let languageSql = `
        SELECT DISTINCT f.language
        FROM fragments f
        INNER JOIN snippets s ON f.snippet_id = s.id
        WHERE s.expiry_date IS NULL
      `;
      const languageParams = [];

      if (userId !== null) {
        languageSql += ` AND s.user_id = ?`;
        languageParams.push(userId);
      } else {
        languageSql += ` AND s.is_public = 1`;
      }
      languageSql += ` ORDER BY f.language`;

      const languages = db.prepare(languageSql).all(...languageParams).map(r => r.language);

      // Get counts
      let countSql = `SELECT COUNT(*) as count FROM snippets WHERE expiry_date IS NULL`;
      const countParams = [];

      if (userId !== null) {
        countSql += ` AND user_id = ?`;
        countParams.push(userId);
      } else {
        countSql += ` AND is_public = 1`;
      }

      const total = db.prepare(countSql).get(...countParams).count;

      return { categories, languages, counts: { total } };
    } catch (error) {
      Logger.error("Error in getMetadata:", error);
      throw error;
    }
  }
}

export default new SnippetRepository();
````

## File: server/src/repositories/userRepository.js
````javascript
import { getDb } from '../config/database.js';
import bcrypt from 'bcrypt';
import Logger from '../logger.js';

class UserRepository {
  constructor() {
    this.createUserStmt = null;
    this.findByUsernameStmt = null;
    this.findByIdStmt = null;
    this.findByOIDCIdStmt = null;
    this.createUserWithOIDCStmt = null;
    this.updatePasswordStmt = null;
    this.findByIdWithPasswordStmt = null;
  }

  #initializeStatements() {
    if (!this.createUserStmt) {
      const db = getDb();

      this.createUserStmt = db.prepare(`
        INSERT INTO users (username, username_normalized, password_hash)
        VALUES (?, ?, ?)
      `);

      this.findByUsernameStmt = db.prepare(`
        SELECT id, username, password_hash, created_at, email, name, oidc_id, oidc_provider, is_admin, is_active
        FROM users
        WHERE username_normalized = ? COLLATE NOCASE
      `);

      this.findByIdStmt = db.prepare(`
        SELECT id, username, created_at, email, name, oidc_id, is_admin, is_active
        FROM users
        WHERE id = ?
      `);

      this.findByIdWithPasswordStmt = db.prepare(`
        SELECT id, username, password_hash, created_at, email, name
        FROM users
        WHERE id = ?
      `);

      this.findByOIDCIdStmt = db.prepare(`
        SELECT id, username, created_at, email, name, is_admin, is_active
        FROM users
        WHERE oidc_id = ? AND oidc_provider = ?
      `);

      this.createUserWithOIDCStmt = db.prepare(`
        INSERT INTO users (
          username, 
          username_normalized,
          password_hash, 
          oidc_id, 
          oidc_provider, 
          email, 
          name
        ) VALUES (?, ?, '', ?, ?, ?, ?)
      `);

      this.findUsernameCountStmt = db.prepare(`
        SELECT COUNT(*) as count 
        FROM users 
        WHERE username_normalized = ? COLLATE NOCASE
      `);

      this.createAnonymousUserStmt = db.prepare(`
        INSERT INTO users (
          id,
          username, 
          username_normalized,
          password_hash,
          created_at
        ) VALUES (0, ?, ?, '', datetime('now'))
        ON CONFLICT(id) DO NOTHING
      `);

      this.updatePasswordStmt = db.prepare(`
        UPDATE users
        SET password_hash = ?
        WHERE id = ?
      `);

      this.updateLastLoginStmt = db.prepare(`
        UPDATE users
        SET last_login_at = CURRENT_TIMESTAMP
        WHERE id = ?
      `);
    }
  }

  async create(username, password) {
    this.#initializeStatements();
    
    try {
      const saltRounds = 10;
      const passwordHash = await bcrypt.hash(password, saltRounds);
      const normalizedUsername = username.toLowerCase();

      const result = this.createUserStmt.run(
        username,
        normalizedUsername,
        passwordHash
      );
      
      return this.findById(result.lastInsertRowid);
    } catch (error) {
      if (error.code === 'SQLITE_CONSTRAINT') {
        throw new Error('Username already exists');
      }
      throw error;
    }
  }

  async findByUsername(username) {
    this.#initializeStatements();
    return this.findByUsernameStmt.get(username.toLowerCase());
  }

  async findById(id) {
    this.#initializeStatements();
    return this.findByIdStmt.get(id);
  }

  async findByIdWithPassword(id) {
    this.#initializeStatements();
    return this.findByIdWithPasswordStmt.get(id);
  }

  async verifyPassword(user, password) {
    if (!user?.password_hash) {
      return false;
    }
    return bcrypt.compare(password, user.password_hash);
  }

  async generateUniqueUsername(baseUsername) {
    this.#initializeStatements();
    let username = baseUsername;
    let counter = 1;
    
    while (this.findUsernameCountStmt.get(username.toLowerCase()).count > 0) {
      username = `${baseUsername}${counter}`;
      counter++;
    }
    
    return username;
  }

  async findOrCreateOIDCUser(profile, provider) {
    this.#initializeStatements();
    
    try {
      const user = this.findByOIDCIdStmt.get(profile.sub, provider);
      if (user) return user;

      const sanitizeName = (name) => {
        return name
          .toLowerCase()
          .replace(/[^a-z0-9]/g, '')
          .slice(0, 30);
      };

      let baseUsername = profile.preferred_username ? sanitizeName(profile.preferred_username) :
                        profile.email?.split('@')[0] || 
                        profile.name ? sanitizeName(profile.name) :
                        profile.sub;
                          
      const username = await this.generateUniqueUsername(baseUsername);

      const result = this.createUserWithOIDCStmt.run(
        username,
        username.toLowerCase(),
        profile.sub,
        provider,
        profile.email,
        profile.name
      );
      
      return this.findById(result.lastInsertRowid);
    } catch (error) {
      Logger.error('Error in findOrCreateOIDCUser:', error);
      throw error;
    }
  }

  async findByOIDCId(oidcId, provider) {
    this.#initializeStatements();
    return this.findByOIDCIdStmt.get(oidcId, provider);
  }

  async createAnonymousUser(username) {
    this.#initializeStatements();
    
    try {
      this.createAnonymousUserStmt.run(
        username,
        username.toLowerCase()
      );
      
      return {
        id: 0,
        username,
        created_at: new Date().toISOString()
      };
    } catch (error) {
      Logger.error('Error creating anonymous user:', error);
      throw error;
    }
  }

  async updatePassword(userId, newPassword) {
    this.#initializeStatements();

    try {
      const saltRounds = 10;
      const passwordHash = await bcrypt.hash(newPassword, saltRounds);

      const result = this.updatePasswordStmt.run(passwordHash, userId);

      if (result.changes === 0) {
        throw new Error('User not found or password not updated');
      }

      return true;
    } catch (error) {
      Logger.error('Error updating password:', error);
      throw error;
    }
  }

  async updateLastLogin(userId) {
    this.#initializeStatements();

    try {
      this.updateLastLoginStmt.run(userId);
    } catch (error) {
      Logger.error('Error updating last login:', error);
      throw error;
    }
  }
}

export default new UserRepository();
````

## File: server/src/routes/adminRoutes.js
````javascript
import express from 'express';
import adminRepository from '../repositories/adminRepository.js';
import badWordsChecker from '../utils/badWords.js';
import Logger from '../logger.js';

const router = express.Router();

// Dashboard stats
router.get('/stats', async (req, res) => {
  try {
    const stats = await adminRepository.getStats();
    res.json(stats);
  } catch (error) {
    Logger.error('Error getting admin stats:', error);
    res.status(500).json({ message: 'Failed to retrieve statistics' });
  }
});

// User management
router.get('/users', async (req, res) => {
  try {
    const { offset = 0, limit = 50, search = '', authType = '', isActive = '' } = req.query;
    const result = await adminRepository.getAllUsers({
      offset: parseInt(offset),
      limit: parseInt(limit),
      search,
      authType,
      isActive
    });
    res.json(result);
  } catch (error) {
    Logger.error('Error getting users:', error);
    res.status(500).json({ message: 'Failed to retrieve users' });
  }
});

router.get('/users/:id', async (req, res) => {
  try {
    const user = await adminRepository.getUserDetails(req.params.id);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }
    res.json(user);
  } catch (error) {
    Logger.error('Error getting user details:', error);
    res.status(500).json({ message: 'Failed to retrieve user details' });
  }
});

router.delete('/users/:id', async (req, res) => {
  try {
    const userId = parseInt(req.params.id);

    if (userId === req.user.id) {
      return res.status(400).json({ message: 'Cannot delete your own account' });
    }

    if (userId === 0) {
      return res.status(400).json({ message: 'Cannot delete anonymous user' });
    }

    const deleted = await adminRepository.deleteUser(userId);
    if (!deleted) {
      return res.status(404).json({ message: 'User not found' });
    }

    res.json({ message: 'User deleted successfully' });
  } catch (error) {
    Logger.error('Error deleting user:', error);
    res.status(500).json({ message: 'Failed to delete user' });
  }
});

router.patch('/users/:id/toggle-active', async (req, res) => {
  try {
    const userId = parseInt(req.params.id);

    if (userId === req.user.id) {
      return res.status(400).json({ message: 'Cannot modify your own active status' });
    }

    if (userId === 0) {
      return res.status(400).json({ message: 'Cannot modify anonymous user' });
    }

    const user = await adminRepository.toggleUserActive(userId);
    res.json(user);
  } catch (error) {
    Logger.error('Error toggling user active status:', error);
    res.status(500).json({ message: 'Failed to update user status' });
  }
});

// Snippet management
router.get('/snippets', async (req, res) => {
  try {
    const { offset = 0, limit = 50, search = '', userId = '', isPublic = '', language = '', category = '' } = req.query;
    const result = await adminRepository.getAllSnippets({
      offset: parseInt(offset),
      limit: parseInt(limit),
      search,
      userId,
      isPublic,
      language,
      category
    });
    res.json(result);
  } catch (error) {
    Logger.error('Error getting snippets:', error);
    res.status(500).json({ message: 'Failed to retrieve snippets' });
  }
});

router.delete('/snippets/:id', async (req, res) => {
  try {
    const deleted = await adminRepository.deleteSnippetPermanently(req.params.id);
    if (!deleted) {
      return res.status(404).json({ message: 'Snippet not found' });
    }
    res.json({ message: 'Snippet deleted successfully' });
  } catch (error) {
    Logger.error('Error deleting snippet:', error);
    res.status(500).json({ message: 'Failed to delete snippet' });
  }
});

router.patch('/snippets/:id/owner', async (req, res) => {
  try {
    const { newUserId } = req.body;

    if (!newUserId) {
      return res.status(400).json({ message: 'newUserId is required' });
    }

    await adminRepository.changeSnippetOwner(req.params.id, newUserId);
    res.json({ message: 'Snippet owner changed successfully' });
  } catch (error) {
    Logger.error('Error changing snippet owner:', error);
    res.status(500).json({ message: 'Failed to change snippet owner' });
  }
});

router.patch('/snippets/:id/toggle-public', async (req, res) => {
  try {
    await adminRepository.toggleSnippetPublic(req.params.id);
    res.json({ message: 'Snippet visibility toggled successfully' });
  } catch (error) {
    Logger.error('Error toggling snippet public status:', error);
    res.status(500).json({ message: 'Failed to toggle snippet visibility' });
  }
});

router.get('/snippets/scan/offensive', async (req, res) => {
  try {
    const result = await adminRepository.scanSnippetsForOffensiveContent(badWordsChecker);
    res.json(result);
  } catch (error) {
    Logger.error('Error scanning snippets for offensive content:', error);
    res.status(500).json({ message: 'Failed to scan snippets for offensive content' });
  }
});

router.get('/snippets/:id', async (req, res) => {
  try {
    const snippet = await adminRepository.getSnippetDetails(req.params.id);
    if (!snippet) {
      return res.status(404).json({ message: 'Snippet not found' });
    }
    res.json(snippet);
  } catch (error) {
    Logger.error('Error getting snippet details:', error);
    res.status(500).json({ message: 'Failed to retrieve snippet details' });
  }
});

// API Key management
router.get('/api-keys', async (req, res) => {
  try {
    const { offset = 0, limit = 50, userId = '' } = req.query;
    const result = await adminRepository.getAllApiKeys({
      offset: parseInt(offset),
      limit: parseInt(limit),
      userId
    });
    res.json(result);
  } catch (error) {
    Logger.error('Error getting API keys:', error);
    res.status(500).json({ message: 'Failed to retrieve API keys' });
  }
});

router.delete('/api-keys/:id', async (req, res) => {
  try {
    const deleted = await adminRepository.deleteApiKey(req.params.id);
    if (!deleted) {
      return res.status(404).json({ message: 'API key not found' });
    }
    res.json({ message: 'API key deleted successfully' });
  } catch (error) {
    Logger.error('Error deleting API key:', error);
    res.status(500).json({ message: 'Failed to delete API key' });
  }
});

// Share management
router.get('/shares', async (req, res) => {
  try {
    const { offset = 0, limit = 50, userId = '', requiresAuth = '' } = req.query;
    const result = await adminRepository.getAllShares({
      offset: parseInt(offset),
      limit: parseInt(limit),
      userId,
      requiresAuth
    });
    res.json(result);
  } catch (error) {
    Logger.error('Error getting shares:', error);
    res.status(500).json({ message: 'Failed to retrieve shares' });
  }
});

router.delete('/shares/:id', async (req, res) => {
  try {
    const deleted = await adminRepository.deleteShare(req.params.id);
    if (!deleted) {
      return res.status(404).json({ message: 'Share not found' });
    }
    res.json({ message: 'Share deleted successfully' });
  } catch (error) {
    Logger.error('Error deleting share:', error);
    res.status(500).json({ message: 'Failed to delete share' });
  }
});

export default router;
````

## File: server/src/routes/apiKeyRoutes.js
````javascript
import express from 'express';
import { createApiKey, getApiKeys, deleteApiKey } from '../repositories/apiKeyRepository.js';
import Logger from '../logger.js';

const router = express.Router();

// List all API keys for the authenticated user
router.get('/', async (req, res) => {
  try {
    const keys = getApiKeys(req.user.id);
    res.json(keys);
  } catch (error) {
    Logger.error('Error fetching API keys:', error);
    res.status(500).json({ error: 'Failed to fetch API keys' });
  }
});

// Create a new API key
router.post('/', async (req, res) => {
  try {
    const { name } = req.body;
    
    if (!name) {
      return res.status(400).json({ error: 'Name is required' });
    }
    
    const apiKey = createApiKey(req.user.id, name);
    
    if (!apiKey) {
      return res.status(500).json({ error: 'Failed to create API key' });
    }
    
    Logger.debug(`User ${req.user.id} created new API key`);
    res.status(201).json(apiKey);
  } catch (error) {
    Logger.error('Error creating API key:', error);
    res.status(500).json({ error: 'Failed to create API key' });
  }
});

// Delete an API key
router.delete('/:id', async (req, res) => {
  try {
    const success = deleteApiKey(req.user.id, req.params.id);
    
    if (!success) {
      return res.status(404).json({ error: 'API key not found' });
    }
    
    Logger.debug(`User ${req.user.id} deleted API key ${req.params.id}`);
    res.json({ sucess: success });
  } catch (error) {
    Logger.error('Error deleting API key:', error);
    res.status(500).json({ error: 'Failed to delete API key' });
  }
});

export default router;
````

## File: server/src/routes/authRoutes.js
````javascript
import express from 'express';
import jwt from 'jsonwebtoken';
import { JWT_SECRET, TOKEN_EXPIRY, ALLOW_NEW_ACCOUNTS, DISABLE_ACCOUNTS, DISABLE_INTERNAL_ACCOUNTS, getOrCreateAnonymousUser, authenticateToken, ALLOW_PASSWORD_CHANGES } from '../middleware/auth.js';
import userService from '../services/userService.js';
import userRepository from '../repositories/userRepository.js';
import { getDb } from '../config/database.js';
import { up_v1_5_0_snippets } from '../config/migrations/20241117-migration.js';
import { isAdmin } from '../middleware/adminAuth.js';
import Logger from '../logger.js';

const router = express.Router();

router.get('/config', async (req, res) => {
  try {
    const db = getDb();
    const userCount = db.prepare('SELECT COUNT(*) as count FROM users').get().count;
    const hasUsers = userCount > 0;
    
    res.json({ 
      authRequired: true,
      allowNewAccounts: !hasUsers || (ALLOW_NEW_ACCOUNTS && !DISABLE_ACCOUNTS),
      hasUsers,
      disableAccounts: DISABLE_ACCOUNTS,
      disableInternalAccounts: DISABLE_INTERNAL_ACCOUNTS,
      allowPasswordChanges: ALLOW_PASSWORD_CHANGES
    });
  } catch (error) {
    Logger.error('Error getting auth config:', error);
    res.status(500).json({ error: 'Failed to get auth configuration' });
  }
});

router.post('/register', async (req, res) => {
  try {
    if (DISABLE_INTERNAL_ACCOUNTS) {
      return res.status(403).json({ error: 'Internal account registration is disabled' });
    }

    const db = getDb();
    const userCount = db.prepare('SELECT COUNT(*) as count FROM users').get().count;
    const hasUsers = userCount > 0;
    
    if (hasUsers && !ALLOW_NEW_ACCOUNTS) {
      return res.status(403).json({ error: 'New account registration is disabled' });
    }

    const { username, password } = req.body;
    const user = await userService.createUser(username, password);
    
    if (!hasUsers) {
      await up_v1_5_0_snippets(db, user.id);
    }
    
    const token = jwt.sign({ 
      id: user.id,
      username: user.username 
    }, JWT_SECRET, 
      TOKEN_EXPIRY ? { expiresIn: TOKEN_EXPIRY } : undefined
    );    

    res.json({
      token,
      user: {
        id: user.id,
        username: user.username,
        created_at: user.created_at,
        is_admin: isAdmin(user.username)
      }
    });
  } catch (error) {
    Logger.error('Registration error:', error);
    res.status(400).json({ error: error.message });
  }
});

router.post('/login', async (req, res) => {
  try {
    if (DISABLE_INTERNAL_ACCOUNTS) {
      return res.status(403).json({ error: 'Internal accounts are disabled' });
    }

    const { username, password } = req.body;
    const user = await userService.validateUser(username, password);

    if (!user) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    if (user.is_active === 0 || user.is_active === false) {
      return res.status(403).json({ error: 'Account has been deactivated' });
    }

    await userRepository.updateLastLogin(user.id);

    const token = jwt.sign({
      id: user.id,
      username: user.username
    }, JWT_SECRET,
      TOKEN_EXPIRY ? { expiresIn: TOKEN_EXPIRY } : undefined
    );

    const userResponse = {
      ...user,
      is_admin: isAdmin(user.username)
    };

    res.json({ token, user: userResponse });
  } catch (error) {
    Logger.error('Login error:', error);
    res.status(500).json({ error: 'An error occurred during login' });
  }
});

router.get('/verify', async (req, res) => {
  const authHeader = req.headers['bytestashauth'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) {
    return res.status(401).json({ valid: false });
  }

  try {
    const decoded = jwt.verify(token, JWT_SECRET);
    const user = await userService.findById(decoded.id);
    
    if (!user) {
      return res.status(401).json({ valid: false });
    }

    res.status(200).json({
      valid: true,
      user: {
        id: user.id,
        username: user.username,
        created_at: user.created_at,
        is_admin: isAdmin(user.username)
      }
    });
  } catch (err) {
    res.status(401).json({ valid: false });
  }
});

router.post('/anonymous', async (req, res) => {
  if (!DISABLE_ACCOUNTS) {
    return res.status(403).json({ error: 'Anonymous login not allowed' });
  }

  try {
    const anonymousUser = await getOrCreateAnonymousUser();
    const token = jwt.sign({ 
      id: anonymousUser.id,
      username: anonymousUser.username 
    }, JWT_SECRET, {
      expiresIn: TOKEN_EXPIRY
    });

    res.json({ token, user: anonymousUser });
  } catch (error) {
    Logger.error('Error in anonymous login:', error);
    res.status(500).json({ error: 'Failed to create anonymous session' });
  }
});

router.post('/change-password', authenticateToken, async (req, res) => {
  try {
    if (!ALLOW_PASSWORD_CHANGES) {
      return res.status(403).json({ error: 'Password changes are disabled' });
    }

    if (DISABLE_INTERNAL_ACCOUNTS) {
      return res.status(403).json({ error: 'Internal accounts are disabled' });
    }

    const { currentPassword, newPassword } = req.body;
    const userId = req.user.id;

    if (!currentPassword || !newPassword) {
      return res.status(400).json({ error: 'Current password and new password are required' });
    }

    // Check if user is using OIDC authentication
    const user = await userService.findById(userId);
    if (user?.oidc_id) {
      return res.status(403).json({ error: 'Password change not available for external authentication accounts' });
    }

    await userService.changePassword(userId, currentPassword, newPassword);
    
    res.json({ success: true, message: 'Password changed successfully' });
  } catch (error) {
    Logger.error('Change password error:', error);
    res.status(400).json({ error: error.message });
  }
});

export default router;
````

## File: server/src/routes/embedRoutes.js
````javascript
import express from 'express';
import shareRepository from '../repositories/shareRepository.js';

const router = express.Router();

router.get('/:shareId', async (req, res) => {
  try {
    const { shareId } = req.params;
    const { showTitle, showDescription, fragmentIndex } = req.query;

    const snippet = await shareRepository.getShare(shareId);
    if (!snippet) {
      return res.status(404).json({ error: 'Snippet not found' });
    }

    if (snippet.share.expired) {
      return res.status(404).json({ error: 'Share link has expired' });
    }

    if (snippet.share.requiresAuth && !req.user) {
      return res.status(401).json({ error: 'Authentication required' });
    }

    const embedData = {
      id: snippet.id,
      title: showTitle === 'true' ? snippet.title : undefined,
      description: showDescription === 'true' ? snippet.description : undefined,
      language: snippet.language,
      fragments: fragmentIndex !== undefined ? 
        [snippet.fragments[parseInt(fragmentIndex, 10)]] : 
        snippet.fragments,
      created_at: snippet.created_at,
      updated_at: snippet.updated_at
    };

    res.json(embedData);
  } catch (error) {
    console.error('Error in embed route:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

export default router;
````

## File: server/src/routes/oidcRoutes.js
````javascript
import express from 'express';
import { OIDCConfig } from '../oidc/oidcConfig.js';
import userRepository from '../repositories/userRepository.js';
import { JWT_SECRET, TOKEN_EXPIRY, ALLOW_NEW_ACCOUNTS } from '../middleware/auth.js';
import jwt from 'jsonwebtoken';
import Logger from '../logger.js';
import { getDb } from '../config/database.js';
import { up_v1_5_0_snippets } from '../config/migrations/20241117-migration.js';
import { isAdmin } from '../middleware/adminAuth.js';

const router = express.Router();

function getBaseUrl(req) {
  const forwardedProto = req.get('X-Forwarded-Proto');

  const isSecure = req.secure ||
    forwardedProto === 'https' ||
    req.get('X-Forwarded-SSL') === 'on';

  const protocol = isSecure ? 'https' : 'http';

  const host = req.get('X-Forwarded-Host') || req.get('Host');

  Logger.debug('Protocol detection:', {
    secure: req.secure,
    forwardedProto,
    resultingProtocol: protocol,
    host
  });

  const baseUrl = `${protocol}://${host}${process.env.BASE_PATH || ''}`;
  return baseUrl.endsWith('/') ? baseUrl.slice(0, -1) : baseUrl;
}

router.get('/config', async (req, res) => {
  try {
    const oidc = await OIDCConfig.getInstance();
    res.json(oidc.getConfig());
  } catch (error) {
    Logger.error('OIDC config fetch error:', error);
    res.status(500).json({ error: 'Failed to fetch OIDC configuration' });
  }
});

router.get('/auth', async (req, res) => {
  try {
    const oidc = await OIDCConfig.getInstance();
    if (!oidc.isEnabled()) {
      return res.redirect('/login?error=config_error');
    }

    const baseUrl = getBaseUrl(req);
    const authUrl = await oidc.getAuthorizationUrl(
      baseUrl,
      oidc.getScopes().join(' ')
    );

    Logger.debug('Generated auth URL:', authUrl);
    res.redirect(authUrl);
  } catch (error) {
    Logger.error('OIDC auth error:', error);
    const errorMessage = encodeURIComponent(error.message || 'Unknown error');
    res.redirect(`/login?error=provider_error&message=${errorMessage}`);
  }
});

router.get('/logout', async (req, res) => {
  try {
    const oidc = await OIDCConfig.getInstance();
    if (!oidc.isEnabled()) {
      return res.redirect('/');
    }

    const authHeader = req.headers.cookie;
    const token = authHeader && authHeader.split('=')[1];

    // Clear the auth cookie
    res.clearCookie('bytestash_token', { path: '/' });

    // Reset logged_in state
    oidc.loggedIn = false;

    if (!token) {
      return res.redirect(`${process.env.BASE_PATH || ''}/auth/logout_callback`);
    }

    const baseUrl = getBaseUrl(req);
    const logoutUrl = await oidc.getLogoutUrl(baseUrl, token);

    if (logoutUrl) {
      Logger.debug('Generated Logout URL:', logoutUrl);
      res.redirect(logoutUrl);
    } else {
      // Provider doesn't support end_session_endpoint (e.g., Google)
      // Perform local-only logout
      const logoutCallbackUrl = `${process.env.BASE_PATH || ''}/auth/logout_callback`;
      res.redirect(logoutCallbackUrl);
    }
  } catch (error) {
    Logger.error('OIDC logout error:', error);
    res.clearCookie('bytestash_token', { path: '/' });
    res.redirect(`${process.env.BASE_PATH || ''}/auth/logout_callback`);
  }
});

router.get('/callback', async (req, res) => {
  try {
    const oidc = await OIDCConfig.getInstance();
    if (!oidc.isEnabled()) {
      return res.status(404).json({ error: 'OIDC not enabled' });
    }

    const db = getDb();
    const userCount = db.prepare('SELECT COUNT(*) as count FROM users').get().count;
    const hasUsers = userCount > 0;

    const baseUrl = getBaseUrl(req);
    const callbackUrl = oidc.getCallbackUrl(baseUrl);
    const queryString = new URLSearchParams(req.query).toString();
    const currentUrl = queryString ? `${callbackUrl}?${queryString}` : callbackUrl;

    Logger.debug('Full callback URL:', currentUrl);

    const { tokens, userInfo } = await oidc.handleCallback(currentUrl, callbackUrl);
    Logger.debug('Authentication successful');

    const existingUser = await userRepository.findByOIDCId(
      userInfo.sub,
      oidc.config.serverMetadata().issuer
    );

    if (!hasUsers && !existingUser) {
      const db = getDb();
      const userCount = db.prepare('SELECT COUNT(*) as count FROM users').get().count;
      const hasUsers = userCount > 0;

      if (hasUsers && !ALLOW_NEW_ACCOUNTS) {
        Logger.error('OIDC registration blocked: New accounts not allowed');
        return res.redirect('/login?error=registration_disabled');
      }
    }

    const user = await userRepository.findOrCreateOIDCUser(
      userInfo,
      oidc.config.serverMetadata().issuer
    );

    if (user.is_active === 0 || user.is_active === false) {
      Logger.error('OIDC login blocked: Account deactivated');
      return res.redirect('/login?error=account_deactivated&message=Your account has been deactivated');
    }

    await userRepository.updateLastLogin(user.id);

    if (!hasUsers) {
      await up_v1_5_0_snippets(db, user.id);
    }

    const token = jwt.sign({
      id: user.id,
      username: user.username,
      id_token: tokens.id_token
    }, JWT_SECRET, {
      expiresIn: TOKEN_EXPIRY
    });

    // Set OIDC login config
    oidc.loggedIn = true;

    res.redirect(`${process.env.BASE_PATH || ''}/auth/callback?token=${token}`);
  } catch (error) {
    Logger.error('OIDC callback error:', error);
    let errorType = 'auth_failed';
    let errorDetails = '';

    if (error.message?.includes('state parameter')) {
      errorType = 'auth_failed';
      errorDetails = 'Your authentication session has expired';
    } else if (error.message?.includes('accounts disabled')) {
      errorType = 'registration_disabled';
    } else if (error.message?.includes('OIDC configuration')) {
      errorType = 'config_error';
    } else if (error.response?.status === 401 || error.response?.status === 403) {
      errorType = 'provider_error';
      errorDetails = 'Authorization denied by identity provider';
    }

    const messageParam = errorDetails ? `&message=${encodeURIComponent(errorDetails)}` : '';
    res.redirect(`/login?error=${errorType}${messageParam}`);
  }
});

export default router;
````

## File: server/src/routes/publicRoutes.js
````javascript
import express from 'express';
import snippetService from '../services/snippetService.js';
import Logger from '../logger.js';

const router = express.Router();

// Query parameter parser
function parseQueryParams(query) {
  const DEFAULT_LIMIT = 50;
  const MAX_LIMIT = 100;

  let limit = parseInt(query.limit) || DEFAULT_LIMIT;
  let offset = parseInt(query.offset) || 0;

  if (limit < 1) limit = DEFAULT_LIMIT;
  if (limit > MAX_LIMIT) limit = MAX_LIMIT;
  if (offset < 0) offset = 0;

  const categories = query.category
    ? query.category.split(',').map(c => c.trim().toLowerCase())
    : null;

  return {
    limit,
    offset,
    filters: {
      search: query.search || null,
      searchCode: query.searchCode === 'true',
      language: query.language || null,
      categories,
      favorites: query.favorites === 'true',
      pinned: query.pinned === 'true',
      recycled: query.recycled === 'true',
    },
    sort: query.sort || 'newest',
  };
}

router.get('/', async (req, res) => {
  try {
    const { limit, offset, filters, sort } = parseQueryParams(req.query);

    const { snippets, total } = await snippetService.getSnippetsPaginated({
      userId: null,  // null = public only
      filters,
      sort,
      limit,
      offset
    });

    res.json({
      data: snippets,
      pagination: {
        total,
        offset,
        limit,
        hasMore: offset + limit < total
      }
    });
  } catch (error) {
    Logger.error('Error fetching public snippets:', error);
    res.status(500).json({ error: 'Failed to fetch public snippets' });
  }
});

router.get('/metadata', async (req, res) => {
  try {
    const metadata = await snippetService.getMetadata(null);
    res.json(metadata);
  } catch (error) {
    Logger.error('Error fetching public metadata:', error);
    res.status(500).json({ error: 'Failed to fetch metadata' });
  }
});

// Raw public snippet endpoint for plain text access
router.get('/:id/:fragmentId/raw', async (req, res) => {
  try {
    const { id, fragmentId } = req.params;
    const snippet = await snippetService.findById(id);
    if (!snippet) {
      res.status(404).send('Snippet not found');
    } else {
      const fragment = snippet.fragments.find(fragment => fragment.id === parseInt(fragmentId));
      if (!fragment) {
        res.status(404).send('Fragment not found');
      } else {
        res.set('Content-Type', 'text/plain; charset=utf-8');
        // Remove carriage returns to fix bash script execution issues
        const normalizedCode = fragment.code.replace(/\r\n/g, '\n').replace(/\r/g, '\n');
        res.send(normalizedCode);
      }
    }
  } catch (error) {
    Logger.error('Error in GET /public/snippets/:id/raw:', error);
    res.status(500).send('Internal server error');
  }
});

router.get('/:id', async (req, res) => {
  try {
    const snippet = await snippetService.findById(req.params.id);
    if (!snippet) {
      res.status(404).json({ error: 'Snippet not found' });
    } else {
      res.json(snippet);
    }
  } catch (error) {
    Logger.error('Error in GET /public/snippets/:id:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

export default router;
````

## File: server/src/routes/shareRoutes.js
````javascript
import express from 'express';
import jwt from 'jsonwebtoken';
import { JWT_SECRET, authenticateToken } from '../middleware/auth.js';
import shareRepository from '../repositories/shareRepository.js';
import Logger from '../logger.js';

const router = express.Router();

router.post('/', authenticateToken, async (req, res) => {
  try {
    const { snippetId, requiresAuth, expiresIn } = req.body;
    const share = await shareRepository.createShare({
      snippetId,
      requiresAuth: !!requiresAuth,
      expiresIn: expiresIn ? parseInt(expiresIn) : null
    }, req.user.id);
    res.status(201).json(share);
  } catch (error) {
    Logger.error('Error creating share:', error);
    if (error.message === 'Unauthorized') {
      res.status(403).json({ error: 'You do not have permission to share this snippet' });
    } else if (error.message === 'Invalid snippet ID') {
      res.status(400).json({ error: 'Invalid snippet ID provided' });
    } else {
      res.status(500).json({ error: 'Failed to create share' });
    }
  }
});

router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const share = await shareRepository.getShare(id);
    
    if (!share) {
      return res.status(404).json({ error: 'Share not found' });
    }

    if (share.share?.requiresAuth) {
      const authHeader = req.headers['bytestashauth'];
      const token = authHeader && authHeader.split(' ')[1];

      if (!token) {
        return res.status(401).json({ error: 'Authentication required' });
      }

      try {
        jwt.verify(token, JWT_SECRET);
      } catch (err) {
        return res.status(401).json({ error: 'Invalid or expired token' });
      }
    }

    if (share.share?.expired) {
      return res.status(410).json({ error: 'Share has expired' });
    }

    res.json(share);
  } catch (error) {
    Logger.error('Error getting share:', error);
    res.status(500).json({ error: 'Failed to get share' });
  }
});

router.get('/snippet/:snippetId', authenticateToken, async (req, res) => {
  try {
    const { snippetId } = req.params;
    const shares = await shareRepository.getSharesBySnippetId(snippetId, req.user.id);
    res.json(shares);
  } catch (error) {
    Logger.error('Error listing shares:', error);
    res.status(500).json({ error: 'Failed to list shares' });
  }
});

router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    await shareRepository.deleteShare(id, req.user.id);
    res.json({ success: true });
  } catch (error) {
    Logger.error('Error deleting share:', error);
    res.status(500).json({ error: 'Failed to delete share' });
  }
});

export default router;
````

## File: server/src/routes/snippetRoutes.js
````javascript
import express from "express";
import snippetService from "../services/snippetService.js";
import Logger from "../logger.js";

const router = express.Router();

// Query parameter parser
function parseQueryParams(query) {
  const DEFAULT_LIMIT = 50;
  const MAX_LIMIT = 100;

  let limit = parseInt(query.limit) || DEFAULT_LIMIT;
  let offset = parseInt(query.offset) || 0;

  if (limit < 1) limit = DEFAULT_LIMIT;
  if (limit > MAX_LIMIT) limit = MAX_LIMIT;
  if (offset < 0) offset = 0;

  const categories = query.category
    ? query.category.split(',').map(c => c.trim().toLowerCase())
    : null;

  return {
    limit,
    offset,
    filters: {
      search: query.search || null,
      searchCode: query.searchCode === 'true',
      language: query.language || null,
      categories,
      favorites: query.favorites === 'true',
      pinned: query.pinned === 'true',
      recycled: query.recycled === 'true',
    },
    sort: query.sort || 'newest',
  };
}

// GET all snippets (with pagination and filtering)
router.get("/", async (req, res) => {
  try {
    const { limit, offset, filters, sort } = parseQueryParams(req.query);

    const { snippets, total } = await snippetService.getSnippetsPaginated({
      userId: req.user.id,
      filters,
      sort,
      limit,
      offset
    });

    res.json({
      data: snippets,
      pagination: {
        total,
        offset,
        limit,
        hasMore: offset + limit < total
      }
    });
  } catch (error) {
    Logger.error("Error fetching snippets:", error);
    res.status(500).json({ error: "Failed to fetch snippets" });
  }
});

router.post("/", async (req, res) => {
  try {
    const newSnippet = await snippetService.createSnippet(
      req.body,
      req.user.id
    );
    res.status(201).json(newSnippet);
  } catch (error) {
    Logger.error("Error in POST /snippets:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

router.delete("/:id", async (req, res) => {
  try {
    const result = await snippetService.deleteSnippet(
      req.params.id,
      req.user.id
    );
    if (!result) {
      res.status(404).json({ error: "Snippet not found" });
    } else {
      res.json({ id: result.id });
    }
  } catch (error) {
    Logger.error("Error in DELETE /snippets/:id:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

router.patch("/:id/restore", async (req, res) => {
  try {
    const result = await snippetService.restoreSnippet(
      req.params.id,
      req.user.id
    );
    if (!result) {
      res
        .status(404)
        .json({ error: "Snippet not found or not in recycle bin" });
    } else {
      res.json({ id: result.id });
    }
  } catch (error) {
    Logger.error("Error in PATCH /snippets/:id/restore:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

router.patch("/:id/recycle", async (req, res) => {
  try {
    const result = await snippetService.moveToRecycle(
      req.params.id,
      req.user.id
    );
    if (!result) {
      res
        .status(404)
        .json({ error: "Snippet not found or already moved to recycle bin" });
    } else {
      res.json({ id: result.id });
    }
  } catch (error) {
    Logger.error("Error in POST /snippets/:id/recycle:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// GET metadata
router.get("/metadata", async (req, res) => {
  try {
    const metadata = await snippetService.getMetadata(req.user.id);
    res.json(metadata);
  } catch (error) {
    Logger.error("Error fetching metadata:", error);
    res.status(500).json({ error: "Failed to fetch metadata" });
  }
});

// Removed /recycled route - use ?recycled=true instead

router.put("/:id", async (req, res) => {
  try {
    const updatedSnippet = await snippetService.updateSnippet(
      req.params.id,
      req.body,
      req.user.id
    );

    if (!updatedSnippet) {
      res.status(404).json({ error: "Snippet not found" });
    } else {
      res.json(updatedSnippet);
    }
  } catch (error) {
    Logger.error("Error in PUT /snippets/:id:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Raw snippet endpoint for plain text access
router.get("/:id/:fragmentId/raw", async (req, res) => {
  try {
    const { id, fragmentId } = req.params;
    const snippet = await snippetService.findById(id, req.user.id);
    if (!snippet) {
      res.status(404).send("Snippet not found");
    } else {
      const fragment = snippet.fragments.find(
        (fragment) => fragment.id === parseInt(fragmentId)
      );
      if (!fragment) {
        res.status(404).send("Fragment not found");
      } else {
        res.set("Content-Type", "text/plain; charset=utf-8");
        // Remove carriage returns to fix bash script execution issues
        const normalizedCode = fragment.code.replace(/\r\n/g, '\n').replace(/\r/g, '\n');
        res.send(normalizedCode);
      }
    }
  } catch (error) {
    Logger.error("Error in GET /snippets/:id/raw:", error);
    res.status(500).send("Internal server error");
  }
});

router.get("/:id", async (req, res) => {
  try {
    const snippet = await snippetService.findById(req.params.id, req.user.id);
    if (!snippet) {
      res.status(404).json({ error: "Snippet not found" });
    } else {
      res.json(snippet);
    }
  } catch (error) {
    Logger.error("Error in GET /snippets/:id:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Pin/unpin snippet
router.patch("/:id/pin", async (req, res) => {
  try {
    const { is_pinned } = req.body;
    const result = await snippetService.setPinned(
      req.params.id,
      is_pinned,
      req.user.id
    );
    if (!result) {
      res.status(404).json({ error: "Snippet not found" });
    } else {
      res.json(result);
    }
  } catch (error) {
    Logger.error("Error in PATCH /snippets/:id/pin:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Favorite/unfavorite snippet
router.patch("/:id/favorite", async (req, res) => {
  try {
    const { is_favorite } = req.body;
    const result = await snippetService.setFavorite(
      req.params.id,
      is_favorite,
      req.user.id
    );
    if (!result) {
      res.status(404).json({ error: "Snippet not found" });
    } else {
      res.json(result);
    }
  } catch (error) {
    Logger.error("Error in PATCH /snippets/:id/favorite:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

export default router;
````

## File: server/src/services/snippetService.js
````javascript
import Logger from "../logger.js";
import snippetRepository from "../repositories/snippetRepository.js";

class SnippetService {
  async getAllSnippets(userId) {
    try {
      Logger.debug("Service: Getting all snippets for user:", userId);
      const result = await snippetRepository.findAll(userId);
      Logger.debug(`Service: Retrieved ${result.length} snippets`);
      return result;
    } catch (error) {
      Logger.error("Service Error - getAllSnippets:", error);
      throw error;
    }
  }

  async getAllPublicSnippets() {
    try {
      Logger.debug("Service: Getting all public snippets");
      const result = await snippetRepository.findAllPublic();
      Logger.debug(`Service: Retrieved ${result.length} public snippets`);
      return result;
    } catch (error) {
      Logger.error("Service Error - getAllPublicSnippets:", error);
      throw error;
    }
  }

  async createSnippet(snippetData, userId) {
    try {
      Logger.debug("Service: Creating new snippet for user:", userId);
      const result = await snippetRepository.create({
        ...snippetData,
        userId,
        isPublic: snippetData.is_public || 0,
      });
      Logger.debug("Service: Created snippet with ID:", result.id);
      return result;
    } catch (error) {
      Logger.error("Service Error - createSnippet:", error);
      throw error;
    }
  }

  async moveToRecycle(id, userId) {
    try {
      Logger.debug(
        "Service: Moving snippet to recycle bin:",
        id,
        "for user:",
        userId
      );
      const result = await snippetRepository.moveToRecycle(id, userId);
      if (!result) {
        Logger.debug(
          "Service: Snippet not found or already moved to recycle bin"
        );
        return null;
      }
      Logger.debug("Service: Snippet moved to recycle bin successfully");
      return { id: result.id };
    } catch (error) {
      Logger.error("Service Error - moveToRecycle:", error);
      throw error;
    }
  }

  async getRecycledSnippets(userId) {
    try {
      // Ensure expired snippets are deleted before fetching recycled snippets
      this.deleteExpiredSnippets();

      Logger.debug("Service: Getting recycled snippets for user:", userId);
      const result = await snippetRepository.findAllDeleted(userId);
      Logger.debug(`Service: Retrieved ${result.length} recycled snippets`);
      return result;
      // return {};
    } catch (error) {
      Logger.error("Service Error - getRecycledSnippets:", error);
      throw error;
    }
  }

  async deleteExpiredSnippets() {
    try {
      Logger.debug("Service: Deleting expired snippets");
      await snippetRepository.deleteExpired();
      Logger.debug(`Service: Deleted expired snippets`);
    } catch (error) {
      Logger.error("Service Error - deleteExpiredSnippets:", error);
      throw error;
    }
  }

  async deleteSnippet(id, userId) {
    try {
      Logger.debug("Service: Deleting snippet:", id, "for user:", userId);
      const result = await snippetRepository.delete(id, userId);
      Logger.debug(
        "Service: Delete operation result:",
        result ? "Success" : "Not Found"
      );
      return result;
    } catch (error) {
      Logger.error("Service Error - deleteSnippet:", error);
      throw error;
    }
  }

  async restoreSnippet(id, userId) {
    try {
      Logger.debug("Service: Restoring snippet:", id, "for user:", userId);
      await snippetRepository.restore(id, userId);
      Logger.debug("Service: Restore operation result:", "Success");
      return { id };
    } catch (error) {
      Logger.error("Service Error - restoreSnippet:", error);
      throw error;
    }
  }

  async updateSnippet(id, snippetData, userId) {
    try {
      Logger.debug("Service: Updating snippet:", id, "for user:", userId);
      const result = await snippetRepository.update(
        id,
        {
          ...snippetData,
          isPublic: snippetData.is_public || 0,
        },
        userId
      );
      Logger.debug(
        "Service: Update operation result:",
        result ? "Success" : "Not Found"
      );
      return result;
    } catch (error) {
      Logger.error("Service Error - updateSnippet:", error);
      throw error;
    }
  }

  async findById(id, userId = null) {
    try {
      Logger.debug(
        "Service: Getting snippet:",
        id,
        userId != null ? `for user: ${userId}` : "(public access)"
      );
      const result = await snippetRepository.findById(id, userId);
      Logger.debug(
        "Service: Find by ID result:",
        result ? "Found" : "Not Found"
      );
      return result;
    } catch (error) {
      Logger.error("Service Error - findById:", error);
      throw error;
    }
  }

  async setPinned(id, value, userId) {
    try {
      Logger.debug(
        "Service: Setting pinned status for snippet:",
        id,
        "to:",
        value,
        "for user:",
        userId
      );
      const result = await snippetRepository.setPinned(id, value, userId);
      Logger.debug(
        "Service: Set pinned operation result:",
        result ? "Success" : "Not Found"
      );
      return result;
    } catch (error) {
      Logger.error("Service Error - setPinned:", error);
      throw error;
    }
  }

  async setFavorite(id, value, userId) {
    try {
      Logger.debug(
        "Service: Setting favorite status for snippet:",
        id,
        "to:",
        value,
        "for user:",
        userId
      );
      const result = await snippetRepository.setFavorite(id, value, userId);
      Logger.debug(
        "Service: Set favorite operation result:",
        result ? "Success" : "Not Found"
      );
      return result;
    } catch (error) {
      Logger.error("Service Error - setFavorite:", error);
      throw error;
    }
  }

  async getSnippetsPaginated({ userId, filters, sort, limit, offset }) {
    try {
      Logger.debug(
        "Service: Getting paginated snippets for user:",
        userId,
        "with filters:",
        filters,
        "sort:",
        sort,
        "limit:",
        limit,
        "offset:",
        offset
      );
      const result = await snippetRepository.findAllPaginated({
        userId,
        filters,
        sort,
        limit,
        offset
      });
      Logger.debug(
        `Service: Retrieved ${result.snippets.length} snippets, total: ${result.total}`
      );
      return result;
    } catch (error) {
      Logger.error("Service Error - getSnippetsPaginated:", error);
      throw error;
    }
  }

  async getMetadata(userId = null) {
    try {
      Logger.debug(
        "Service: Getting metadata for",
        userId !== null ? `user: ${userId}` : "public snippets"
      );
      const result = await snippetRepository.getMetadata(userId);
      Logger.debug(
        `Service: Retrieved ${result.categories.length} categories, ${result.languages.length} languages`
      );
      return result;
    } catch (error) {
      Logger.error("Service Error - getMetadata:", error);
      throw error;
    }
  }
}

export default new SnippetService();
````

## File: server/src/services/userService.js
````javascript
import Logger from '../logger.js';
import userRepository from '../repositories/userRepository.js';

class UserService {
  async createUser(username, password) {
    try {
      if (!username || username.length < 3 || username.length > 30) {
        throw new Error('Username must be between 3 and 30 characters');
      }

      if (!password || password.length < 8) {
        throw new Error('Password must be at least 8 characters');
      }

      if (!/^[a-zA-Z0-9_-]+$/.test(username)) {
        throw new Error('Username can only contain letters, numbers, underscores, and hyphens');
      }

      const existing = await userRepository.findByUsername(username);
      if (existing) {
        throw new Error('Username already exists');
      }

      return await userRepository.create(username, password);
    } catch (error) {
      Logger.error('Service Error - createUser:', error);
      throw error;
    }
  }

  async validateUser(username, password) {
    try {
      const user = await userRepository.findByUsername(username);
      if (!user) {
        return null;
      }

      const isValid = await userRepository.verifyPassword(user, password);
      if (!isValid) {
        return null;
      }

      const { password_hash, ...userWithoutPassword } = user;
      return userWithoutPassword;
    } catch (error) {
      Logger.error('Service Error - validateUser:', error);
      throw error;
    }
  }

  async findById(id) {
    try {
      return await userRepository.findById(id);
    } catch (error) {
      Logger.error('Service Error - findById:', error);
      throw error;
    }
  }

  async changePassword(userId, currentPassword, newPassword) {
    try {
      // Validate new password
      if (!newPassword || newPassword.length < 8) {
        throw new Error('New password must be at least 8 characters');
      }

      // Get user to verify current password
      const user = await userRepository.findByIdWithPassword(userId);
      if (!user) {
        throw new Error('User not found');
      }

      // Verify current password
      const isCurrentPasswordValid = await userRepository.verifyPassword(user, currentPassword);
      if (!isCurrentPasswordValid) {
        throw new Error('Current password is incorrect');
      }

      // Update password
      return await userRepository.updatePassword(userId, newPassword);
    } catch (error) {
      Logger.error('Service Error - changePassword:', error);
      throw error;
    }
  }
}

export default new UserService();
````

## File: server/src/utils/badWords.js
````javascript
import { Filter } from 'bad-words';
import Logger from '../logger.js';

class BadWordsChecker {
  constructor() {
    this.filter = new Filter();
    Logger.info(`Bad words filter initialized with ${this.filter.list.length} words`);
  }

  containsBadWords(text) {
    if (!text) {
      return false;
    }

    return this.filter.isProfane(text);
  }

  findBadWords(text) {
    if (!text) {
      return [];
    }

    const found = new Set();
    const lowerText = text.toLowerCase();

    // Check each word in the filter's list
    for (const badWord of this.filter.list) {
      // Use word boundaries to match whole words only
      const regex = new RegExp(`\\b${this.escapeRegex(badWord)}\\b`, 'i');
      if (regex.test(lowerText)) {
        found.add(badWord);
      }
    }

    return Array.from(found);
  }

  escapeRegex(string) {
    return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  }

  // Optional: Add custom words to the filter
  addWords(...words) {
    this.filter.addWords(...words);
    Logger.info(`Added ${words.length} custom words to filter`);
  }

  // Optional: Remove words from the filter
  removeWords(...words) {
    this.filter.removeWords(...words);
    Logger.info(`Removed ${words.length} words from filter`);
  }
}

export default new BadWordsChecker();
````

## File: server/src/app.js
````javascript
import express from "express";
import cookieParser from "cookie-parser";
import { initializeDatabase, shutdownDatabase } from "./config/database.js";
import snippetRoutes from "./routes/snippetRoutes.js";
import authRoutes from "./routes/authRoutes.js";
import shareRoutes from "./routes/shareRoutes.js";
import publicRoutes from "./routes/publicRoutes.js";
import oidcRoutes from "./routes/oidcRoutes.js";
import embedRoutes from "./routes/embedRoutes.js";
import apiKeyRoutes from "./routes/apiKeyRoutes.js";
import adminRoutes from "./routes/adminRoutes.js";
import { authenticateToken } from "./middleware/auth.js";
import { authenticateApiKey } from "./middleware/apiKeyAuth.js";
import { requireAdmin } from "./middleware/adminAuth.js";
import { fileURLToPath } from "url";
import { dirname, join } from "path";
import fs from "fs";
import swaggerUi from "swagger-ui-express";
import yaml from "yamljs";
import Logger from "./logger.js";

const app = express();
const PORT = 5000;

app.use(express.json({ limit: "2mb" }));
app.use(cookieParser());
app.set("trust proxy", true);

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const basePath = process.env.BASE_PATH || "";
const buildPath = join(__dirname, "../../client/build");
const assetsPath = join(buildPath, "assets");

const swaggerPath = join(__dirname, "../docs/swagger.yaml");
const swaggerDocument = yaml.load(swaggerPath);
app.use(
  `${basePath}/api-docs`,
  swaggerUi.serve,
  swaggerUi.setup(swaggerDocument)
);

app.use(`${basePath}/api/auth`, authRoutes);
app.use(`${basePath}/api/auth/oidc`, oidcRoutes);
app.use(`${basePath}/api/keys`, authenticateToken, apiKeyRoutes);
app.use(
  `${basePath}/api/snippets`,
  authenticateApiKey,
  authenticateToken,
  snippetRoutes
);
app.use(`${basePath}/api/share`, shareRoutes);
app.use(`${basePath}/api/public/snippets`, publicRoutes);
app.use(`${basePath}/api/embed`, embedRoutes);
app.use(`${basePath}/api/admin`, authenticateToken, requireAdmin, adminRoutes);

app.use(
  `${basePath}/manifest.json`,
  express.static(join(buildPath, "manifest.json"))
);

app.get("/", (req, res, next) => {
  if (basePath) {
    return res.redirect(basePath);
  }
  next();
});

app.use(`${basePath}/assets`, express.static(assetsPath));
app.use(
  `${basePath}/monacoeditorwork`,
  express.static(join(buildPath, "monacoeditorwork"))
);
app.use(basePath, express.static(buildPath, { index: false }));

/*
 * A bit of a hack, we need to manually rewrite the HTML to support base paths with ingress
 * If given a base path of /bytestash, the index.html file will still be using /assets/xyz.css
 * But of course the files are not there on ingress, so we need to change them to /bytestash/assets/xyz.css
 * It's a bit of a hacky mess but this is the only solution I figured out without directly modifying vite.config.ts
 * on the client, but this will affect everyone, so not a viable solution
 *
 * We're also injecting the base path into the HTML so that the client can know the value without relying on an
 * environment variable, which would be baked into the client code at build time, which is not acceptable in this case
 */
app.get(`${basePath}/*`, (req, res, next) => {
  if (req.url.startsWith(`${basePath}/api`)) {
    return next();
  }

  // Don't cache, if the base path changes the previous index.html file is still used which will have incorrect paths
  res.set({
    "Cache-Control": "no-store, no-cache, must-revalidate, proxy-revalidate",
    Pragma: "no-cache",
    Expires: "0",
  });

  fs.readFile(join(buildPath, "index.html"), "utf8", (err, data) => {
    if (err) {
      Logger.error("Failed to read index.html:", err);
      return res.status(500).send("Error loading index.html");
    }

    const modifiedHtml = data
      .replace(/(src|href)="\/assets\//g, `$1="${basePath}/assets/`)
      .replace(/\/monacoeditorwork\//g, `${basePath}/monacoeditorwork/`)
      .replace(/(href)="\/manifest\.json"/g, `$1="${basePath}/manifest.json"`)
      .replace(/(href)="\/favicon\.ico"/g, `$1="${basePath}/favicon.ico"`);

    const scriptInjection = `<script>window.__BASE_PATH__ = "${basePath}";</script>`;
    const injectedHtml = modifiedHtml.replace(
      "</head>",
      `${scriptInjection}</head>`
    );

    res.send(injectedHtml);
  });
});

function handleShutdown() {
  Logger.info("Received shutdown signal, starting graceful shutdown...");

  shutdownDatabase();

  process.exit(0);
}

(async () => {
  await initializeDatabase();

  return new Promise((resolve) => {
    app.listen(PORT, () => {
      Logger.info(`Server running on port ${PORT}`);
      resolve();
    });
  });
})();

process.on("SIGTERM", handleShutdown);
process.on("SIGINT", handleShutdown);
````

## File: server/src/logger.js
````javascript
const DEBUG = process.env.DEBUG === 'true';

class Logger {
  static debug(...args) {
    if (DEBUG) {
      console.log('[DEBUG]', ...args);
    }
  }

  static error(...args) {
    if (DEBUG) {
      console.error('[ERROR]', ...args);
    } else {
      const messages = args.map(arg => 
        arg instanceof Error ? arg.message : arg
      );
      console.error('[ERROR]', ...messages);
    }
  }

  static info(...args) {
    console.log('[INFO]', ...args);
  }
}

export default Logger;
````

## File: server/.gitignore
````
node_modules/
````

## File: server/package.json
````json
{
  "name": "bytestash-server",
  "version": "1.0.0",
  "main": "src/app.js",
  "type": "module",
  "scripts": {
    "start": "node src/app.js",
    "test": "jest"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "description": "",
  "dependencies": {
    "bad-words": "^4.0.0",
    "bcrypt": "^5.1.1",
    "better-sqlite3": "^11.5.0",
    "body-parser": "^1.20.3",
    "cookie-parser": "^1.4.7",
    "cors": "^2.8.5",
    "express": "^4.21.1",
    "jsonwebtoken": "^9.0.2",
    "multer": "^1.4.5-lts.1",
    "openid-client": "^6.1.3",
    "swagger-ui-express": "^5.0.1",
    "yamljs": "^0.3.0"
  },
  "engines": {
    "node": ">=22"
  }
}
````

## File: .gitignore
````
# db storage directory
data

node_modules
dist

kube.yml

docker-compose-dev.yaml

example-fragment.js
````

## File: docker-compose.sh
````bash
#!/usr/bin/env bash

set -e

# Check OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     OS_TYPE="linux" ;;
    Darwin*)    OS_TYPE="macos" ;;
    *)
        echo "❌ Unsupported OS: ${OS}"
        exit 1
        ;;
esac

echo "📱 ОС: ${OS_TYPE}"

# Check docker
if ! command -v docker >/dev/null 2>&1; then
    echo "❌ Docker not install"
    exit 1
fi

CMD=""

if docker compose version >/dev/null 2>&1; then
    CMD="docker compose"
    echo "🔧 Usage: docker compose (plugin)"
elif command -v docker-compose >/dev/null 2>&1; then
    CMD="docker-compose"
    echo "🔧 Usage: docker-compose (util)"
else
    echo "❌ Docker Compose not install!"
    echo ""
    echo "Install depending on the system:"
    echo "  Ubuntu (Docker-cli):    sudo apt install docker-compose-plugin"
    echo "  MacOS (Colima):         brew install colima docker docker-compose docker-buildx"
    echo "  Or:                     Docker Desktop"
    exit 1
fi

${CMD:?} -f docker-compose.yaml "$@"
````

## File: docker-compose.yaml
````yaml
services:
  server:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "5000:5000"
    environment:
      # e.g. write /bytestash for a domain such as my.domain/bytestash, leave blank in every other case
      - BASE_PATH=
      # optionally include additional allowed hosts for reverse proxies
      # e.g. localhost,my.domain.com,my.domain.net
      - ALLOWED_HOSTS=
      # Either provide JWT_SECRET directly or use JWT_SECRET_FILE for Docker secrets
      #- JWT_SECRET_FILE=/run/secrets/jwt
      - JWT_SECRET=your-secret
      # how long the token lasts, examples: "2 days", "10h", "7d", "1m", "60s"
      - TOKEN_EXPIRY=24h
      # is this bytestash instance open to new accounts being created?
      - ALLOW_NEW_ACCOUNTS=true
      # Should debug mode be enabled? Essentially enables logging, in most cases leave this as false
      - DEBUG=false
      # Should we use accounts at all? When enabled, it will be like starting a fresh account so export your snippets, no login required
      - DISABLE_ACCOUNTS=false
      # Should internal accounts be disabled?
      - DISABLE_INTERNAL_ACCOUNTS=false
      # Allow password changes (false by default)
      - ALLOW_PASSWORD_CHANGES=true

      # Optional: Enable OIDC for Single Sign On
      - OIDC_ENABLED=true
      # Optional: Display name for users signing in with SSO, will default to Single Sign-on
      - OIDC_DISPLAY_NAME=
      # Your OIDC issuer url, e.g. https://authentik.mydomain.com/application/o/bytestash/ for authentik
      - OIDC_ISSUER_URL=
      # Your OIDC client ID, you can find it in your app provider
      - OIDC_CLIENT_ID=
      # Your OIDC client secret, again, found in the app provider
      - OIDC_CLIENT_SECRET=
      # The OIDC scopes to request, e.g. "openid profile email groups"
      - OIDC_SCOPES=
      # Optional: Comma-separated list of usernames that should have admin privileges
      # e.g. "admin,jordan" - these users will have access to the admin panel
      - ADMIN_USERNAMES=admin
    volumes:
      - ./data:/data/snippets
# Uncomment to use docker secrets
#    secrets:
#      - jwt

#secrets:
#  jwt:
#    file: ./secrets/jwt.txt
````

## File: Dockerfile
````dockerfile
# Build stage for client
FROM node:22-alpine AS client-build
WORKDIR /app/client
COPY client/package.json ./
RUN npm install --package-lock-only
RUN npm ci
COPY client/ ./
RUN npm run build

# Production stage
FROM node:22-alpine AS production
WORKDIR /app

# Copy server source and dependencies
WORKDIR /app
COPY server/package.json ./
RUN apk add --no-cache --virtual .build-deps python3 make g++ gcc && \
      npm install --omit=dev && \
      apk del .build-deps

COPY server/src ./src
COPY server/docs ./docs

# Copy client build
COPY --from=client-build /app/client/build /client/build

# Create output directory
RUN mkdir -p ./data/snippets

EXPOSE 5000

CMD ["node", "src/app.js"]
````

## File: LICENSE
````
GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The GNU General Public License is a free, copyleft license for
software and other kinds of works.

  The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom to
share and change all versions of a program--to make sure it remains free
software for all its users.  We, the Free Software Foundation, use the
GNU General Public License for most of our software; it applies also to
any other work released this way by its authors.  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
them if you wish), that you receive source code or can get it if you
want it, that you can change the software or use pieces of it in new
free programs, and that you know you can do these things.

  To protect your rights, we need to prevent others from denying you
these rights or asking you to surrender the rights.  Therefore, you have
certain responsibilities if you distribute copies of the software, or if
you modify it: responsibilities to respect the freedom of others.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must pass on to the recipients the same
freedoms that you received.  You must make sure that they, too, receive
or can get the source code.  And you must show them these terms so they
know their rights.

  Developers that use the GNU GPL protect your rights with two steps:
(1) assert copyright on the software, and (2) offer you this License
giving you legal permission to copy, distribute and/or modify it.

  For the developers' and authors' protection, the GPL clearly explains
that there is no warranty for this free software.  For both users' and
authors' sake, the GPL requires that modified versions be marked as
changed, so that their problems will not be attributed erroneously to
authors of previous versions.

  Some devices are designed to deny users access to install or run
modified versions of the software inside them, although the manufacturer
can do so.  This is fundamentally incompatible with the aim of
protecting users' freedom to change the software.  The systematic
pattern of such abuse occurs in the area of products for individuals to
use, which is precisely where it is most unacceptable.  Therefore, we
have designed this version of the GPL to prohibit the practice for those
products.  If such problems arise substantially in other domains, we
stand ready to extend this provision to those domains in future versions
of the GPL, as needed to protect the freedom of users.

  Finally, every program is threatened constantly by software patents.
States should not allow patents to restrict development and use of
software on general-purpose computers, but in those that do, we wish to
avoid the special danger that patents applied to a free program could
make it effectively proprietary.  To prevent this, the GPL assures that
patents cannot be used to render the program non-free.

  The precise terms and conditions for copying, distribution and
modification follow.

                       TERMS AND CONDITIONS

  0. Definitions.

  "This License" refers to version 3 of the GNU General Public License.

  "Copyright" also means copyright-like laws that apply to other kinds of
works, such as semiconductor masks.

  "The Program" refers to any copyrightable work licensed under this
License.  Each licensee is addressed as "you".  "Licensees" and
"recipients" may be individuals or organizations.

  To "modify" a work means to copy from or adapt all or part of the work
in a fashion requiring copyright permission, other than the making of an
exact copy.  The resulting work is called a "modified version" of the
earlier work or a work "based on" the earlier work.

  A "covered work" means either the unmodified Program or a work based
on the Program.

  To "propagate" a work means to do anything with it that, without
permission, would make you directly or secondarily liable for
infringement under applicable copyright law, except executing it on a
computer or modifying a private copy.  Propagation includes copying,
distribution (with or without modification), making available to the
public, and in some countries other activities as well.

  To "convey" a work means any kind of propagation that enables other
parties to make or receive copies.  Mere interaction with a user through
a computer network, with no transfer of a copy, is not conveying.

  An interactive user interface displays "Appropriate Legal Notices"
to the extent that it includes a convenient and prominently visible
feature that (1) displays an appropriate copyright notice, and (2)
tells the user that there is no warranty for the work (except to the
extent that warranties are provided), that licensees may convey the
work under this License, and how to view a copy of this License.  If
the interface presents a list of user commands or options, such as a
menu, a prominent item in the list meets this criterion.

  1. Source Code.

  The "source code" for a work means the preferred form of the work
for making modifications to it.  "Object code" means any non-source
form of a work.

  A "Standard Interface" means an interface that either is an official
standard defined by a recognized standards body, or, in the case of
interfaces specified for a particular programming language, one that
is widely used among developers working in that language.

  The "System Libraries" of an executable work include anything, other
than the work as a whole, that (a) is included in the normal form of
packaging a Major Component, but which is not part of that Major
Component, and (b) serves only to enable use of the work with that
Major Component, or to implement a Standard Interface for which an
implementation is available to the public in source code form.  A
"Major Component", in this context, means a major essential component
(kernel, window system, and so on) of the specific operating system
(if any) on which the executable work runs, or a compiler used to
produce the work, or an object code interpreter used to run it.

  The "Corresponding Source" for a work in object code form means all
the source code needed to generate, install, and (for an executable
work) run the object code and to modify the work, including scripts to
control those activities.  However, it does not include the work's
System Libraries, or general-purpose tools or generally available free
programs which are used unmodified in performing those activities but
which are not part of the work.  For example, Corresponding Source
includes interface definition files associated with source files for
the work, and the source code for shared libraries and dynamically
linked subprograms that the work is specifically designed to require,
such as by intimate data communication or control flow between those
subprograms and other parts of the work.

  The Corresponding Source need not include anything that users
can regenerate automatically from other parts of the Corresponding
Source.

  The Corresponding Source for a work in source code form is that
same work.

  2. Basic Permissions.

  All rights granted under this License are granted for the term of
copyright on the Program, and are irrevocable provided the stated
conditions are met.  This License explicitly affirms your unlimited
permission to run the unmodified Program.  The output from running a
covered work is covered by this License only if the output, given its
content, constitutes a covered work.  This License acknowledges your
rights of fair use or other equivalent, as provided by copyright law.

  You may make, run and propagate covered works that you do not
convey, without conditions so long as your license otherwise remains
in force.  You may convey covered works to others for the sole purpose
of having them make modifications exclusively for you, or provide you
with facilities for running those works, provided that you comply with
the terms of this License in conveying all material for which you do
not control copyright.  Those thus making or running the covered works
for you must do so exclusively on your behalf, under your direction
and control, on terms that prohibit them from making any copies of
your copyrighted material outside their relationship with you.

  Conveying under any other circumstances is permitted solely under
the conditions stated below.  Sublicensing is not allowed; section 10
makes it unnecessary.

  3. Protecting Users' Legal Rights From Anti-Circumvention Law.

  No covered work shall be deemed part of an effective technological
measure under any applicable law fulfilling obligations under article
11 of the WIPO copyright treaty adopted on 20 December 1996, or
similar laws prohibiting or restricting circumvention of such
measures.

  When you convey a covered work, you waive any legal power to forbid
circumvention of technological measures to the extent such circumvention
is effected by exercising rights under this License with respect to
the covered work, and you disclaim any intention to limit operation or
modification of the work as a means of enforcing, against the work's
users, your or third parties' legal rights to forbid circumvention of
technological measures.

  4. Conveying Verbatim Copies.

  You may convey verbatim copies of the Program's source code as you
receive it, in any medium, provided that you conspicuously and
appropriately publish on each copy an appropriate copyright notice;
keep intact all notices stating that this License and any
non-permissive terms added in accord with section 7 apply to the code;
keep intact all notices of the absence of any warranty; and give all
recipients a copy of this License along with the Program.

  You may charge any price or no price for each copy that you convey,
and you may offer support or warranty protection for a fee.

  5. Conveying Modified Source Versions.

  You may convey a work based on the Program, or the modifications to
produce it from the Program, in the form of source code under the
terms of section 4, provided that you also meet all of these conditions:

    a) The work must carry prominent notices stating that you modified
    it, and giving a relevant date.

    b) The work must carry prominent notices stating that it is
    released under this License and any conditions added under section
    7.  This requirement modifies the requirement in section 4 to
    "keep intact all notices".

    c) You must license the entire work, as a whole, under this
    License to anyone who comes into possession of a copy.  This
    License will therefore apply, along with any applicable section 7
    additional terms, to the whole of the work, and all its parts,
    regardless of how they are packaged.  This License gives no
    permission to license the work in any other way, but it does not
    invalidate such permission if you have separately received it.

    d) If the work has interactive user interfaces, each must display
    Appropriate Legal Notices; however, if the Program has interactive
    interfaces that do not display Appropriate Legal Notices, your
    work need not make them do so.

  A compilation of a covered work with other separate and independent
works, which are not by their nature extensions of the covered work,
and which are not combined with it such as to form a larger program,
in or on a volume of a storage or distribution medium, is called an
"aggregate" if the compilation and its resulting copyright are not
used to limit the access or legal rights of the compilation's users
beyond what the individual works permit.  Inclusion of a covered work
in an aggregate does not cause this License to apply to the other
parts of the aggregate.

  6. Conveying Non-Source Forms.

  You may convey a covered work in object code form under the terms
of sections 4 and 5, provided that you also convey the
machine-readable Corresponding Source under the terms of this License,
in one of these ways:

    a) Convey the object code in, or embodied in, a physical product
    (including a physical distribution medium), accompanied by the
    Corresponding Source fixed on a durable physical medium
    customarily used for software interchange.

    b) Convey the object code in, or embodied in, a physical product
    (including a physical distribution medium), accompanied by a
    written offer, valid for at least three years and valid for as
    long as you offer spare parts or customer support for that product
    model, to give anyone who possesses the object code either (1) a
    copy of the Corresponding Source for all the software in the
    product that is covered by this License, on a durable physical
    medium customarily used for software interchange, for a price no
    more than your reasonable cost of physically performing this
    conveying of source, or (2) access to copy the
    Corresponding Source from a network server at no charge.

    c) Convey individual copies of the object code with a copy of the
    written offer to provide the Corresponding Source.  This
    alternative is allowed only occasionally and noncommercially, and
    only if you received the object code with such an offer, in accord
    with subsection 6b.

    d) Convey the object code by offering access from a designated
    place (gratis or for a charge), and offer equivalent access to the
    Corresponding Source in the same way through the same place at no
    further charge.  You need not require recipients to copy the
    Corresponding Source along with the object code.  If the place to
    copy the object code is a network server, the Corresponding Source
    may be on a different server (operated by you or a third party)
    that supports equivalent copying facilities, provided you maintain
    clear directions next to the object code saying where to find the
    Corresponding Source.  Regardless of what server hosts the
    Corresponding Source, you remain obligated to ensure that it is
    available for as long as needed to satisfy these requirements.

    e) Convey the object code using peer-to-peer transmission, provided
    you inform other peers where the object code and Corresponding
    Source of the work are being offered to the general public at no
    charge under subsection 6d.

  A separable portion of the object code, whose source code is excluded
from the Corresponding Source as a System Library, need not be
included in conveying the object code work.

  A "User Product" is either (1) a "consumer product", which means any
tangible personal property which is normally used for personal, family,
or household purposes, or (2) anything designed or sold for incorporation
into a dwelling.  In determining whether a product is a consumer product,
doubtful cases shall be resolved in favor of coverage.  For a particular
product received by a particular user, "normally used" refers to a
typical or common use of that class of product, regardless of the status
of the particular user or of the way in which the particular user
actually uses, or expects or is expected to use, the product.  A product
is a consumer product regardless of whether the product has substantial
commercial, industrial or non-consumer uses, unless such uses represent
the only significant mode of use of the product.

  "Installation Information" for a User Product means any methods,
procedures, authorization keys, or other information required to install
and execute modified versions of a covered work in that User Product from
a modified version of its Corresponding Source.  The information must
suffice to ensure that the continued functioning of the modified object
code is in no case prevented or interfered with solely because
modification has been made.

  If you convey an object code work under this section in, or with, or
specifically for use in, a User Product, and the conveying occurs as
part of a transaction in which the right of possession and use of the
User Product is transferred to the recipient in perpetuity or for a
fixed term (regardless of how the transaction is characterized), the
Corresponding Source conveyed under this section must be accompanied
by the Installation Information.  But this requirement does not apply
if neither you nor any third party retains the ability to install
modified object code on the User Product (for example, the work has
been installed in ROM).

  The requirement to provide Installation Information does not include a
requirement to continue to provide support service, warranty, or updates
for a work that has been modified or installed by the recipient, or for
the User Product in which it has been modified or installed.  Access to a
network may be denied when the modification itself materially and
adversely affects the operation of the network or violates the rules and
protocols for communication across the network.

  Corresponding Source conveyed, and Installation Information provided,
in accord with this section must be in a format that is publicly
documented (and with an implementation available to the public in
source code form), and must require no special password or key for
unpacking, reading or copying.

  7. Additional Terms.

  "Additional permissions" are terms that supplement the terms of this
License by making exceptions from one or more of its conditions.
Additional permissions that are applicable to the entire Program shall
be treated as though they were included in this License, to the extent
that they are valid under applicable law.  If additional permissions
apply only to part of the Program, that part may be used separately
under those permissions, but the entire Program remains governed by
this License without regard to the additional permissions.

  When you convey a copy of a covered work, you may at your option
remove any additional permissions from that copy, or from any part of
it.  (Additional permissions may be written to require their own
removal in certain cases when you modify the work.)  You may place
additional permissions on material, added by you to a covered work,
for which you have or can give appropriate copyright permission.

  Notwithstanding any other provision of this License, for material you
add to a covered work, you may (if authorized by the copyright holders of
that material) supplement the terms of this License with terms:

    a) Disclaiming warranty or limiting liability differently from the
    terms of sections 15 and 16 of this License; or

    b) Requiring preservation of specified reasonable legal notices or
    author attributions in that material or in the Appropriate Legal
    Notices displayed by works containing it; or

    c) Prohibiting misrepresentation of the origin of that material, or
    requiring that modified versions of such material be marked in
    reasonable ways as different from the original version; or

    d) Limiting the use for publicity purposes of names of licensors or
    authors of the material; or

    e) Declining to grant rights under trademark law for use of some
    trade names, trademarks, or service marks; or

    f) Requiring indemnification of licensors and authors of that
    material by anyone who conveys the material (or modified versions of
    it) with contractual assumptions of liability to the recipient, for
    any liability that these contractual assumptions directly impose on
    those licensors and authors.

  All other non-permissive additional terms are considered "further
restrictions" within the meaning of section 10.  If the Program as you
received it, or any part of it, contains a notice stating that it is
governed by this License along with a term that is a further
restriction, you may remove that term.  If a license document contains
a further restriction but permits relicensing or conveying under this
License, you may add to a covered work material governed by the terms
of that license document, provided that the further restriction does
not survive such relicensing or conveying.

  If you add terms to a covered work in accord with this section, you
must place, in the relevant source files, a statement of the
additional terms that apply to those files, or a notice indicating
where to find the applicable terms.

  Additional terms, permissive or non-permissive, may be stated in the
form of a separately written license, or stated as exceptions;
the above requirements apply either way.

  8. Termination.

  You may not propagate or modify a covered work except as expressly
provided under this License.  Any attempt otherwise to propagate or
modify it is void, and will automatically terminate your rights under
this License (including any patent licenses granted under the third
paragraph of section 11).

  However, if you cease all violation of this License, then your
license from a particular copyright holder is reinstated (a)
provisionally, unless and until the copyright holder explicitly and
finally terminates your license, and (b) permanently, if the copyright
holder fails to notify you of the violation by some reasonable means
prior to 60 days after the cessation.

  Moreover, your license from a particular copyright holder is
reinstated permanently if the copyright holder notifies you of the
violation by some reasonable means, this is the first time you have
received notice of violation of this License (for any work) from that
copyright holder, and you cure the violation prior to 30 days after
your receipt of the notice.

  Termination of your rights under this section does not terminate the
licenses of parties who have received copies or rights from you under
this License.  If your rights have been terminated and not permanently
reinstated, you do not qualify to receive new licenses for the same
material under section 10.

  9. Acceptance Not Required for Having Copies.

  You are not required to accept this License in order to receive or
run a copy of the Program.  Ancillary propagation of a covered work
occurring solely as a consequence of using peer-to-peer transmission
to receive a copy likewise does not require acceptance.  However,
nothing other than this License grants you permission to propagate or
modify any covered work.  These actions infringe copyright if you do
not accept this License.  Therefore, by modifying or propagating a
covered work, you indicate your acceptance of this License to do so.

  10. Automatic Licensing of Downstream Recipients.

  Each time you convey a covered work, the recipient automatically
receives a license from the original licensors, to run, modify and
propagate that work, subject to this License.  You are not responsible
for enforcing compliance by third parties with this License.

  An "entity transaction" is a transaction transferring control of an
organization, or substantially all assets of one, or subdividing an
organization, or merging organizations.  If propagation of a covered
work results from an entity transaction, each party to that
transaction who receives a copy of the work also receives whatever
licenses to the work the party's predecessor in interest had or could
give under the previous paragraph, plus a right to possession of the
Corresponding Source of the work from the predecessor in interest, if
the predecessor has it or can get it with reasonable efforts.

  You may not impose any further restrictions on the exercise of the
rights granted or affirmed under this License.  For example, you may
not impose a license fee, royalty, or other charge for exercise of
rights granted under this License, and you may not initiate litigation
(including a cross-claim or counterclaim in a lawsuit) alleging that
any patent claim is infringed by making, using, selling, offering for
sale, or importing the Program or any portion of it.

  11. Patents.

  A "contributor" is a copyright holder who authorizes use under this
License of the Program or a work on which the Program is based.  The
work thus licensed is called the contributor's "contributor version".

  A contributor's "essential patent claims" are all patent claims
owned or controlled by the contributor, whether already acquired or
hereafter acquired, that would be infringed by some manner, permitted
by this License, of making, using, or selling its contributor version,
but do not include claims that would be infringed only as a
consequence of further modification of the contributor version.  For
purposes of this definition, "control" includes the right to grant
patent sublicenses in a manner consistent with the requirements of
this License.

  Each contributor grants you a non-exclusive, worldwide, royalty-free
patent license under the contributor's essential patent claims, to
make, use, sell, offer for sale, import and otherwise run, modify and
propagate the contents of its contributor version.

  In the following three paragraphs, a "patent license" is any express
agreement or commitment, however denominated, not to enforce a patent
(such as an express permission to practice a patent or covenant not to
sue for patent infringement).  To "grant" such a patent license to a
party means to make such an agreement or commitment not to enforce a
patent against the party.

  If you convey a covered work, knowingly relying on a patent license,
and the Corresponding Source of the work is not available for anyone
to copy, free of charge and under the terms of this License, through a
publicly available network server or other readily accessible means,
then you must either (1) cause the Corresponding Source to be so
available, or (2) arrange to deprive yourself of the benefit of the
patent license for this particular work, or (3) arrange, in a manner
consistent with the requirements of this License, to extend the patent
license to downstream recipients.  "Knowingly relying" means you have
actual knowledge that, but for the patent license, your conveying the
covered work in a country, or your recipient's use of the covered work
in a country, would infringe one or more identifiable patents in that
country that you have reason to believe are valid.

  If, pursuant to or in connection with a single transaction or
arrangement, you convey, or propagate by procuring conveyance of, a
covered work, and grant a patent license to some of the parties
receiving the covered work authorizing them to use, propagate, modify
or convey a specific copy of the covered work, then the patent license
you grant is automatically extended to all recipients of the covered
work and works based on it.

  A patent license is "discriminatory" if it does not include within
the scope of its coverage, prohibits the exercise of, or is
conditioned on the non-exercise of one or more of the rights that are
specifically granted under this License.  You may not convey a covered
work if you are a party to an arrangement with a third party that is
in the business of distributing software, under which you make payment
to the third party based on the extent of your activity of conveying
the work, and under which the third party grants, to any of the
parties who would receive the covered work from you, a discriminatory
patent license (a) in connection with copies of the covered work
conveyed by you (or copies made from those copies), or (b) primarily
for and in connection with specific products or compilations that
contain the covered work, unless you entered into that arrangement,
or that patent license was granted, prior to 28 March 2007.

  Nothing in this License shall be construed as excluding or limiting
any implied license or other defenses to infringement that may
otherwise be available to you under applicable patent law.

  12. No Surrender of Others' Freedom.

  If conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot convey a
covered work so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you may
not convey it at all.  For example, if you agree to terms that obligate you
to collect a royalty for further conveying from those to whom you convey
the Program, the only way you could satisfy both those terms and this
License would be to refrain entirely from conveying the Program.

  13. Use with the GNU Affero General Public License.

  Notwithstanding any other provision of this License, you have
permission to link or combine any covered work with a work licensed
under version 3 of the GNU Affero General Public License into a single
combined work, and to convey the resulting work.  The terms of this
License will continue to apply to the part which is the covered work,
but the special requirements of the GNU Affero General Public License,
section 13, concerning interaction through a network will apply to the
combination as such.

  14. Revised Versions of this License.

  The Free Software Foundation may publish revised and/or new versions of
the GNU General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

  Each version is given a distinguishing version number.  If the
Program specifies that a certain numbered version of the GNU General
Public License "or any later version" applies to it, you have the
option of following the terms and conditions either of that numbered
version or of any later version published by the Free Software
Foundation.  If the Program does not specify a version number of the
GNU General Public License, you may choose any version ever published
by the Free Software Foundation.

  If the Program specifies that a proxy can decide which future
versions of the GNU General Public License can be used, that proxy's
public statement of acceptance of a version permanently authorizes you
to choose that version for the Program.

  Later license versions may give you additional or different
permissions.  However, no additional obligations are imposed on any
author or copyright holder as a result of your choosing to follow a
later version.

  15. Disclaimer of Warranty.

  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

  16. Limitation of Liability.

  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

  17. Interpretation of Sections 15 and 16.

  If the disclaimer of warranty and limitation of liability provided
above cannot be given local legal effect according to their terms,
reviewing courts shall apply local law that most closely approximates
an absolute waiver of all civil liability in connection with the
Program, unless a warranty or assumption of liability accompanies a
copy of the Program in return for a fee.

                     END OF TERMS AND CONDITIONS

            How to Apply These Terms to Your New Programs

  If you develop a new program, and you want it to be of the greatest
possible use to the public, the best way to achieve this is to make it
free software which everyone can redistribute and change under these terms.

  To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
state the exclusion of warranty; and each file should have at least
the "copyright" line and a pointer to where the full notice is found.

    <one line to give the program's name and a brief idea of what it does.>
    Copyright (C) <year>  <name of author>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

Also add information on how to contact you by electronic and paper mail.

  If the program does terminal interaction, make it output a short
notice like this when it starts in an interactive mode:

    <program>  Copyright (C) <year>  <name of author>
    This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
    This is free software, and you are welcome to redistribute it
    under certain conditions; type `show c' for details.

The hypothetical commands `show w' and `show c' should show the appropriate
parts of the General Public License.  Of course, your program's commands
might be different; for a GUI interface, you would use an "about box".

  You should also get your employer (if you work as a programmer) or school,
if any, to sign a "copyright disclaimer" for the program, if necessary.
For more information on this, and how to apply and follow the GNU GPL, see
<https://www.gnu.org/licenses/>.

  The GNU General Public License does not permit incorporating your program
into proprietary programs.  If your program is a subroutine library, you
may consider it more useful to permit linking proprietary applications with
the library.  If this is what you want to do, use the GNU Lesser General
Public License instead of this License.  But first, please read
<https://www.gnu.org/licenses/why-not-lgpl.html>.
````

## File: package.json
````json
{
  "name": "bytestash",
  "description": "A React and node.js app that stores code snippets",
  "author": "Jordan Dalby",
  "version": "1.0.0",
  "main": "server/app.js",
  "scripts": {
    "start": "cd client && npm start",
    "server": "cd server && npm start",
    "dev": "./docker-compose.sh up --build"
  },
  "workspaces": [
    "client",
    "server"
  ],
  "engines": {
    "node": ">=22"
  }
}
````

## File: README.md
````markdown
# ByteStash
<p align="center">
  <img src="https://raw.githubusercontent.com/jordan-dalby/ByteStash/refs/heads/main/client/public/logo192.png" />
</p>

ByteStash is a self-hosted web application designed to store, organise, and manage your code snippets efficiently. With support for creating, editing, and filtering snippets, ByteStash helps you keep track of your code in one secure place.

![ByteStash App](https://raw.githubusercontent.com/jordan-dalby/ByteStash/refs/heads/main/media/app-image.png)

## Demo
Check out the [ByteStash demo](https://bytestash-demo.pikapod.net/) powered by PikaPods!  
Username: demo  
Password: demodemo

## Features
- Create and Edit Snippets: Easily add new code snippets or update existing ones with an intuitive interface.
- Filter by Language and Content: Quickly find the right snippet by filtering based on programming language or keywords in the content.
- Secure Storage: All snippets are securely stored in a sqlite database, ensuring your code remains safe and accessible only to you.

## Howto
### Unraid
ByteStash is now on the Unraid App Store! Install it from [there](https://unraid.net/community/apps).

### PikaPods
Also available on [PikaPods](https://www.pikapods.com/) for [1-click install](https://www.pikapods.com/pods?run=bytestash) from $1/month.

### Docker
ByteStash can also be hosted manually via the docker-compose file:
```yaml
services:
  bytestash:
    image: "ghcr.io/jordan-dalby/bytestash:latest"
    restart: always
    volumes:
      - /your/snippet/path:/data/snippets
    ports:
      - "5000:5000"
    environment:
      # See https://github.com/jordan-dalby/ByteStash/wiki/FAQ#environment-variables
      #ALLOWED_HOSTS: localhost,my.domain.com,my.domain.net
      BASE_PATH: ""
      JWT_SECRET: your-secret
      TOKEN_EXPIRY: 24h
      ALLOW_NEW_ACCOUNTS: "true"
      DEBUG: "true"
      DISABLE_ACCOUNTS: "false"
      DISABLE_INTERNAL_ACCOUNTS: "false"

      # See https://github.com/jordan-dalby/ByteStash/wiki/Single-Sign%E2%80%90on-Setup for more info
      OIDC_ENABLED: "false"
      OIDC_DISPLAY_NAME: ""
      OIDC_ISSUER_URL: ""
      OIDC_CLIENT_ID: ""
      OIDC_CLIENT_SECRET: ""
      OIDC_SCOPES: ""
```

## Tech Stack
- Frontend: React, Tailwind CSS
- Backend: Node.js, Express
- Containerisation: Docker

## API Documentation
Once the server is running you can explore the API via Swagger UI. Open
`/api-docs` in your browser to view the documentation for all endpoints.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any improvements or bug fixes.

### I18n
To add phrases for a new language, follow these steps. Example for `fr` locale:
- Add the locale name to the `Locale` enum in the `client/src/i18n/types.ts` file
- Add the locale name to the `locales` array in the `client/i18next.config.ts` file
- Run translation synchronization: `cd client && npm run i18n:extract`
- Replace all `__TRANSLATE_ME__` lines with the desired phrases
- Create new resources file as `client/src/i18n/resources/fr.ts`
- Update export resources in file `client/src/i18n/resources/index.ts`
- Run the server in development mode: `npm run dev`
- Run the client in development mode: `cd client && npm run start`
````
