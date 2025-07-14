#!/bin/bash

# Detect LAN IP (macOS or Linux fallback)
IP=$(ipconfig getifaddr en0 2>/dev/null || ip route get 1 | awk '{print $7; exit}')

# Port for live-server
PORT=8080

# Root directory (docs/)
ROOT_DIR="docs"

# Check if docs/ exists
if [ ! -d "$ROOT_DIR" ]; then
  echo "❌ Error: '$ROOT_DIR/' directory not found."
  exit 1
fi

# Show URL
echo "✅ Starting live-server"
echo "🌐 URL: http://$IP:$PORT"

# Optional QR code (comment out if you don’t want it)
npx qrcode-terminal "http://$IP:$PORT"

# Launch live-server pointing to docs/
live-server "$ROOT_DIR" --host="$IP" --port="$PORT" --open=false --quiet
