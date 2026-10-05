return {
	{
		"creativenull/efmls-configs-nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local linters = {
				luacheck = require("efmls-configs.linters.luacheck"),
				ruff = require("efmls-configs.linters.ruff"),
				eslint_d = require("efmls-configs.linters.eslint_d"),
				shellcheck = require("efmls-configs.linters.shellcheck"),
				cpplint = require("efmls-configs.linters.cpplint"),
				go_revive = require("efmls-configs.linters.go_revive"),
			}

			local formatters = {
				stylua = require("efmls-configs.formatters.stylua"),
				ruff = require("efmls-configs.formatters.ruff"),
				prettier_d = require("efmls-configs.formatters.prettier_d"),
				fixjson = require("efmls-configs.formatters.fixjson"),
				shfmt = require("efmls-configs.formatters.shfmt"),
				clang_format = require("efmls-configs.formatters.clang_format"),
				gofumpt = require("efmls-configs.formatters.gofumpt"),
			}

			local languages = {
				c = { formatters.clang_format, linters.cpplint },
				cpp = { formatters.clang_format, linters.cpplint },
				css = { formatters.prettier_d },
				go = { formatters.gofumpt, linters.go_revive },
				html = { formatters.prettier_d },
				javascript = { linters.eslint_d, formatters.prettier_d },
				javascriptreact = { linters.eslint_d, formatters.prettier_d },
				json = { linters.eslint_d, formatters.fixjson },
				jsonc = { linters.eslint_d, formatters.fixjson },
				lua = { linters.luacheck, formatters.stylua },
				markdown = { formatters.prettier_d },
				python = { linters.ruff, formatters.ruff },
				sh = { linters.shellcheck, formatters.shfmt },
				typescript = { linters.eslint_d, formatters.prettier_d },
				typescriptreact = { linters.eslint_d, formatters.prettier_d },
				vue = { linters.eslint_d, formatters.prettier_d },
				svelte = { linters.eslint_d, formatters.prettier_d },
			}

			vim.lsp.config("efm", {
				cmd = { "efm-langserver" },
				filetypes = vim.tbl_keys(languages),
				init_options = {
					documentFormatting = true,
				},
				settings = {
					rootMarkers = { ".git/" },
					languages = languages,
				},
			})
			vim.lsp.enable("efm")
		end,
	},
}
