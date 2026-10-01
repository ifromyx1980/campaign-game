#!/bin/bash
# Launch the web game locally (double-click on Mac)
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"
PORT=8800
echo "Starting game server on port $PORT ..."
python3 -m http.server $PORT >/dev/null 2>&1 &
SRV=$!
sleep 1
open "http://localhost:$PORT/"
echo "Game opened in your browser: http://localhost:$PORT/"
echo "Close this window or press Ctrl+C to stop the server."
trap "kill $SRV 2>/dev/null" EXIT
wait $SRV
