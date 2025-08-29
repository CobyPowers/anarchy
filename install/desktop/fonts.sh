#!/bin/bash

paru -S --noconfirm --needed ttf-font-awesome ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-ia-writer noto-fonts noto-fonts-emoji

if [ -z "$ANARCHY_BARE" ]; then
  paru -S --noconfirm --needed noto-fonts-cjk noto-fonts-extra
fi
