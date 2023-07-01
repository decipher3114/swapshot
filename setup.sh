#!/usr/bin/bash


if command -v dnf &> /dev/null; then
    sudo dnf install gnome-screenshot wl-clipboard swappy curl -y
elif command -v pacman &> /dev/null; then
    sudo pacman -Sy --noconfirm gnome-screenshot wl-clipboard swappy curl
fi

if sudo curl "https://raw.githubusercontent.com/decipher3114/swapshot/main/swapshot" -o /usr/local/bin/swapshot; then
    sudo chmod +x /usr/local/bin/swapshot
    echo -e "\n\n"
    echo "swapshot installed !!"
else
    echo "Installation Failed !!"
    exit 1
fi


mkdir -p "$HOME/Screenshots/tmp"
mkdir -p "$HOME/.config/swappy"

echo -e "[Default]
save_dir=$HOME/Desktop/Screenshots/
save_filename_format=Capture_%Y-%m-%d_%H-%M-%S.png
show_panel=true" > "$HOME/.config/swappy/config"

BEGINNING="gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['$KEY_PATH/custom0/', '$KEY_PATH/custom1/', '$KEY_PATH/custom2/']"


# Full Screen KeyBinding
$BEGINNING/custom0/ name "Full Screenshot"
$BEGINNING/custom0/ command "swapshot"
$BEGINNING/custom0/ binding "<Super><Shift>S"

# Selection Mode KeyBinding
$BEGINNING/custom1/ name "Area Screenshot"
$BEGINNING/custom1/ command "swapshot -a"
$BEGINNING/custom1/ binding "<Super><Shift>A"

# Window Mode Keybindings
$BEGINNING/custom2/ name "Window Screenshot"
$BEGINNING/custom2/ command "swapshot -w"
$BEGINNING/custom2/ binding "<Super><Shift>W"

echo -e "\n\n"
echo "Full Screenshot --> Win(Super) + Shift + S"
echo "Area Screenshot --> Win(Super) + Shift + A"
echo "Window Screenshot --> Win(Super) + Shift + W"
echo "KeyBindings Set Successfully !!"