vim.api.nvim_create_user_command('Top', function() require('top').show() end, {
  desc = 'Open a floating window displaying the configured system monitor (htop/top/btop)',
})
