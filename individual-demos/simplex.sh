

DEMO_ID="3"
WELCOME_SCREEN_DIR="/home/fari/Documents/Welcome-Screen-Fari_Internship"


cd "$WELCOME_SCREEN_DIR"
git pull origin main

chromium-browser --kiosk "http://localhost:8080/$DEMO_ID"

#run welcome screen
terminator --working-directory=$WELCOME_SCREEN_DIR -e 'nohup python server.py' -T "Welcome Screen"

