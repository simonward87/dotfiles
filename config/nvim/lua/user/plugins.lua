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
	-- general utilities
	use("akinsho/bufferline.nvim") -- bufferline along top of window
	use("antoinemadec/FixCursorHold.nvim") -- fixes lsp doc highlight
	use({
		"kyazdani42/nvim-tree.lua", -- file explorer
		requires = {
			"kyazdani42/nvim-web-devicons", -- icons
		},
	})
	use("lewis6991/impatient.nvim") -- speeds up loading lua modules
	use("lukas-reineke/indent-blankline.nvim") -- add guide rules to indentation
	use("moll/vim-bbye") -- improve buffer deletion behaviour
	use("norcalli/nvim-colorizer.lua") -- hex code colourizer
	use("nvim-lua/popup.nvim") -- An implementation of vim Popup API
	use("nvim-lua/plenary.nvim") -- lua function library (dependency for other plugs)
	-- use("petertriho/nvim-scrollbar") -- diagnostics scrollbar
	use("tpope/vim-capslock") -- software capslock
	use("tpope/vim-commentary") -- comment stuff out
	use("tpope/vim-fugitive") -- git wrapper
	use("tpope/vim-surround") -- streamline surroundings workflow
	use("wbthomason/packer.nvim") -- Let packer manage itself
	use("nvim-treesitter/nvim-treesitter-context") -- pin code context (current block)

	-- colorschemes
	use("cocopon/iceberg.vim")
	use("cormacrelf/vim-colors-github")
	use("gosukiwi/vim-atom-dark")
	use("habamax/vim-habaurora")
	use("jacoborus/tender.vim")
	use("nelstrom/vim-mac-classic-theme")
	use("rebelot/kanagawa.nvim")
	use("sainnhe/gruvbox-material")

	-- completion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("hrsh7th/cmp-nvim-lua") -- complete neovim lua

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- snippet library

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("b0o/SchemaStore.nvim") -- schemastore catalog access
	use("j-hui/fidget.nvim") -- UI for nvim-lsp install progress

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring") -- simple code commenting
	use("windwp/nvim-autopairs") -- autopairs with cmp and treesitter integration
	use("windwp/nvim-ts-autotag") -- auto-close & auto-rename html tags

	-- Gitsigns
	use("lewis6991/gitsigns.nvim")

	-- dap
	use("mfussenegger/nvim-dap")

	-- Automatically set up configuration after cloning packer
	-- NOTE: must run after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
