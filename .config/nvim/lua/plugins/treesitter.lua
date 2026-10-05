return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup({})

			local ensure_installed = {
        "java",
				"vim",
				"vimdoc",
				"rust",
				"c",
				"cpp",
				"c_sharp",
				"go",
				"html",
				"css",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"typescript",
				"vue",
				"svelte",
				"bash",
			}

			local config = require("nvim-treesitter.config")
			local already_installed = config.get_installed()
			local parsers_to_install = {}

			for _, parser in ipairs(ensure_installed) do
				if not vim.tbl_contains(already_installed, parser) then
					table.insert(parsers_to_install, parser)
				end
			end

			if #parsers_to_install > 0 then
				treesitter.install(parsers_to_install)
			end

			local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(args)
					local language = vim.treesitter.language.get_lang(args.match)
					if language and vim.list_contains(config.get_installed(), language) then
						vim.treesitter.start(args.buf)
					end
				end,
			})
		end,
	},
}
