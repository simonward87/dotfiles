-- go.mod files incorrectly read as 'rapid' — temporary fix:
vim.cmd("autocmd BufRead,BufNewFile go.mod setfiletype gomod")
vim.cmd("autocmd BufRead,BufNewFile Dockerfile.dev setfiletype dockerfile")
vim.cmd("autocmd BufRead,BufNewFile *.gohtml setfiletype html")
vim.cmd("autocmd BufRead,BufNewFile *.tmpl setfiletype html")
vim.cmd("autocmd BufRead,BufNewFile zprofile setfiletype zsh")
vim.cmd("autocmd FileType gitcommit setlocal wrap spell textwidth=72")
vim.cmd("autocmd FileType go setlocal noexpandtab")
vim.cmd("autocmd FileType lua setlocal noexpandtab")
vim.cmd("autocmd FileType make setlocal noexpandtab softtabstop=0 shiftwidth=8 tabstop=8")
vim.cmd("autocmd FileType markdown setlocal spell")
vim.cmd("autocmd FileType prisma setlocal cindent")
vim.cmd("command! -nargs=1 -complete=help H h <args> | only") -- :H <topic> for full screen help

local frontend_filetypes = {
	"astro",
	"css",
	"graphql",
	"html",
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"json",
	"less",
	"markdown",
	"prisma",
	"scss",
	"svelte",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
	"vue",
	"yaml",
}

for i = 1, #frontend_filetypes do
	vim.cmd("au FileType " .. frontend_filetypes[i] .. " setlocal softtabstop=2 shiftwidth=2 tabstop=2")
end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- highlight selection on yank
autocmd("TextYankPost", {
	group = augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Hide IncSearch on entering INSERT (Paired keymaps: PCLoFRvAUuTj)
autocmd("InsertEnter", {
	group = augroup("IncSearchHideOnInsert", { clear = true }),
	pattern = "*",
	callback = function()
		vim.cmd("setlocal nohlsearch")
	end,
})
autocmd("InsertLeave", {
	group = augroup("IncSearchShowOnEsc", { clear = true }),
	pattern = "*",
	callback = function()
		vim.cmd("setlocal hlsearch lazyredraw")
	end,
})

-- Tidy Go imports on save
autocmd("BufWritePost", {
	group = augroup("TidyGoImports", { clear = true }),
	pattern = "*.go",
	callback = function()
		vim.cmd('silent exe "!goimports -w %:p"')
	end,
})

-- clear command line output after CursorHold timeout
autocmd("CursorHold", {
	group = augroup("ClearCmdAfterTimeout", { clear = true }),
	pattern = "*",
	callback = function()
		print(" ")
	end,
})
