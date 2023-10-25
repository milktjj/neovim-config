local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    require("plugins.ui.ui-setup"),
    require("plugins.utils"),
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        event = "VeryLazy",
        lazy = true,
        dependencies = {
            "milktjj/nvim-web-devicons-nvim-tree",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- "HiPhish/nvim-ts-rainbow2",

    -- lsp
    require("plugins.lsp.lsp-setup"),
    -- complete
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    {
        "olexsmir/gopher.nvim",
        event = "VeryLazy",
        lazy = true,
        keys = {
            { "<leader>gaj", mode = { "n", "x", "o" }, "<cmd>GoTagAdd json", desc = "add json tag" },
        },
        config = function()
            require("gopher").setup {
                commands = {
                    go = "go",
                    gomodifytags = "gomodifytags",
                    gotests = "~/go/bin/gotests", -- also you can set custom command path
                    impl = "impl",
                    iferr = "iferr",
                },
            }
        end
    },

    "numToStr/Comment.nvim",

    "akinsho/bufferline.nvim",
    "lewis6991/gitsigns.nvim",
    {
        "NeogitOrg/neogit",
        dependencies = {

            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },
    {
        'nvim-telescope/telescope.nvim',
        -- tag = '0.1.x',
        -- or                              , branch = '0.1.x',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    require('plugins.project'),
    require('plugins.debuger'),
}

local opts = {}

require("lazy").setup(plugins, opts)
