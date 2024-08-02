return {
	"akinsho/pubspec-assist.nvim",
	requires = "plenary.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"PubspecAssistAddPackage",
		"PubspecAssistAddDevPackage",
		"PubspecAssistPickVersion",
	},
	ft = { "yaml" },
	event = "BufEnter pubspec.yaml",
	config = function()
		require("pubspec-assist").setup()
		require("which-key").add({
			{ "<leader>fp", ":PubspecAssistAddPackage <CR>", desc = "Pubspect assis", mode = "n" },
		})
	end,
}
