#!/usr/bin/env bash
set -euo pipefail

F=(--no-sandbox --disable-gpu-sandbox --password-store=basic --ozone-platform=wayland --enable-features=UseOzonePlatform,WaylandWindowDecorations)
command="${1:-code}"
if (($# > 0)); then shift; fi

case "$command" in
  code)
    args=("$@")
    ((${#args[@]})) || args=(/workspaces)
    exec /usr/share/code/code --wait "${F[@]}" "${args[@]}"
    ;;
  app)
    exec copilot-app "${F[@]}" "$@"
    ;;
  cli)
    exec copilot "$@"
    ;;
  browser)
    exec firefox "$@"
    ;;
  shell)
    exec bash -l
    ;;
  *)
    exec "$command" "$@"
    ;;
esac
