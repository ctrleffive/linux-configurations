#!/bin/sh

# Author : Chandu J S
# Copyright (c) chandujs.dev

# This script install all packages I need for my use cases.

# files to look for the packages to install.
trustedPackages="./install_trusted.conf"
thirdPartyPackages="./install_third_party.conf"

sudo pacman --sync --refresh

echo ""
echo "🏁 Preparing installation..."
echo ""

# looping through the list & avoiding the empty spaces
trustedPackagesTogether=$(cat ${trustedPackages} | grep -v "^$")
thirdPartyPackagesTogether=$(cat ${thirdPartyPackages} | grep -v "^$")

# installing `pikaur` if not installed.
if ! which pikaur >/dev/null; then
  currentDirectory=$pwd
  tmpDirectory="/tmp/pikaur"
  sudo pacman --sync --needed --noconfirm base-devel git
  mkdir $tmpDirectory
  git clone https://aur.archlinux.org/pikaur.git $tmpDirectory
  cd $tmpDirectory
  makepkg --force --syncdeps --rmdeps --install
  cd $currentDirectory
  rm -rf $tmpDirectory
  echo ""
fi

# installing trusted packages.
# regular packages can also be installed with `pikaur`.
sudo pacman --sync --needed --noconfirm $trustedPackagesTogether

echo ""

# installing third party packages.
pikaur --sync --needed $thirdPartyPackagesTogether

echo ""
echo "🎉 Installation complete! You can restart your PC."
