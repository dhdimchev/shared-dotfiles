#!/bin/bash

DOTFILES_DIR="$HOME/shared-dotfiles/.config"
CONFIG_DIR="$HOME/.config"

# Folders you want linked
FOLDERS=(
  "hypr"
  "waybar"
  "omarchy"
  "nvim"
  "btop"
  "fastfetch"
)

for folder in "${FOLDERS[@]}"; do
    echo "Processing $folder..."

    if [ ! -d "$DOTFILES_DIR/$folder" ]; then
        echo "  ✗ Repo folder missing: $DOTFILES_DIR/$folder"
        continue
    fi

    if [ -L "$CONFIG_DIR/$folder" ]; then
        echo "  → Already symlinked. Skipping."
        continue
    fi

    if [ -d "$CONFIG_DIR/$folder" ]; then
        echo "  → Removing local folder..."
        rm -rf "$CONFIG_DIR/$folder"
    fi

    echo "  → Creating symlink..."
    ln -s "$DOTFILES_DIR/$folder" "$CONFIG_DIR/$folder"

    echo "  ✓ Linked."
done

echo "Done."

