local opt = vim.opt
local fn = vim.fn
local buffer = vim.b
local global = vim.g

opt.timeoutlen = 500
opt.relativenumber = true
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftround = true
opt.smartindent = true
opt.number = true
opt.wildmenu = true
opt.wrap = false
opt.cursorline = true
opt.cursorcolumn = false
opt.autoread = true
-- opt.title = true
opt.undofile = true
opt.undodir = fn.expand('$HOME/.local/share/nvim/undo')
opt.exrc = true
opt.swapfile = false
opt.completeopt = { "menu", "menuone", "preview" }
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"

buffer.fileencoding = "utf-8"
