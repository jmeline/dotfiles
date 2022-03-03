------------------------ HELPERS ------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local o = vim.o

local map = require("util.funcs").map

-- Auto install packer if it does not exist
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-------------------- PLUGINS -----------------------------------
require('packer').startup(function(use) 
  use ('wbthomason/packer.nvim')
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use ('nvim-lua/lsp_extensions.nvim')
  use ('nvim-lua/completion-nvim')

  use ('rafamadriz/friendly-snippets')
  use ('hrsh7th/vim-vsnip')

  use ('hrsh7th/nvim-compe')                        -- completion provided in lua
  use ('onsails/lspkind-nvim')
  use ('kyazdani42/nvim-web-devicons')               -- for file icons
  use ('kyazdani42/nvim-tree.lua')                   -- file explorer in lua
  use ('hoob3rt/lualine.nvim')                       -- blazingly fast statusline
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- 'junegunn/fzf';
  -- 'junegunn/fzf.vim';

  use ('nvim-lua/popup.nvim')
  use ('nvim-lua/plenary.nvim')
  use ('nvim-telescope/telescope.nvim')

  --'machakann/vim-sandwich'
  --'tomtom/tcomment_vim'
  -- 'tpope/vim-commentary'
  --'tpope/vim-fugitive'
  use ('jiangmiao/auto-pairs')
  use ('christoomey/vim-tmux-navigator')

  use ('mattn/emmet-vim')
  --use ('pangloss/vim-javascript')
  --use ('leafgarland/typescript-vim')
  use ('peitalin/vim-jsx-typescript')
  use ('Pocco81/TrueZen.nvim')
  use 'Mofiqul/dracula.nvim'
end)

-- load up personal colorscheme --
opt.runtimepath:append("~/.config/nvim/dracula_pro/vim")
cmd 'colorscheme dracula_pro_buffy'

g.indent_blankline_char = '┊'
g.mapleader             = ","  -- Set leader key
g.noshowmode            = true -- Disables standart -INSERT-, -NORMAL-, etc 
g.noswapfile            = true

g.user_emmet_leader_key = ","


-- map('s', '<leader>c', '<cmd>Commentary<CR>')
-- map('x', '<leader>c', '<cmd>Commentary<CR>')
-- map('n', '<leader>c', '<cmd>Commentary<CR>')
-- map('n', '<leader>o', '<cmd>Files<CR>')
-- map('n', '<leader>r', '<cmd>Rg<CR>')
-- map('n', '<leader>/', '<cmd>BLines<CR>')
-- map('n', '<leader>;', '<cmd>History:<CR>')
-- map('n', '<leader>g', '<cmd>GitFiles<CR>')
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
require "lsp-installer"
--require "lsp-config"
require "nvim-treesitting"
--require "vsnip-config"
--require "trueZen-config"
require "telescope-config"

-------------------- Mappings ----------------------------------
map("n", "<leader>c", "<cmd>TComment<CR>")
map("v", "<leader>c", "<cmd>TCommentBlock<CR>")
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
