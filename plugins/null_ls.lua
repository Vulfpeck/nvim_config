local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting

local M = {}

M.setup = function()
  null_ls.setup {
    sources = {
      formatting.stylua.with { filetypes = { "lua" } },
      formatting.prettier.with {
        filetypes = {
          "html",
          "markdown",
          "css",
          "typescript",
          "javascript",
          "json",
          "svelte",
          "javascriptreact",
          "typescriptreact",
        },
      },
      formatting.autopep8.with { filetypes = { "python" } },
      formatting.gofmt.with { filetypes = { "go" } },
      formatting.clang_format,
    },
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
    end,
  }
end

return M
