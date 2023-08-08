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
        lazy = false,
        dependencies = {
            "milktjj/nvim-web-devicons-nvim-tree",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "p00f/nvim-ts-rainbow",

    -- lsp
    require("plugins.lsp.lsp-setup"),
    { "folke/neodev.nvim", opts = {} },
    -- complete
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path",

    "numToStr/Comment.nvim",

    "akinsho/bufferline.nvim",
    "lewis6991/gitsigns.nvim",

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    require('plugins.project'),
    require('plugins.debuger'),
}

local opts = {}

require("lazy").setup(plugins, opts)

