return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			decorations = {
				statusline = {
					device = true,
				},
			},
			debugger = {
				enabled = true,
			},
		})
	end,
}
