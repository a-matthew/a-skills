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
  docker.io/library/askillsagent code