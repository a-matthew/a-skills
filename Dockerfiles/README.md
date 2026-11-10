# ToC
- [ToC](#toc)
- [Podman](#podman)
  - [Commands](#commands)
    - [GitHub Copilot image](#github-copilot-image)
    - [Claude Code image](#claude-code-image)
- [Extensions](#extensions)

# Podman
In order to start the container, first build the container using one of the Docker images under `Dockerfiles`.

There are two types of images:
- Claude Code based agent
- Copilot based agent

Subsequently, in order to run a built image, run Podman with the following command (replace `copilot-vsc` with `claude-vsc` if using Claude Code instead):

```Bash
podman run --rm -it --name askillsagent \
  --userns=keep-id:uid=1000,gid=1000 \
  --cap-drop=ALL --security-opt=no-new-privileges --security-opt label=disable \
  --device /dev/dri --shm-size=1g --hostname sandbox \
  --mount type=tmpfs,destination=/run/user/1000,tmpfs-mode=0700,U=true \
  -e WAYLAND_DISPLAY -e XDG_RUNTIME_DIR=/run/user/1000 \
  -v "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/run/user/1000/$WAYLAND_DISPLAY" \
  -e ELECTRON_OZONE_PLATFORM_HINT=wayland -e MOZ_ENABLE_WAYLAND=1 \
  -v askillsagent-home:/home/agent \
  -v askillsagent-workspaces:/workspaces \
  -v "$HOME/askillsagent:/workspaces/main-workspace" \
  -v "{host-path}/a-skills/.github:/workspaces/.github" \
  -v "{host-path}/a-skills/AGENTS.md:/workspaces/AGENTS.md" \
  -v "{host-path}/a-skills/CLAUDE.md:/workspaces/CLAUDE.md" \
  docker.io/library/askillsagent copilot-vsc
```
Files may be dropped into the host's `$HOME/askillsagent` directory, or multiple different directories can be mounted under their own appropriate names.

In this simple way entire working directories can be easily exposed to the agent ad-hoc, while making sure it does not crawl into every file of the host by default.

> **Known issue:** The `--security-opt label=disable` flag turns off SELinux labelling for the container, because the default labels block access to the Wayland socket and `/dev/dri`, which the window needs. The container stays isolated by namespaces, dropped capabilities and `--userns=keep-id`.

## Commands
Each image starts one app as entrypoint (VSC by default), which may be overwritten by one of the entrypoint's options passed at the end of the `podman run` command (e.g. `copilot-cli` instead of `copilot-vsc`). The same entry options can be run in VSC's terminal inside a running container using the system paths and they are documented in the table below.

### GitHub Copilot image
| Entrypoint | App | Direct command in the container |
|---|---|---|
| `copilot-vsc` (default) | Visual Studio Code | — |
| `copilot-app` | GitHub Copilot App | `copilot-app` |
| `copilot-cli` | GitHub Copilot CLI | `copilot` |
| `browser` | Firefox | `firefox` |
| `terminal` | Bash login shell | `foot` |

### Claude Code image
| Entrypoint | App | Direct command in the container |
|---|---|---|
| `claude-vsc` | Visual Studio Code | — |
| `claude-app` | Claude Desktop App | `claude-desktop --no-sandbox --no-zygote --disable-gpu-sandbox --password-store=basic --ozone-platform=wayland` |
| `claude-cli` | Claude Code CLI | `claude` |
| `browser` | Firefox | `firefox` |
| `terminal` | Bash login shell | `foot` |

> **Note:** GitHub Copilot is built into Visual Studio Code and enabled by default, also in the Claude Code image. To (optionally) avoid confusion between the Copilot and Claude Code tools, it may be the best to disable some settings in the personal `settings.json` (see [SETTINGS.md](SETTINGS.md)):
> - `"chat.agent.enabled": false` disables only the Copilot agent mode, which runs tools and terminal commands.
> - `"chat.disableAIFeatures": true` disables all built-in AI features, including Copilot chat, inline suggestions and the Copilot extensions.

The GitHub Copilot CLI (`copilot`), the GitHub Copilot App (`copilot-app`) and the Claude Code CLI (`claude`) start without any extra parameters.

> **Known issue:** the Claude Desktop App is the only exception in this image. It needs the `--no-sandbox`, `--no-zygote` and `--disable-gpu-sandbox` flags, because the container's `--cap-drop=ALL` and `no-new-privileges` options prevent the Chromium sandbox from starting. Without them, it fails with "Zygote process exited prematurely with exit code -1".

# Extensions
In order to adjust `vsc-settings.json` either have a look personally into the [SETTINGS.md](SETTINGS.md) file, where all up-to-date (more or less) settings for both Claude and Copilot are defined, or task the agent with updating it itself.