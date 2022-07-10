local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config
  local servers =
  { "html", "cssls", "tailwindcss", "jsonls", "prismals", "eslint", "tsserver", "cssmodules_ls", "pyright" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = function(client, bufnr)
        attach(client, bufnr)
        -- change gopls server capabilities
        if lsp == "null-ls" then
          client.resolved_capabilities.document_formatting = true
          client.resolved_capabilities.document_range_formatting = true
          client.server_capabilities.documentFormattingProvider = true
          client.server_capabilities.documentRangeFormattingProvider = true
        end
      end,
      capabilities = capabilities,
    }
  end
end

return M
