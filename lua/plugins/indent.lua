return {
	"lukas-reineke/indent-blankline.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
  opts = {
    indent = { char = "┊" },
  },
  config = function()
    require('ibl').setup()
  end
}
