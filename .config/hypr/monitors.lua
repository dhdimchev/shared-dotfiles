-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1.25

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Monitor layout
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 2 })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto", scale = 1, transform = 3 })
hl.monitor({ output = "DP-1", mode = "preferred", position = "auto", scale = 1 })

-- Workspace assignments
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })

-- Equivalent of the old exec-once workspace moves
hl.on("hyprland.start", function()
  hl.timer(function()
    hl.dispatch(hl.dsp.workspace.move({ workspace = "1", monitor = "HDMI-A-1" }))
    hl.dispatch(hl.dsp.workspace.move({ workspace = "2", monitor = "DP-1" }))
    hl.dispatch(hl.dsp.workspace.move({ workspace = "3", monitor = "eDP-1" }))
  end, { timeout = 100, type = "oneshot" })
end)
