#!/usr/bin/env bash

function check_prog() {
    if ! hash "$1" >/dev/null 2>&1; then
        echo "Command not found: $1. Aborting..."
        exit 1
    fi
}

check_prog stow
check_prog curl

mkdir -p "$HOME/.config"

############################# How to use it #############################
#                                                                       #
# Uncomment the lines of the configs you want to install below.         #
# Then run this script from within the dotfiles directory.              #
# E.g. `cd ~/.dotfiles; ./install.sh`                                   #
#                                                                       #
# To uninstall the config later, run stow -D in the dotfiles directory. #
# E.g. `cd ~/.dotfiles; stow -D vim`                                    #
#                                                                       #
#########################################################################

#stow aerospace
#stow bat
#stow code
#stow commitizen
#stow direnv
#stow dunst
#stow github
#stow i3
#stow kitty
#stow lazygit
#stow mise
#stow nvim
#stow picom
#stow rofi
#stow -t / scripts
#stow sketchybar
#stow tmux
#stow zsh
#stow zsh-mac
