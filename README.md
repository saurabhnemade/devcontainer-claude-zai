# Claude Code DevContainer

A development container with Node.js 24 and Claude Code CLI configured for Z AI API.

## Features

- **Node.js 24**: Latest LTS with npm
- **Claude Code CLI**: Pre-installed and auto-configured
- **Z AI API Integration**: Configured for Z AI API endpoints
- **MCP Support**: Model Context Protocol configured with shadcn server
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

### MCP (Model Context Protocol)

This DevContainer includes MCP support to extend Claude Code's capabilities with external tools and services.

#### Default MCP Configuration

The project includes a pre-configured shadcn MCP server:

- **Configuration File**: `.mcp.json`
- **Enabled Server**: `shadcn` - Provides access to shadcn/ui components for UI development
- **Claude Settings**: `.claude/settings.local.json` enables project MCP servers

#### MCP Server Configuration

MCP servers are configured in `.mcp.json`:

```json
{
  "mcpServers": {
    "server-name": {
      "command": "command-to-run",
      "args": ["arg1", "arg2"]
    }
  }
}
```

#### Adding MCP Servers

To add a new MCP server:

1. **Edit `.mcp.json`**:
   ```json
   {
     "mcpServers": {
       "your-server": {
         "command": "npx",
         "args": ["your-package", "server"]
       }
     }
   }
   ```

2. **Install dependencies** (if required):
   ```bash
   pnpm install your-package
   ```

3. **Enable in Claude settings** (if not using `enableAllProjectMcpServers`):
   ```bash
   # Edit .claude/settings.local.json
   "enabledMcpjsonServers": ["your-server"]
   ```

#### Removing MCP Servers

To remove an MCP server:

1. **Edit `.mcp.json`** and remove the server entry
2. **Remove from enabled list** in `.claude/settings.local.json` if present
3. **Uninstall dependencies** (optional):
   ```bash
   pnpm uninstall your-package
   ```

#### Available MCP Servers

Common MCP servers you can add:

- **shadcn**: UI component library (pre-installed)
- **filesystem**: File system operations
- **git**: Git repository operations
- **database**: Database connections and queries
- **web**: Web scraping and API calls

For a complete list, check the [MCP documentation](https://modelcontextprotocol.io/)

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

3. **Use MCP-powered features**:
   ```bash
   # Example: Add shadcn UI components (using pre-configured MCP server)
   claude "Add a card component using shadcn/ui"
   ```

4. **Run your application**:
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

### MCP Server Issues

#### Server Not Available
1. Check `.mcp.json` configuration for correct command and arguments
2. Verify required packages are installed: `pnpm install`
3. Check `.claude/settings.local.json` for server enablement

#### Shadcn MCP Server Issues
```bash
# Reinstall shadcn package
pnpm install shadcn@latest

# Verify MCP configuration
cat .mcp.json
```

#### Generic MCP Debugging
```bash
# Test MCP server manually
npx shadcn mcp

# Check Claude MCP settings
cat .claude/settings.local.json

# List available MCP resources
claude "List available MCP resources"
```

### Container Issues
1. Rebuild: "Dev Containers: Rebuild Container" in VS Code
2. Ensure Docker Desktop is running
3. Verify sufficient disk space

## Support

- **Dev Containers**: [VS Code documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- **Claude Code**: [Official documentation](https://docs.anthropic.com/claude-code)
- **MCP**: [Model Context Protocol documentation](https://modelcontextprotocol.io/)
- **Z AI API**: Refer to your Z AI API documentation