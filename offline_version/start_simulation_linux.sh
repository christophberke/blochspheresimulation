#!/bin/bash

# === Configuration ===
PORT=8000
HOST="localhost"
FOLDER="."                # Change this if your index.html is in a subfolder
URL="http://$HOST:$PORT"
BROWSER="firefox"

# === Start server ===
echo "Starting local HTTP server at $URL..."
python3 -m http.server "$PORT" --directory "$FOLDER" &

# Capture server PID so we can stop it later (if needed)
SERVER_PID=$!

# Give the server a moment to start
sleep 1.5

# === Launch Firefox in kiosk mode ===
echo "Launching Firefox in kiosk mode..."
$BROWSER --kiosk "$URL"

# === Optional: Stop the server when the browser closes ===
# echo "Stopping server (PID: $SERVER_PID)..."
# kill $SERVER_PID
