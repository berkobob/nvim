return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		spec = {
			{ "<leader>l", group = "Lazy" },
			{ "<leader>lg", "<cmd>LazyGit<CR>", desc = "Lazygit", mode = "n" },
			{ "<leader>ll", "<cmd>Lazy<CR>", desc = "Lazy", mode = "n" },
			{ "<leader>lz", "<cmd>Lazy<CR>", desc = "Lazy", mode = "n" },
		},
	},
	plugins = {
		presents = {
			operators = true,
			motions = true,
			text_objects = true,
		},
	},
	keys = {
		{
			"<C-?>",
			function()
				local wk = require("which-key")
				wk.show({ global = true })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
