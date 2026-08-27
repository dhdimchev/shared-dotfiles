-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.
-- Replace Quattro defaults.
hl.unbind("SUPER + Q")
hl.unbind("SUPER + W")
hl.unbind("SUPER + D")
hl.unbind("SUPER + ALT + F")
hl.unbind("SUPER + O")
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + G")
hl.unbind("SUPER + SHIFT + S")
hl.unbind("SUPER + SHIFT + W")

-- Personal bindings.
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())
o.bind("SUPER + W", "Browser", { omarchy = "browser" })
o.bind("SUPER + D", "Full width", hl.dsp.window.fullscreen({ mode = "maximized" }))
o.bind("SUPER + O", "Omarchy menu", "omarchy-menu toggle root")
o.bind("SUPER + SPACE", "Apps menu", "omarchy-menu toggle apps")
o.bind("SUPER + SHIFT + S", "Screenshot to clipboard", "omarchy-capture-screenshot")
o.bind("SUPER + G", "ChatGPT", { webapp = "https://chatgpt.com" })
o.bind("SUPER + SHIFT + W", "Typora", { launch = "typora --enable-wayland-ime" })

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

