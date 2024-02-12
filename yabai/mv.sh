#!/bin/bash

# Define source directory and target directory
source_dir="$HOME/.config"
target_dir="$HOME/Code/dotfiles"

# List files and directories in ~/.config/ and prompt user to choose one
echo "Choose a file or directory to copy:"
select item in "$source_dir"/*; do
	if [ -n "$item" ]; then
		if [ -d "$item" ]; then
			echo "Copying directory $item to $target_dir"
			cp -r "$item" "$target_dir"
			echo "Directory copied successfully."
		elif [ -f "$item" ]; then
			echo "Copying file $item to $target_dir"
			cp "$item" "$target_dir"
			echo "File copied successfully."
		else
			echo "Unknown item selected."
		fi
	else
		echo "Invalid selection. Please try again."
	fi
	break
done
