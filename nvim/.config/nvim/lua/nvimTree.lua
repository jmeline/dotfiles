local api, g, opt = vim.api, vim.g, vim.opt

require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}

opt.termguicolors = true

g.nvim_tree_side = "left"
g.nvim_tree_width = 25
g.nvim_tree_ignore = {
  ".git",
  "node_modules",
  ".cache"
}
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":t"
g.nvim_tree_allow_resize = 1
g.nvim_tree_gitignore = 1
g.nvim_tree_highlight_opened_files= 3

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1
}

-- g.nvim_tree_icons = {
--   default = " ",
--   symlink = " ",
--   git = {
--       unstaged = "✗",
--       staged = "✓",
--       unmerged = "",
--       renamed = "➜",
--       untracked = "★",
--       deleted = "",
--       ignored = "◌"
--   },
--   folder = {
--       default = "",
--       open = "",
--       symlink = "",
--       empty = "",
--       empty_open = "",
--       symlink_open = ""
--   }
-- }

g.nvim_tree_icons = {
 default      = "",
 symlink      = "",
 git = {
  unstaged    = "✗",
  staged      = "✓",
  unmerged    = "",
  renamed     = "➜",
  untracked   = "★",
  deleted     = "",
 },
 folder = {
  arrow_open  = "",
  arrow_closed= "",
  default     = "",
  open        = "",
  empty       = "",
  empty_open  = "",
  symlink     = "",
  symlink_open= "",
 },
 lsp = {
   hint       = "",
    info      = "",
    warning   = "",
    error     = "",
  }
 }

-- Mappings for nvimtree

local tree_cb = require "nvim-tree.config".nvim_tree_callback
local map = require("util.funcs").map

map("n", "<leader>n", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- g.nvim_tree_bindings = {
--   { key = {"<CR>", "o"} }
--     ["u"] = ":lua require'some_module'.some_function()<cr>",
--     -- default mappings
--     ["<CR>"]            = tree_cb("edit"),
--     ["o"]               = tree_cb("edit"),
--     ["<2-LeftMouse>"]   = tree_cb("edit"),
--     ["<2-RightMouse>"]  = tree_cb("cd"),
--     ["<C-]>"]           = tree_cb("cd"),
--     ["<C-v>"]           = tree_cb("vsplit"),
--     ["<C-x>"]           = tree_cb("split"),
--     ["<C-t>"]           = tree_cb("tabnew"),
--     ["<"]               = tree_cb("prev_sibling"),
--     [">"]               = tree_cb("next_sibling"),
--     ["<BS>"]            = tree_cb("close_node"),
--     ["<S-CR>"]          = tree_cb("close_node"),
--     ["<Tab>"]           = tree_cb("preview"),
--     ["I"]               = tree_cb("toggle_ignored"),
--     ["H"]               = tree_cb("toggle_dotfiles"),
--     ["R"]               = tree_cb("refresh"),
--     ["a"]               = tree_cb("create"),
--     ["d"]               = tree_cb("remove"),
--     ["r"]               = tree_cb("rename"),
--     ["<C-r>"]           = tree_cb("full_rename"),
--     ["x"]               = tree_cb("cut"),
--     ["c"]               = tree_cb("copy"),
--     ["p"]               = tree_cb("paste"),
--     ["y"]               = tree_cb("copy_name"),
--     ["Y"]               = tree_cb("copy_path"),
--     ["gy"]              = tree_cb("copy_absolute_path"),
--     ["[c"]              = tree_cb("prev_git_item"),
--     ["]c"]              = tree_cb("next_git_item"),
--     ["-"]               = tree_cb("dir_up"),
--     ["q"]               = tree_cb("close")
-- }
