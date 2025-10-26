FROM node:24-bullseye

# Install system dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
    curl \
    wget \
    git \
    vim \
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

# Enable corepack
RUN corepack enable

# Switch to node user
USER node

# Set working directory
WORKDIR /workspace

# Create .claude directory
RUN mkdir -p /home/node/.claude
RUN mkdir -p ~/.pnpm-global/bin

COPY --chown=node:node .devcontainer/claude-settings.json /home/node/.claude/settings.json

RUN export PNPM_HOME="$HOME/.pnpm-global/bin"
RUN export PATH="$PNPM_HOME:$PATH"

CMD ["/bin/bash"]