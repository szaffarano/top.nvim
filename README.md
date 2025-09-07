# top.nvim

A simple Neovim plugin that displays system monitors (htop/top/btop) in a
floating window.

## Installation

### lazy.nvim

```lua
return {
  "szaffarano/top.nvim",
    ---@module 'top.types'
    ---@type top.Options
    opts = {
      bin = "btop",
      ui = {
        border = "rounded",
      },
  },
}
```

## Usage

- **Command**: `:Top`: Open the system monitor in a floating window
- **Lua**: `require('top').show()`: Programmatically open the monitor
- **Health check**: `:checkhealth top`: Verify system monitor availability

## Configuration

The plugin uses these defaults:

```lua
{
  bin = 'htop',           -- System monitor binary
  ui = {
    height_percent = 0.8, -- Window height (0.0-1.0)
    width_percent = 0.8,  -- Window width (0.0-1.0)
    border = 'single',    -- Border style
  },
}
```

## Requirements

- Neovim 0.8+
- A system monitor: `htop`, `top`, or `btop`

## License

MIT
