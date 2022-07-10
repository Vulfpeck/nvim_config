-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "radium",
}

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["nvim-telescope/telescope.nvim"] = {
      extensions_list = { "fzf", "themes", "terms" },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    },
    ["nvim-treesitter.configs"] = {
      ensure_installed = { "all" },
    },
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
}

return M
