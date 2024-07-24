return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup()
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
