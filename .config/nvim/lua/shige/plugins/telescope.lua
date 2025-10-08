return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require("telescope")

    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<Esc>"] = actions.close,
            ['<c-d>'] = require('telescope.actions').delete_buffer
          }
        }
      }
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap
    local builtin = require("telescope.builtin")

    keymap.set("n", "<leader>tf", builtin.find_files, {})
    keymap.set("n", "<leader>tb", builtin.buffers, {})
    keymap.set("n", "<leader>tr", builtin.lsp_references, {})
    keymap.set("n", "<leader>ts", builtin.live_grep, {})
    keymap.set("n", "<leader>tc", builtin.grep_string, {})
  end
}
