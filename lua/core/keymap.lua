local term_opts = { silent = true } -- Standard options for the terminal
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


---
--- Plugins
---

-- nvim-tree
opts.desc = "Open file tree"
keymap("n", "<C-p>", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope
opts.desc = "Find files"
keymap("n", "<leader>ef", "<cmd>Telescope find_files <CR>", opts)
opts.desc = "Search file contents (grep)"
keymap("n", "<leader>eg", "<cmd>Telescope live_grep <CR>", opts)
opts.desc = "Search for word under cursor"
keymap("n", "<leader>ec", "<cmd>Telescope grep_string <CR>", opts)
opts.desc = "Search open buffers"
keymap("n", "<leader>eb", "<cmd>Telescope buffers <CR>", opts)
opts.desc = "Telescope help"
keymap("n", "<leader>eh", "<cmd>Telescope help_tags <CR>", opts)
opts.desc = "Search recent files"
keymap("n", "<leader>er", "<cmd>Telescope oldfiles <CR>", opts)

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

-- todo comments
opts.desc = "Next todo comment"
keymap("n", "<leader>tn", function() require("todo-comments").jump_next() end, opts)
opts.desc = "Previous todo comment"
keymap("n", "<leader>tp", function() require("todo-comments").jump_prev() end, opts)
opts.desc = "Popup of all TODOs"
keymap("n", "<leader>tl", ":TodoTelescope<CR>", opts)
opts.desc = "Show TODOs in new window"
keymap("n", "<leader>tw", ":TodoLocList<CR>", opts)
opts.desc = "Telescope todos"
keymap('n', "<leader>tt", ":Telescope todo-comments<CR>", opts)

-- Dart and Flutter
opts.desc = "Show Flutter commands"
keymap("n", "<leader>fx", "<cmd>Telescope flutter commands <CR>", opts)
opts.desc = "Show Flutter devices"
keymap("n", "<leader>fd", "<cmd>FlutterDevices<CR>", opts)
opts.desc = "Flutter run"
keymap("n", "<leader>fr", "<cmd>FlutterRun<CR>", opts)
opts.desc = "Flutter quit"
keymap("n", "<leader>fq", "<cmd>FlutterQuit<CR>", opts)

-- LazyGit
keymap("n", "<leader>lg", ":LazyGit <CR>", opts)

--[[
-- Maximizer
opts.desc = "Maximize/minimize a split"
keymap("n", "<C-m>", "<cmd>MaximizerToggle<CR>", opts)

--[[
-- surround
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
--]]

---
--- Advanced help and debugging
---

-- LSP
opts.desc = "Show LSP references"
-- nvim-tree
--keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", opts)
--keymap("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", opts)
--keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", opts)

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
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

opts.desc = "Show buffer diagnostics"
keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

opts.desc = "Show line diagnostics"
keymap("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

opts.desc = "Go to previous diagnostic"
keymap("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

opts.desc = "Go to next diagnostic"
keymap("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

opts.desc = "Show documentation for what is under cursor"
keymap("n", "K", vim.lsp.buf.hover, {}) -- show documentation for what is under cursor

opts.desc = "Restart LSP"
keymap("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

keymap("n", "<leader>gf", vim.lsp.buf.format, {})

--]]--
