local opts = {
  noremap = true,
  silent = true
}

local kmap = vim.api.nvim_set_keymap

--  Remap space as the leader key
kmap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode --
-- Clear search highlighting with <leader> and c
kmap("n", "<leader>c", ":noh<CR>", opts)

-- Open Nvim-tree with Space + F
kmap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Save file with Leader + w
kmap("n", "<leader>s", ":w<CR>", opts)

-- Better navigation through buffers
kmap("n", "<Tab>", ":bnext<CR>", opts)
kmap("n", "<S-Tab>", ":bprevious<CR>", opts)
kmap("n", "<leader>dd", ":Bdelete<CR>", opts)
kmap("n", "<leader>dw", "<C-w>q", opts)
kmap("n", "<leader>da", ":bdelete<CR>", opts)

-- Better window navigation
kmap("n", "<C-w>m", "<C-w>h", opts)
kmap("n", "<C-w>n", "<C-w>j", opts)
kmap("n", "<C-w>e", "<C-w>k", opts)
kmap("n", "<C-w>i", "<C-w>l", opts)

-- Window resizing controls
kmap("n", "<C-Up>", ":resize +2<cr>", opts)
kmap("n", "<C-Down>", ":resize -2<cr>", opts)
kmap("n", "<C-Left>", ":vertical resize +2<cr>", opts)
kmap("n", "<C-Right>", ":vertical resize -2<cr>", opts)

-- Insert mode --

-- Visual mode --
-- Stay in indent mode
kmap("v", "<", "<gv", opts)
kmap("v", ">", ">gv", opts)

-- Move text up and down
kmap("v", "<A-Down>", ":m .+1<CR>==", opts)
kmap("v", "<A-Up>", ":m .-2<CR>==", opts)
kmap("v", "p", '"_dP', opts)

-- Visual Block mode --
kmap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
kmap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

-- Terminal mode --
kmap("t", "<Esc>", "<C-\\><C-n>", opts)
