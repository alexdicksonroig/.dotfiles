return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters = {
					zigfmt = {
						command = "zig",
						args = { "fmt", "--stdin" }, -- Formats via stdin
						stdin = true, -- Required for piping to stdin
					},
					rustfmt = {
						command = "rustfmt",
						args = { "--emit=stdout" },
						stdin = true,
					},
				},
				-- Map of filetype to formatters
				formatters_by_ft = {
					zig = { "zigfmt" },
					rust = { "rustfmt" },
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					go = { "goimports", "gofmt" },
					-- Use a sub-list to run only the first available formatter
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					markdown = { "prettier" },
					yaml = { "prettier" },
					-- You can use a function here to determine the formatters dynamically
					python = function(bufnr)
						if require("conform").get_formatter_info("ruff_format", bufnr).available then
							return { "ruff_format" }
						else
							return { "isort", "black" }
						end
					end,
					-- Use the "*" filetype to run formatters on all filetypes.
					["*"] = { "codespell" },
					-- Use the "_" filetype to run formatters on filetypes that don't
					-- have other formatters configured.
					["_"] = { "trim_whitespace" },
				},
				-- If this is set, Conform will run the formatter on save.
				-- It will pass the table to conform.format().
				-- This can also be a function that returns the table.
				format_on_save = {
					-- I recommend these options. See :help conform.format for details.
					lsp_format = true,
					async = false,
					timeout_ms = 500,
				},
				-- If this is set, Conform will run the formatter asynchronously after save.
				-- It will pass the table to conform.format().
				-- This can also be a function that returns the table.
				format_after_save = {
					lsp_format = "fallback",
				},
				-- Set the log level. Use `:ConformInfo` to see the location of the log file.
				log_level = vim.log.levels.ERROR,
				-- Conform will notify you when a formatter errors
				notify_on_error = true,
			})

			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end)
		end,
	},
}
