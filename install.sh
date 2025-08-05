#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

ANARCHY_INSTALL=~/.local/share/anarchy/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mAnarchy installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/anarchy/install.sh"
}
trap catch_errors ERR

show_logo() {
  clear
  tte -i ~/.local/share/anarchy/logo.txt --frame-rate ${2:-120} ${1:-expand}
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

load_shell_scripts() {
  for script in "$1/*.sh"; do
    source "$script"
  done  
}

# Install prerequisites
load_shell_scripts $ANARCHY_INSTALL/preflight

# Install config files
show_logo beams 240
show_subtext "Installing config files [1/5]"
load_shell_scripts $ANARCHY_INSTALL/config

# Install development tools
show_logo decrypt 920
show_subtext "Installing terminal tools [2/5]"
load_shell_scripts $ANARCHY_INSTALL/development

# Install desktop tools
show_logo slice 60
show_subtext "Installing desktop tools [3/5]"
load_shell_scripts $ANARCHY_INSTALL/desktop

# Install default applications
show_logo expand
show_subtext "Installing default applications [4/5]"
load_shell_scripts $ANARCHY_INSTALL/apps

# Update system packages
show_logo highlight
show_subtext "Updating system packages [5/5]"
sudo updatedb
sudo pacman -Syu --noconfirm

# Reboot system to apply changes
show_logo laseretch 920
show_subtext "You're done! So we'll be rebooting now..."
sleep 3
reboot
