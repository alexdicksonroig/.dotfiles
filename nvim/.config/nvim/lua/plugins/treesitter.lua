return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"javascript",
				"typescript",
				"tsx",
				"bash",
				"c",
				"html",
				"lua",
				"css",
				"luadoc",
				"markdown",
				"vim",
				"vimdoc",
				"zig",
			},
			auto_install = true,
		})

		-- Enable treesitter highlighting for all buffers
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
