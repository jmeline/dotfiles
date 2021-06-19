------------------------ HELPERS ------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local o = vim.o

local map = require('util.funcs').map

-- Auto install paq-nvim if it does not exist
-- https://github.com/savq/paq-nvim
local install_path = fn.stdpath("data")..'/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone --depth 1 https://github.com/savq/paq-nvim.git '..install_path)
end

-------------------- PLUGINS -----------------------------------
require 'paq-nvim' {
  'savq/paq-nvim';                -- Let Paq manage itself

  -- Add your packages
  -- lsp 
  'neovim/nvim-lspconfig';          
  'nvim-lua/completion-nvim';
  'nvim-lua/lsp_extensions.nvim';

  'hrsh7th/nvim-compe';                         -- completion provided in lua
  'kyazdani42/nvim-web-devicons';               -- for file icons
  'kyazdani42/nvim-tree.lua';                   -- file explorer in lua
  'hoob3rt/lualine.nvim';                       -- blazingly fast statusline
}


-- load up personal colorscheme --
opt.runtimepath:append("~/.config/nvim/dracula_pro/vim");
cmd 'colorscheme dracula_pro_buffy'

g.indent_blankline_char = '┊'
g.mapleader             = ","  -- Set leader key
g.noshowmode            = true -- Disables standart -INSERT-, -NORMAL-, etc 


-------------------- Load PLUGINS ----------------------------------
require "nvimTree"
require "statusline"
require "completion"

-------------------- Mappings ----------------------------------
map("i", "jk", "<ESC>")
map("i", "<slient> <ESC>", "<C-O>:stopinsert<CR>")
map("n", ";", ":")
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "Y", "y$")
map("n", "<leader>y", '"*y')
map("n", "<leader>p", '"*p')
map("n", "<leader>Y", '"+y')
map("n", "<leader>P", '"+p')

-------------------- User Commands -----------------------------
cmd ':command! WQ wq'
cmd ':command! WQ wq'
cmd ':command! Wq wq'
cmd ':command! Wqa wqa'
cmd ':command! W w'
cmd ':command! Q q'

-------------------- OPTIONS -----------------------------------
local indent, width = 2, 120
opt.number          = true             -- Display numbers
opt.tabstop         = 2                -- Number of spaces tabs count for
opt.softtabstop     = 2
opt.shiftwidth      = indent           -- Size of an indent
opt.expandtab       = true             -- Use spaces instead of tabs
opt.termguicolors   = true             -- True color support
opt.signcolumn      = "yes"
opt.splitbelow      = true
opt.splitright      = true
opt.list            = true
opt.completeopt     = {
  "menuone",
  "noselect"
}
opt.colorcolumn = tostring(width)
opt.smartcase       = true
opt.smartindent     = true
