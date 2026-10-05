return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()

			require("mini.comment").setup({
				options = {
					custom_commentstring = function()
						local ok, context = pcall(require, "ts_context_commentstring.internal")
						if ok then
							return context.calculate_commentstring() or vim.bo.commentstring
						end
						return vim.bo.commentstring
					end,
				},
			})

			require("mini.move").setup()
			require("mini.surround").setup()
			require("mini.cursorword").setup()
			local indentscope = require("mini.indentscope")
			indentscope.setup({
				draw = {
					delay = 0,
					animation = indentscope.gen_animation.none(),
				},
			})
			require("mini.pairs").setup()
			require("mini.trailspace").setup()
			require("mini.bufremove").setup()
			require("mini.notify").setup()
			require("mini.icons").setup()

			require("mini.clue").setup({
				triggers = {
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },
					{ mode = "n", keys = "g" },
					{ mode = "n", keys = "[" },
					{ mode = "n", keys = "]" },
				},
				clues = {
					require("mini.clue").gen_clues.builtin_completion(),
				},
			})

			require("mini.sessions").setup()

			require("mini.diff").setup({
				view = {
					style = "sign",
					signs = { add = "▎", change = "▎", delete = "▎" },
				},
			})

			require("mini.git").setup()
			local MiniDiff = require("mini.diff")
			vim.keymap.set("n", "]h", function()
				MiniDiff.goto_hunk("next")
			end, { desc = "Next git hunk" })
			vim.keymap.set("n", "[h", function()
				MiniDiff.goto_hunk("prev")
			end, { desc = "Previous git hunk" })
			vim.keymap.set("n", "<leader>hs", MiniDiff.operator, { desc = "Stage hunk" })
			vim.keymap.set("n", "<leader>hp", function()
				MiniDiff.toggle_overlay()
			end, { desc = "Preview diff overlay" })
			vim.keymap.set("n", "<leader>hb", function()
				require("mini.git").show_at_cursor()
			end, { desc = "Git blame/show" })
		end,
	},
}
