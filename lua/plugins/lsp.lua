return {
    { 'fatih/vim-go',         lazy = true, ft = "go" },
    { 'neovim/nvim-lspconfig' },
    { "folke/neodev.nvim", opts = {} },
    {
        'nvimtools/none-ls.nvim',
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                -- currently missing python
                sources = {
                    null_ls.builtins.formatting.shfmt, null_ls.builtins.formatting.terraform_fmt,
                    null_ls.builtins.formatting.yamlfmt, null_ls.builtins.formatting
                    .prettierd, null_ls.builtins.formatting.markdownlint
                }
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects', -- mini.ai and move, do i need?
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        opts = {
            ensure_installed = { 'python', 'regex', 'markdown', 'markdown_inline', 'ruby', 'yaml', 'go', 'bash',
                'dockerfile', 'hcl', 'json' },
            highlight = { enable = true },
        }
    },

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { { 'williamboman/mason.nvim', build = ":MasonUpdate", config = true } },
    },
    {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
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
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp',     event = "InsertEnter", },
            { 'hrsh7th/cmp-buffer',       event = "InsertEnter", },
            { 'hrsh7th/cmp-cmdline',      event = "InsertEnter", },
            { 'hrsh7th/cmp-path',         event = "InsertEnter", },
            { 'hrsh7th/cmp-buffer',       event = "InsertEnter", },
            { 'hrsh7th/cmp-emoji',        event = "InsertEnter", },
            { 'saadparwaiz1/cmp_luasnip', event = "InsertEnter", },
            { 'hrsh7th/cmp-nvim-lua',     event = "InsertEnter", }
        },
    },
}
