local wk = require("which-key")

wk.register({
  ["<Tab>l"] = { ":tabn <CR>", "Next tab" },
  ["<Tab>h"] = { ":tabp <CR>", "Previous tab" },
  ["<Tab>t"] = { ":tabnew <CR>", "Open a new tab" },
  ["<Tab>w"] = { ":tabclose <CR>", "Close this tab" },
  ["<Tab>m"] = { "<cmd>tabnew % <CR>", "New tab with this buffer" },
  ["<Tab>p"] = { "<cmd>BufferLinePick <CR>", "New tab with this buffer" },
  ["<C-_>"] = { ":new<CR>", "Split window vertically" },
  ["<C-\\>"] = { ":vne<CR>", "Split window horizontally" },
  ["<C-l>"] = { "<C-w>l", "Move to window on right" },
  ["<C-h>"] = { "<C-w>h", "Move to window on left" },
  ["<C-k>"] = { "<C-w>k", "Move to window above" },
  ["<C-j>"] = { "<C-w>j", "Move to window below" },
  ["<S-C-H>"] = { ":vertical resize -1<CR>", "Decrease width" },
  ["<S-C-L>"] = { ":vertical resize +1<CR>", "Increase width" },
  ["<S-C-J>"] = { ":resize +1<CR>", "Increase height" },
  ["<S-C-K>"] = { ":resize -1<CR>", "Decrease height" },
  ["<A-h>"] = { ":bnext<CR>", "Next buffer" },
  ["<A-l>"] = { ":bprevious<CR>", "Previous buffer" },
}, { mode = "n" })
