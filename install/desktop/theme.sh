#!/bin/bash

paru -S --noconfirm --needed kvantum-qt5 \
  gnome-themes-extra \ # Adds Adwaita-dark theme
  yaru-icon-theme

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

# Setup theme links
mkdir -p ~/.config/anarchy/themes
for f in ~/.local/share/anarchy/themes/*; do 
  ln -snf "$f" ~/.config/anarchy/themes/
done

# Set initial theme
mkdir -p ~/.config/anarchy/current
ln -snf ~/.config/anarchy/themes/catppuccin-mocha ~/.config/anarchy/current/theme
ln -snf ~/.config/anarchy/current/theme/backgrounds/yohoho.jpg ~/.config/anarchy/current/background

# Set specific app links for current theme
ln -snf ~/.config/anarchy/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/anarchy/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/anarchy/current/theme/mako.ini ~/.config/mako/config
