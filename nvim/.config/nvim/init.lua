------------------------ HELPERS ------------------------------
-- local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
-- local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
-- local opt = vim.opt  -- to set options
-- local o = vim.o
-- local g = vim.g      -- a table to access global variables

require "core/settings"
require "core/keymaps"
require "core/colorscheme"
require "packer_init"

-------------------- Load PLUGINS ----------------------------------
require "plugins/nvim-tree"
require "plugins/lualine"
require "plugins/compe-completion"
require "plugins/nvim-lsp-installer"
require "plugins/nvim-lspconfig"
require "plugins/nvim-treesitter"
-- require "plugins/vsnip-config"
-- require "telescope-config"

-- map('s', '<leader>c', '<cmd>Commentary<CR>')
-- map('x', '<leader>c', '<cmd>Commentary<CR>')
-- map('n', '<leader>c', '<cmd>Commentary<CR>')
-- map('n', '<leader>o', '<cmd>Files<CR>')
-- map('n', '<leader>r', '<cmd>Rg<CR>')
-- map('n', '<leader>/', '<cmd>BLines<CR>')
-- map('n', '<leader>;', '<cmd>History:<CR>')
-- map('n', '<leader>g', '<cmd>GitFiles<CR>')
