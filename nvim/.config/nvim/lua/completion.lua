local map = require("util/funcs").map

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

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn["compe#confirm"]()
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t("<Plug>(vsnip-expand-or-jump)")
    else
        return t("<Tab>")
    end
end

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<C-Space>", "compe#complete()", {expr = true, silent = true})
map("i", "<CR>", [[compe#confirm("<CR>")]], {expr = true, silent = true})
map("i", "<C-e>", [[compe#close("<C-e>")]], {expr = true, silent = true})
--
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true, silent = true})
-- vim.api.nvim_set_keymap("i", "<CR>", [[compe#confirm("<CR>")]], {expr = true, silent = true})
-- vim.api.nvim_set_keymap("i", "<C-e>", [[compe#close("<C-e>")]], {expr = true, silent = true})
