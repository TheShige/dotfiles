local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- return to last cursor position
autocmd("BufReadPost", {
	group = augroup("LastCursorPos", { clear = true }),
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then -- except in diff mode
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
		local last_line = vim.api.nvim_buf_line_count(0)

		local row = last_pos[1]
		if row < 1 or row > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

-- wrap, linebreak and spellcheck on markdown and text files
autocmd("FileType", {
	group = augroup("MarkdownFix", { clear = true }),
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})
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

-- Format on save when efm is attached to a supported file.
autocmd("BufWritePre", {
	group = augroup("EfmFormatOnSave", { clear = true }),
	pattern = {
		"*.lua", "*.py", "*.go", "*.js", "*.jsx", "*.ts", "*.tsx",
		"*.json", "*.css", "*.scss", "*.html", "*.sh", "*.bash", "*.zsh",
		"*.c", "*.cpp", "*.h", "*.hpp",
	},
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" or not vim.bo[args.buf].modifiable then
			return
		end
		if vim.api.nvim_buf_get_name(args.buf) == "" then
			return
		end
		local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "efm" })
		if #clients == 0 then
			return
		end
		pcall(vim.lsp.buf.format, {
			bufnr = args.buf,
			timeout_ms = 2000,
			filter = function(client)
				return client.name == "efm"
			end,
		})
	end,
})

-- Highlight on yank
autocmd('TextYankPost', {
  group = augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '100' })
  end
})

-- Set indentation to 2 spaces
autocmd('Filetype', {
  group = augroup('setIndent', { clear = true }),
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'yaml', 'lua', 'dart' },                                                                                                                       command = 'setlocal shiftwidth=2 tabstop=2'
})
