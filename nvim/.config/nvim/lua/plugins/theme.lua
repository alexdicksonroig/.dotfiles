--[[
return { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, 	init = function()
		vim.cmd.colorscheme("gruvbox")
	end,
}
--]]
---[[
return { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"folke/tokyonight.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	init = function()
		local function system_appearance()
			if vim.fn.has("macunix") == 1 then
				local output = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
				return vim.v.shell_error == 0 and output:match("Dark") and "dark" or "light"
			end

			return "dark"
		end

		local function apply_theme()
			local appearance = system_appearance()
			local colorscheme = appearance == "light" and "tokyonight-day" or "tokyonight"

			if vim.o.background == appearance and vim.g.colors_name == colorscheme then
				return
			end

			vim.o.background = appearance
			vim.cmd.colorscheme(colorscheme)
			vim.cmd([[
  highlight Comment guibg=none
  highlight Normal guibg=none ctermbg=none
  highlight NormalFloat guibg=none ctermbg=none
  highlight NonText guibg=none ctermbg=none
  highlight SignColumn guibg=none ctermbg=none
  highlight EndOfBuffer guibg=none ctermbg=none
]])
		end

		apply_theme()

		vim.api.nvim_create_autocmd({ "FocusGained", "VimResume" }, {
			desc = "Follow system appearance for the colorscheme",
			group = vim.api.nvim_create_augroup("system-appearance-colorscheme", { clear = true }),
			callback = apply_theme,
		})
	end,
}
--]]
--[[
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end,
  }
--]]
--[[
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		require("catppuccin").setup({
			flavour = "auto", -- latte, frappe, macchiato, mocha
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				harpoon = true,
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})
		--vim.cmd.colorscheme("catppuccin-latte")
		--vim.cmd.colorscheme("catppuccin-frappe")
		vim.cmd.colorscheme("catppuccin-macchiato")
		--vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
--]]

--[[
--
  vim.cmd [[
  highlight Comment guibg=none
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight SignColumn guibg=none
]]
--]]
