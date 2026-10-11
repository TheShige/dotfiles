return {
	{
		"christoomey/vim-tmux-navigator",
		init = function()
			-- The tmux configuration uses the same keys when Neovim is active.
			vim.g.tmux_navigator_no_mappings = 1
		end,
		config = function()
			vim.keymap.set("n", "<M-m>", "<cmd>TmuxNavigateLeft<CR>", {
				silent = true,
				desc = "Navigate left across splits and tmux panes",
			})
			vim.keymap.set("n", "<M-n>", "<cmd>TmuxNavigateDown<CR>", {
				silent = true,
				desc = "Navigate down across splits and tmux panes",
			})
			vim.keymap.set("n", "<M-e>", "<cmd>TmuxNavigateUp<CR>", {
				silent = true,
				desc = "Navigate up across splits and tmux panes",
			})
			vim.keymap.set("n", "<M-i>", "<cmd>TmuxNavigateRight<CR>", {
				silent = true,
				desc = "Navigate right across splits and tmux panes",
			})
		end,
	},
}
