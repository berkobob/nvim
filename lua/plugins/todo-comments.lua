return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup()
    local wk = require('which-key')
    wk.add({
      { '<leader>t',  group = "Todo comments" },
      { "<leader>tn", function() require("todo-comments").jump_next() end, desc = 'Next todo comment', mode = 'n' },
      { "<leader>tp", function() require("todo-comments").jump_prev() end, desc = 'Previous todo comment' , mode = 'n' },
      { "<leader>tl", ":TodoTelescope<CR>", desc = 'Popup of all TODOs' , mode = 'n' },
      { "<leader>tw", ":TodoLocList<CR>", desc = 'Show TODOs in new window', mode = 'n'  },
      { "<leader>tt", ":Telescope todo-comments<CR>", desc = 'Telescope todos', mode = 'n'  },
    })
  end,
}
-- TODO: This is to do
-- WARN: This is a warning
-- FIX: Fix me
-- PERF: A performance issue
-- HACK: Hack me
-- NOTE: A humble note
-- BUG: Fix me too
-- TEST: Needs testing
