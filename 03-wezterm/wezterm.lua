local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

-- Neovim integration
local function isViProcess(pane)
    -- get_foreground_process_name On Linux, macOS and Windows,
    -- the process can be queried to determine this path. Other operating systems
    -- (notably, FreeBSD and other unix systems) are not currently supported
    return pane:get_foreground_process_name():find('n?vim') ~= nil
    -- return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
    if isViProcess(pane) then
        window:perform_action(
            -- This should match the keybinds you set in Neovim.
            act.SendKey({ key = vim_direction, mods = 'CTRL' }),
            pane
        )
    else
        window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
    end
end
wezterm.on('ActivatePaneDirection-right', function(window, pane)
    conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
    conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
    conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
    conditionalActivatePane(window, pane, 'Down', 'j')
end)

config.default_prog = { '/usr/bin/fish', '-l' }
config.default_cursor_style = 'SteadyBar'
config.tab_bar_at_bottom = true
config.tab_max_width = 80
config.use_fancy_tab_bar = false

config.font = wezterm.font('Hack Nerd Font FC Ligatured', {weight='Bold'})
config.freetype_load_target = 'Light'
config.freetype_render_target = 'Light'
config.font_size = 11.0
config.line_height = 1.0
config.window_padding = {
    left = '0px',
    right = '0px',
    top = '0px',
    bottom = '0px',
}
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}
config.window_background_opacity = 0.9

config.enable_kitty_keyboard = true
config.disable_default_key_bindings = true
config.keys = {
    -- build-in actions
    {key="C", mods = 'CTRL', action=act.CopyTo 'Clipboard'},
    {key="V", mods = 'CTRL', action=act.PasteFrom 'Clipboard'},
    {key='F', mods = 'CTRL', action=act.Search 'CurrentSelectionOrEmptyString'},
    {key='N', mods = 'CTRL', action=act.SpawnWindow},
    {key='P', mods = 'CTRL', action=act.ActivateCommandPalette},
    {key='PageUp', mods = 'SHIFT', action=act.ScrollByPage(-1)},
    {key='PageDown', mods ='SHIFT', action=act.ScrollByPage(1)},

    -- custom actions
    {key="t", mods="CTRL", action=act.SpawnTab 'CurrentPaneDomain'},
    {key="1", mods="ALT", action=act.ActivateTab(0)},
    {key="2", mods="ALT", action=act.ActivateTab(1)},
    {key="3", mods="ALT", action=act.ActivateTab(2)},
    {key="4", mods="ALT", action=act.ActivateTab(3)},
    {key="5", mods="ALT", action=act.ActivateTab(4)},
    {key="6", mods="ALT", action=act.ActivateTab(5)},
    {key="7", mods="ALT", action=act.ActivateTab(6)},
    {key="8", mods="ALT", action=act.ActivateTab(7)},
    {key="9", mods="ALT", action=act.ActivateTab(8)},
    {key="0", mods="ALT", action=act.ActivateTab(9)},
    {key="LeftArrow", mods="SHIFT", action=act.ActivateTabRelative(-1)},
    {key="RightArrow", mods="SHIFT", action=act.ActivateTabRelative(1)},
    {key="LeftArrow", mods="CTRL|SHIFT", action=act.MoveTabRelative(-1)},
    {key="RightArrow", mods="CTRL|SHIFT", action=act.MoveTabRelative(1)},
    {key="h", mods="CTRL", action=act.EmitEvent("ActivatePaneDirection-left")},
    {key="j", mods="CTRL", action=act.EmitEvent("ActivatePaneDirection-down")},
    {key="k", mods="CTRL", action=act.EmitEvent("ActivatePaneDirection-up")},
    {key="l", mods="CTRL", action=act.EmitEvent("ActivatePaneDirection-right")},

    {key="a", mods="CTRL", action=act.ActivateKeyTable{name = 'alpha', one_shot = true}},
}

config.key_tables = {
    alpha = {
        {key="\\", action=act.SplitHorizontal{domain="CurrentPaneDomain"}},
        {key="-", action=act.SplitVertical{domain="CurrentPaneDomain"}},
        -- exchange with pane to the left
    }
}

wezterm.on('update-right-status', function(window, pane)
    local name = window:active_key_table()
    if name then
        name = 'TABLE: ' .. name
    end
    window:set_right_status(name or '')
end)

return config
