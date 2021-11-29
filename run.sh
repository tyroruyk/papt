#!/usr/bin/env bash
#
# Avishek Dutta (avishekdutta531)
# https://github.com/avishekdutta531/papt
#

# colors
CYAN='\033[0;36m'
LIGHT_BLUE='\033[1;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33'
NC='\033[0m'

# checking root
if [ "$EUID" -ne 0 ]
  then echo "${RED}This sciprt MUST BE run as root${NC}"
  exit
fi

# text type
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

echo ""
echo "${YELLOW}Welcome to ${BOLD}Post APT - PAPT${NORMAL}${NC}"
echo "${CYAN}Installing ${BOLD}PAPT${NORMAL}...${NC}"
echo ""

# installation
echo "${LIGHT_BLUE}Installing Softwares${NC}"
echo ""

sudo apt-get install emacs
sudo apt-get install vlc
sudo apt-get install curl
sudo apt-get install zsh
sudo apt-get install conky

# changing default shell to zsh
echo ""
echo "${CYAN}Changing Defualt Shell to ZSH...${NC}"
chsh -s /bin/zsh
echo ""

# installing oh-my-zsh
echo "${LIGHT_BLUE}Installing Oh-My-ZSH${NC}"
echo ""
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# icons and themes
echo "${CYAN}Installing Icons and Themes...${NC}"
echo ""
sudo apt install gnome-tweaks
sudo apt install arc-theme
mkdir ~/.icons
cp -r ./Themes/Tela ~/.icons

# making directories
mkdir ~/.config/autostart

# copying dotfiles
echo "${YELLOW}Copying dotfiles...${NC}"
echo ""

echo "${GREEN}Installing Doom Emacs...${NC}"
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync
rm ~/.doom.d
cp -r ./dot-files/.doom.d ~
~/.emacs.d/bin/doom sync -e

echo "${GREEN}Installing Conky...${NC}"
cp -r ./dot-files/conky ~/.config
cp -r ./dot-files/autostart/start_conky.desktop ~/.config/autostart

# instruction
echo "${CYAN}Installation has been completed!!${NC}"
echo "${YELLOW}Change Themes and Icons from ${BOLD}Gnome Tweaks${NORMAL}${NC}"
echo "${GREEN}Now, please ${BOLD}RESTART${NORMAL} your system.${NC}"

# end of file
