
require("lazy").setup({

    -- {'sainnhe/everforest', lazy = false, priority = 1000,
    --     config = function()
    --         vim.cmd('set background=dark')
    --         -- vim.cmd("let g:everforest_background = 'soft'")
    --         -- vim.cmd("let g:everforest_colors_override = {'bg1': ['#B0C145', '5'],'bg5': ['#d699b6', '223']}")
    --         vim.cmd('colorscheme everforest')
    --     end
    -- },
    {
        'rose-pine/neovim', name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                variant = 'moon',
                dark_variant = 'moon',
                bold_vert_split = true,
                dim_nc_background = false,
                groups = {
                    background = 'base',
                    background_nc = '_experimental_nc',
                    panel = 'surface',
                    panel_nc = 'base',
                    border = 'highlight_med',
                    comment = 'rose',
                    link = 'iris',
                    punctuation = 'subtle',

                    error = 'love',
                    hint = 'iris',
                    info = 'foam',
                    warn = 'gold',

                    headings = {
                        h1 = 'iris',
                        h2 = 'foam',
                        h3 = 'rose',
                        h4 = 'gold',
                        h5 = 'pine',
                        h6 = 'foam',
                    }
                },
                highlight_groups = {
                    TelescopeBorder = { fg = "highlight_high", bg = "none" },
                    TelescopeNormal = { bg = "none" },
                    TelescopePromptNormal = { bg = "base" },
                    TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                    TelescopeSelection = { fg = "text", bg = "base" },
                    TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
                },

            })
            vim.cmd('colorscheme rose-pine')
        end
},
    'junegunn/fzf',
    'jiangmiao/auto-pairs',
    'folke/lsp-colors.nvim',
    'tpope/vim-commentary',
    'tpope/vim-eunuch',
    'tpope/vim-endwise',
    'jessarcher/vim-context-commentstring',
    'jessarcher/vim-sayonara',
    'jessarcher/vim-heritage',
    'terryma/vim-smooth-scroll',
    'neovim/nvim-lspconfig',
    'wellle/targets.vim',
    'tpope/vim-repeat',
    'machakann/vim-highlightedyank',
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    "axieax/typo.nvim",
    'lewis6991/gitsigns.nvim',
    'serenevoid/kiwi.nvim', dependencies = { 'nvim-lua/plenary.nvim' },
    { 'voldikss/vim-floaterm',       lazy = true, cmd = 'FloatermToggle' },
    { 'norcalli/nvim-colorizer.lua', lazy = true, cmd = 'ColorizerToggle' },
    { 'jose-elias-alvarez/null-ls.nvim', dependencies = { "nvim-lua/plenary.nvim" } },
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },
    { 'fatih/vim-go',           lazy = true,   ft = "go" },
    {  'TobinPalmer/pastify.nvim', cmd = { 'Pastify' }, opts = { ft = { vimwiki = '![]($IMG$)'}} },
    { "folke/noice.nvim", event = "VeryLazy",
    opts = {
        {
            lsp = {
                override = { ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true
                },
            },
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = false, -- long messages will be sent to a split
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
        }
    },
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}
},

    { 'kdheepak/lazygit.nvim', lazy = true,
        cmd = 'LazyGitCurrentFile', dependencies = { "nvim-lua/plenary.nvim" }
    },

    { 'kevinhwang91/rnvimr',
        lazy = true, cmd = "RnvimrToggle",
        init = function()
            vim.g.rnvimr_enable_ex = 1
            vim.g.rnvimr_enable_bw = 1
            vim.g.rnvimr_enable_picker = 1
            vim.g.rnvimr_edit_cmd = 'drop'
            vim.g.rnvimr_vanilla = 0
        end
    },

    { 'kyazdani42/nvim-web-devicons',
        opts = {
            override = { zsh = { icon = '📺', color = '#428850', cterm_color = '65', name = 'Zsh' } },
            default = true
        }
    },

    { 'toppair/peek.nvim', lazy = true,
    ft = { 'md', "markdown", "vimwiki" },
    event = { 'BufRead', 'BufNewFile' },
    build = 'deno task --quiet build:fast',
    config = function()
        require("peek").setup{
            auto_load = true,
            close_on_bdelete = true,
            syntax = true,
            theme = 'dark',
            update_on_change = true,
            throttle_at = 200000,
            throttle_time = 'auto',
            filetype = { 'markdown', 'md', 'vimwiki' },

        }
        vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
        vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 600
            require("which-key").setup{
                spelling = false,
                presets = { windows = false },
                key_labels = { ["<space>"] = "Space"},
                window = { border = "single", -- none, single, double, shadow
                    margin = { 1, 3, 1, 3 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
                    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
                },
                layout = { height = { min = 4, max = 20 }, align = "center"},
                triggers_blacklist = { n = { "i", "j", "k" }, },
            }
        end,
    },
    { 'tomiis4/Hypersonic.nvim',
        event = "CmdlineEnter", cmd = "Hypersonic",
        config = function() require('hypersonic').setup() end
    },
    { 'lukas-reineke/indent-blankline.nvim',
        config = function()
            vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
            vim.opt.listchars:append 'space:⋅'
        end,
        opts = {
            indent_blankline_char = '/',
            space_char_blankline = ' ',
            show_current_context = true,
            show_current_context_start = true,
            char_highlight_list = { 'IndentBlanklineIndent1', 'IndentBlanklineIndent2', 'IndentBlanklineIndent3',
                'IndentBlanklineIndent4', 'IndentBlanklineIndent5', 'IndentBlanklineIndent6' }
        }
    },
    {'ggandor/leap.nvim', dependencies = {'nvim-treesitter/playground'},
    config = function()
        require("leap").add_default_mappings()
    end
    },

    { 'folke/trouble.nvim',
        opts = {
            auto_close = true, height = 5, use_diagnostic_signs = true,
            signs = { error = '😡', warning = '⚡', hint = '💡', information = '🧠' }
        }
    },

    { 'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/playground', 'lewis6991/spellsitter.nvim',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        opts = {
            ensure_installed = { 'python', 'regex','markdown','markdown_inline','ruby', 'yaml', 'go', 'bash', 'dockerfile', 'hcl', 'json' },
            highlight = { enable = true },
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        event = 'ColorScheme',
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
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
                lualine_y = {

                },
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
    { 'williamboman/mason-lspconfig.nvim',
        dependencies = { { 'williamboman/mason.nvim', build = ":MasonUpdate", config = true } },
    },
    { 'L3MON4D3/LuaSnip',
        version = "v1.*", run = "make install_jsregexp", lazy = true,
        dependencies = { 'kmf/vim-chef-snippets', "rafamadriz/friendly-snippets" },

        config = function()
            require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    { 'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip' },
    },

})

-- lsp stuff
local wk = require("which-key")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    wk.register({
        ["gD"] ={vim.lsp.buf.declaration, "Go to Declaration", bufopts},
        ["gd"] ={vim.lsp.buf.definition, "Go to Definition", bufopts},
        ["K"] ={vim.lsp.buf.hover, "Lsp Docs", bufopts},
        ["gi"] ={vim.lsp.buf.implementation, "Go to Implementation", bufopts},
        ["<C-k>"] ={vim.lsp.buf.signature_help, "Signature Help", bufopts},
        ["<space>D"] ={vim.lsp.buf.type_definition, "Go to Type", bufopts},
        ["<leader>ca"] ={vim.lsp.buf.code_action, "Code Action", bufopts},
        ["<leader>rn"] ={vim.lsp.buf.rename, "Refactor Name", bufopts},
        -- ["<space>p"] ={vim.lsp.buf.format{async = true}, "Format", bufopts},
        ["<leader>lr"] ={vim.lsp.buf.format, "Format", bufopts},
    })
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({ on_attach = lsp_attach, capabilities = lsp_capabilities })
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
            local menu_icon = { luasnip = '🔪', nvim_lsp = '🤓', buffer = '🧾', path = '🥾' }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
}

-- Diagnostic config
local signs = { Error = "😡", Warn = "⚡", Hint = "💡", Info = "🧠" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({ virtual_text = false, severity_sort = true, float = { source = "if_many"}})

--null-ls
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.beautysh, null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.yamlfmt, null_ls.builtins.formatting.jq,
    }
})


lspconfig.lua_ls.setup {
  settings = {
    Lua = { runtime = { version = 'LuaJIT'},
      diagnostics = {
        globals = {'vim', 'require'}},
        workspace = {library = vim.api.nvim_get_runtime_file("", true)},
        telemetry = {enable = false}
    },
  },
}

vim.notify = require("notify")

require('rose-pine').setup({
    variant = 'moon',
    dark_variant = 'moon',
    bold_vert_split = true,
    dim_nc_background = false,
    groups = {
        background = 'base',
        background_nc = '_experimental_nc',
        panel = 'surface',
        panel_nc = 'base',
        border = 'highlight_med',
        comment = 'gold',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
        }
    },
    highlight_groups = {
		TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "base" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	},

})
vim.cmd('colorscheme rose-pine')
