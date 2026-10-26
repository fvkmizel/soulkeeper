#!/bin/sh
# Soulkeeper installer for Antigravity
# Sets up Engram memory, proactive skills, and anti-hallucination rules.
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Soulkeeper into Antigravity..."

# 1. Ensure Engram binary is installed
if ! command -v engram >/dev/null 2>&1; then
  echo "→ Downloading Engram binary..."
  ARCH="$(uname -m)"
  case "$ARCH" in
    aarch64|arm64) BIN_ARCH="arm64" ;;
    x86_64|amd64)  BIN_ARCH="amd64" ;;
    *) echo "❌ Unsupported architecture: $ARCH"; exit 1 ;;
  esac

  TAG="$(curl -fsSL https://api.github.com/repos/Gentleman-Programming/engram/releases/latest | grep '"tag_name":' | head -n 1 | cut -d '"' -f 4)"
  VER="${TAG#v}"
  TMPDIR="$(mktemp -d)"
  curl -fsSL "https://github.com/Gentleman-Programming/engram/releases/download/${TAG}/engram_${VER}_linux_${BIN_ARCH}.tar.gz" -o "$TMPDIR/engram.tar.gz"
  tar -xzf "$TMPDIR/engram.tar.gz" -C "$TMPDIR"
  
  DEST="/data/data/com.termux/files/usr/bin"
  if [ ! -w "$DEST" ]; then
    DEST="$HOME/.local/bin"
    mkdir -p "$DEST"
  fi
  install -m 755 "$TMPDIR/engram" "$DEST/engram"
  rm -rf "$TMPDIR"
  echo "✓ Engram installed to $DEST/engram"
else
  echo "✓ Engram already installed: $(engram version)"
fi

# 2. Register Engram MCP server in Antigravity
if command -v agy >/dev/null 2>&1; then
  echo "→ Configuring Engram MCP server in Antigravity..."
  agy mcp add engram -- engram mcp --tools=agent 2>/dev/null || true
  
  echo "→ Installing Soulkeeper plugin via 'agy plugin install'..."
  agy plugin install "$DIR" || true
fi

# 3. Install skills globally
GLOBAL_GEMINI_SKILLS="$HOME/.gemini/config/skills"
mkdir -p "$GLOBAL_GEMINI_SKILLS"
cp -R "$DIR/skills/." "$GLOBAL_GEMINI_SKILLS/"
echo "✓ Skills installed to $GLOBAL_GEMINI_SKILLS"

GLOBAL_AGENTS_SKILLS="$HOME/.agents/skills"
mkdir -p "$GLOBAL_AGENTS_SKILLS"
cp -R "$DIR/skills/." "$GLOBAL_AGENTS_SKILLS/"
echo "✓ Skills installed to $GLOBAL_AGENTS_SKILLS"

echo ""
echo "✅ Success! Soulkeeper (4 Skills + Engram Memory) is now active."
