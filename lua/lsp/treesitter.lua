return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "yaml",
        "markdown",
        "markdown_inline",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "c",
        "dart",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-]>",
          node_incremental = "<C-]>",
          scope_incremental = false,
          node_decremental = "<C-[>",
        },
      },
    })
  end,
}

