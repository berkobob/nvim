return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    todo_comments.setup()
  end,
}
-- TODO: This is to do
--
-- FIX: Fix me
--
-- HACK: Hack me
--
-- BUG: Fix me too
