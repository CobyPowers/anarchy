#!/bin/bash

DUCK_CHAT_DL_URL=$(curl -s https://api.github.com/repos/benoitpetit/duckduckGO-chat-cli/releases/latest | grep -oP 'https.*linux_amd64' | grep -oP 'https.*v[0-9]+\.[0-9]+\.[0-9]+_linux_amd64' | head -1)
DUCK_CHAT_PATH=~/.local/bin

mkdir -p $DUCK_CHAT_PATH
curl -o $DUCK_CHAT_PATH/duckchat -L $DUCK_CHAT_DL_URL
chmod +x $DUCK_CHAT_PATH/duckchat 


