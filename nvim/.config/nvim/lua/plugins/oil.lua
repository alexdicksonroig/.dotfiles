return { 
	'stevearc/oil.nvim', 
	config = function()
    		require('oil').setup{
  			prompt_save_on_select_new_entry = false,
  			skip_confirm_for_simple_edits = true,
  			view_options = {
    				-- Show files and directories that start with "."
    				show_hidden = true,
  			},
			vim.keymap.set('n', ',,', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
		}
  	end,
}
