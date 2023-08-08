return {
    {
        "folke/persistence.nvim",
        keys = {
            { "<leader>qs", [[<cmd>lua require("persistence").load()<CR>]]},
            { "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<CR>]]},
            { "<leader>qs", [[<cmd>lua require("persistence").stop()<CR>]]},
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {
            enable_check_bracket_line = false,
        }
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = {"n", "x", "o"}, function () require("flash").jump() end, desc = "Flash" },
            { "S", mode = {"n", "o", "x"}, function () require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function () require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = {"o", "x"}, function () require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = {"c"}, function ()
                require("flash").toggle()
            end, desc = "Toggle Flash Search" }
        },
    }
}
