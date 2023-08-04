vim.g.mapleader = " "

local keymap = vim.keymap

-- insert mode
-- keymap.set("i", "jk", "<ESC>")

-- visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- normal mode
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")

keymap.set("n", "<leader>nh", "nohl<CR>")

keymap.set({"i", "n", "v"}, "<F5>", "<cmd>lua require'dap'.continue()<CR>", {silent = true, noremap = true, buffer = bufnr})
keymap.set({"i", "n", "v"}, "<F10>", "<cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true, buffer = bufnr})
keymap.set({"i", "n", "v"}, "<F11>", "<cmd>lua require'dap'.step_into()<CR>", {silent = true, noremap = true, buffer = bufnr})
keymap.set({"i", "n", "v"}, "<F9>", "<cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true, buffer = bufnr})
keymap.set({"i", "n", "v"}, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true, noremap = true, buffer = bufnr})

keymap.set({"i", "n", "v"}, "<leader><left>", "<C-w>h", {silent = true, noremap = true})
keymap.set({"i", "n", "v"}, "<leader><Right>", "<C-w>l", {silent = true, noremap = true})
keymap.set({"i", "n", "v"}, "<leader><Up>", "<C-w>k", {silent = true, noremap = true})
keymap.set({"i", "n", "v"}, "<leader><Down>", "<C-w>j", {silent = true, noremap = true})


