local opt = vim.opt  -- to set options
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

-- load up personal colorscheme --
opt.runtimepath:append("~/.config/nvim/dracula_pro/vim")
cmd 'colorscheme dracula_pro_buffy'
