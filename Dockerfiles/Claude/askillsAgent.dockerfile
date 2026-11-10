# Fedora
FROM registry.fedoraproject.org/fedora:latest

# There are 3 types of 'Claude Code' apps
# https://code.claude.com/docs/en/setup

ARG DEB_ARCH=amd64
ARG UID=1000
ARG CLAUDE_DESKTOP_REPO=https://downloads.claude.ai/claude-desktop/apt/stable

# Install Flatpak (which is normally included OOB)
# Auto-generated: 'openssl3-libs' lets VS Code 'vsce-sign' verify extension signatures, as Fedora 45+ ships only OpenSSL 4.
RUN dnf -y install curl dpkg flatpak openssl3-libs shadow-utils \
    && dnf clean all

# Enable Flatpak repositories
RUN flatpak remote-add --system --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo

# Install Chrome and Gearlevel for AppImages
#RUN flatpak install --system --noninteractive flathub \
#      com.google.Chrome it.mijorus.gearlever
#RUN flatpak install --system --noninteractive flathub \
#    it.mijorus.gearlever

# Download Claude Desktop App (Linux beta ships only as .deb, so it is extracted without apt)
RUN mkdir -p /opt/Downloads \
    && DEB_PATH=$(curl -fsSL "$CLAUDE_DESKTOP_REPO/dists/stable/main/binary-${DEB_ARCH}/Packages" \
    | grep '^Filename: pool/main/c/claude-desktop/claude-desktop_' | sort -V | tail -n 1 | cut -d' ' -f2) \
    && curl -fL "$CLAUDE_DESKTOP_REPO/$DEB_PATH" -o /opt/Downloads/claude-desktop.deb \
    && dpkg-deb -x /opt/Downloads/claude-desktop.deb / \
    && rm -rf /opt/Downloads

# Install the official Visual Studio Code
RUN tee /etc/yum.repos.d/vscode.repo > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
autorefresh=1
type=rpm-md
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

RUN dnf -y install code \
    && dnf clean all

# Install Claude Code CLI
RUN tee /etc/yum.repos.d/claude-code.repo > /dev/null <<EOF
[claude-code]
name=Claude Code
baseurl=https://downloads.claude.ai/claude-code/rpm/stable
enabled=1
gpgcheck=1
gpgkey=https://downloads.claude.ai/keys/claude-code.asc
EOF

RUN dnf -y install claude-code \
    && dnf clean all

# Install and set Firefox as the default
RUN dnf install -y firefox xdg-utils && \
    dnf clean all

ENV BROWSER=firefox

# Writing custom desktop entry handler for opening links with Firefox
RUN printf '%s\n' \
    '[Desktop Entry]' \
    'Name=VS Code URL Handler (container)' \
    'Type=Application' \
    'NoDisplay=true' \
    'Exec=/usr/share/code/code --no-sandbox --disable-gpu-sandbox --password-store=basic --ozone-platform=wayland --open-url %U' \
    'MimeType=x-scheme-handler/vscode;' \
    > /usr/share/applications/code-container-url-handler.desktop \
    && mkdir -p /etc/xdg \
    && printf '%s\n' \
    '[Default Applications]' \
    'x-scheme-handler/http=org.mozilla.firefox.desktop' \
    'x-scheme-handler/https=org.mozilla.firefox.desktop' \
    'text/html=org.mozilla.firefox.desktop' \
    'x-scheme-handler/vscode=code-container-url-handler.desktop' \
    > /etc/xdg/mimeapps.list

# Essentially bypassing tab isolation/sandboxing in FIrefox, which does not work in Podman due to '--cap-drop=ALL and no-new-privileges' of container setup.
ENV BROWSER=firefox \
    MOZ_DISABLE_CONTENT_SANDBOX=1 \
    MOZ_DISABLE_RDD_SANDBOX=1 \
    MOZ_DISABLE_SOCKET_PROCESS_SANDBOX=1 \
    MOZ_DISABLE_UTILITY_SANDBOX=1 \
    MOZ_DISABLE_GMP_SANDBOX=1

# Set dark mode for everything in the container
ENV GTK_THEME=Adwaita:dark

# Session setup, incl. Terminal from Fedora Silverblue.
# RUN dnf -y install dbus-daemon ptyxis && dnf clean all
RUN dnf -y install foot && dnf clean all

COPY --chmod=755 Claude/entrypoint.sh /usr/local/bin/entrypoint

# Auto-generated: Run with '--userns=keep-id' so this UID maps to the host user and root inside the container is not root on the host.
# Auto-generated: Only the folders chosen in 'podman run' are mounted, and '/run/user/1000' is an in-memory 'tmpfs'.
RUN useradd -m -U -u "${UID}" -s /bin/bash agent \
    && mkdir -p /workspaces /mnt/share \
    && chown agent:agent /workspaces /mnt/share

USER agent
WORKDIR /workspaces
RUN code --no-sandbox \
    && mkdir -p /home/agent/.config/Code/User

# Auto-generated: VS Code keeps up to 20 downloaded '.vsix' packages, so the copy is removed in the same 'RUN' as the install.
RUN code --install-extension anthropic.claude-code \
    && rm -rf /home/agent/.config/Code/CachedExtensionVSIXs

COPY --chown=agent:agent vsc-settings.json \
    /home/agent/.config/Code/User/settings.json

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["claude-vsc"]