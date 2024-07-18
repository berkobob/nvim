return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    --  prefix = '<leader>?'
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?", function()
        local wk = require('which-key')
        wk.show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
--[[    {
      "<C-?>", function()
        local wk = require('which-key')
        wk.show({ global = false })
        wk.add({
          { '<C>', group = "Window mgt" },
          { '<C-h>', desc = "Window left please" },
        })
      end,
      desc = "please please work",
    },
]]--
  },
}

