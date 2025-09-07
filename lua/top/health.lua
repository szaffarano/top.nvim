local M = {}

local cnf = require('top.config')

--- Health check function for the top.nvim plugin.
--- Validates that the configured system monitor binary is available in PATH.
--- Called by Neovim's health check system (:checkhealth top).
M.check = function()
  local bin = cnf:get_options().bin

  vim.health.start('top report')

  if vim.fn.executable(bin) == 0 then
    vim.health.error(string.format('%s not found on path', bin))
    return
  end

  vim.health.ok(string.format('%s found on path', bin))
end

return M
