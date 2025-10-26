# Claude Code DevContainer

A development container with Node.js 24 and Claude Code CLI configured for Z AI API.

## Features

- **Node.js 24**: Latest LTS with npm
- **Claude Code CLI**: Pre-installed and auto-configured
- **Z AI API Integration**: Configured for Z AI API endpoints
- **VS Code Extensions**: TypeScript, ESLint, Prettier, Claude Code extension

## Quick Start

1. **Open in VS Code**:
   ```bash
   code .
   ```

2. **Reopen in Container**:
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Select "Dev Containers: Reopen in Container"

3. **Configure API Key**:
   ```bash
   # Copy the example environment file
   cp .env.example .env

   # Edit .env with your Z AI API key
   nano .env
   ```

   Add your key to `.env`:
   ```bash
   Z_AI_API_KEY=your_z_ai_api_key_here
   ```

4. **Start Using Claude Code**:
   ```bash
   claude
   ```

## Configuration

The devcontainer automatically configures Claude Code settings using the setup script. Settings are created at `~/.claude/settings.json` with:

- API endpoint: `https://api.z.ai/api/anthropic`
- Authentication via `Z_AI_API_KEY` environment variable
- Optimized timeout and performance settings

## Development Workflow

1. **Start a new project**:
   ```bash
   npm init -y
   npm install express
   ```

2. **Use Claude Code**:
   ```bash
   claude "Create an Express server with TypeScript"
   ```

3. **Run your application**:
   ```bash
   npm start
   # or
   npm run dev
   ```

## Troubleshooting

### Claude Code Not Found
The CLI is pre-installed. If unavailable:
```bash
npm install -g @anthropic-ai/claude-code
```

### API Key Issues
1. Ensure `.env` file contains `Z_AI_API_KEY=your_key`
2. Verify the API key has proper permissions
3. Check network connectivity to Z AI API endpoint

### Container Issues
1. Rebuild: "Dev Containers: Rebuild Container" in VS Code
2. Ensure Docker Desktop is running
3. Verify sufficient disk space

## Support

- **Dev Containers**: [VS Code documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- **Claude Code**: [Official documentation](https://docs.anthropic.com/claude-code)
- **Z AI API**: Refer to your Z AI API documentation