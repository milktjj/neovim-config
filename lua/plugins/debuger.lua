return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "ravenxrz/DAPInstall.nvim",
                config = function()
                    local dap_install = require("dap-install")
                    dap_install.setup({
                        installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
                    })
                end
            },
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
            "Weissle/persistent-breakpoints.nvim",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            require('lsp.python')
            require('lsp.go')
            dapui.setup()
            require("nvim-dap-virtual-text").setup()

            -- breakpoints save setup
            require('persistent-breakpoints').setup{
                load_breakpoints_event = { "BufReadPost" }
            }

            -- dap setup
            -- local m = { noremap = true }
            -- vim.keymap.set("n", "<leader>'q", ":Telescope dap<CR>", m)
            -- vim.keymap.set("n", "<leader>'t", dap.toggle_breakpoint, m)
            -- vim.keymap.set("n", "<leader>'n", dap.continue, m)
            -- vim.keymap.set("n", "<leader>'s", dap.terminate, m)
            -- vim.keymap.set("n", "<leader>'du", dapui.toggle, m)
            --
            vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

            vim.fn.sign_define('DapBreakpoint',
                { text = 'o', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointCondition',
                { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointRejected',
                { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
            vim.fn.sign_define('DapLogPoint', {
                text = '',
                texthl = 'DapLogPoint',
                linehl = 'DapLogPoint',
                numhl = 'DapLogPoint'
            })
            -- vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
        end
    }
}
