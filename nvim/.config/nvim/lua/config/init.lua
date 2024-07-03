require("config.lazy")
require("config.set")
require("config.remap")

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto save
vim.cmd [[autocmd InsertLeave * silent! update]]
vim.cmd [[autocmd TextChanged * silent! update]]

-- Copy current path
vim.api.nvim_create_user_command('Cppath', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
vim.keymap.set('n', '<leader>cp', ':Cppath<CR>')
