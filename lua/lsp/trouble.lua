return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	configure = function()
		require("trouble.providers.telescope")
	end,

	require("which-key").add({
		{ "<leader>x", group = "Trouble" },
		{ "<Leader>xx", "<cmd>Trouble diagnostics toggle <CR>", desc = "Diagnostics (Trouble)", mode = "n" },
		{
			"<Leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0 <CR>",
			desc = "Buffer Diagnostics (Trouble)",
			mode = "n",
		},
		{ "<Leader>xp", "<cmd>TroubleToggle workspace_diganostics <CR>", desc = "Symbols (Trouble)", mode = "n" },
		{ "<Leader>xs", "<cmd>Trouble symbols toggle focus=false <CR>", desc = "Symbols (Trouble)", mode = "n" },
		{
			"<Leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=right <CR>",
			desc = "LSP Definitions",
			mode = "n",
		},
		{ "<Leader>xL", "<cmd>Trouble loclist toggle <CR>", desc = "Location List (Trouble)", mode = "n" },
		{ "<Leader>xq", "<cmd>Trouble qflist toggle <CR>", desc = "Quickfix List (Trouble)", mode = "n" },
	}),
}
