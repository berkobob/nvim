local wk = require("which-key")

wk.register({
  ["&"] = { name = "Misc",
    ["&"] = { ":&&<CR>", ":help &-default" }
  },
  ["-"] = { name = "--------",
    ["-----"] = { "---------", "-------------" }
  },
  ["<"] = { name = "Comment.nvim",
    ["<C-Bslash>"] = { ":vne<CR>", "Split window horizontally" },
    ["<C-S-H>"] = { ":vertical resize -1<CR>", "Decrease width" },
    ["<C-S-J>"] = { ":resize +1<CR>", "Increase height" },
    ["<C-S-K>"] = { ":resize -1<CR>", "Decrease height" },
    ["<C-S-L>"] = { ":vertical resize +1<CR>", "Increase width" },
    ["<C-U>"] = { "<C-G>u<C-U>", ":help i_CTRL-U-default" },
    ["<C-W>"] = { "<C-G>u<C-W>", ":help i_CTRL-W-default" },
    ["<C-W><C-D>"] = { "<C-W>d", "Show diagnostics under the cursor" },
    ["<C-_>"] = { ":new<CR>", "Split window vertically" },
    ["<M-h>"] = { ":bnext<CR>", "Next buffer" },
    ["<M-l>"] = { ":bprevious<CR>", "Previous buffer" },
    ["<Plug>(comment_toggle_blockwise_visual)"] = { "<Esc><Cmd>lua require(\"Comment.api\").locked(\"toggle.blockwise\")(vim.fn.visualmode())<CR>", "Comment toggle blockwise (visual)" },
    ["<Plug>(comment_toggle_linewise_visual)"] = { "<Esc><Cmd>lua require(\"Comment.api\").locked(\"toggle.linewise\")(vim.fn.visualmode())<CR>", "Comment toggle linewise (visual)" },
    ["<Tab>h"] = { ":tabp <CR>", "Previous tab" },
    ["<Tab>l"] = { ":tabn <CR>", "Next tab" },
    ["<Tab>m"] = { "<Cmd>tabnew % <CR>", "New tab with this buffer" },
    ["<Tab>p"] = { "<Cmd>BufferLinePick <CR>", "New tab with this buffer" },
    ["<Tab>t"] = { ":tabnew <CR>", "Open a new tab" },
    ["<Tab>w"] = { ":tabclose <CR>", "Close this tab" }
  },
  ["@"] = { name = "Misc",
    ["@"] = { ":help v_@-default", "mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@'" }
  },
  ["Q"] = { name = "Misc",
    ["Q"] = { ":help v_Q-default", "mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'" }
  },
  ["Y"] = { name = "Misc",
    ["Y"] = { "y$", ":help Y-default" }
  },
  ["g"] = { name = "Comment.nvim",
    ["gb"] = { "<Plug>(comment_toggle_blockwise_visual)", "Comment toggle blockwise (visual)" },
    ["gc"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" }
  },
})
