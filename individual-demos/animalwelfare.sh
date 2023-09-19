#!/bin/bash

# Demo repo and demo directory path on the sbc here
DEMO_ID="0"

WELCOME_SCREEN_DIR="/home/fari/Documents/Welcome-Screen"
WELCOME_SCREEN_REPO="https://github.com/FARI-brussels/welcome-screen"
DEMO_REPO="https://github.com/FARI-brussels/demo-iridia-animal-welfare.git"
DEMO_DIR="/home/fari/Documents/demo-iridia-animal-welfare"

# Assuming git_sync.sh and launch_demo.sh are in the same directory as this script
SCRIPT_DIR="$(dirname "$0")"

# Use git_sync.sh to sync both repositories
"$SCRIPT_DIR/clone_or_pull_repo.sh" "$WELCOME_SCREEN_DIR" "$WELCOME_SCREEN_REPO"
"$SCRIPT_DIR/clone_or_pull_repo.sh" "$DEMO_DIR" "$DEMO_REPO"

# Launch the welcome screen using launch_welcome_screen.sh
"$SCRIPT_DIR/launch_welcome_screen.sh" "$WELCOME_SCREEN_DIR" "$DEMO_ID"


#run demo
gnome-terminal --working-directory=$DEMO_DIR -- bash -c "nohup python -m flask --app=app --debug run --host=0.0.0.0"
