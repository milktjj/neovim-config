vim.keymap.set("n", "<leader>T", function () require("trouble").toggle() end)
vim.keymap.set("n", "<leader>TW", function ()
    require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>TD", function ()
    require("trouble").toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>TQ", function ()
    require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>TL", function ()
    require("trouble").toggle("loclist")
end)
vim.keymap.set("n", "gR", function ()
    require("trouble").toggle("lsp_references")
end)

