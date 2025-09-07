local M = {}

local cnf = require('top.config')

--- Health check function for the top.nvim plugin.
--- Validates that the configured system monitor binary is available in PATH.
--- Called by Neovim's health check system (:checkhealth top).
M.check = function()
  local bin = cnf:get_options().bin

  vim.health.start('top report')

  if not bin or bin == '' then
    vim.health.error('Binary option is nil or empty. Configure with: require("top").setup({ bin = "htop" })')
    return
  end

  if vim.fn.executable(bin) == 1 then
    vim.health.ok(string.format('Configured binary "%s" found on path', bin))
  else
    vim.health.error(string.format('Configured binary "%s" not found on path', bin))
    vim.health.info('Install the binary or reconfigure with an available one')
  end
end

return M
