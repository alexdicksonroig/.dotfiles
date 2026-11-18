vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "J", "<Nop>", { noremap = true, silent = true })

local function replace_word(search, replacement)
	if search == "" then
		vim.notify("Search word cannot be empty", vim.log.levels.WARN)
		return
	end

	-- Treat both inputs literally while retaining Vim's whole-word boundaries.
	local pattern = [[\V\<]] .. vim.fn.escape(search, [[\/]]) .. [[\>]]
	local escaped_replacement = vim.fn.escape(replacement, [[\/&]])
	local current_file = vim.api.nvim_buf_get_name(0)
	local root = vim.fs.root(current_file ~= "" and current_file or vim.fn.getcwd(), ".git") or vim.fn.getcwd()

	local result = vim.system({
		"rg",
		"--vimgrep",
		"--hidden",
		"--smart-case",
		"--fixed-strings",
		"--word-regexp",
		"--glob",
		"!.git/*",
		search,
		root,
	}, { text = true }):wait()

	if result.code == 1 then
		vim.notify('No matches for "' .. search .. '"', vim.log.levels.INFO)
		return
	end
	if result.code ~= 0 then
		vim.notify("Search failed: " .. (result.stderr or "unknown ripgrep error"), vim.log.levels.ERROR)
		return
	end

	local results = vim.split(result.stdout or "", "\n", { trimempty = true })
	vim.fn.setqflist({}, " ", {
		title = "Replace: " .. search .. " → " .. replacement .. " (" .. root .. ")",
		lines = results,
		efm = "%f:%l:%c:%m",
	})

	-- :cfdo visits each matched file once; %s applies the confirmed replacement
	-- throughout that file and :update saves only when a replacement was accepted.
	vim.cmd("cfdo %s/" .. pattern .. "/" .. escaped_replacement .. "/gc | update")
	vim.cmd("copen")
end

vim.api.nvim_create_user_command("Replace", function(command)
	if #command.fargs ~= 2 then
		vim.notify("Usage: :Replace <search> <replacement>", vim.log.levels.ERROR)
		return
	end
	local search, replacement = unpack(command.fargs)
	replace_word(search, replacement)
end, { nargs = "+", desc = "Confirm project replacements and list matches in quickfix" })

vim.keymap.set("n", "<leader>r", function()
	vim.ui.input({ prompt = "Replace word: ", default = vim.fn.expand("<cword>") }, function(search)
		if not search then
			return
		end
		vim.ui.input({ prompt = "Replace with: " }, function(replacement)
			if replacement then
				replace_word(search, replacement)
			end
		end)
	end)
end, { desc = "Search and replace word across project" })

-- Console log helper
vim.keymap.set(
	"n",
	"<leader>cl",
	"console.log()<Esc>ha",
	{ noremap = true, silent = true, desc = "Insert console.log()" }
)
