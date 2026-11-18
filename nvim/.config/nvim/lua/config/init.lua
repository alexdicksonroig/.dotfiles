require("config.lazy")
require("config.set")
require("config.remap")

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Autosave
vim.cmd([[
  autocmd InsertLeave * if &buftype == '' | update | endif
  autocmd TextChanged * if &buftype == '' | update | endif
]])

-- Show a compact save message without quotes around the filename
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("compact-save-message", { clear = true }),
	callback = function(event)
		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(event.buf), ":t")
		local lines = vim.api.nvim_buf_line_count(event.buf)
		local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(event.buf))
		local bytes = stat and stat.size or 0

		vim.schedule(function()
			vim.api.nvim_echo({ { string.format("%s %dL, %dB written", name, lines, bytes) } }, false, {})
		end)
	end,
})

-- Copy current path relative to the project root
vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%:p")
	if path == "" then
		vim.notify("No file path to copy", vim.log.levels.WARN)
		return
	end

	local file_dir = vim.fn.fnamemodify(path, ":h")
	local git_root = vim.fn.systemlist({ "git", "-C", file_dir, "rev-parse", "--show-toplevel" })[1]
	local root = vim.v.shell_error == 0 and git_root or vim.fn.getcwd()

	path = vim.fs.normalize(path)
	root = vim.fs.normalize(root)

	local relative_path = path
	if path:sub(1, #root + 1) == root .. "/" then
		relative_path = path:sub(#root + 2)
	else
		relative_path = vim.fn.fnamemodify(path, ":.")
	end

	vim.fn.setreg("+", relative_path)
	vim.notify('Copied "' .. relative_path .. '" to the clipboard!')
end, {})
vim.keymap.set("n", "<leader>cp", ":Cppath<CR>", { silent = true, desc = "Copy project-relative path" })
