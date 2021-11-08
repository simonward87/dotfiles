if !exists('g:lspconfig') | finish | endif

lua << EOF
local nvim_lsp = require("lspconfig")

require("rust-tools").setup({})

require('nvim-autopairs').setup{}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', opts) -- Go to definition
    buf_set_keymap('n', 'gr', '<Cmd>Telescope lsp_references<CR>', opts) -- Show references
    buf_set_keymap('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>', opts) -- Go to implementation

    buf_set_keymap('n', 'ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '[g', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']g', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end
end

-- ----------------------------------------------------------- Language Servers

nvim_lsp.cssls.setup { capabilities = capabilities }

nvim_lsp.dockerls.setup { capabilities = capabilities }

nvim_lsp.html.setup { capabilities = capabilities }

nvim_lsp.jsonls.setup {
    capabilities = capabilities,
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
            end
        }
    }
}

-- nvim_lsp.denols.setup { capabilities = capabilities }

nvim_lsp.svelte.setup { capabilities = capabilities }

nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}


nvim_lsp.vimls.setup { capabilities = capabilities }

-- ----------------------------------------------------------------------------
EOF
