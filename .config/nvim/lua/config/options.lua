-- Display
vim.opt.number = true -- Show absolute line numbers.
vim.opt.relativenumber = true -- Show relative line numbers.
vim.opt.cursorline = true -- Highlight the current line.
vim.opt.wrap = false -- Do not wrap long lines.
vim.opt.scrolloff = 10 -- Keep context above and below the cursor.
vim.opt.sidescrolloff = 0 -- Do not keep extra horizontal context.
vim.opt.signcolumn = "yes" -- Always show the sign column.
vim.opt.colorcolumn = "100" -- Mark the 100th column.
vim.opt.showmatch = true -- Briefly jump to the matching bracket.
vim.opt.showmode = false -- Hide mode text; the statusline shows it.
vim.opt.laststatus = 2 -- Show a statusline in each window.
vim.opt.cmdheight = 1 -- Keep one command-line row.
vim.opt.fillchars = { eob = " " } -- Hide tildes below the end of the buffer.
vim.opt.synmaxcol = 300 -- Limit syntax highlighting on long lines.

-- Indentation
vim.opt.tabstop = 4 -- Display hard tabs as four columns.
vim.opt.shiftwidth = 4 -- Indent by four columns.
vim.opt.softtabstop = 0 -- Do not add separate soft tab stops.
vim.opt.expandtab = true -- Insert spaces instead of tab characters.
vim.opt.autoindent = true -- Copy indentation from the previous line.
vim.opt.smartindent = true -- Add language-aware indentation for C-like syntax.

-- Search
vim.opt.ignorecase = true -- Ignore case in searches.
vim.opt.smartcase = true -- Match case when a search contains uppercase letters.
vim.opt.hlsearch = true -- Highlight search matches.
vim.opt.incsearch = true -- Show matches while typing a search.

-- Completion and floating windows
vim.opt.completeopt = "menuone,noinsert,noselect" -- Show completion menu without inserting or preselecting.
vim.opt.pumheight = 10 -- Limit completion menu height to ten items.
vim.opt.pumblend = 10 -- Slightly blend the completion menu.
vim.opt.winblend = 0 -- Keep floating windows opaque.
vim.opt.conceallevel = 0 -- Do not conceal marked text.
vim.opt.concealcursor = "" -- Do not conceal text on the cursor line.

-- Files, undo, and buffers
vim.opt.backup = false -- Do not keep a backup after writing.
vim.opt.writebackup = false -- Do not make a temporary write backup.
vim.opt.swapfile = true -- Keep swap files for crash recovery.
vim.opt.undofile = true -- Save undo history across sessions.

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p") -- Create the undo directory when missing.
end
vim.opt.undodir = undodir -- Store persistent undo files here.

vim.opt.updatetime = 300 -- Reduce CursorHold and swap update delay.
vim.opt.autoread = true -- Check for file changes made outside Neovim.
vim.opt.autowrite = false -- Do not save files automatically.
vim.opt.hidden = true -- Keep buffers loaded when switching away.
vim.opt.modifiable = true -- Allow buffer edits.

-- Input and navigation
vim.opt.timeoutlen = 500 -- Wait half a second for a mapped key sequence.
vim.opt.ttimeoutlen = 50 -- Wait 50 ms for terminal key codes.
vim.opt.errorbells = false -- Disable error bells.
vim.opt.backspace = "indent,eol,start" -- Allow Backspace across indent, line end, and line start.
vim.opt.autochdir = false -- Keep the working directory stable.
vim.opt.iskeyword = "@,48-57,_,-,192-255" -- Treat hyphens as part of words.
vim.opt.selection = "inclusive" -- Include the character under the cursor in Visual mode.
vim.opt.mouse = "a" -- Enable mouse support in all modes.
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard for default yank and paste.

-- Folds
vim.opt.foldmethod = "expr" -- Use an expression to define folds.
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use Tree-sitter fold queries.
vim.opt.foldlevel = 99 -- Start with folds open.

-- Splits
vim.opt.splitbelow = true -- Open horizontal splits below.
vim.opt.splitright = true -- Open vertical splits to the right.

-- Command-line completion
vim.opt.wildmenu = true -- Enable command-line completion menu.
vim.opt.wildmode = "full" -- Cycle through full matches with Tab.

-- Diff and performance
vim.opt.diffopt = "linematch:60" -- Align similar lines in diffs, up to 60 lines.
vim.opt.redrawtime = 2000 -- Stop slow highlighting after two seconds.
vim.opt.maxmempattern = 1000 -- Limit memory used by pattern matching.
