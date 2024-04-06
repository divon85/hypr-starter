# ------------------------------------------------------
# Install wallpapers
# ------------------------------------------------------
echo -e "${GREEN}"
figlet "Wallpapers"
echo -e "${NONE}"
if [ ! -d ~/Pictures ];
    mkdir ~/Pictures
fi
if [ ! -d ~/Pictures/wallpapers ]; then
    echo "Do you want to download the wallpapers from repository https://gitlab.com/stephan-raabe/wallpaper/ ?"
    echo "If not, the script will install 3 default wallpapers in ~/Pictures/wallpapers/"
    echo ""
    if gum confirm "Do you want to download the repository?" ;then
        wget -P ~/Downloads/ https://gitlab.com/stephan-raabe/wallpaper/-/archive/main/wallpaper-main.zip
        unzip -o ~/Downloads/wallpaper-main.zip -d ~/Downloads/
        if [ ! -d ~/Pictures/wallpapers/ ]; then
            mkdir ~/Pictures/wallpapers
        fi
        cp ~/Downloads/wallpaper-main/* ~/Pictures/wallpapers/
        echo "Wallpapers from the repository installed successfully."
    elif [ $? -eq 130 ]; then
        exit 130
    else
        if [ -d ~/Pictures/wallpapers/ ]; then
            echo "wallpaper folder already exists."
        else
            mkdir ~/Pictures/wallpapers
        fi
        cp wallpapers/* ~/Pictures/wallpapers
        echo "Default wallpapers installed successfully."
    fi
else
    echo ":: ~/Pictures/wallpapers folder already exists."
fi
echo ""

# ------------------------------------------------------
# Copy default wallpaper files to .cache
# ------------------------------------------------------

# Cache file for holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"
rasi_file="$HOME/.cache/current_wallpaper.rasi"

# Create cache file if not exists
if [ ! -f $cache_file ] ;then
    touch $cache_file
    echo "$HOME/Pictures/wallpapers/default.jpg" > "$cache_file"
fi

# Create rasi file if not exists
if [ ! -f $rasi_file ] ;then
    touch $rasi_file
    echo "* { current-image: url(\"$HOME/Pictures/wallpapers/default.jpg\", height); }" > "$rasi_file"
fi
