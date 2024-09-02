return {
	"Al0den/notion.nvim",
	lazy = false, --Should work when lazy loaded, not tested
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("notion").setup()
		require("which-key").add({
			{ "<leader>n", group = "Notion" },
			{ "<leader>nm", "<cmd>Notion menu<CR>", desc = "Notion menu", mode = { "n", "v" } },
			{ "<leader>ns", "<cmd>Notion status<CR>", desc = "Notion status", mode = { "n", "v" } },
			{ "<leader>nu", "<cmd>Notion update<CR>", desc = "Notion update", mode = { "n", "v" } },
		})
	end,
}
