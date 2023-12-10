require("lazy").setup({
    'junegunn/fzf',
    'folke/lsp-colors.nvim',
    'tpope/vim-eunuch',
    'tpope/vim-endwise',
    'jessarcher/vim-heritage',
    'terryma/vim-smooth-scroll',
    'neovim/nvim-lspconfig',
    -- 'wellle/targets.vim', -- mini.ai
    'tpope/vim-repeat',
    'machakann/vim-highlightedyank',
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    "axieax/typo.nvim",
    'lewis6991/gitsigns.nvim',
    'lervag/wiki.vim',
{ 'echasnovski/mini.nvim', version = false },
    { 'voldikss/vim-floaterm',       lazy = true, cmd = 'FloatermToggle' },
    { 'norcalli/nvim-colorizer.lua', lazy = true, cmd = 'ColorizerToggle' },
    {
        'nvimtools/none-ls.nvim',
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.beautysh, null_ls.builtins.formatting.terraform_fmt,
                    null_ls.builtins.formatting.yamlfmt, null_ls.builtins.formatting.jq, null_ls.builtins.formatting
                    .prettierd, null_ls.builtins.formatting.markdownlint
                }
            })
        end
    },
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },
    { 'fatih/vim-go',           lazy = true,   ft = "go" },
    {
        "coffebar/neovim-project",
        lazy = false,
        priority = 100,
        opts = {
            projects = {
                "~/chef/nulsc/*",
                "~/chef/nulsc/cookbooks/*",
                "~/chef/nulsc/policies/*",
                "~/chef/nulsc/profiles/*",
                "~/chef/nulsc/cookbooks/linux_cookbooks/*",
                "~/git/icon/*",
                "~/.config/*",
            },
        },
        init = function()
            -- enable saving the state of plugins in the session
            vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
        end,
        dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" }, { "Shatur/neovim-session-manager" } },
    },
    {
        'TobinPalmer/pastify.nvim',
        cmd = { 'Pastify' },
        opts = { ft = { vimwiki = '![]($IMG$)' } }
    },
    -- Lua
    {
        '0x00-ketsu/markdown-preview.nvim',
        ft = { 'md', 'markdown', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'rmd', 'wiki' },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
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
        },
        dependencies = { "MunifTanjim/nui.nvim" }
    },

    {
        'kdheepak/lazygit.nvim',
        lazy = true,
        cmd = 'LazyGitCurrentFile',
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
        "kelly-lin/ranger.nvim",
        config = function()
            require("ranger-nvim").setup({ replace_netrw = true,
            ui = { border = "rounded", height = .45, width = .65, x = 0.5, y = 0.5 }})
        end,
    },

    {
        'kyazdani42/nvim-web-devicons',
        opts = {
            override = { zsh = { icon = '📺', color = '#428850', cterm_color = '65', name = 'Zsh' } },
            default = true
        }
    },

    {
        "folke/which-key.nvim",
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
    },
    {
        'ggandor/leap.nvim',
        dependencies = { 'nvim-treesitter/playground' },
        config = function()
            require("leap").add_default_mappings()
        end
    },

    {
        'folke/trouble.nvim',
        opts = {
            auto_close = true,
            height = 5,
            use_diagnostic_signs = true,
            signs = { error = '😡', warning = '⚡', hint = '💡', information = '🧠' }
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/playground', 'lewis6991/spellsitter.nvim',
            'nvim-treesitter/nvim-treesitter-textobjects', -- mini.ai and move
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        opts = {
            ensure_installed = { 'python', 'regex', 'markdown', 'markdown_inline', 'ruby', 'yaml', 'go', 'bash',
                'dockerfile', 'hcl', 'json' },
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
                -- theme = 'papercolor_light',
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
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { { 'williamboman/mason.nvim', build = ":MasonUpdate", config = true } },
    },
    {
        'L3MON4D3/LuaSnip',
        version = "v1.*",
        run = "make install_jsregexp",
        lazy = true,
        dependencies = { 'kmf/vim-chef-snippets', "rafamadriz/friendly-snippets" },

        config = function()
            require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip' },
    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = false,
                    -- dim_inactive = true,
                    styles = {       -- Style to be applied to different syntax groups
                        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
                        conditionals = "italic",
                        constants = "italic",
                        functions = "underdotted",
                        keywords = "bold",
                        numbers = "NONE",
                        operators = "bold",
                        strings = "NONE",
                        types = "italic",
                        variables = "bold",
                    },
                    inverse = { visual = false },
                    modules = { -- List of various plugins and additional options
                        telescope = false,
                        whichkey = false,
                        -- ...
                    },
                },
                palettes = {
                    dayfox = {
                        -- bg1 = "#ffc2cd", -- Black background
                    },
                },
            })
        end
    },

})

-- lsp stuff
local wk = require("which-key")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    wk.register({
        ["gD"] = { vim.lsp.buf.declaration, "Go to Declaration", bufopts },
        ["gd"] = { vim.lsp.buf.definition, "Go to Definition", bufopts },
        -- something is overidding K binding and sending it to a split
        ["K"] = { vim.lsp.buf.hover, "Lsp Docs", bufopts },
        ["gi"] = { vim.lsp.buf.implementation, "Go to Implementation", bufopts },
        ["<C-k>"] = { vim.lsp.buf.signature_help, "Signature Help", bufopts },
        ["<space>D"] = { vim.lsp.buf.type_definition, "Go to Type", bufopts },
        ["<leader>ca"] = { vim.lsp.buf.code_action, "Code Action", bufopts },
        ["<leader>rn"] = { vim.lsp.buf.rename, "Refactor Name", bufopts },
        ["<leader>lr"] = { vim.lsp.buf.format, "Format", bufopts },
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

vim.diagnostic.config({ virtual_text = false, severity_sort = true, float = { source = "if_many" } })

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = {
                globals = { 'vim', 'require' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false }
        },
    },
}
require('mini.cursorword').setup()
require('mini.ai').setup()
require('mini.files').setup({windows = { preview = true, },})
require('mini.bufremove').setup()
require('mini.comment').setup({ignore_blank_line = true})
require('mini.indentscope').setup({symbol = '╎'})
require('mini.operators').setup()
require('mini.pairs').setup()
require('mini.surround').setup( {
  mappings = {
    add = 'ta', -- Add surrounding in Normal and Visual modes
    delete = 'td', -- Delete surrounding
    find = 'tf', -- Find surrounding (to the right)
    find_left = 'tF', -- Find surrounding (to the left)
    highlight = 'th', -- Highlight surrounding
    replace = 'tr', -- Replace surrounding
    update_n_lines = 'tn', -- Update `n_lines`
  }}
)
require('mini.move').setup( {
  mappings = {
    left = '<M-h>',
    right = '<M-l>',
    down = '<M-j>',
    up = '<M-k>',
line_left = '', line_right = '', line_down = '', line_up = '',
  } }
)
vim.cmd.colorscheme "terafox"
