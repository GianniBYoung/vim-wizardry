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
    'jessarcher/vim-sayonara',
    'jessarcher/vim-heritage',
    'terryma/vim-smooth-scroll',
    'wellle/targets.vim',
    'machakann/vim-highlightedyank',
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'lewis6991/gitsigns.nvim',

    { 'voldikss/vim-floaterm',       lazy = true, cmd = 'FloatermToggle' },
    { 'norcalli/nvim-colorizer.lua', lazy = true, cmd = 'ColorizerToggle' },
    {
        'kdheepak/lazygit.nvim',
        lazy = true,
        cmd = 'LazyGitCurrentFile',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { "nvim-lua/plenary.nvim",

        },
    },
    { 'fatih/vim-go',           lazy = true,   ft = "go" },
    {
        "luukvbaal/nnn.nvim",
        opts = { picker = { style = { border = "rounded" }, }, auto_close = true, }
    },
    {
        'unblevable/quick-scope',
        lazy = false,
        init = function()
            vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
            vim.g.qs_max_chars = 150
            vim.g.qs_delay = 1
        end
    },

    { "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },
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
        ft = { 'md', "markdown" },
        event = { 'BufRead', 'BufNewFile' },
        build = 'deno task --quiet build:fast',
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
        config = function()
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end,
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
        'tomiis4/Hypersonic.nvim',
        event = "CmdlineEnter", cmd = "Hypersonic",
        config = function()
            require('hypersonic').setup()
        end
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
            height = 5,
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
    },
    {
        'L3MON4D3/LuaSnip',
        version = "v1.*",
        run = "make install_jsregexp",
        dependencies = { 'kmf/vim-chef-snippets', "rafamadriz/friendly-snippets" },

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

    -- if client.server_capabilities.document_highlight then
    --     vim.cmd [[ hi! LspReferenceRead cterm=bold ctermbg=235 guibg=LightPink
    --   hi! LspReferenceText cterm=bold ctermbg=235 guibg=LightPink
    --   hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=LightPink ]]

    --     vim.api.nvim_create_augroup('lsp_document_highlight', {})
    --     vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, { group = 'lsp_document_highlight', buffer = 0, callback = vim.lsp.buf.document_highlight, })
    --     vim.api.nvim_create_autocmd('CursorMoved', { group = 'lsp_document_highlight', buffer = 0, callback = vim.lsp.buf.clear_references, })
    -- end
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

-- show diagnostics in message window at the bottom of the screen
function PrintDiagnostics(opts, bufnr, line_nr, _)
    bufnr = bufnr or 0
    line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
    opts = opts or { ['lnum'] = line_nr }

    local line_diagnostics = vim.diagnostic.get(bufnr, opts)
    if vim.tbl_isempty(line_diagnostics) then return end

    local diagnostic_message = ""
    for i, diagnostic in ipairs(line_diagnostics) do
        diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
        if i ~= #line_diagnostics then
            diagnostic_message = diagnostic_message .. "\n"
        end
    end
    vim.api.nvim_echo({ { diagnostic_message, "Normal" } }, false, {})
end


vim.api.nvim_create_autocmd("CursorHold", {  callback = function(  ) PrintDiagnostics()end })

vim.diagnostic.config({ virtual_text = true, severity_sort = true, float = { source = "if_many", } })

--null-ls
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.formatting.jq,
    }
})


lspconfig.lua_ls.setup {
  settings = {
    Lua = { runtime = { version = 'LuaJIT', },
      diagnostics = {
        globals = {
          'vim',
          'require'
        },
      },
      workspace = { library = vim.api.nvim_get_runtime_file("", true), },
      telemetry = { enable = false, },
    },
  },
}
