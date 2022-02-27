local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	-- List of servers with custom config files
	local custom_configs = {
		"denols",
		"jsonls",
		"sumneko_lua",
		"tsserver",
		"yamlls",
	}

	-- Loads custom config and combines it with capabilities and on_attach function
	local load_custom_config = function(server_name)
		if server.name == server_name then
			-- Relies on config lua file being located in ./settings and using
			-- the server name as the filename
			local custom_opts = require("user.lsp.settings." .. server_name)
			opts = vim.tbl_deep_extend("force", custom_opts, opts)
		end
	end

	for i = 1, #custom_configs do
		load_custom_config(custom_configs[i])
	end

	-- setup() is the default lspconfig setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
