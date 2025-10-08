-- :help options
local options = {
  -----------------------------
  --- General
  -----------------------------
  mouse = "a",
  clipboard = "unnamedplus",
  completeopt = { "menuone", "noselect", "noinsert" },
  swapfile = true,

  -----------------------------
  --- Neovim UI
  -----------------------------
  number = true,
  relativenumber = true,
  cmdheight = 0,
  cursorline = false,
  fileencoding = "UTF-8",
  signcolumn = "yes",
  wrap = true,
  scrolloff = 8,
  ignorecase = true,
  smartcase = true,
  termguicolors = true,
  splitbelow = true,
  splitright = true,
  laststatus = 3,
  foldmethod = "marker",
  colorcolumn = "80",

  -----------------------------
  --- Tabs, Indenting
  -----------------------------
  tabstop = 4,
  shiftwidth = 4,
  smartindent = true,
  expandtab = true,
  showtabline = 2,

  -----------------------------
  --- Memory, CPU
  -----------------------------
  hidden = true,
  history = 100,
  lazyredraw = true,
  synmaxcol = 250,
  updatetime = 500,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '100' })
  end
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'yaml', 'lua', 'dart' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})
