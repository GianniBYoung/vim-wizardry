require("lazy").setup({
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd('set background=light')
            vim.cmd("let g:everforest_background = 'soft'")
            vim.cmd("let g:everforest_colors_override = {'bg1': ['#B0C145', '5'],'bg5': ['#d699b6', '223']}")
            vim.cmd('colorscheme everforest')
        end
    },

    'junegunn/fzf',
    'jiangmiao/auto-pairs',
    'folke/lsp-colors.nvim',
    'tpope/vim-commentary',
    'tpope/vim-eunuch',
    'tpope/vim-endwise',
    'jessarcher/vim-context-commentstring',
    { 'voldikss/vim-floaterm', lazy = true, cmd = 'FloatermToggle' },
    'jessarcher/vim-sayonara',
    'jessarcher/vim-heritage',
    'terryma/vim-smooth-scroll',
    'wellle/targets.vim',
    { 'norcalli/nvim-colorizer.lua', lazy = true, cmd = 'ColorizerToggle' },
    'machakann/vim-highlightedyank',
    { 'kdheepak/lazygit.nvim', lazy = true, cmd = 'LazyGitCurrentFile'},
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'lewis6991/gitsigns.nvim',
    { 'fatih/vim-go', lazy = true, ft = "go" },

    {
        'unblevable/quick-scope',
        lazy = false,
        init = function()
            vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
            vim.g.qs_max_chars = 150
            vim.g.qs_delay = 1
        end
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true
    },
    {
        'kevinhwang91/rnvimr',
        lazy = true,
        cmd = "RnvimrToggle",
        init = function()
            vim.g.rnvimr_enable_ex = 1
            vim.g.rnvimr_enable_bw = 1
            vim.g.rnvimr_enable_picker = 1
            vim.g.rnvimr_edit_cmd = 'drop'
            vim.g.rnvimr_vanilla = 0
        end
    },

    {
        'kyazdani42/nvim-web-devicons',
        opts = {
            override = { zsh = { icon = '📺', color = '#428850', cterm_color = '65', name = 'Zsh' } },
            default = true
        }
    },

    {
        'toppair/peek.nvim',
        lazy = true,
        ft = {'md', "markdown"},
        event = { 'BufRead', 'BufNewFile' },
        build = 'deno task --quiet build:fast',
        config = function()
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end,
        opts = {
            auto_load = true,
            close_on_bdelete = true,
            syntax = true,
            theme = 'light',
            update_on_change = true,
            throttle_at = 200000,
            throttle_time = 'auto',
            filetype = { 'markdown', 'md' },
        },
    },

    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup()
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            vim.opt.termguicolors = true
            vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
            vim.opt.list = true
            vim.opt.listchars:append 'space:⋅'
        end,
        opts = {
            indent_blankline_char = '/',
            space_char_blankline = ' ',
            show_current_context = true,
            show_current_context_start = true,
            char_highlight_list = { 'IndentBlanklineIndent1', 'IndentBlanklineIndent2', 'IndentBlanklineIndent3',
                'IndentBlanklineIndent4', 'IndentBlanklineIndent5', 'IndentBlanklineIndent6', }
        },
    },

    {
        'justinmk/vim-sneak',
        init = function()
            vim.g['sneak#label'] = 1
            vim.g['sneak#use_ic_scs'] = 1
        end
    },

    {
        'folke/trouble.nvim',
        opts = {
            auto_close = true,
            signs = { error = '😡', warning = '⚡', hint = '💡', information = '🧠' },
            use_diagnostic_signs = true
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'lewis6991/spellsitter.nvim',
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        opts = {
            ensure_installed = { 'python', 'ruby', 'yaml', 'go', 'bash', 'dockerfile', 'hcl', 'json' },
            highlight = { enable = true },
        }
    },

    {
        'vimwiki/vimwiki',
        lazy = false,
        keys = { { '<leader>ww', '<cmd>VimwikiIndex<cr>', desc = 'Vim Wiki Index' } },
        init = function() vim.g.vimwiki_list = { { path = '~/vimwiki', syntax = 'markdown', ext = '.md' } } end
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = false,
                globalstatus = false,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', {
                    'diagnostics',
                    sources = { 'nvim_diagnostic', 'nvim_lsp' },
                    symbols = { error = '😡', warning = '⚡', info = '🧠', hint = '💡' },
                } },
                lualine_c = { { 'filename', path = 3, shortening_target = 20 } },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 0 } },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {
                lualine_a = { {
                    'buffers',
                    symbols = {
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
                            readonly = '➖',      -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '[No Name]', -- Text to show for unnamed buffers.
                            newfile = '🐤',
                        }
                    }
                },
            },
            extensions = { 'quickfix' }
        }
    },

    'neovim/nvim-lspconfig',

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { { 'williamboman/mason.nvim', build = ":MasonUpdate", config = true } },
        opts = {
            ensure_installed = {
                'bashls', 'dockerls', 'gopls',
                'marksman', 'lua_ls', 'pyright',
                'jsonls', 'yamlls', 'vimls'
            }
        }
    },
    {
        'L3MON4D3/LuaSnip',
        version = "v1.*",
        run = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        lazy = true,
        config = function()
            require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip' },
    },

    --                float_boarder = 'rounded',
    --            lsp.set_sign_icons({
    --                error = '😡',
    --                warn = '⚡',
    --                hint = '💡',
    --                info = '🧠'
})
---- end of lazy

-- lsp stuff
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>F', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
        })
    end,
})


local luasnip = require 'luasnip'
local cmp = require 'cmp'

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip',    keyword_length = 2 },
        { name = 'nvim_lsp',   keyword_length = 2 },
        { name = "treesitter", keyword_length = 2 },
        { name = "nvim_lua",   keyword_length = 2 },
        { name = "path" },
        { name = "buffer",     keyword_length = 3 },
    }),
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                luasnip = '🔪', nvim_lsp = '🤓', buffer = '🧾', path = '🥾',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
}
