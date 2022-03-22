
-- map('s', '<leader>c', '<cmd>Commentary<CR>')
-- map('x', '<leader>c', '<cmd>Commentary<CR>')
-- map('n', '<leader>c', '<cmd>Commentary<CR>')
-- map('n', '<leader>o', '<cmd>Files<CR>')
-- map('n', '<leader>r', '<cmd>Rg<CR>')
-- map('n', '<leader>/', '<cmd>BLines<CR>')
-- map('n', '<leader>;', '<cmd>History:<CR>')
-- map('n', '<leader>g', '<cmd>GitFiles<CR>')

require 'core/settings'
require 'core/colorscheme'
require 'core/keymaps'
require 'packer_init'

-------------------- Load PLUGINS ----------------------------------
require 'plugins/nvim-tree'
require 'plugins/lualine'
require "plugins/compe-completion"
require "plugins/lsp-installer"
require "plugins/nvim-lspconfig"
require "plugins/nvim-treesitter"
require "plugins/vsnip-config"
--require "trueZen-config"
-- require "telescope-config"
