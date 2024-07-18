-- Nice file explorer
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree docs
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrePlugin = 1

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
            float = {
              enable = true,
              quit_on_focus_loss = true,
              open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 80,
                row = 1,
                col = 1,
              },
            },
          },

          actions = {
            open_file = {
            window_picker = {
              enable = false,
            },
            quit_on_open = true,
          }
        }
      })
    end
}
