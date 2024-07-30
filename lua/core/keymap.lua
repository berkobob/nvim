local term_opts = { silent = true }            -- Standard options for the terminal
local opts = { noremap = true, silent = true } -- Seems to be standard options
local keymap = vim.keymap.set
local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- Modes
--   normal_mode  = 'n'
--   insert_mode  = 'i'
--   visual_mode  = 'v'
--   term_mode    = 't'
--   command_mode = 'c'
--   visual_block_mode = 'x'

-- Keys
--   A = Alt
--   S = Shift
--   C = Control
--   ESC = Escape
--   CR  = Enter / Return
--   Up, Down, Left, Right = Cursor keys

---
vim.g.mapleader = "\\"
---

---
--- Visual mode moving things around
---

-- Move indent with less and greater than signs
keymap("v", ",", "<gv", opts)
keymap("v", ".", ">gv", opts)

-- Move text up and down
keymap("v", "<Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<Up>", ":m '<-2<CR>gv=gv", opts)

---
--- Opening and closing things
---

-- Tabs
opts.desc = "Next tab"
keymap("n", "<Tab>l", ":tabn <CR>", opts)
opts.desc = "Previous tab"
keymap("n", "<Tab>h", ":tabp <CR>", opts)
opts.desc = "Open a new tab"
keymap("n", "<Tab>t", ":tabnew <CR>", opts)
opts.desc = "Close this tab"
keymap("n", "<Tab>w", ":tabclose <CR>", opts)
opts.desc = "New tab with this buffer"
keymap("n", "<Tab>m", "<cmd>tabnew % <CR>", opts)
-- opts.desc = "New tab with this buffer"
keymap("n", "<Tab>p", "<cmd>BufferLinePick <CR>", opts)

-- Create windows / panes / splits
opts.desc = "Split window vertically"
keymap("n", "<C-=>", ":new<CR>", opts)
opts.desc = "Split window horizontally"
keymap("n", "<C-\\>", ":vne<CR>", opts)

-- Navigate windows
opts.desc = "Move to window on right"
keymap("n", "<C-l>", "<C-w>l", opts)
opts.desc = "Move to window on left"
keymap("n", "<C-h>", "<C-w>h", opts)
opts.desc = "Move to window above"
keymap("n", "<C-k>", "<C-w>k", opts)
opts.desc = "Move to window below"
keymap("n", "<C-j>", "<C-w>j", opts)

-- Resize Windows
opts.desc = "Decrease width"
keymap("n", "<S-C-H>", ":vertical resize -1<CR>", opts)
opts.desc = "Increase width"
keymap("n", "<S-C-L>", ":vertical resize +1<CR>", opts)
opts.desc = "Increase height"
keymap("n", "<S-C-J>", ":resize +1<CR>", opts)
opts.desc = "Decrease height"
keymap("n", "<S-C-K>", ":resize -1<CR>", opts)

-- buffers
opts.desc = "Next buffer"
keymap('n', '<C-l>', ":bnext<CR>", opts)
opts.desc = "Previous buffer"
keymap('n', '<C-h>', ":bprevious<CR>", opts)

---
--- Plugins
---

-- nvim-tree
opts.desc = "Open file tree"
keymap("n", "<C-p>", "<cmd>NvimTreeToggle<CR>", opts)
opts.desc = "Open file tree at current file"
keymap("n", "<C-f>", "<cmd>NvimTreeFindFileToggle<CR>", opts)

-- trouble
opts.desc = "Diagnostics (Trouble)"
keymap('n', "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
opts.desc = "Buffer Diagnostics (Trouble)"
keymap('n', "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)
opts.desc = "Symbols (Trouble)"
keymap('n', "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", opts)
opts.desc = "LSP Definitions"
keymap('n', "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", opts)
opts.desc = "Location List (Trouble)"
keymap('n', "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts)
opts.desc = "Quickfix List (Trouble)"
keymap('n', "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", opts)

-- Maximizer
opts.desc = "Maximize/minimize a split"
keymap("n", "<C-m>", "<cmd>MaximizerToggle<CR>", opts)

opts.desc = "Test Alt"
keymap('n', '<A-p>', function() print('Hello Antoine, the left Alt key is working') end, opts)
opts.desc = "Toggle breakpoint"
keymap('n', '<A-b>', ":DapToggleBreakpoint<CR>", opts)
opts.desc = "Continue debugging"
keymap('n', '<A-c>', ":DapContinue<CR>", opts)
opts.desc = "Start debugging"
keymap('n', '<A-d>', ":DapNew<CR>", opts)
opts.desc = "Stop debugging"
keymap('n', '<A-q>', ":DapTerminate<CR>", opts)
opts.desc = "Step Over"
keymap('n', '<A-Right>', ":DapStepOver<CR>", opts)
opts.desc = "Step down"
keymap('n', '<A-Down>', ":DapStepInto<CR>", opts)
opts.desc = "Step out"
keymap('n', '<A-Up>', ":DapStepOut<CR>", opts)
opts.desc = "Show Dap Log"
keymap('n', '<A-l>', ":DapShowLog<CR>", opts)

---
--- Advanced help and debugging
---

-- LSP
opts.desc = "Show LSP references"
keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

opts.desc = "Go to declaration"
keymap("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

opts.desc = "Show LSP definitions"
-- keymap("n", "gd", "<cmd>:tab Telescope lsp_definitions<CR>", opts) -- show lsp definitions
keymap("n", "gd", "<cmd>tab split | Telescope lsp_definitions <CR>", {}) -- show lsp definitions

opts.desc = "Show LSP implementations"
keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

opts.desc = "Show LSP type definitions"
keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

opts.desc = "See available code actions"
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- see available code actions, in visual mode will apply to selection

opts.desc = "Smart rename"
keymap("n", "<leader>bn", vim.lsp.buf.rename, opts) -- smart rename

opts.desc = "Show buffer diagnostics"
keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

opts.desc = "Show line diagnostics"
keymap("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

opts.desc = "Go to previous diagnostic"
keymap("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

opts.desc = "Go to next diagnostic"
keymap("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

opts.desc = "Show documentation for what is under cursor"
keymap("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

opts.desc = "Restart LSP"
keymap("n", "<leader>bs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

opts.desc = "Format code"
keymap("n", "<leader>bf", vim.lsp.buf.format, opts)

--]]--
