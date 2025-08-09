#!/bin/bash

if [ -z "$ANARCHY_BARE" ]; then
  paru -S --noconfirm --needed \
    gnome-calculator gnome-keyring beeper-v4-bin \
    obsidian libreoffice-still obs-studio \
    xournalpp localsend-bin discord

  # Packages known to be flaky or having key signing issues are run one-by-one
  for pkg in pinta typora; do
    paru -S --noconfirm --needed "$pkg" ||
      echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
  done
fi

# Copy over Anarchy applications
source ~/.local/share/anarchy/bin/anarchy-refresh-applications || true
