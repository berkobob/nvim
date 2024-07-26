return {
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
    require('nvim-dap-virtual-text').setup()

local dap, dapui = require("dap"), require("dapui")
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
  command = 'dart',    -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
  args = { 'debug_adapter' },
  -- windows users will need to set 'detached' to false
  options = { 
    detached = false,
  }
}
dap.adapters.flutter = {
  type = 'executable',
  command = 'flutter',   -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
  args = { 'debug_adapter' },
  -- windows users will need to set 'detached' to false
  options = { 
    detached = false,
  }
}
  end
}
