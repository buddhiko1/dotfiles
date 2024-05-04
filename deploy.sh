#!/bin/bash

function create_soft_link {
  file_path="$1/$3"
  link_path="$2/$3"

  if [ -e "$link_path" ]; then
    echo "$3 already exists, remove it fistly."
    sudo rm -rf "$link_path"
  fi

  if [ -L "$link_path" ]; then
    if [ ! -e "$(readlink "$link_file")" ]; then
      echo "$3 is a invalid link file, remove it firstly."
      sudo rm "$link_path"
    fi
  fi

  ln -s "$file_path" "$link_path"
  echo "Soft link for $3 created successfully."
  echo "------------------------------------------------------------------------"
}

# $HOME/.config
files=("alacritty" "helix" "nvim" "fish" "gitui" "mako" "scripts" "sioyek" "sway" "swayimg" "swaylock" "broot")
for file in "${files[@]}"
do
  create_soft_link "$HOME/dotfiles" "$HOME/.config" "$file"
done

# keyboard
mkdir -p $HOME/.xkb/symbols
create_soft_link "$HOME/dotfiles" "$HOME/.xkb/symbols" "us-pali"

# other file
create_soft_link "$HOME/dotfiles" "$HOME" ".gitconfig"

# input method
mkdir -p $HOME/.config/fcitx
create_soft_link "$HOME/dotfiles" "$HOME/.config/fcitx" "rime"
