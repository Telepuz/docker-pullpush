FROM ubuntu:focal
MAINTAINER Lex White <t7k312@gmail.com>

# Variables
ENV SSH_KEY="" \
    URL="github.com" \
    TIMEOUT="300" \
    REPO_DIR=/repo

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
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
