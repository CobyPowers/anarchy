#!/bin/bash

ANSI_ART='   ▄████████ ███▄▄▄▄      ▄████████    ▄████████  ▄████████    ▄█    █▄    ▄██   ▄   
  ███    ███ ███▀▀▀██▄   ███    ███   ███    ███ ███    ███   ███    ███   ███   ██▄ 
  ███    ███ ███   ███   ███    ███   ███    ███ ███    █▀    ███    ███   ███▄▄▄███ 
  ███    ███ ███   ███   ███    ███  ▄███▄▄▄▄██▀ ███         ▄███▄▄▄▄███▄▄ ▀▀▀▀▀▀███ 
▀███████████ ███   ███ ▀███████████ ▀▀███▀▀▀▀▀   ███        ▀▀███▀▀▀▀███▀  ▄██   ███ 
  ███    ███ ███   ███   ███    ███ ▀███████████ ███    █▄    ███    ███   ███   ███ 
  ███    ███ ███   ███   ███    ███   ███    ███ ███    ███   ███    ███   ███   ███ 
  ███    █▀   ▀█   █▀    ███    █▀    ███    ███ ████████▀    ███    █▀     ▀█████▀  
                                      ███    ███                                     '

clear
echo -e "\n$ansi_art\n"

if [[ ! -f /etc/arch-release ]]; then
  echo "You must be using an Arch-based distro to install and use Anarchy."
  exit 1
fi

sudo pacman -Sy --noconfirm --needed git

# Use custom repo if specified, otherwise default to CobyPowers/anarchy
ANARCHY_REPO="${ANARCHY_REPO:-CobyPowers/anarchy}"

echo -e "\nCloning Anarchy from: https://github.com/${ANARCHY_REPO}.git"
rm -rf ~/.local/share/anarchy/
git clone "https://github.com/${ANARCHY_REPO}.git" ~/.local/share/anarchy >/dev/null

# Use custom branch if instructed
if [[ -n "$ANARCHY_REF" ]]; then
  echo -e "\eUsing branch: $ANARCHY_REF"
  cd ~/.local/share/anarchy
  git fetch origin "${ANARCHY_REF}" && git checkout "${ANARCHY_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/anarchy/install.sh
