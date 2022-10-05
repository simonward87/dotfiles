-- go.mod files incorrectly read as 'rapid' — temporary fix:
vim.cmd("au BufRead,BufNewFile go.mod setf gomod")
vim.cmd("au BufRead,BufNewFile Dockerfile.dev setf dockerfile")
vim.cmd("au BufRead,BufNewFile *.gohtml setf html")
vim.cmd("au BufRead,BufNewFile zprofile setf zsh")
vim.cmd("au FileType gitcommit setl wrap spell tw=72")
vim.cmd("au FileType go setl noet")
vim.cmd("au FileType lua setl noet")
vim.cmd("au FileType make setl noet sts=0 sw=8 ts=8")
vim.cmd("au FileType markdown setl spell")
vim.cmd("au FileType prisma setl cindent")

local frontend_filetypes = {
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
	vim.cmd("au FileType " .. frontend_filetypes[i] .. " setl sts=2 sw=2 ts=2")
end

-- http://www.panozzaj.com/blog/2016/03/21/ignore-urls-and-acroynms-while-spell-checking-vim/
--
-- Don't mark URL-like things as spelling errors
vim.cmd([=[syntax match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell]=])

-- Don't mark MD urls as spelling errors
vim.cmd([=[syntax match MdUrlNoSpell '\[.\+\](\w\+:\/\/[^[:space:])]\+)' contains=@NoSpell]=])
-- [Colt Steele](https://www.udemy.com/user/coltsteele/)

-- Don't mark MD headings as spelling errors
vim.cmd([[syntax match MdHeadingNoSpell '^#\{1,4}' contains=@NoSpell]])

-- Don't count acronyms / abbreviations as spelling errors
-- (all upper-case letters, at least three characters)
-- Also will not count acronym with 's' at the end a spelling error
-- Also will not count numbers that are part of this
-- Recognizes the following as correct:
vim.cmd([[syntax match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell]])
