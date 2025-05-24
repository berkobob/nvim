return {
	{
		"williamboman/mason-lspconfig.nvim",
		-- commit = "fa3957f59c1b1cb424a7ebd7ab5f1c56f5e7d71a", -- 🔒 v1.3.0
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			{
				"antosha417/nvim-lsp-file-operations",
				config = true,
			},
			{
				"folke/neodev.nvim",
				opts = {},
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local capabilities = cmp_nvim_lsp.default_capabilities()

			mason_lspconfig.setup({
				automatic_installation = false,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }
					local keymap = vim.keymap
					keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					keymap.set("n", "K", vim.lsp.buf.hover, opts)
					keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
					keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})
			local servers = mason_lspconfig.get_installed_servers()
			for _, server_name in ipairs(servers) do
				if server_name == "lua_ls" then
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				else
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end
			end
		end,
	},
}
