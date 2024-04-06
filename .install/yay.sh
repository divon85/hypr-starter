# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
echo -e "${GREEN}"
figlet "yay"
echo -e "${NONE}"
if [ ! -d ~/Master ];
    mkdir ~/Master
fi
if sudo pacman -Qs yay > /dev/null ; then
    echo ":: yay is already installed!"
else
    echo ":: yay is not installed. Starting the installation!"
    _installPackagesPacman "base-devel"
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    echo $temp_path
    git clone https://aur.archlinux.org/yay-git.git ~/Master/yay-git
    cd ~/Master/yay-git
    makepkg -si
    cd $temp_path
    echo ":: yay has been installed successfully."
fi
echo ""