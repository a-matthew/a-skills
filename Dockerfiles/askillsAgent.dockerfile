# Fedora
FROM registry.fedoraproject.org/fedora:latest

# There are 3 types of 'Copilot' apps
# https://github.com/features/copilot

ARG ARCH=x64
ARG UID=1000
ARG COPILOT_APP_URL=https://github.com/github/app/releases/latest/download/GitHub-Copilot-linux-${ARCH}.AppImage

# Install Flatpak (which is normally included OOB)
RUN dnf -y install curl flatpak shadow-utils \
    && dnf clean all

# Enable Flatpak repositories
RUN flatpak remote-add --system --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo

# Install Chrome and Gearlevel for AppImages
#RUN flatpak install --system --noninteractive flathub \
#      com.google.Chrome it.mijorus.gearlever
#RUN flatpak install --system --noninteractive flathub \
#    it.mijorus.gearlever

# Download GitHub Copilot Desktop App (AppImage)
RUN mkdir -p /opt/Downloads && \
    curl -fL "$COPILOT_APP_URL" \
    -o /opt/Downloads/GitHub-Copilot-Desktop.AppImage && \
    chmod 755 /opt/Downloads/GitHub-Copilot-Desktop.AppImage

# Integrate the AppImages
#RUN flatpak run it.mijorus.gearlever \
#    --integrate "$HOME/Downloads/GitHub-Copilot-Desktop.AppImage" -y
RUN cd /opt && /opt/Downloads/GitHub-Copilot-Desktop.AppImage --appimage-extract >/dev/null \
    && mv squashfs-root copilot-app \
    && chmod -R a+rX /opt/copilot-app \
    && printf '#!/bin/sh\nexec /opt/copilot-app/AppRun "$@"\n' > /usr/local/bin/copilot-app \
    && chmod 755 /usr/local/bin/copilot-app

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

# Install GitHub Copilot CLI
RUN curl -fsSL https://gh.io/copilot-install | PREFIX=/usr/local bash

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

COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint

RUN useradd -m -U -u "${UID}" -s /bin/bash agent \
    && mkdir -p /workspaces /mnt/share \
    && chown agent:agent /workspaces /mnt/share

USER agent
WORKDIR /workspaces
RUN code --no-sandbox \
    && mkdir -p /home/agent/.config/Code/User

#--install-extension GitHub.copilot-chat \
#--install-extension GitHub.copilot \    

COPY --chown=agent:agent vsc-settings.json \
    /home/agent/.config/Code/User/settings.json

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["code"]