local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
require("telescope").load_extension("noice")
require('telescope').load_extension('projects')
local project = require("telescope").extensions.projects

-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- 环境里要安装ripgrep
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', project.projects, {})

require("telescope").setup {
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        },
    },
}

local neorg_callbacks = require("neorg.core.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)
