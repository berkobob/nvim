return {
  'echasnovski/mini.surround',
  version = '*',
  config = function()
    require('mini.surround').setup()
    local wk = require('which-key')
    wk.add({
      mode = { "n", "v" },
      { '<leader>s',  group = "Surround" },
      { '<leader>sa', desc = "Add"},
      { '<leader>sd', desc = "Delete"},
      { '<leader>sr', desc = "Replace"},
      { '<leader>sf', desc = "Find matching left"},
      { '<leader>sF', desc = "Find matching right"},
      { '<leader>sh', desc = "Highlight matching"},
    })
  end
}
