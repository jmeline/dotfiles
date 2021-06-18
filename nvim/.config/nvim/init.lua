------------------------ HELPERS ------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local _ = require('util.funcs')

-- Auto install paq-nvim if it does not exist
-- https://github.com/savq/paq-nvim
local install_path = fn.stdpath("data")..'/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone --depth 1 https://github.com/savq/paq-nvim.git '..install_path)
end

-------------------- PLUGINS -----------------------------------
require 'paq-nvim' {
    -- Let Paq manage itself
    'savq/paq-nvim';                  

    -- Add your packages
    -- LSP
    'neovim/nvim-lspconfig';          
    'nvim-lua/completion-nvim';
    'nvim-lua/lsp_extensions.nvim';
    'hrsh7th/nvim-compe';
    'kyazdani42/nvim-web-devicons'; -- for file icons
    'kyazdani42/nvim-tree.lua';
}


-- load up personal colorscheme --
opt.runtimepath:append("~/.config/nvim/dracula_pro/vim");
cmd 'colorscheme dracula_pro_buffy'

g.mapleader             = "," 		        -- set leader 
g.indent_blankline_char = '┊'

-------------------- Mappings ----------------------------------
_.map("i", "jk", "<ESC>")
_.map("i", "<slient> <ESC>", "<C-O>:stopinsert<CR>")
_.map("n", ";", ":")
_.map("n", "j", "gj")
_.map("n", "k", "gk")
_.map("n", "Y", "y$")
_.map("n", "<leader>y", '"*y')
_.map("n", "<leader>p", '"*p')
_.map("n", "<leader>Y", '"+y')
_.map("n", "<leader>P", '"+p')

-------------------- OPTIONS -----------------------------------
opt.number          = true             -- Display numbers
opt.tabstop         = 2                -- Number of spaces tabs count for
opt.shiftwidth      = 2                -- Size of an indent
opt.expandtab       = true             -- Use spaces instead of tabs
opt.termguicolors   = true             -- True color support
opt.completeopt     = { 
                          "menuone",
                          "noselect"
                      }

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

