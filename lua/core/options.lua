local o = vim.opt -- Global options
local c = vim.cmd -- Vim commands
local w = vim.wo -- Window options
local b = vim.bo -- Vim buffer options

o.completeopt = menuone, noinsert, noselect
o.hidden = true
o.filetype = plugin, indent, on
o.mouse = "a" -- enable mouse
o.number = true -- Show line numbers
o.relativenumber = false -- Show line numbers
o.scrolloff = 8 -- Start scrolling before reaching the bottom or top
o.termguicolors = true -- Have more colors available
o.splitbelow = true -- New split windows appear below
o.splitright = true -- New split windows appear right
o.wrap = false -- Don't wrap text
o.autochdir = false -- Change the default dir to this one
o.signcolumn = "yes" -- Extra column for signs
o.iskeyword:append("-")
c("set colorcolumn=80") -- Show where the 80th column
c("highlight ColorColumn ctermbg=0 guibg=lightgrey")

o.tabstop = 2 -- Size of tabs
o.shiftwidth = 2 -- Size of each indent
o.expandtab = true -- When using tab key, insert spaces
o.autoindent = true

-- search settings
o.ignorecase = true -- Will find upper and lowercase examples
o.smartcase = true
o.incsearch = true -- Smart searching e.g example*
o.hlsearch = true -- dont stay highlighted

-- backspace
o.backspace = "indent,eol,start"

-- clipboard
o.clipboard:append("unnamedplus")

-- highlight current row
o.cursorline = true

o.foldmethod = "indent"
o.foldlevelstart = 99
o.conceallevel = 2
--[[
tabstop
The width of a hard tabstop measured in "spaces" -- effectively the (maximum) width of an actual tab character.

shiftwidth
The size of an "indent". It's also measured in spaces, so if your code base indents with tab characters then you want shiftwidth to equal the number of tab characters times tabstop. This is also used by things like the =, > and < commands.

softtabstop
Setting this to a non-zero value other than tabstop will make the tab key (in insert mode) insert a combination of spaces (and possibly tabs) to simulate tab stops at this width.

expandtab
Enabling this will make the tab key (in insert mode) insert spaces instead of tab characters. This also affects the behavior of the retab command.

smarttab
Enabling this will make the tab key (in insert mode) insert spaces or tabs to go to the next indent of the next tabstop when the cursor is at the beginning of a line (i.e. the only preceding characters are whitespace).
]]
--
