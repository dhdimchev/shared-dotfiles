#!/bin/bash

DOTFILES_DIR="$HOME/shared-dotfiles/.config"
CONFIG_DIR="$HOME/.config"

# Add here the folders you want to sync
FOLDERS=(
  "hypr"
  "waybar"
  "omarchy"
  "nvim"
  "btop"
  "fastfetch"
)

mkdir -p "$DOTFILES_DIR"

for folder in "${FOLDERS[@]}"; do
    echo "Processing $folder..."

    if [ -L "$CONFIG_DIR/$folder" ]; then
        echo "  → Already symlinked. Skipping."
        continue
    fi

    if [ -d "$CONFIG_DIR/$folder" ]; then
        echo "  → Moving existing folder to dotfiles..."
        mv "$CONFIG_DIR/$folder" "$DOTFILES_DIR/"
    fi

    echo "  → Creating symlink..."
    ln -s "$DOTFILES_DIR/$folder" "$CONFIG_DIR/$folder"

    echo "  ✓ Done."
done

echo "All folders processed."

