#!/bin/bash

# Setup script for Claude Code configuration
# This script configures the Claude settings with the API key from environment variable

set -e  # Exit on any error

source .env

echo "Setting up Claude Code configuration..."

# Check if Z_AI_API_KEY environment variable is set
if [ -z "$Z_AI_API_KEY" ]; then
    echo "Error: Z_AI_API_KEY environment variable is not set."
    echo "Please set the Z_AI_API_KEY environment variable before running this script."
    exit 1
fi

# Create .claude directory if it doesn't exist
CLAUDE_DIR="$HOME/.claude"
mkdir -p "$CLAUDE_DIR"

# Path to the template and final settings files
TEMPLATE_FILE="/workspaces/claude-devcontainer/.devcontainer/claude-settings.json"
SETTINGS_FILE="$CLAUDE_DIR/settings.json"

# Check if template file exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file $TEMPLATE_FILE not found."
    exit 1
fi

# Replace the placeholder with the actual API key and create the settings file
echo "Creating Claude settings file at $SETTINGS_FILE"

# Check if jq is available for JSON processing
if command -v jq &> /dev/null; then
    echo "Using jq for JSON processing..."
    jq --arg api_key "$Z_AI_API_KEY" '.env.ANTHROPIC_AUTH_TOKEN = $api_key' "$TEMPLATE_FILE" > "$SETTINGS_FILE"
else
    echo "Using sed for placeholder replacement..."
    sed "s/\${Z_AI_API_KEY}/$Z_AI_API_KEY/g" "$TEMPLATE_FILE" > "$SETTINGS_FILE"
fi

# Verify the settings file was created successfully
if [ -f "$SETTINGS_FILE" ]; then
    echo "✓ Claude settings file created successfully"
    echo "✓ API key has been configured"
else
    echo "Error: Failed to create settings file"
    exit 1
fi

# Setup pnpm using corepack
echo "Setting up pnpm..."
corepack prepare pnpm@latest --activate

echo "✓ pnpm is now available and ready to use"
echo "Setup completed successfully!"