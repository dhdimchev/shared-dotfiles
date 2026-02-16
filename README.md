# Shared Dotfiles

Running the same Arch / Omarchy setup on multiple machines leads to config drift.

This repo solves it with a simple approach:

- Real configs live here
- `~/.config` is symlinked to this repo
- Git is used to sync changes across machines

Two scripts:

- `setup-dotfiles.sh` → migrate first machine (move + link)
- `link-dotfiles.sh` → link additional machines (link only)

---

# First Machine (Migration)

```bash
git clone git@github.com:dhdimchev/shared-dotfiles.git ~/shared-dotfiles
cd ~/shared-dotfiles
chmod +x setup-dotfiles.sh
./setup-dotfiles.sh
```

Commit and push after migration.

---

# Additional Machines

```bash
git clone git@github.com:dhdimchev/shared-dotfiles.git ~/shared-dotfiles
cd ~/shared-dotfiles
chmod +x link-dotfiles.sh
./link-dotfiles.sh
```

---

# Daily Sync

On machine where changes are made:

```bash
cd ~/shared-dotfiles
git add .
git commit -m "update"
git push
```

On other machines:

```bash
cd ~/shared-dotfiles
git pull
```

Reload Hyprland if needed.

---

If you find this useful, feel free to use it.
