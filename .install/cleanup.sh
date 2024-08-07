# ------------------------------------------------------
# Install tty login and issue
# ------------------------------------------------------
echo -e "${GREEN}"
figlet "Cleanup"
echo -e "${NONE}"

# Check for ttf-ms-fonts
if [[ $(_isInstalledPacman "ttf-ms-fonts") == 0 ]]; then
    echo "The script has detected ttf-ms-fonts. This can cause conflicts with icons in Waybar."
    if gum confirm "Do you want to uninstall ttf-ms-fonts?" ;then
        sudo pacman --noconfirm -R ttf-ms-fonts
    fi
fi

# Check for running NetworkManager.service
if [[ $(systemctl list-units --all -t service --full --no-legend "NetworkManager.service" | sed 's/^\s*//g' | cut -f1 -d' ') == "NetworkManager.service" ]];then
    echo ":: NetworkManager.service already running."
else
    sudo systemctl enable NetworkManager.service
    sudo systemctl start NetworkManager.service
    echo ":: NetworkManager.service activated successfully."    
fi

# Check for running bluetooth.service
if [[ $(systemctl list-units --all -t service --full --no-legend "bluetooth.service" | sed 's/^\s*//g' | cut -f1 -d' ') == "bluetooth.service" ]];then
    echo ":: bluetooth.service already running."
else
    sudo systemctl enable bluetooth.service
    sudo systemctl start bluetooth.service
    echo ":: bluetooth.service activated successfully."    
fi

if [ -f ~/.dotfiles/.settings/eww-monitor.sh ] ;then
    if grep -q "echo" $HOME/.dotfiles/.settings/eww-monitor.sh ; then
       rm ~/.dotfiles/.settings/eww-monitor.sh
       echo "::  ~/.dotfiles/.settings/eww-monitor.sh removed."
    fi
fi

# Replace pfetch and neofetch with fastfetch
sed -i "s/pfetch/fastfetch/g" ~/.dotfiles/.bashrc
sed -i "s/neofetch/fastfetch/g" ~/.dotfiles/.bashrc

# Create default folder structure
xdg-user-dirs-update
echo 

echo ":: Cleanup done."