#!/bin/bash
clear
if [ -f ~/.dotfiles/.settings/terminal.sh ]; then
    terminal="$(cat ~/.dotfiles/.settings/terminal.sh)"
    echo ":: Installing $terminal"
    if [ -d ~/.dotfiles/xfce4 ]; then
        if [ ! -f ~/.dotfiles/xfce4/helpers.rc ]; then
            touch ~/.dotfiles/xfce4/helpers.rc
        fi
        echo "TerminalEmulator=$terminal" > ~/.dotfiles/xfce4/helpers.rc
        echo ":: $terminal defined as Thunar Terminal Emulator."
    else
        echo "ERROR: ~/.dotfiles/xfce4 not found. Please open Thunar once to create it."
        echo "Then start this script again."
    fi
else
    echo "ERROR: ~/.dotfiles/.settings/terminal.sh not found"
fi
sleep 3
