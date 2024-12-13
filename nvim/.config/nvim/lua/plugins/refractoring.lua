return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup({})
    vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file<CR>")
  end,
}
