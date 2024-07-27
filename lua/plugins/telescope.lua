return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		--    "folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local transform_mod = require("telescope.actions.mt").transform_mod
		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")
    require('telescope').load_extension('todo-comments')
		require("telescope").load_extension("flutter")

    local wk = require('which-key')
    wk.add({
      { '<leader>e',  group = "Explore" },
      { "<leader>ef", "<cmd>Telescope find_files <CR>", desc = 'Find files', mode = 'n' },
    })

		local custom_actions = transform_mod({
		  open_trouble_qflist = function(prompt_bufnr)
		    trouble.toggle("quickfix")
		  end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["Up"] = actions.move_selection_previous, -- move to prev result
						["Down"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
