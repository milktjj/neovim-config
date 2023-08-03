require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "vim", "bash", "go", "c", "cpp", "javascript", "json", "lua", "python" },
  
  highlight = { enable = true },
  indent = { enable = true },
  -- rainbow
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

require 'nvim-treesitter.install'.compilers = { "gcc" }

