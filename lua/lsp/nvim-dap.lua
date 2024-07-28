return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      ui.setup({})
      require('nvim-dap-virtual-text').setup({
        all_references = true,
      })

      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })

      local dapui = require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Dart CLI adapter (recommended)
      dap.adapters.dart = {
        type = 'executable',
        command = 'dart', -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
        args = { 'debug_adapter' },
        -- windows users will need to set 'detached' to false
        options = {
          detached = false,
        }
      }
      dap.adapters.flutter = {
        type = 'executable',
        command = 'flutter', -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
        args = { 'debug_adapter' },
        -- windows users will need to set 'detached' to false
        options = {
          detached = false,
        }
      }

      -- vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#993939', guibg='#31353f' }, false)
      -- vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef', guibg='#31353f' }, false)
      vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

      vim.fn.sign_define('DapBreakpoint',
        { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition',
        { text = '⭕️', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected',
        { text = '❌', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text = '⏹️', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl =
      'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text = '🟢', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
    end,
  },
  { "folke/neodev.nvim", opts = {} }
}
