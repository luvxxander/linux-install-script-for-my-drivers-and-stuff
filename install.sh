#!/bin/bash
set -e

START_DIR="$PWD"

sudo pacman -Syu --noconfirm

sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf
sudo pacman -Sy --noconfirm

sudo pacman -S --noconfirm \
base-devel \
git \
wget \
curl \
linux-headers \
networkmanager \
pipewire \
pipewire-pulse \
wireplumber \
bluez \
bluez-utils \
mesa \
vulkan-radeon \
lib32-mesa \
lib32-vulkan-radeon \
amd-ucode \
linux-firmware \
asusctl \
supergfxctl \
tlp \
acpi \
acpi_call

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable tlp
sudo systemctl enable supergfxd

cd /tmp
rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

yay -S --noconfirm \
steam \
discord \
visual-studio-code-bin \
google-chrome \
fastfetch \
gamemode \
mangohud

cd "$START_DIR"
rm -rf ctOS
git clone https://github.com/TSM-061/ctOS.git
cd ctOS
chmod +x install.sh
./install.sh

echo Done