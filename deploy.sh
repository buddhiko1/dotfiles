#!/bin/bash

function create_soft_link {
    file_path="$1/$3"
    link_path="$2/$3"

    if [ -e "$link_path" ]; then
        echo "$3 already exists, remove it fistly."
        sudo rm -rf "$link_path"
    fi

    ln -s "$file_path" "$link_path"
    echo "Soft link for $3 created successfully."
    echo "------------------------------------------------------------------------"
}

# files under $HOME/.config
files=("alacritty" "helix" "nvim" "background" "fish" "gitui" "mako" "scripts" "sioyek" "sway" "swayimg" "swaylock" "libinput-gestures.conf")
for file in "${files[@]}"
do
    create_soft_link "$HOME/dotfiles" "$HOME/.config" "$file"
done

# files for input method
files=("luna_pinyin_userdb" "default.custom.yaml" "luna_pinyin.custom.yaml")
for file in "${files[@]}"
do
    create_soft_link "$HOME/dotfiles/rime" "$HOME/.local/share/fcitx5/rime" "$file"
done

# files for gentoo 
files=("package.use" "repos.conf" "make.conf" "package.accept_keywords" "package.license" "package.mask" "package.unmask")
for file in "${files[@]}"
do
    sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/dotfiles/gentoo/etc/portage' '/etc/portage' '$file'"   
done
sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/dotfiles/gentoo' '/usr/src/linux' '.config'"   
sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/dotfiles/gentoo/etc' '/etc' 'fstab'"   
sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/dotfiles/gentoo/etc' '/etc' 'environment'"   
sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/dotfiles/gentoo/etc' '/etc/systemd/system/getty@tty1.service.d' 'autologin.conf'"   
# sudo bash -c "$(declare -f create_soft_link); create_soft_link '$HOME/dotfiles/gentoo/etc/bluetooth' '/etc/bluetooth' 'main.conf'"   

# other file
create_soft_link "$HOME/dotfiles" "$HOME/.xkb/symbols" "us-pali"
create_soft_link "$HOME/dotfiles" "$HOME" ".gitconfig"

