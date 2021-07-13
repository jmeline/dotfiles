------------------------ HELPERS ------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local o = vim.o

local map = require("util.funcs").map

-- Auto install paq-nvim if it does not exist
-- https://github.com/savq/paq-nvim
local install_path = fn.stdpath("data")..'/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone --depth 1 https://github.com/savq/paq-nvim.git '..install_path)
end

-------------------- PLUGINS -----------------------------------
require 'paq-nvim' {
  {'savq/paq-nvim', opt=true};                -- Let Paq manage itself

  -- Add your packages
  -- lsp 
  'neovim/nvim-lspconfig';
  'nvim-lua/completion-nvim';
  'nvim-lua/lsp_extensions.nvim';

  'rafamadriz/friendly-snippets';
  'hrsh7th/vim-vsnip';

  'hrsh7th/nvim-compe';                         -- completion provided in lua
  'onsails/lspkind-nvim';
  'kyazdani42/nvim-web-devicons';               -- for file icons
  'kyazdani42/nvim-tree.lua';                   -- file explorer in lua
  'hoob3rt/lualine.nvim';                       -- blazingly fast statusline
  {'nvim-treesitter/nvim-treesitter', run=":TSUpdate"};

  -- 'junegunn/fzf';
  -- 'junegunn/fzf.vim';

  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';

  'machakann/vim-sandwich';
  'tpope/vim-commentary';
  'tpope/vim-fugitive';
  'jiangmiao/auto-pairs';

  'mattn/emmet-vim';
  'christoomey/vim-tmux-navigator';

  'pangloss/vim-javascript';
  'leafgarland/typescript-vim';
  'peitalin/vim-jsx-typescript';
  'Pocco81/TrueZen.nvim';
}


-- load up personal colorscheme --
opt.runtimepath:append("~/.config/nvim/dracula_pro/vim");
cmd 'colorscheme dracula_pro_buffy'

g.indent_blankline_char = '┊'
g.mapleader             = ","  -- Set leader key
g.noshowmode            = true -- Disables standart -INSERT-, -NORMAL-, etc 

g.user_emmet_leader_key = ","

map('n', '<leader>o', '<cmd>Files<CR>')
map('n', '<leader>r', '<cmd>Rg<CR>')
map('n', '<leader>/', '<cmd>BLines<CR>')
map('n', '<leader>;', '<cmd>History:<CR>')
map('n', '<leader>g', '<cmd>GitFiles<CR>')
--map('n', 's', '<cmd>Buffers<CR>')
g['fzf_action'] = {
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

-- vim.api.nvim_command("command! -bang -nargs=* Rg "
--   .."call fzf#vim#grep('rg --column --line-number --no-heading --color=always "
--   .."--glob '!{node_modules/*,.git/*}' --smart-case -- '.shellescape(<q-args>), 1, "
--   .."fzf#vim#with_preview(), <bang>0")

-- vim.api.nvim_command("command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob '!.git' --glob '!node_modules' --color 'always'\".shellescape(<q-args>), 1, <bang>0)\"")

-------------------- Load PLUGINS ----------------------------------
require "nvimTree"
require "statusline"
require "compe-completion"
require "lsp-config"
require "nvimTreeSitting"
require "vsnip-config"
require "trueZen-config"
require "telescope-config"

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
 -- maintain undo history between sessions
cmd [[ 
  set undofile
]]

--cmd 'runtime macros/sandwich/keymap/surround.vim'
-------------------- OPTIONS -----------------------------------
local indent, width = 2, 120
opt.number          = true             -- Display numbers
opt.hidden          = true             -- Enable background buffers
opt.tabstop         = 2                -- Number of spaces tabs count for
opt.softtabstop     = 2
opt.shiftwidth      = indent           -- Size of an indent
opt.expandtab       = true             -- Use spaces instead of tabs
opt.termguicolors   = true             -- True color support
opt.joinspaces      = false
opt.ignorecase      = false
opt.signcolumn      = "yes"
opt.splitbelow      = true
opt.splitright      = true
opt.list            = true
opt.completeopt     = {
  "menuone",
  "noinsert",
  "noselect"
}

opt.colorcolumn     = tostring(width)
opt.smartcase       = true
opt.smartindent     = true
opt.clipboard       = "unnamedplus"
