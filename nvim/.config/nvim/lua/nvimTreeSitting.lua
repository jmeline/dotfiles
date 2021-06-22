-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained",
--   highlight = { 
--     enable = true
--   }
-- }
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "javascript",
        "clojure",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        -- "python"
        -- "rust",
        -- "go"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
