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

## [1.0.0] - 2026-11-12
### Added
- `style` skill with `Cloud`, `Comment`, `Reference`, `Codeowners`, `Changelog`, `Planning` and `Security` extensions.
- `ops` skill with `Notation`, `Terraform` and `Python` extensions.
- `obsidian` skill with the `Obsidian` extension.
- `AGENTS.md`, applying the `style` skill to every agent task and the `ops` and `obsidian` skills to matching tasks, and `CLAUDE.md` importing it.
- `.github/CODEOWNERS`, with `CODEOWNERS_TEMPLATE`, `CHANGELOG_TEMPLATE` and `PULL_REQUEST_TEMPLATE` directories.
- Default `.github/pull_request_template.md` with "Summary", "Changelog", "Examples", "Testing" and "Comments" sections.
- Fedora-based `askillsAgent.dockerfile` image under `Dockerfiles/Copilot`, with Visual Studio Code, GitHub Copilot App, GitHub Copilot CLI and `git`.
- Fedora-based `askillsAgent.dockerfile` image under `Dockerfiles/Claude`, with Visual Studio Code, the Claude Code extension, Claude Desktop App and Claude Code CLI.
- Downloaded installers and cached `.vsix` packages are removed in the same image layer, to keep both images small.
- Firefox as the default browser, with a `vscode://` URL handler and dark mode in the container.
- `entrypoint.sh` for each image, with `copilot-vsc`/`claude-vsc` (default), `copilot-app`/`claude-app`, `copilot-cli`/`claude-cli`, `browser` and `terminal` sub-commands.
- `Dockerfiles/vsc-settings.json` shared by both images, with Copilot settings listed before Claude Code settings.
- `Dockerfiles/SETTINGS.md` with Claude Code and GitHub Copilot extension settings as tables, with ToC and references.
- `Dockerfiles/README.md` with the Podman run command and per-image commands, and `Dockerfiles/SUB-COMMANDS.md`.
- `README.md` with metadata, features, setup, usage, repository structure, Podman socket troubleshooting and example screenshots of both images.
- `TO-DO.md` with the planned SELinux confinement of the container.
- `.gitignore` excluding `Dockerfiles/PERSONAL.md`.
- `CHANGELOG.md`.

### Security
- Containers run with `--cap-drop=ALL`, `no-new-privileges` and `--userns=keep-id`, with only the selected folders mounted and `/run/user/1000` as an in-memory `tmpfs`.
- `openssl3-libs` is installed in both images, so Visual Studio Code can verify extension signatures on Fedora 45+.
- Known issue: SELinux labelling is disabled with `--security-opt label=disable`, because the default labels block the Wayland socket and `/dev/dri`. Confinement is planned in `TO-DO.md`.
