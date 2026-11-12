## As an Operator, I want the container confined by SELinux without breaking the Wayland window
- Generate a dedicated SELinux policy for the container with `udica` (from `podman inspect askillsagent`) and install it with `semodule`.
- Replace `--security-opt label=disable` with `--security-opt label=type:askillsagent.process` in the `podman run` command.
- Add the `:Z` label to the private `$HOME/askillsagent` bind mount.
- Add the `:ro,z` labels to the `.github`, `AGENTS.md` and `CLAUDE.md` bind mounts.
- Do not relabel the Wayland socket mount; allow its access through the `udica` policy instead.
- Check for denials with `ausearch -m avc -ts recent`, then update the READMEs once confirmed working.
