
# NOTE: This is for me not to forget wtf I was doing


# Shared Dotfiles

This repository contains my custom configuration overrides for Omarchy / Arch Linux.

The goal is to keep multiple machines in sync using a single source of truth.

---
# How It Works

The repository acts as the **single source of truth**.

Each machine:
~/.config/hypr → ~/shared-dotfiles/.config/hypr
So when configs are updated in the repo and pushed, pulling on another machine updates everything automatically.

Workflow:

1. Edit config
2. `git add .`
3. `git commit`
4. `git push`
5. On other machine → `git pull`

Done.

---

# Setup On a New Machine
## 1. Clone the repo

git clone git@github.com:dhdimchev/shared-dotfiles.git ~/shared-dotfiles
cd ~/shared-dotfiles

## 2. Run setup script
chmod +x setup-dotfiles.sh
./setup-dotfiles.sh


The script will:

Move existing selected config folders into the repo (if needed)

Create symlinks from ~/.config to the repo

Skip folders already linked



