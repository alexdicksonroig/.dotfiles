return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
	keys = {
		{ "<leader>vo", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
		{ "<leader>vc", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
		{ "<leader>vh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview current file history" },
		{ "<leader>vH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview repo history" },
	},
	opts = {},
}
