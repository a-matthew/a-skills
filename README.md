<sup>This skills bundle has been generated using ['A-Skills'](https://github.com/a-matthew/a-skills).</sup>

## Metadata
<!-- - Author: {author-profile-name}/{author-alias}. -->
- Name: 'A-Skills'.
- Purpose: Enforcing agent skills (in a sandbox).
- Format: Markdown / 'Agent Skills' framework.
- License:
  - This project's license: [GNU General Public License v3.0](LICENSE)
  <!-- - Dependency-1: [{dependency-name}({license-1-name})] -->
  <!-- - Dependency-2: [{dependency-name}({license-2-name})] -->

## Setup
### Dependencies:
  - None (Any OS, no-isolation)
  - Gnome Boxes VM (Linux, full-isolation)
  - Podman (Linux, full isolation)

### Installation:
- clone the repository <sub>duh</sub>
- (optionally) rename the folder to .github or .claude or .agents, depending on the harness, per
[documentation](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills) by GitHub.
- (optionally) adjust Visual Studio Code settings per settings.json snippet.
#### Linux-only
- (optionally) install Gnome Boxes (e.g. Flathub)
- (optionally) install Podman Desktop (e.g. Flathub)
  - check whether the Podman socket is running
    - `systemctl --user enable podman.socket`
    - `systemctl --user start podman.socket`
    - `systemctl status --user podman.socket`
      - it should not be dead, but occassionally it embraces this state.
      - the command starts Podman Desktop (Flatpak) in CLI mode with an `ls` command to read the socket, the `spawn` command creates a test podman process.
      - `flatpak run --command=sh io.podman_desktop.PodmanDesktop -c \
  'ls -l $XDG_RUNTIME_DIR/podman/; flatpak-spawn --host podman --version'`
      - test if there any any stale connections using `podman system connection list`
      - if nothing seems wrong then congrats. Perhaps like myself you managed to spawn so many processes on the OS that system has random issues. I ocassionally experience this in GitKraken's [`"file watching failed to start for this repository"`](https://help.gitkraken.com/gitkraken-desktop/common-issues/#file-watching-failed-to-start) error, but also with Gnome system monitor's `"Unable to find default local file monitor type"`.
      - close some VSC instances, browser windows, or restart the host. Essentially increase `fs.inotify.max_user_watches` and `inotify.max_user_instances`, per my [article](https://blog.amatthew.eu/diagnosing-podman-desktop).

### Usage:
  - no-isolation
    - In this mode the skills in this repository can be used as-is and the agents roam free across the entire host operating system, performing the magic of `rm` or alike on random files :thumbsup:.
  - Gnome Boxes
    - In this mode the skills in this repository can be used inside a VM. Gnome Boxes offers the majority of Linux distributions on a drop-down list. The operator can select which files on the host are shared with the guest OS. This is not a very performant setup, as there is significant lag and also I/O issues when operating inside guest OS's VSC and CLIs. Mostly *click-ops* type of setup.
  - Podman (container)
    - In this mode the skills in this repository can be used inside a container. Podman may build the included .Dockerfile with dependencies for Visual Studio Code with GitHub Copilot extension, GitHub Copilot App, GitHub Copilot CLI.
    - Most likely the ideal solution.

## Example
### Podman (container)
![A-Skills Agent container with Wayland passthrough](askillsagent-podman-wayland.png)
