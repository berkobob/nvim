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
      { "<leader>ef", "<cmd>Telescope find_files <CR>",           desc = 'Find files',                   mode = 'n' },
      { "<leader>eg", "<cmd>Telescope live_grep <CR>",            desc = 'Search file contents (grep)' },
      { "<leader>ec", "<cmd>Telescope grep_string <CR>",          desc = 'Search for word under cursor', mode = 'n' },
      { "<leader>eb", "<cmd>Telescope buffers <CR>",              desc = 'Search open buffers',          mode = 'n' },
      { "<leader>eh", "<cmd>Telescope help_tags <CR>",            desc = 'Telescope help',               mode = 'n' },
      { "<leader>er", "<cmd>Telescope oldfiles <CR>",             desc = 'Search recent files',          mode = 'n' },
      { "<leader>es", "<cmd>Telescope lsp_document_symbols <CR>", desc = 'Search document symbols',      mode = 'n' },
      { "<leader>eq", "<cmd>Telescope quickfix <CR>",             desc = 'Display quickfix list',        mode = 'n' },
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
            ["Down"] = actions.move_selection_next,   -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
    })
    telescope.load_extension("fzf")
  end,
}
