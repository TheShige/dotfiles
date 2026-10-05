return {
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({})

			vim.keymap.set("n", "<leader>ff", function()
				require("fzf-lua").files()
			end, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", function()
				require("fzf-lua").live_grep()
			end, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fb", function()
				require("fzf-lua").buffers()
			end, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", function()
				require("fzf-lua").help_tags()
			end, { desc = "Search help tags" })
			vim.keymap.set("n", "<leader>fx", function()
				require("fzf-lua").diagnostics_document()
			end, { desc = "Document diagnostics" })
			vim.keymap.set("n", "<leader>fX", function()
				require("fzf-lua").diagnostics_workspace()
			end, { desc = "Workspace diagnostics" })
		end,
	},
}
