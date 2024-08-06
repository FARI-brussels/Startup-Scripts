#!/bin/bash
# Demo repo and demo directory path on the sbc here
DEMO_REPO="https://github.com/FARI-brussels/imageprocessingPOC.git"
DEMO_DIR="/home/fari/Documents/imageprocessingPOC"
SCRIPT_DIR="/home/fari/Documents/TE-Scripts"


"$SCRIPT_DIR/clone_or_pull_repo.sh" "$DEMO_DIR" "$DEMO_REPO"

# Launch the welcome screen using launch_welcome_screen.sh



#run demo
#kill process on port 5000
kill -9 $(lsof -t -i:5000)


gnome-terminal --working-directory=$DEMO_DIR -- bash -c "python edge.py --record; echo 'Press Enter to exit'; read"


