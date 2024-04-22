# ------------------------------------------------------
# Neovim
# ------------------------------------------------------
neovim=0
if [ -d ~/.dotfiles/nvim ]; then
echo -e "${GREEN}"
figlet "Neovim"
echo -e "${NONE}"
    if gum confirm "Do you want to install the Neovim configuration and overwrite your existing configuration?"; then
        echo ":: Neovim configuration will be installed"
        neovim=1
    else
        rm -rf ~/.dotfiles-versions/$version/nvim/
        echo ":: Installation of Neovim configuration skipped."
    fi
fi
