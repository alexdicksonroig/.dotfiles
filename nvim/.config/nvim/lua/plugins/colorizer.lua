return {
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*", -- Enable colorizer for all file types
      })
    end
  }
}
