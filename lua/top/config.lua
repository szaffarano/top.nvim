--- @class top.TopConfig
--- @field private opts top.Options Configuration options
local TopConfig = {
  opts = {
    bin = 'htop',
    ui = {
      height_percent = 0.8,
      width_percent = 0.8,
      border = 'single',
    },
  },
}

--- Set configuration options by merging custom options with defaults.
--- Custom options take precedence over default values using vim.tbl_deep_extend with 'keep' behavior.
--- @param custom_opts top.Options|nil Custom configuration options to merge with defaults
function TopConfig:set_options(custom_opts)
  custom_opts = custom_opts or {}

  self.opts = vim.tbl_deep_extend('keep', custom_opts, self.opts)
end

--- Get the current merged configuration options
--- @return top.Options The current configuration with all applied customizations
function TopConfig:get_options() return self.opts end

return TopConfig
