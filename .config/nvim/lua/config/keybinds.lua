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

kmap("n", "<Down>", "g<Down>", opts)
kmap("n", "<Up>", "g<Up>", opts)

-- Clear search highlighting with <leader> and c
kmap("n", "<leader>c", ":noh<CR>", opts)

-- Open Nvim-tree with Space + F
kmap("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", opts)

-- Save file with Leader + w
kmap("n", "<leader>s", ":w<CR>", opts)

-- BBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersBetter navigation through buffersetter navigation through buffers
kmap("n", "<Tab>", ":bnext<CR>", opts)
kmap("n", "<S-Tab>", ":bprevious<CR>", opts)
kmap("n", "<leader>db", ":lua require('mini.bufremove').delete(0)<CR>", opts)
kmap("n", "<leader>dw", "<C-w>q", opts)
kmap("n", "<leader>da", ":bdelete<CR>", opts)

-- Window resizing controls
kmap("n", "<A-C-Up>", ":resize +4<cr>", opts)
kmap("n", "<A-C-Down>", ":resize -4<cr>", opts)
kmap("n", "<A-C-Left>", ":vertical resize +4<cr>", opts)
kmap("n", "<A-C-Right>", ":vertical resize -5<cr>", opts)

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
