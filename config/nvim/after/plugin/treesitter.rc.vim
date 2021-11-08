if !exists('g:loaded_nvim_treesitter')
    echom "Not loaded treesitter"
    finish
endif

lua << EOF
require"nvim-treesitter.configs".setup {
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
}

local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF
