return {
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null_ls").setup()
    end,
  },
}
