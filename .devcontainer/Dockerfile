# Created by taki-on based on
# https://github.com/microsoft/vscode-dev-containers/blob/master/containers/swift-4/.devcontainer/Dockerfile

FROM swift:5.2.4

ARG USERNAME=me
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get -y install git openssh-client less iproute2 procps lsb-release \
    && apt-get install libsqlite3-0 libsqlite3-dev libtinfo-dev libncurses5-dev libncursesw5-dev  \
    && git clone https://github.com/apple/sourcekit-lsp.git \
    && cd sourcekit-lsp \
    && export PATH="/usr/bin:${PATH}"   \
    && swift package update \
    && swift build -Xcxx -I/usr/lib/swift -Xcxx -I/usr/lib/swift/Block  \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*