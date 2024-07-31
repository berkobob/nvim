return {
	"szw/vim-maximizer",
	config = function()
		require("which-key").add({
			{ "<C-m>", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize plan", mode = "n" },
		})
	end,
}
