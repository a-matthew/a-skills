#!/usr/bin/env bash
set -euo pipefail

# Start a D-Bus session, then reruns the script inside. Requirement for Ptyxis
#if [[ -z "${DBUS_SESSION_BUS_ADDRESS:-}" ]] && command -v dbus-run-session >/dev/null; then
#  exec dbus-run-session -- "$0" "$@"
#fi

F=(--no-sandbox --disable-gpu-sandbox --password-store=basic --ozone-platform=wayland --enable-features=UseOzonePlatform,WaylandWindowDecorations)
command="${1:-code}"
if (($# > 0)); then shift; fi

case "$command" in
  claude-vsc)
    args=("$@")
    ((${#args[@]})) || args=(/workspaces)
    exec /usr/share/code/code --wait "${F[@]}" "${args[@]}"
    ;;
  claude-app)
    exec claude-desktop "${F[@]}" "$@"
    ;;
  claude-cli)
    exec claude "$@"
    ;;
  browser)
    exec firefox "$@"
    ;;
  terminal)
    exec bash -l
    ;;
  *)
    exec "$command" "$@"
    ;;
esac
