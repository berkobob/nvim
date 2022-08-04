local term_opts = { silent = true }              -- Standard options for the terminal
local opts = { noremap = true, silent = true }   -- Seems to be standard options
local keymap = vim.api.nvim_set_keymap           -- Shorten function name
local bufopts = { noremap=true, silent=true, buffer=bufnr }

vim.g.mapleader = '`'

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


-- Move between windows
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Resize windows!
keymap('n', '<a-Up>', ':resize +2<CR>', opts)
keymap('n', '<a-Down>', ':resize -2<CR>', opts)
keymap('n', '<a-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<a-Right>', ':vertical resize +2<CR>', opts)

-- Stay in indent mode
keymap('v', ',', '<gv', opts)
keymap('v', '.', '>gv', opts)

-- Move text up and down
keymap('v', "<Down>", ":m '>+1<CR>gv=gv", opts)
keymap('v', "<Up>",   ":m '<-2<CR>gv=gv", opts)

-- Navigate buffers
keymap('n', "<S-l>", ":bnext<CR>", opts)
keymap('n', "<S-h>", ":bprevious<CR>", opts)
keymap('n', "<S-w>", ":bdelete<CR>", opts)

-- NvimTree
-- keymap ('n', "<leader>e", ":NvimTreeToggle<CR>", opts)

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

