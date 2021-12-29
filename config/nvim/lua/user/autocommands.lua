vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.css,*.scss,*.js,*.ts,*.json,*.jsx,*.tsx,*.md,*.mdx,*.yaml FormatWrite
  augroup END
]], true)
