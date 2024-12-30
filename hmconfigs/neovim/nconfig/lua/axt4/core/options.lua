vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

--Numbers
opt.number = true
--opt.relativenumber = true

--Tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true 
opt.autoindent = true


--Wrapping
opt.wrap = false

--Search
opt.ignorecase = true
opt.smartcase = true

--Line Highlight
opt.cursorline = true

--Colorscheme Settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--Backspace
opt.backspace = "indent,eol,start"

--System Clipboard

--Window Splitting
opt.splitright = true
opt.splitbelow = true

--Swapfile
opt.swapfile = false
