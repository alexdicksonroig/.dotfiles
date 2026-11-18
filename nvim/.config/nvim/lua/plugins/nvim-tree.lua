return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
	},
	opts = {
		filters = {
			dotfiles = false,
		},
		update_focused_file = {
			enable = true,
		},
		view = {
			side = "left",
			width = 80,
			number = true,
		},
	},
	}
