-- Nice file explorer
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree docs
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrePlugin = 1
    vim.opt.termguicolors = true -- enable 24bit colour

    nvimtree.setup({
      view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        side = "left",
        preserve_window_proportions = false,
        number = true,
        relativenumber = false,
        signcolumn = "yes",
        width = 30,
      },

      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = true,
        },
      },
    })

    require("which-key").add({
      { "<C-p>", "<cmd>NvimTreeToggle<CR>", desc = "Open file explorer", mode = "n" },
      -- { "<C-F>", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Open file explorer", mode = "n" },
      { "<Esc>", "<cmd>NvimTreeToggle<CR>", desc = "Open file explorer", mode = "n" },
    })
  end,
}
