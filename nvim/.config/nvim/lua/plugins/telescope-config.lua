local map = require("util/funcs").map

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      -- '--color=never',
      '--no-heading',
      '--ignore-case',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "▶  ",
    selection_caret = "▶ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { ".git" },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}


function createCmd(cmd) 
  return "<cmd>Telescope "..cmd.."<CR>"
end

map("n", "<leader>ff", createCmd("find_files"))
map("n", "<leader>fg", createCmd("live_grep"))
map("n", "<leader>fb", createCmd("buffers"))
map("n", "<leader>fh", createCmd("help_tags"))
