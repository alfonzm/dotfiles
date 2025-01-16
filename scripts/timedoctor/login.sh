#!/bin/bash

# Run:
# sh ~/.dotfiles/scripts/timedoctor/login.sh

TD_EMAIL="$TIMEDOCTOR_EMAIL"
TD_PASSWORD="$TIMEDOCTOR_PASSWORD"

echo "✨ Retrieving TimeDoctor API Token"

RESPONSE_JSON=$(curl -sX POST "https://api2.timedoctor.com/api/1.0/authorization/login" -H "Content-Type: application/json" -d "{\"email\": \"$TD_EMAIL\", \"password\": \"$TD_PASSWORD\", \"totpCode\": \"string\", \"permissions\": \"write\"}")

TOKEN=$(echo $RESPONSE_JSON | jq -r '.data.token')

sed -i.bak "s/^export TIMEDOCTOR_API_TOKEN=.*/export TIMEDOCTOR_API_TOKEN=$TOKEN/" ~/.zshenv

echo "✨ Updated TIMEDOCTOR_API_TOKEN in ~/.zshenv"
