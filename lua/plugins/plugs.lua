return {
    -- Do i need?
    {'axieax/typo.nvim', event = "VeryLazy"},
    {'jessarcher/vim-heritage', event = "VeryLazy"},
    {'tpope/vim-eunuch', event = "VeryLazy"},
    {'tpope/vim-endwise', event = "VeryLazy"},
    {'tpope/vim-repeat', event = "VeryLazy"},
    {'TobinPalmer/pastify.nvim', cmd = { 'Pastify' }},
    --- misc
    {'voldikss/vim-floaterm',lazy = true, cmd = 'FloatermToggle' },
    {'machakann/vim-highlightedyank'},
    {'lervag/wiki.vim', lazy = true, cmd = 'WikiIndex'},
    {'0x00-ketsu/markdown-preview.nvim', ft = { 'md', 'markdown', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'rmd', 'wiki' } },
    {'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '│' }, change = { text = '│' }, delete  = { text = '_' },
            topdelete = { text = '‾' }, changedelete = { text = '~' }, untracked = { text = '┆' },
        }
    }
},
{ 'kdheepak/lazygit.nvim',
dependencies = { "nvim-lua/plenary.nvim" },
lazy = true, cmd = 'LazyGitCurrentFile'
    },



}

