FROM codercom/code-server:4.14.1

USER coder

ENV SHELL=/bin/bash

RUN sudo apt-get update && \
    curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - && \
    sudo apt-get install python3 python3-pip build-essential nodejs -y && \
    pip3 install web3 pandas asyncio aiohttp nest-asyncio prefect && \
    corepack enable --install-directory ~/.local/bin && corepack prepare yarn@stable --activate && \
    cd .local/ && GO_LATEST=$(curl https://go.dev/VERSION?m=text) && \
    curl -OL -C- "https://dl.google.com/go/$GO_LATEST.linux-amd64.tar.gz" && \
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "$GO_LATEST.linux-amd64.tar.gz" && \
    rm "$GO_LATEST.linux-amd64.tar.gz"

EXPOSE 8080
