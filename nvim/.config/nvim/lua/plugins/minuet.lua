return {
	"milanglacier/minuet-ai.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("minuet").setup({
			provider = "claude",
			provider_options = {
				claude = {
					model = "claude-opus-4-5-20251101",
					max_tokens = 512,
					-- Uses ANTHROPIC_API_KEY env var by default
				},
			},
			-- Throttle requests to avoid excessive API calls
			throttle = 1500,
			-- Debounce delay in milliseconds
			debounce = 500,
		})

		-- Accept minuet completion with <C-h> (same as copilot was)
		vim.keymap.set("i", "<C-h>", function()
			require("minuet").accept()
		end, { desc = "Accept Minuet completion" })
	end,
}
