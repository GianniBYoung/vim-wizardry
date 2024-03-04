return {
    {
        "folke/which-key.nvim",
        event = 'VimEnter',     -- Sets the loading event to 'VimEnter',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 600
            require("which-key").setup {
                spelling = false,
                presets = { windows = false },
                key_labels = { ["<space>"] = "Space" },
                window = {
                    border = "single",        -- none, single, double, shadow
                    margin = { 1, 3, 1, 3 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
                    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
                },
                layout = { height = { min = 4, max = 20 }, align = "center" },
                triggers_blacklist = { n = { "i", "j", "k" }, },
            }
        end,
        lazy = true
    },
}
