return {
    {
        'sontungexpt/witch',
        priority = 1000,
        config = function()
            opts = { dim_inactive = { enabled = true, level = 0.88 } }
            require("witch").setup(opts)
        end
    },
    { 'norcalli/nvim-colorizer.lua', lazy = true, cmd = 'ColorizerToggle' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            {
                presets = {
                    command_palette = true,
                    lsp_doc_border = true,
                },
            }
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        -- event = 'ColorScheme',
        opts = {
            options = {
                ignore_focus = {
                    "dapui_watches", "dapui_breakpoints",
                    "dapui_scopes", "dapui_console",
                    "dapui_stacks", "dap-repl"
                },
                theme = 'horizon',
                -- theme = 'auto',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                always_divide_middle = false,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', {
                    'diagnostics',
                    sources = { 'nvim_diagnostic', 'nvim_lsp' },
                    symbols = { error = '😡', warning = '⚡', info = '🧠', hint = '💡' }
                } },
                lualine_c = { { 'filename', path = 3, shortening_target = 30 } },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_c = { { 'filename', path = 0 } },
                lualine_x = { 'location' },
            },
            tabline = {
                lualine_a = { {
                    'buffers',
                    symbols = {
                        -- TODO: Change this
                        modified = ' ●',
                        directory = '🗂️',
                    }
                } },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {
                        'filename',
                        path = 4,
                        symbols = {
                            modified = '➕',
                            readonly = '➖', -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '[No Name]', -- Text to show for unnamed buffers.
                            newfile = '🐤',
                        }
                    }
                },
            },
            extensions = { 'quickfix' }
        }
    },
}
