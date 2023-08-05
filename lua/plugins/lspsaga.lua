local saga = require('lspsaga')
saga.setup()

vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", {silent = true, noremap = true, buffer = bufnr})
-- 跳转到定义
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", {silent = true, noremap = true})
-- 显示注释文档
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {silent = true, noremap = true})
-- 跳转到实现
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true, noremap = true})
-- 跳转到引用位置
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", {silent = true, noremap = true})
-- 以浮窗形式显示错误
vim.keymap.set("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", {silent = true, noremap = true})
vim.keymap.set("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", {silent = true, noremap = true})
