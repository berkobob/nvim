return { 
  "rcarriga/nvim-dap-ui", 
  dependencies = {
    "mfussenegger/nvim-dap", 
    "nvim-neotest/nvim-nio",
    "folke/neodev.nvim"
  }, 
  config = function()
    require('neodev').setup({
      library = { plugins = { 'nvim-dap-ui' }, types = true },
    })
    require('dapui').setup()
  end
}