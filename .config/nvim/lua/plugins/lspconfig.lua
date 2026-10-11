return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local on_attach = function(client, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = bufnr,
						silent = true,
						desc = desc,
					})
				end

				map("n", "gd", vim.lsp.buf.definition, "Go to definition")
				map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				map("n", "gr", vim.lsp.buf.references, "Find references")
				map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
				map("n", "K", vim.lsp.buf.hover, "Show hover documentation")
				map("n", "<C-k>", vim.lsp.buf.signature_help, "Show signature help")
				if client.name == "intellij" then
					map("n", "<leader>lf", "<cmd>IntellijLspFormat<cr>", "Format Java/Kotlin file")
				end
				map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
				map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
				map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
				map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
				-- map("n", "<leader>le", vim.diagnostic.open_float, "Show diagnostic")
				-- map("n", "<leader>dl", vim.diagnostic.setloclist, "Diagnostics list")

				-- Recreate mini.clue's leader trigger after LSP buffer mappings.
				-- Otherwise its older <Space> mapping intercepts <Space>lf/<Space>le.
				if package.loaded["mini.clue"] then
					require("mini.clue").ensure_buf_triggers(bufnr)
				end
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.name == "intellij" then
						on_attach(client, args.buf)
					end
				end,
			})

			vim.lsp.config("starpls", {
				filetypes = { "bzl", "starlark" },
				root_markers = { "MODULE.bazel", "WORKSPACE", "WORKSPACE.bazel", "BUILD.bazel", "BUILD" },
			})
			vim.lsp.enable("starpls")

			vim.lsp.config("ts_ls", {
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				root_dir = function(bufnr, on_dir)
					local root = vim.fs.root(bufnr, { "tsconfig.json", "jsconfig.json", "package.json" })
					if root then
						on_dir(root)
					end
				end,
				on_attach = on_attach,
			})
			vim.lsp.enable("ts_ls")
		end,
	},
}
