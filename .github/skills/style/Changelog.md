<!-- This skills bundle has been generated using 'A-Skills' (https://github.com/a-matthew/a-skills). -->
# Changelog conventions

## Semantic:
- Adhere to the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) framework for `CHANGELOG.md` file updates, or creation, unless overwritten by the directives.
- Each `version` sub-header of the `CHANGELOG.md` must be a title representing the `git tag` (version) of the project encapsulated in '[]' (square brackets), followed by a ' ' (space), '-' (dash), ' ' (space) symbols with the tag's date in 'YYYY-MM-DD' format appended right after.
- Each `version` sub-header must contain appropriate sub-sub-headers, which represent scope of changes in the following keyword-based categories: "Added", "Changed", "Deprecated", "Removed", "Fixed", "Security", but add only categories that contain changes.
- Omit the version comparison links.
- Ignore any comments present in the `CHANGELOG.md` file.
- The changes for each category should be items of a list.

## Technical:
- If the `CHANGELOG.md` file is missing and a template exists under `.github/CHANGELOG_TEMPLATE` directory, then use it for creating the `CHANGELOG.md` file.
- If a `CHANGELOG.md` file already exists and the compliant template also exists, then update the `CHANGELOG.md` file according to the template and the scope of changes in either the current commit, context window, or feature branch.
- If current changes are a part of a `git tag` not yet present on the remote, then use that tag as the `version` sub-header.
- If such a tag does not exist, then treat all new changes as belonging to the `Unreleased` sub-header, which is put before the latest `version` sub-header.
- The `Unreleased` sub-header uses the current date.
- Should a `git tag` appear after the most recent `version`, the `Unreleased` changes are moved into that tag's sub-header (version).
- The scope of project updates summarised in the file must reflect all commits in the current branch. Notify the Operator if there is a discrepancy.
- Do not update `CHANGELOG.md` file if the current work branch is set to either of: `develop`, `dev`, `main`, `production`, `master`, `release`, or `develop/*`, `dev/*`, `main/*`, `production/*`, `master/*`, `release/*`, unless explicitly requested to do so.
- If the current work branch is set to either of: `develop`, `dev`, `main`, `production`, `master`, `release`, or `develop/*`, `dev/*`, `main/*`, `production/*`, `master/*`, `release/*` and the `CHANGELOG.md` seems outdated, then point out this fact to the Operator and ask how to proceed.
- If neither `CHANGELOG.md` file, nor a template under the `.github/CHANGELOG_TEMPLATE` directory exists then do not create the file automatically, but rather point this out to the Operator and ask how to proceed.
- The template may take precedence over directives in this skill, but should remain largely consistent with them. If conflicting directives are defined within the template, use the directives from the template.
- If a `CHANGELOG.md` file exists and the template under the `.github/CHANGELOG_TEMPLATE` directory also exists, but is incompatible, then notify the Operator of the conflict and ask how to proceed.
- If a directives incompatible `CHANGELOG.md` file exists then notify the Operator of the conflict. Otherwise, compatible files should be processed as defined by the directives.