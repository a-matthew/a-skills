# ToC
- [ToC](#toc)
- [Podman](#podman)
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

The `--security-opt label=disable` flag turns off SELinux labelling for the container, because the default labels block access to the Wayland socket and `/dev/dri`, which the window needs. The container stays isolated by namespaces, dropped capabilities and `--userns=keep-id`.

# Extensions
In order to adjust `vsc-settings.json` either have a look personally into the [SETTINGS.md](SETTINGS.md) file, where all up-to-date (more or less) settings for both Claude and Copilot are defined, or task the agent with updating it itself.