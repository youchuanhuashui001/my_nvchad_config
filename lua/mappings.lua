require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Vista快捷键
map("n", "ee", "<cmd>Vista!!<CR>", { desc = "Toggle Vista", silent = true })

-- 修改目录树快捷键为切换模式
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvimtree", silent = true })

-- LSP 导航
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "跳转到定义" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "查看引用" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "显示文档" })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "重命名" })

-- Tags 导航
map("n", "<C-]>", "g<C-]>", { desc = "跳转到定义(多选)" })
map("n", "<C-t>", "<C-o>", { desc = "返回上一位置" })

-- 高亮当前单词
map("n", "\\m", "<Plug>MarkSet", { desc = "高亮当前单词" })
map("x", "\\m", "<Plug>MarkSet", { desc = "高亮选中文本" })
map("n", "\\r", "<Plug>MarkRegex", { desc = "使用正则表达式高亮" })
map("n", "\\c", "<Plug>MarkAllClear", { desc = "清除所有高亮" })