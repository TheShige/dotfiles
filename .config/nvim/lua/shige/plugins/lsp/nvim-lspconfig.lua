return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

      vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

      client.server_capabilities.signatureHelpProvider = false
    end

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = "",
      })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("lua_ls", {
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

    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--fallback-style=webkit",
      },
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("pyright", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    local java21_home = "/usr/lib/jvm/java-21-openjdk"
    local lombok_jar = "/home/shige/.m2/repository/org/projectlombok/lombok/1.18.42/lombok-1.18.42.jar"

    vim.lsp.config("jdtls", {
      cmd = {
        "jdtls",
        "--jvm-arg=-javaagent:" .. lombok_jar,
      },
      cmd_env = {
        JAVA_HOME = java21_home,
      },
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("dartls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("pyright")
    vim.lsp.enable("jdtls")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("dartls")
  end,
}
