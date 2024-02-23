return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.cursorword').setup()
            require('mini.ai').setup()
            require('mini.files').setup({
                windows = { preview = true, },
                mappings = {
                    go_in       = 'L',
                    go_in_plus  = 'l',
                    go_out      = 'H',
                    go_out_plus = 'h',
                },
            })
            require('mini.bufremove').setup()
            require('mini.comment').setup({ ignore_blank_line = true })
            require('mini.indentscope').setup({ symbol = '╎' })
            require('mini.operators').setup()
            require('mini.pairs').setup()
            require('mini.surround').setup({
                mappings = {
                    add = 'ta',    -- Add surrounding in Normal and Visual modes
                    delete = 'td', -- Delete surrounding
                    find = 'tf',   -- Find surrounding (to the right)
                    find_left = 'tF', -- Find surrounding (to the left)
                    highlight = 'th', -- Highlight surrounding
                    replace = 'tr', -- Replace surrounding
                    update_n_lines = 'tn', -- Update `n_lines`
                }
            }
            )
            require('mini.move').setup({
                mappings = {
                    left = '<M-h>',
                    right = '<M-l>',
                    down = '<M-j>',
                    up = '<M-k>',
                    -- Move current line in Normal mode
                    line_left = '<M-h>',
                    line_right = '<M-l>',
                    line_down = '<M-j>',
                    line_up = '<M-k>',
                }
            }
            )
        end
    },
}
