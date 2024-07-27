return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
	},
  setup = function()
    require("telescope").load_extension("lazygit")
    require('which-key').add({
      { '<leader>l',  group = "Lazy" },
      { "<leader>lg", "<cmd>Lazygit<CR>", desc = 'Lazygit', mode = 'n' },
      { "<leader>ll", "<cmd>Lazy<CR>", desc = 'Lazy', mode = 'n' },
    })
  end
}
