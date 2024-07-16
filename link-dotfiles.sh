#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

CONFIG_DIR="$HOME/.config"

SCRIPT_NAME=$(basename "$0")

EXCLUDE_FILES=("backgrounds" "$SCRIPT_NAME")

mkdir -p "$CONFIG_DIR"

create_symlink(){
	local source="$1"
	local target="$2"

	if [ -e "$target" ]; then
		echo "Removing existing $target"
		rm -rf "$target"
	fi

	echo "Creating symlink: $target -> $source"
	ln -s "$source" "$target"
}

for file in "$DOTFILES_DIR"/*; do

  filename=$(basename "$file")
  if [[ " ${EXCLUDE_FILES[@]} " =~ " $filename " ]]; then		
    continue
  fi

	create_symlink "$file" "$CONFIG_DIR/$filename"
done

echo "Symlinks creation completed."
