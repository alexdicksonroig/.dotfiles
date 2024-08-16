return {
	'github/copilot.vim',
	config = function()
		vim.keymap.set('i', '<C-h>', 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
	end,
}

