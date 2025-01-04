#!/bin/bash

# Step 1: Connect to the server

SERVER_USER="root"
SERVER_IP="167.71.54.29"
SERVER_DIR="/root/test-app"
ssh $SERVER_USER@$SERVER_IP << EOF
// cd into the server directory if exists otherwise create it
    if [ -d "$SERVER_DIR" ]; then
        cd $SERVER_DIR || exit
    else
        mkdir $SERVER_DIR
        cd $SERVER_DIR || exit
    fi
    echo "Connected successfully"
EOF

#Step 2: Push code to github
git add .
git commit -m "Deploying latest version"
git push origin main
echo "Code pushed to github"

#Trigger Github actions to deploy (Happens automatically)

#Step 4
# Deployment process initiated