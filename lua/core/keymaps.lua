vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")

-- keymap.set({"n", "i"}, "<left>", "<Nop>")
-- keymap.set({"n", "i"}, "<right>", "<Nop>")
-- keymap.set({"n", "i"}, "<up>", "<Nop>")
-- keymap.set({"n", "i"}, "<down>", "<Nop>")

vim.keymap.set('n', '<C-s>', ':w<CR>')          -- Save
vim.keymap.set('v', '<C-c>', '"+y')             -- Copy
vim.keymap.set('n', '<C-v>', '"+P')             -- Paste normal mode
vim.keymap.set('t', '<C-v>', '"+P')             -- Paste normal mode
vim.keymap.set('v', '<C-v>', '"+P')             -- Paste visual mode
vim.keymap.set('c', '<C-v>', '<C-R>+')          -- Paste command mode
vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli')     -- Paste insert mode


keymap.set("n", "<leader><right>", "<cmd>bn<CR>", { silent = true })
keymap.set("n", "<leader><left>", "<cmd>bp<CR>", { silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")

keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")


local opts = { noremap = true, silent = true }
-- Save breakpoints to file automatically.
keymap.set({ "i", "n", "v" }, "<F1>", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
keymap.set({ "n", "v" }, "<leader>scd",
    "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", opts)
keymap.set({ "n", "v" }, "<leader>cab", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
    opts)


-- keymap.set({"i", "n", "v"}, "<leader><left>", "<C-w>h", {silent = true, noremap = true})
-- keymap.set({"i", "n", "v"}, "<leader><Right>", "<C-w>l", {silent = true, noremap = true})
-- keymap.set({"i", "n", "v"}, "<leader><Up>", "<C-w>k", {silent = true, noremap = true})
-- keymap.set({"i", "n", "v"}, "<leader><Down>", "<C-w>j", {silent = true, noremap = true})

keymap.set({ "n", "v" }, "<leader>h", "<C-w>h", { silent = true, noremap = true })
keymap.set({ "n", "v" }, "<leader>l", "<C-w>l", { silent = true, noremap = true })
keymap.set({ "n", "v" }, "<leader>k", "<C-w>k", { silent = true, noremap = true })
keymap.set({ "n", "v" }, "<leader>j", "<C-w>j", { silent = true, noremap = true })

keymap.set({ "n", "t" }, "<leader>t", "<cmd>Lspsaga term_toggle<cr>", { silent = true, noremap = true })

require("plugins.lsp.trouble-keymap")
