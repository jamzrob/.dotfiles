-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indents
vim.opt.smartindent = true

vim.opt.wrap = true

-- No swaps long running todos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("XDG_CONFIG_HOME") .. "/undo"
vim.opt.undofile = true

-- search highlights
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true
vim.opt.colorcolumn = ""

-- scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- fast update time
vim.opt.updatetime = 50

-- text width
vim.opt.textwidth = 80
vim.opt.wrap = true
vim.opt.linebreak = true

-- auto writing
vim.opt.autowrite = true

-- move jarring splits outta here
vim.opt.spr = true

vim.opt.clipboard="unnamedplus"


vim.cmd([[
set nocompatible
filetype plugin on
syntax on
set splitright 
set formatoptions+=r
]])

