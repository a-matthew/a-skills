# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!--
Template
## [{version}] - {YYYY-MM-DD}

### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security
-->

## [Unreleased] - 2026-11-08
### Added
- `style` skill with `Cloud`, `Terraform`, `Obsidian`, `Comment`, `Reference`, `Codeowners`, `Changelog` and `Security` extensions.
- `AGENTS.md` and `CLAUDE.md`, applying the `style` skill to every agent task.
- `.github/CODEOWNERS`, with `CODEOWNERS_TEMPLATE`, `CHANGELOG_TEMPLATE` and `PULL_REQUEST_TEMPLATE` directories.
- Fedora-based `askillsAgent.dockerfile` images under `Dockerfiles/Copilot` and `Dockerfiles/Claude`, with Visual Studio Code, GitHub Copilot App, GitHub Copilot CLI and `git`.
- Firefox as the default browser, with a `vscode://` URL handler and dark mode in the container.
- `entrypoint.sh` for each image, with `copilot-vsc` (default), `copilot-app`, `copilot-cli`, `browser` and `terminal` sub-commands in the Copilot image.
- `Dockerfiles/vsc-settings.json` shared by both images, with Copilot settings listed before Claude Code settings.
- `Dockerfiles/SETTINGS.md` with Claude Code and GitHub Copilot extension settings as tables, with ToC and references.
- `Dockerfiles/README.md` with the Podman run command, and `Dockerfiles/SUB-COMMANDS.md`.
- `README.md` with metadata, setup, usage, Podman socket troubleshooting, build context and example screenshots.
- `.gitignore` excluding `Dockerfiles/PERSONAL.md`.
- `CHANGELOG.md`.
