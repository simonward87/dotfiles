local nvim_lsp = require("lspconfig")

require("rust-tools").setup({})

require('nvim-autopairs').setup{}

require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    ensure_installed = {
        "css",
        "dockerfile",
        "go",
        "graphql",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "rust",
        "scss",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml"
    }
})

-- local buf_map = function(bufnr, mode, lhs, rhs, opts)
--     vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
--         silent = true,
--     })
-- end

-- local on_attach = function(client, bufnr)
--     vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
--     vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
--     vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
--     vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
--     vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
--     vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
--     vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
--     vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
--     vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
--     vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
--     vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
--     vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

--     buf_map(bufnr, "n", "gd", ":LspDef<CR>")
--     buf_map(bufnr, "n", "gr", ":LspRename<CR>")
--     buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
--     buf_map(bufnr, "n", "K", ":LspHover<CR>")
--     buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
--     buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
--     buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
--     buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
--     buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

--     if client.resolved_capabilities.document_formatting then
--         vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--     end
-- end

-- nvim_lsp.tsserver.setup({
--     on_attach = function(client, bufnr)
--         client.resolved_capabilities.document_formatting = false
--         client.resolved_capabilities.document_range_formatting = false

--         local ts_utils = require("nvim-lsp-ts-utils")
--         ts_utils.setup({
--             eslint_bin = "eslint_d",
--             eslint_enable_diagnostics = true,
--             eslint_enable_code_actions = true,
--             enable_formatting = true,
--             formatter = "prettier",
--         })
--         ts_utils.setup_client(client)

--         buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
--         buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
--         buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")

--         on_attach(client, bufnr)
--     end,
-- })

-- require("null-ls").config({})
-- nvim_lsp["null-ls"].setup({ on_attach = on_attach })

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true


-- ------------------------------------------------------------------- nvim-cmp
local cmp = require'cmp'

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
  end,
},
mapping = {
  ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
},
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
  -- { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- ----------------------------------------------------------- Language Servers

nvim_lsp.cssls.setup { capabilities = capabilities }

nvim_lsp.dockerls.setup {
    capabilities = capabilities
}

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

-- nvim_lsp.denols.setup {
--     capabilities = capabilities
-- }

nvim_lsp.svelte.setup {
    capabilities = capabilities
}

nvim_lsp.tsserver.setup {
    capabilities = capabilities
}

nvim_lsp.vimls.setup {
    capabilities = capabilities
}

-- ----------------------------------------------------------------------------
