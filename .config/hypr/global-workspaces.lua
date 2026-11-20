-- Global workspaces (the pre-Quattro behavior).
--
-- Omarchy now always loads default/hypr/monitor-workspaces.lua, which gives
-- every monitor its own block of ten (laptop 1-10, HDMI 11-20, DP 21-30) and
-- makes Super + N switch only within the focused monitor. There is no flag to
-- turn it off, so this file neuters it:
--
--   * Super + N focuses global workspace N. Workspaces 1-3 are pinned to
--     monitors in monitors.lua, so Hyprland jumps to that monitor and
--     warp_on_change_workspace puts the cursor in the middle of it.
--   * The reconcile step (run on start, reload and hotplug) that renumbers and
--     moves workspaces into per-monitor blocks is disabled.
--   * The bar widget's click/scroll expressions use global ids too.
--
-- The bar reads ~/.local/state/omarchy/monitor-workspaces to decide which
-- block each monitor shows; every monitor is written there as block 0 so each
-- bar shows workspaces 1-10.
--
-- Delete this file (and its require in hyprland.lua) to go back to Omarchy's
-- per-monitor workspaces.

local M = o.workspaces

local function action(fn, expression)
  o.bind_expressions[fn] = expression
  return fn
end

function M.workspace_id(_, slot)
  return slot
end

function M.reconcile() end

function M.focus(slot)
  return action(function()
    hl.dispatch(hl.dsp.focus({ workspace = tostring(slot) }))
  end, "o.workspaces.focus(" .. slot .. ")")
end

function M.move_window(slot, follow)
  return action(function()
    hl.dispatch(hl.dsp.window.move({ workspace = tostring(slot), follow = follow ~= false }))
  end, "o.workspaces.move_window(" .. slot .. (follow == false and ", false" or "") .. ")")
end

function M.move_to_monitor(direction)
  return action(function()
    local target = hl.get_monitor(direction)
    if target then
      hl.dispatch(hl.dsp.workspace.move({ monitor = target.name }))
    end
  end, "o.workspaces.move_to_monitor(" .. string.format("%q", direction) .. ")")
end

-- Every monitor on block 0, so each bar lists workspaces 1-10.
do
  local state = (os.getenv("XDG_STATE_HOME") or (os.getenv("HOME") .. "/.local/state")) .. "/omarchy"
  local lines = {}
  for _, monitor in ipairs(hl.get_monitors()) do
    if not monitor.is_mirror then
      local identity = (monitor.description and monitor.description ~= "") and monitor.description or monitor.name
      lines[#lines + 1] = "0\t" .. monitor.name .. "\t" .. identity
    end
  end
  if #lines > 0 then
    os.execute("mkdir -p '" .. state .. "'")
    local file = io.open(state .. "/monitor-workspaces", "w")
    if file then
      file:write(table.concat(lines, "\n") .. "\n")
      file:close()
    end
  end
end

-- The default Super + N bindings captured the per-monitor actions when they
-- were created, so bind the keys again with the global ones.
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  o.rebind("SUPER + " .. key, "Switch to workspace " .. workspace, M.focus(workspace))
  o.rebind("SUPER + SHIFT + " .. key, "Move window to workspace " .. workspace, M.move_window(workspace))
  o.rebind("SUPER + SHIFT + ALT + " .. key, "Move window silently to workspace " .. workspace, M.move_window(workspace, false))
end

o.rebind("SUPER + SHIFT + ALT + LEFT", "Move workspace to left monitor", M.move_to_monitor("l"))
o.rebind("SUPER + SHIFT + ALT + RIGHT", "Move workspace to right monitor", M.move_to_monitor("r"))
o.rebind("SUPER + SHIFT + ALT + UP", "Move workspace to up monitor", M.move_to_monitor("u"))
o.rebind("SUPER + SHIFT + ALT + DOWN", "Move workspace to down monitor", M.move_to_monitor("d"))
o.rebind("SUPER + TAB", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
o.rebind("SUPER + SHIFT + TAB", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
