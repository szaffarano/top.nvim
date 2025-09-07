--- UI configuration for the floating window display
--- @class (exact) top.UIConfig
--- @field height_percent? number Height as percentage of screen (0.0-1.0, default: 0.8)
--- @field width_percent? number Width as percentage of screen (0.0-1.0, default: 0.8)
--- @field border? string Border style for the UI window (e.g., 'single', 'rounded', 'double', default: 'single')

--- Main plugin configuration options
--- @class (exact) top.Options
--- @field bin? string System monitor binary to execute (e.g., 'htop', 'top', 'btop', default: 'htop')
--- @field ui? top.UIConfig UI configuration for the floating window

return {}
