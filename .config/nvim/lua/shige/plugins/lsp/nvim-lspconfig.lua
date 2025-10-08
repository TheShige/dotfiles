return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true }
      opts.buffer = bufnr

      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      --vim.keymap.set('n', '<space>wl', function()
      --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      --end, opts)
      --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      --vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      --vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)

      --vim.keymap.set('n', '<space>f', function()
      --  vim.lsp.buf.format { async = true }
      --end, opts)

      vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

      client.server_capabilities.signatureHelpProvider = false
    end

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    lspconfig["clangd"].setup({
      cmd = {
        "clangd",
        "--fallback-style=webkit"
      },
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["jdtls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig['ts_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["dartls"].setup({
      -- cmd = { "dart", "language-server", "--protocol=lsp" },
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
