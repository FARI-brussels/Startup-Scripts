#!/bin/bash

# Demo repo and demo directory path on the sbc here
DEMO_ID="13"
WELCOME_SCREEN_DIR="/home/fari/Documents/Welcome-Screen"
WELCOME_SCREEN_REPO="https://github.com/FARI-brussels/welcome-screen"
DEMO_REPO="https://github.com/ShadhviVR/Chatbot-fari.git"
DEMO_DIR="/home/fari/Documents/demo-fari-chatbot-frontend"


# Assuming git_sync.sh and launch_demo.sh are in the same directory as this script
SCRIPT_DIR="$(dirname "$0")"
# Use git_sync.sh to sync both repositories
"$SCRIPT_DIR/clone_or_pull_repo.sh" "$WELCOME_SCREEN_DIR" "$WELCOME_SCREEN_REPO"


#WELCOMESCREEN
# Kill process on port 8080
kill -9 $(lsof -t -i:8080)
# Remove chromium cache
rm -rf ~/.cache/chromium
# Launch welcome screen in a new gnome terminal



#DEMOOOO

"$SCRIPT_DIR/clone_or_pull_repo.sh" "$DEMO_DIR" "$DEMO_REPO"
#run demo
#kill process on port 3000
kill -9 $(lsof -t -i:3000)

gnome-terminal --working-directory=$WELCOME_SCREEN_PATH -- bash -c 'nohup python server.py' 
gnome-terminal --working-directory=$DEMO_DIR -- bash -c "npm run dev" 
chromium-browser --kiosk "http://localhost:8080/$DEMO_ID"
