return {
	{
		"christoomey/vim-tmux-navigator",
		init = function()
			-- We'll define our own Meta/Alt mappings below.
			vim.g.tmux_navigator_no_mappings = 1
		end,
		config = function()
			vim.keymap.set("n", "<M-h>", "<cmd>TmuxNavigateLeft<CR>", {
				silent = true,
				desc = "Navigate left across splits and tmux panes",
			})
			vim.keymap.set("n", "<M-j>", "<cmd>TmuxNavigateDown<CR>", {
				silent = true,
				desc = "Navigate down across splits and tmux panes",
			})
			vim.keymap.set("n", "<M-k>", "<cmd>TmuxNavigateUp<CR>", {
				silent = true,
				desc = "Navigate up across splits and tmux panes",
			})
			vim.keymap.set("n", "<M-l>", "<cmd>TmuxNavigateRight<CR>", {
				silent = true,
				desc = "Navigate right across splits and tmux panes",
			})
		end,
	},
}
