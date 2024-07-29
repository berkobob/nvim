return {
  "folke/which-key.nvim",
  event   = "VeryLazy",
  init    = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts    = {
    --  prefix = '<leader>?'
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  plugins = {
    presents = {
      operators = true,
      motions = true,
      text_objects = true,
    }
  },
  keys    = {
    {
      "<C-Space>",
      function()
        local wk = require('which-key')
        wk.show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    { '<leader>l',  group = "Lazy" },
    { "<leader>lg", ":LazyGit<CR>",                            desc = 'Lazygit',   mode = 'n' },
    { "<leader>lz", "<cmd>Lazy<CR>",                           desc = 'Lazy',      mode = 'n' },
    { "<leader>ll", function() require('lint').try_lint() end, desc = 'Lint file', mode = 'n' },
  },
}
