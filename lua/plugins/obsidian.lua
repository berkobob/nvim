return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter",
		"folke/which-key.nvim",
	},
	-- opts = {
	-- },
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "RPM",
					path = "/Users/antoine/Library/Mobile Documents/iCloud~md~obsidian/Documents/RPM",
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			open_notes_in = "vsplit",
		})

		require("which-key").add({
			{ "<leader>o", group = "Obsidian" },
			{
				"<leader>oc",
				"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
				desc = "Toggle checkbox",
				mode = "n",
			},
			{
				"<leader>oe",
				"<CMD>ObsidianExtractNote<CR>",
				desc = "New note from selection",
				mode = { "n", "v" },
			},
			{
				"<leader>of",
				"<CMD>ObsidianLink<CR>",
				desc = "Follow link",
				mode = { "n", "v" },
			},
			{
				"<leader>oi",
				"<CMD>ObsidianLinkNew<CR>",
				desc = "Insert link",
				mode = { "n", "v" },
			},
			{
				"<leader>ol",
				"<CMD>ObsidianLinks<CR>",
				desc = "List links",
				mode = { "n", "v" },
			},
			{
				"<leader>on",
				"<cmd>ObsidianNew<CR>",
				desc = "New note",
				mode = "n",
			},
			{
				"<leader>oo",
				"<cmd>ObsidianOpen<CR>",
				desc = "Open the app",
				mode = "n",
			},
			{
				"<leader>oq",
				"<cmd>ObsidianQuickSwitch<CR>",
				desc = "Find note",
				mode = "n",
			},
			{
				"<leader>or",
				"<cmd>ObsidianRename<CR>",
				desc = "Rename note",
				mode = "n",
			},
			{
				"<leader>ot",
				"<cmd>ObsidianTags<CR>",
				desc = "List tags",
				mode = "n",
			},
			{
				"<leader>oT",
				"<cmd>ObsidianTOC<CR>",
				desc = "Table of Contents",
				mode = "n",
			},
			{
				"<leader>os",
				"<cmd>ObsidianSearch<CR>",
				desc = "Search notes",
				mode = "n",
			},
			{
				"<leader>ow",
				"<cmd>ObsidianWorkspace<CR>",
				desc = "Change workspace",
				mode = "n",
			},
		})
	end,
}
