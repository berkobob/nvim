return {
	"stevearc/conform.nvim",
	-- opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
		require("which-key").add({
			{
				"<leader>lf",
				function()
					require("conform").format()
				end,
				desc = "Format file",
				mode = "n",
			},
		})
	end,
}
