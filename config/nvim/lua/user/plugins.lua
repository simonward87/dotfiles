local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- autoinstall plugin manager
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- reload nvim whenever changes to this file are saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- protected call stops errors on first load
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- use popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- plugin installs
return packer.startup(function(use)
	use("akinsho/bufferline.nvim") -- bufferline along top of window
	use("antoinemadec/FixCursorHold.nvim") -- fixes lsp doc highlight
	use("folke/zen-mode.nvim") -- focus mode
	use("JoosepAlviste/nvim-ts-context-commentstring") -- simple code commenting
	use({
		"nvim-tree/nvim-tree.lua", -- file explorer
		requires = {
			"nvim-tree/nvim-web-devicons", -- icons
		},
	})
	use("lewis6991/gitsigns.nvim") -- git info in sign column
	use("lewis6991/impatient.nvim") -- speeds up loading lua modules
	use("lukas-reineke/indent-blankline.nvim") -- add guide rules to indentation
	use("mfussenegger/nvim-dap") -- debug adapter
	use("moll/vim-bbye") -- improve buffer deletion behaviour
	use("norcalli/nvim-colorizer.lua") -- hex code colourizer
	use("nvim-lua/plenary.nvim") -- lua function library (dependency for other plugs)
	use("nvim-lua/popup.nvim") -- An implementation of vim Popup API
	use("nvim-telescope/telescope.nvim") -- fuzzy finder
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context") -- pin code context (current block)
	use("nvim-treesitter/playground") -- view treesitter info
	use("tpope/vim-capslock") -- software capslock
	use("tpope/vim-commentary") -- comment stuff out
	use("tpope/vim-fugitive") -- git wrapper
	use("tpope/vim-surround") -- streamline surroundings workflow
	use("wbthomason/packer.nvim") -- Let packer manage itself
	-- use("windwp/nvim-autopairs") -- autopairs with cmp and treesitter integration
	use("windwp/nvim-ts-autotag") -- auto-close & auto-rename html tags
	use("simonward87/nvim-autopairs")

	-- colorschemes
	use("axvr/photon.vim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("cocopon/iceberg.vim")
	use("gosukiwi/vim-atom-dark")
	use("habamax/vim-habaurora")
	use("jacoborus/tender.vim")
	use("nelstrom/vim-mac-classic-theme")
	use("olivercederborg/poimandres.nvim")
	use({
		"projekt0n/github-nvim-theme",
		branch = "0.0.x", -- currently required (https://github.com/projekt0n/github-nvim-theme#installation)
	})
	use("rebelot/kanagawa.nvim")
	use("sainnhe/gruvbox-material")
	-- use("simonward87/drift.nvim")

	-- completion
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("hrsh7th/cmp-nvim-lua") -- complete neovim lua
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- snippet library
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- LSP
	use("b0o/SchemaStore.nvim") -- schemastore catalog access
	use("j-hui/fidget.nvim") -- UI for nvim-lsp install progress
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("neovim/nvim-lspconfig") -- enable LSP
	use("sago35/tinygo.vim") -- tinygo extension
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("williamboman/mason.nvim") -- package manager
	use("williamboman/mason-lspconfig.nvim") -- package manager

	-- automatically set up configuration after cloning packer
	-- NOTE: must run after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
