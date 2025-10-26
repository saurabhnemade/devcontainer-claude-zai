FROM node:24-bullseye

# Install system dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    build-essential \
    python3 \
    python3-pip \
    jq \
    sed \
    && rm -rf /var/lib/apt/lists/*

# Set up home directory
RUN mkdir -p /home/node && \
    chown -R node:node /home/node

# Install Claude Code CLI prerequisites
RUN npm install -g @anthropic-ai/claude-code || true

# Switch to node user
USER node

# Set working directory
WORKDIR /workspace

# Create .claude directory
RUN mkdir -p /home/node/.claude

COPY --chown=node:node .devcontainer/claude-settings.json /home/node/.claude/settings.json

CMD ["/bin/bash"]