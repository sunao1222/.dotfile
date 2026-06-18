local wezterm = require "wezterm"
local act = wezterm.action
local config = wezterm.config_builder()

config.enable_wayland = true
config.enable_tab_bar = false
config.use_ime = true
config.check_for_updates = false

config.default_prog = { "zsh" }

-- config.window_background_opacity = 0.95
config.window_background_opacity = 0.3
config.text_background_opacity = 1.0

config.font_size = 13.0
config.font = wezterm.font("HackGen Console NF", {weight="Regular", stretch="Normal"})

config.color_scheme = "Tokyo Night Moon"

config.exit_behavior = 'Close'

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

config.leader = { key = 'Space', mods = 'CTRL|SHIFT' }

config.keys = {
  {
    key = 'r',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },
  {
    key = 'a',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'activate_pane',
      timeout_milliseconds = 1000,
    },
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'create_pane',
      timeout_milliseconds = 1000,
    },
  },
}

config.key_tables = {
  resize_pane = {
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    { key = 'Escape', action = 'PopKeyTable' },
  },
  activate_pane = {
    { key = 'h', action = act.ActivatePaneDirection 'Left' },

    { key = 'l', action = act.ActivatePaneDirection 'Right' },

    { key = 'k', action = act.ActivatePaneDirection 'Up' },

    { key = 'j', action = act.ActivatePaneDirection 'Down' },
  },
  create_pane = {
    { key = '\'', action = act.SplitHorizontal { domain = 'CurrentPaneDomain'} },

    { key = '5', action = act.SplitVertical { domain = 'CurrentPaneDomain'} },
  },
}

--config.serial_ports = {}
--
--for _, val in ipairs(wezterm.read_dir "dir") do
--  if string.find(val, "/dev/ttyUSB%d*") then
--    data = {
--      name = string.gsub(val, "/dev/ttyUSB", "usb"),
--      port = val,
--      baud = 9600,
--    }
--
--    table.insert(config.serial_ports, data)
--    end
--  end

return config
