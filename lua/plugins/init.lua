return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  -- 示例：添加中文输入法自动切换
  {
    "h-hg/fcitx.nvim",
    lazy = false,
  },

  -- 添加Vista插件用于显示函数列表
  {
    "liuchengxu/vista.vim",
    cmd = "Vista",
    init = function()
      -- Vista配置
      vim.g.vista_default_executive = 'nvim_lsp'  -- 使用nvim-lsp
      vim.g.vista_executive_for = {
        c = 'ctags',              -- 对C文件使用ctags
        cpp = 'ctags',            -- 对C++文件使用ctags
      }
      vim.g.vista_sidebar_width = 45              
      vim.g.vista_echo_cursor = 0                 
      vim.g.vista_stay_on_open = 0               
      vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "} 
      vim.g.vista_update_on_text_changed = 1      
    end,
  },

  -- 添加vim-mark插件用于高亮单词
  {
    "Yggdroot/vim-mark",
    lazy = false,
    init = function()
      -- vim-mark配置
      vim.g.mw_no_mappings = 1  -- 禁用默认键位
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    cmd = "Telescope",
    init = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.6,
              results_width = 0.8,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          path_display = { "truncate" },
          sorting_strategy = "ascending",
        },
        -- 添加 ctags 配置
        pickers = {
          tags = {
            only_sort_tags = true,
            fname_width = 60,
            show_line = true,
          },
          -- 定义跳转也使用 tags
          lsp_definitions = {
            jump_type = "never",  -- 禁止直接跳转
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}

