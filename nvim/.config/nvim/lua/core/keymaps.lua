local map = require("util.funcs").map


-- Change leader to a comma
vim.g.mapleader = "," 

-- 
map("i", "jk", "<ESC>")
map("n", ";", ":")
map("n", "j", "gj")
map("n", "k", "gk")

-- Don't use arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map("n", "<leader>c", "<cmd>TComment<CR>")
map("v", "<leader>c", "<cmd>TCommentBlock<CR>")
map("i", "<slient> <ESC>", "<C-O>:stopinsert<CR>")

map("n", "Y", "y$")
map("n", "<leader>y", '"*y')
map("n", "<leader>p", '"*p')
map("n", "<leader>Y", '"+y')
map("n", "<leader>P", '"+p')
