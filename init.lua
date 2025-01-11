vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },

  {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    config = function()
      vim.g.better_whitespace_ctermcolor = 'red'
      vim.g.better_whitespace_guicolor = '#FF0000'
      vim.g.better_whitespace_enabled = 1
      -- 保存时自动删除多余空格（可选)
      vim.g.strip_whitespace_on_save = 1
      -- 保存时显示确认提示（可选）
      vim.g.strip_whitespace_confirm = 1
      -- 忽略特定文件类型
      vim.g.better_whitespace_filetypes_blacklist = {
        'diff',
        'git',
        'gitcommit',
        'unite',
        'qf',
        'help',
        'markdown',
        'TelescopePrompt',
        'mason',
        'lazy',
        'NvimTree',
      }
    end,
  },

  -- 先确保 treesitter 安装
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    priority = 1000,
  },

  -- 使用最新的彩虹括号插件
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufRead",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      local rainbow_delimiters = require('rainbow-delimiters')

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterOrange',
          'RainbowDelimiterYellow',
          'RainbowDelimiterGreen',
          'RainbowDelimiterCyan',
          'RainbowDelimiterBlue',
          'RainbowDelimiterViolet',
        },
      }
    end,
  },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
