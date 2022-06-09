---
-- Plugins
---


require('packer').startup(function(use)
  -- packer can update itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'joshdick/onedark.vim'

  use{
    'dracula/vim',
    as = 'dracula',
    config = function()
      require('user.plugins.dracula')
    end
    }

    use{
      'sickill/vim-pasta',
      config = function()
        require('user.plugins.pasta')
      end
      }

    use {
      'jessarcher/vim-sayonara',
       config = function()
        require('user.plugins.sayonara')
      end
  }

    use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'lewis6991/spellsitter.nvim',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('user.plugins.treesitter')
      require('spellsitter').setup()
    end
  }
   use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'jessarcher/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'onsails/lspkind-nvim', --
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      require('user.plugins.cmp')
    end
  }

-- gitsigns
  use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
  end
}

-- luealine
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

  -- Plugins
  use 'folke/lsp-colors.nvim'
  use 'neovim/nvim-lspconfig'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  use 'jessarcher/vim-context-commentstring'
  use 'junegunn/vim-peekaboo'
  use 'voldikss/vim-floaterm'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'stsewd/fzf-checkout.vim'
  use 'jessarcher/vim-heritage'
  -- use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'sheerun/vim-polyglot'
  use 'unblevable/quick-scope'
  use 'terryma/vim-smooth-scroll'
  use 'wellle/targets.vim'
  use 'folke/which-key.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  -- use 'onsails/lspkind.nvim'
  use 'vimwiki/vimwiki'
  use 'norcalli/nvim-colorizer.lua'
  use 'frazrepo/vim-rainbow'
  use 'jiangmiao/auto-pairs'
  use 'machakann/vim-highlightedyank'
  use 'justinmk/vim-sneak'
  -- use 'iamcco/markdown-preview.nvim'--
  use 'fatih/vim-go'
  use 'kevinhwang91/rnvimr'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/nvim-lsp-installer'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

end)

-- Setup colorscheme
vim.opt.termguicolors = true
pcall(vim.cmd, 'colorscheme onedark')

-- LSP setup

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '⦿'
  }
})

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()





-- Plugin Configuration
--
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end


-- Dracula
vim.cmd([[
    augroup DraculaOverrides
        autocmd!
        autocmd ColorScheme dracula highlight! link Pmenu DraculaBg
        autocmd ColorScheme dracula highlight link NormalFloat DraculaBgLight
        autocmd ColorScheme dracula highlight FloatBorder guifg=#343746 guibg=#343746
        autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
        autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
        autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
    augroup end
    colorscheme dracula
]])
-- Floaterm

map('n','<F4>',':FloatermNew<CR>')
map('t','<F4>','<C-\\><C-n>::FloatermNew<CR>')

map('t','<F2>','<C-\\><C-n>::FloatermNext<CR>')

map('n','<F1>',':FloatermToggle<CR>')
map('t','<F1>','<C-\\><C-n>::FloatermToggle<CR>')


map('t','<F9>','<C-\\><C-n>::FloatermKill<CR>')

-- FZF

map('n','<Leader>f',':Files<CR>')
map('n','<Leader>F',':AllFiles<CR>')
map('n','<Leader>b',':Buffers<CR>')
map('n','<Leader>h',':History<CR>')
map('n','<Leader>r',':Rg<CR>')
map('n','<Leader>R',':Rg<space>')
map('n','<Leader>gb',':GBranches<CR>')

-- Markdown Preview
-- map('n','<M-m>',':MarkdownPreview<CR>')

-- Colorizer
map('n','<Leader>kk',':ColorizerToggle<CR>')


-- Tree Sitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "ruby", "yaml", "go"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    enable = true,

  },
}

-- Ranger

vim.g.rnvimr_enable_ex=1
vim.g.rnvimr_enable_bw=1

-- Polyglot

vim.g.vim_markdown_new_list_item_indent = 0

-- quickscope

vim.g.qs_highlight_on_keys= {'f','F','t','T'}
vim.g.qs_max_chars=150

-- vim-rainbow
vim.g.rainbow_active=1

-- sneak
vim.g['sneak#label'] = 1
vim.g['sneak#use_ic_scs'] = 1

-- LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')
local servers = { 'sumneko_lua', 'solargraph', 'pyright', 'yamlls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
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
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- devicons
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
