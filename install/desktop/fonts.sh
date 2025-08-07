#!/bin/bash

paru -S --noconfirm --needed ttf-font-awesome ttf-cascadia-mono-nerd ttf-ia-writer noto-fonts noto-fonts-emoji

if [ -z "$ANARCHY_BARE" ]; then
  paru -S --noconfirm --needed ttf-iosevka-nerd noto-fonts-cjk noto-fonts-extra
fi
