# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Environment Setup

This is a DevContainer project pre-configured with Node.js 24 and Claude Code CLI for Z AI API integration.

### Required Configuration
- Copy `.env.example` to `.env` and set `Z_AI_API_KEY=your_api_key_here`
- The container automatically configures Claude Code settings via the setup script
- Claude Code is pre-installed and configured for Z AI API endpoints

### Development Tools
- **Node.js**: Version 24 LTS with npm
- **Package Manager**: pnpm (configured via corepack)
- **VS Code Extensions**: TypeScript, ESLint, Prettier, Claude Code extension

## Key Commands

### Starting Development
```bash
# Open in VS Code and reopen in container
code .

# Start using Claude Code
claude

# Initialize a new Node.js project (if needed)
npm init -y
pnpm install
```

### Package Management
```bash
# Install dependencies
pnpm install <package>

# Run development scripts
pnpm run dev

# Run production scripts
pnpm start

# Build project
pnpm build
```

## Architecture

This is a DevContainer template project, not a traditional application. The structure consists of:

- **`.devcontainer/`**: Container configuration files
  - `devcontainer.json`: VS Code DevContainer setup with Node.js 24, extensions, and port forwarding
  - `Dockerfile`: Container image definition
  - `setup.sh`: Post-creation script that configures Claude Code settings and pnpm
  - `claude-settings.json`: Template for Claude Code API configuration

- **Configuration**: The setup script automatically configures Claude Code to use Z AI API endpoints by:
  1. Reading `Z_AI_API_KEY` from `.env` file
  2. Creating `~/.claude/settings.json` with proper API configuration
  3. Setting up pnpm as the default package manager

## API Configuration

Claude Code is configured to use:
- **Base URL**: `https://api.z.ai/api/anthropic`
- **Authentication**: Via `Z_AI_API_KEY` environment variable
- **Timeout**: 30 minutes (3000000ms)
- **Traffic Optimization**: Non-essential traffic disabled

## Development Workflow

1. Container setup runs automatically on first launch
2. Environment variables are loaded from `.env` file
3. Claude Code settings are configured automatically
4. pnpm is activated as the default package manager
5. Start developing with Claude Code CLI immediately

## Troubleshooting

- If Claude Code is not found, it's pre-installed but can be reinstalled with `npm install -g @anthropic-ai/claude-code`
- API key issues are resolved by ensuring `.env` contains the correct `Z_AI_API_KEY`
- Container issues can be resolved by rebuilding the DevContainer


## Codebase

1. Actual codebase is inside code folder
2. Restrict actions inside code folder


## NextJS Principles

1. Use NextJS 16 only
2. Always use server side components
3. Use next-safe-action for server side actions
4. Use only shadcn UI components


## Shadcn ui

1. Learn about shadcn from https://ui.shadcn.com/docs/installation documentation
2. Always follow the documentation fully
3. Utilise installed mcp server for shadcn