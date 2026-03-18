local light_theme = "Breadog (Gogh)"
local dark_theme = "Catppuccin Mocha"

local wezterm = require('wezterm')

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return 'Dark'
end

local function scheme_for_appearance(appearance)
    if appearance:find 'Light' then
        return light_theme
    else
        return dark_theme
    end
end

local config = {}

config.color_scheme = scheme_for_appearance(get_appearance())

config.font = wezterm.font 'Maple Mono NF'
config.font_size = 16

config.window_close_confirmation = 'NeverPrompt'

-- auto maximize on startup
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    if mux then
        local tab, pane, window = mux.spawn_window(cmd or {})
        window:gui_window():maximize()
    end
end)

-- and finally, return the configuration to wezterm
return config
