#!/bin/bash

set -e

echo "===== Starting Deployment ====="

cd ~/devops_project

echo "Step 1: Pulling latest code..."
git pull --ff-only origin main

echo "Step 2: Backing up website..."
sudo cp /usr/share/nginx/html/index.html /tmp/index.html.backup

echo "Step 3: Deploying website..."
sudo cp index.html /usr/share/nginx/html/index.html

echo "Step 4: Checking website..."
curl --fail --silent --show-error http://localhost > /dev/null

echo "===== Deployment Successful ====="
