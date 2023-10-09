return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "glepnir/lspsaga.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "√",
                    package_pedding = "→",
                    package_uninstalled = "×"
                }
            }
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls", "pylsp", "gopls", "tsserver",
            },
        })

        require('lspsaga').setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require('lspconfig')

        lspconfig.lua_ls.setup {
            capabilities = capabilities,
        }

        lspconfig.tsserver.setup {
            capabilities = capabilities,
        }

        lspconfig.pylsp.setup {
            capabilities = capabilities,
        }

        lspconfig.gopls.setup {
            capabilities = capabilities,
            settings = {
                gopls = {
                    experimentalPostfixCompletions = true,
                    analyses = {
                        unusedparams = true,
                        shadow = true,
                    },
                    staticcheck = true,
                },
            },
        }

        lspconfig.csharp_ls.setup {
            capabilities = capabilities,
        }

        -- Use LspAttach autocommand to only map
        -- the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                local builtin = require("telescope.builtin")
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', builtin.lsp_references, opts)
                vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<cr>", opts)
                vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', builtin.lsp_type_definitions, opts)
                vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename<cr>", opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', "<cmd>Lspsaga code_action<cr>", opts)
                vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end
}
