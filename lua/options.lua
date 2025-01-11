require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local opt = vim.o

-- 示例配置
opt.fileencoding = "utf-8"        -- 文件编码
opt.expandtab = false            -- 使用真实的tab字符，而不是空格
opt.shiftwidth=8
opt.tabstop=8
opt.softtabstop=8
opt.number = true                -- 显示行号
opt.cursorlineopt ='both'        -- 启用光标线

-- 添加到现有配置中
vim.cmd([[
        autocmd BufRead,BufNewFile *.h set filetype=c
        autocmd BufRead,BufNewFile *.hpp set filetype=cpp
]])
