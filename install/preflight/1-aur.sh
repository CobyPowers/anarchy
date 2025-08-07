#!/bin/bash

# Only add Chaotic-AUR if the architecture is x86_64 so ARM users can build the packages
if [[ "$(uname -m)" == "x86_64" ]] && ! command -v paru &>/dev/null; then
  # Try installing Chaotic-AUR keyring and mirrorlist
  if ! pacman-key --list-keys 3056513887B78AEB >/dev/null 2>&1 &&
    sudo pacman-key --recv-key 3056513887B78AEB &&
    sudo pacman-key --lsign-key 3056513887B78AEB &&
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' &&
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'; then

    # Add Chaotic-AUR repo to pacman config
    if ! grep -q "chaotic-aur" /etc/pacman.conf; then
      echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf >/dev/null
    fi

    # Install paru directly from Chaotic-AUR
    sudo pacman -S --needed --noconfirm paru
  else
    echo "Failed to install Chaotic-AUR"
  fi
fi

# Manually install paru from AUR if not already available
if ! command -v paru &>/dev/null; then
  # Install build tools
  sudo pacman -S --needed --noconfirm base-devel
  cd /tmp
  rm -rf paru-bin
  git clone https://aur.archlinux.org/paru-bin.git
  cd paru-bin
  makepkg -si --noconfirm
  cd -
  rm -rf paru-bin
  cd ~
fi

# Use verbose package lists
if grep -q '^[^#]*VerbosePkgLists' /etc/pacman.conf; then
    sudo sed -i 's/^#\s*$VerbosePkgLists$/\1/' /etc/pacman.conf
fi

# Use parallel downloads to download files quicker
if grep -q '^[^#]*ParallelDownloads' /etc/pacman.conf; then
    sudo sed -i 's/^#\s*$ParallelDownloads$/\1/' /etc/pacman.conf
fi

# Add fun and color to the pacman installer
if ! grep -q "ILoveCandy" /etc/pacman.conf; then
  sudo sed -i '/^\[options\]/a Color\nILoveCandy' /etc/pacman.conf
fi
