local M = {}

local cnf = require('top.config')

--- Opens a floating window displaying a terminal running the configured system monitor (htop/top/btop).
--- The window is centered on screen with configurable dimensions and border style.
--- The terminal starts in insert mode and auto-closes when the monitor process exits.
--- @param opts? {win?:integer} Optional window configuration (currently unused)
function M.show(opts)
  opts = opts or {}

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = buf })
  vim.api.nvim_set_option_value('modifiable', false, { buf = buf })

  local height = math.ceil(vim.o.lines * cnf:get_options().ui.height_percent)
  local width = math.ceil(vim.o.columns * cnf:get_options().ui.width_percent)

  local win = vim.api.nvim_open_win(buf, true, {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = math.ceil((vim.o.lines - height) / 2),
    col = math.ceil((vim.o.columns - width) / 2),
    border = cnf:get_options().ui.border,
  })

  -- Change to the window that is floating to ensure termopen uses correct size
  vim.api.nvim_set_current_win(win)

  local bin = cnf:get_options().bin
  if not bin or bin == '' then
    vim.notify('top.nvim: Binary option is nil or empty. Please configure it properly.', vim.log.levels.WARN)
    vim.api.nvim_win_close(win, true)
    return
  end
  if vim.fn.executable(bin) == 0 then
    vim.notify(
      string.format('top.nvim: Binary "%s" not found on PATH. Please install it or reconfigure.', bin),
      vim.log.levels.WARN
    )
    vim.api.nvim_win_close(win, true)
    return
  end

  -- Launch top, and configure to close the window when the process exits
  vim.fn.jobstart({ bin }, {
    term = true,
    on_exit = function(_, _, _)
      if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
    end,
  })

  -- Start in terminal mode
  vim.cmd.startinsert()
end

--- Setup the plugin with custom configuration options.
--- This should be called once during plugin initialization, typically in your init.lua or plugin configuration.
--- @param custom_opts top.Options|nil Custom options to override defaults
function M.setup(custom_opts) cnf:set_options(custom_opts) end
return M
