return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "python",
        "c_sharp",
        "cpp",
        "go",
        "javascript",
        "typescript",
        "dart",
      },
      sync_install = false,
      highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
        disable = { "" },
      }
    })
  end
}
