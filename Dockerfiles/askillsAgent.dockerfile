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
    && ln -s /opt/copilot-app/AppRun /usr/local/bin/copilot-app

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