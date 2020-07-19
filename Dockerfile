FROM ubuntu:focal
MAINTAINER Lex White <t7k312@gmail.com>

# Variables
ENV SSH_KEY="" \
    URL="github.com" \
    TIMEOUT="300" \
    REPO_DIR=/repo \
    UID="1000" \
    GID="1000"

# Create user for service
RUN groupadd -g $GID git \
    && useradd -u $UID -r -d $REPO_DIR -g $GID -m -s /sbin/nologin \
        -c "Git pull/push Application User" git

# Install depencies
RUN apt update && \
    apt install --no-install-recommends -y git openssh-client && \
    apt clean \
    && rm -rf /var/lib/apt/lists/*

# Configure SSH-client
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config

# Ports\user\volume
VOLUME $REPO_DIR

# ENTRYPOINT
USER git
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]