local opt = vim.opt
local fn = vim.fn
local buffer = vim.b


if vim.g.neovide then
    vim.o.guifont = "FiraCode Nerd Font:h11"
    vim.g.neovide_transparency = 0.95

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0

    vim.g.neovide_scroll_animation_length = 0.3

    vim.g.neovide_hide_mouse_when_typing = true

    vim.g.neovide_theme = 'auto'

    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 5

    vim.g.neovide_confirm_quit = true
    vim.g.neovide_fullscreen = false 

    vim.g.neovide_cursor_animation_length = 0.03

    vim.g.neovide_cursor_animate_in_insert_mode = true

    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.25)
    end)
end


opt.timeoutlen = 500
opt.relativenumber = true
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftround = true
opt.smartindent = true
opt.number = true
opt.wildmenu = true
opt.wrap = false
opt.cursorline = true
opt.cursorcolumn = false
opt.autoread = true
-- opt.title = true
opt.undofile = true
opt.undodir = fn.expand('$HOME/.local/share/nvim/undo')
opt.exrc = true
opt.swapfile = false
opt.completeopt = { "noselect", "menuone", "preview" }
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"

buffer.fileencoding = "utf-8"
