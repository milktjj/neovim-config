local auto_indent = vim.api.nvim_create_augroup("AUTO_INDENT", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = "*",
    group = auto_indent,
    -- command = 'normal! gg=G``zz'
    command = 'lua vim.lsp.buf.format { async = false }',
    -- vim.lsp.buf.format { async = true }
})
