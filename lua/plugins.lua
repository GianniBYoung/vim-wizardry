---
-- Plugins
---
require('packer').startup(function(use)
  use 'lewis6991/impatient.nvim'
  require('impatient')
  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'
  -- Lua
  -- vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
  vim.cmd [[colorscheme tokyonight]]

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    ft = {"md", "MD"},
  })

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  }

  -- use {
  --   'kdheepak/tabline.nvim',
  --   config = function()
  --     require 'tabline'.setup {
  --       enable = true,
  --       options = {
  --         max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
  --         show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
  --         show_devicons = true, -- this shows devicons in buffer section
  --         show_bufnr = false, -- this appends [bufnr] to buffer section,
  --         show_filename_only = true, -- shows base filename only instead of relative path in filename
  --         modified_icon = "+ ", -- change the default modified icon
  --         modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
  --         show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
  --       }
  --     }
  --     vim.cmd [[
  --     set guioptions-=e " Use showtabline in gui vim
  --     set sessionoptions+=tabpages,globals " store tabpages and globals in session
  --   ]]
  --   end,
  --   requires = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
  -- }
  -- Replaced the block above with the block below for simplicity
  use {
    'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {enable = false}
    end,
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
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
    }
  }

  -- gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'alvarosevilla95/luatab.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  require('luatab').setup {}

  -- Plugins
  use "lukas-reineke/indent-blankline.nvim"
  -- use 'sickill/vim-pasta'
  use 'p00f/nvim-ts-rainbow'
  use 'Konfekt/vim-wsl-copy-paste'
  use 'folke/lsp-colors.nvim'
  use 'neovim/nvim-lspconfig'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  -- use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  use 'jessarcher/vim-context-commentstring'
  -- use 'junegunn/vim-peekaboo'
  use 'voldikss/vim-floaterm'
  use 'junegunn/fzf'
  use 'jessarcher/vim-sayonara'
  -- use 'stsewd/fzf-checkout.vim'
  use 'jessarcher/vim-heritage'
  use 'kyazdani42/nvim-web-devicons'
  -- use 'sheerun/vim-polyglot'
  use 'unblevable/quick-scope'
  use 'terryma/vim-smooth-scroll'
  use 'wellle/targets.vim'
  use 'folke/which-key.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'vimwiki/vimwiki'
  use 'norcalli/nvim-colorizer.lua'
  -- use 'frazrepo/vim-rainbow'
  use 'jiangmiao/auto-pairs'
  use 'machakann/vim-highlightedyank'
  use 'justinmk/vim-sneak'
  use 'kdheepak/lazygit.nvim'
  use 'kevinhwang91/rnvimr'
  use 'ellisonleao/glow.nvim'
  use {'fatih/vim-go',
    ft = {"go"},
  }
  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/nvim-lsp-installer' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

end)

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

map('n', '<F4>', ':FloatermNew<CR>')
map('t', '<F4>', '<C-\\><C-n>::FloatermNew<CR>')

map('t', '<F2>', '<C-\\><C-n>::FloatermNext<CR>')

map('n', '<F1>', ':FloatermToggle<CR>')
map('t', '<F1>', '<C-\\><C-n>::FloatermToggle<CR>')


map('t', '<F9>', '<C-\\><C-n>::FloatermKill<CR>')

-- FZF

map('n', '<Leader>f', ':Files<CR>')
-- map('n', '<Leader>F', ':AllFiles<CR>')
map('n', '<Leader>r', ':Rg<CR>')
map('n', '<Leader>R', ':Rg<space>')


-- Markdown Preview
map('n', '<M-m>', ':MarkdownPreview<CR>')

require('peek').setup({
  auto_load = true,         -- whether to automatically load preview when
                            -- entering another markdown buffer
  close_on_bdelete = true,  -- close preview window on buffer delete

  syntax = true,            -- enable syntax highlighting, affects performance

  theme = 'dark',           -- 'dark' or 'light'

  update_on_change = true,

  -- relevant if update_on_change is true
  throttle_at = 200000,     -- start throttling when file exceeds this
                            -- amount of bytes in size
  throttle_time = 'auto',   -- minimum amount of time in milliseconds
                            -- that has to pass before starting new render
})
vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

-- Colorizer
map('n', '<Leader>kk', ':ColorizerToggle<CR>')

-- Tree Sitter
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "ruby", "yaml", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    enable = true,

  },
    rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }

}

-- Ranger

vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_bw = 1
vim.g.rnvimr_enable_picker = 1

-- Polyglot

-- vim.g.vim_markdown_new_list_item_indent = 0

-- quickscope

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.g.qs_max_chars = 150

-- vim-rainbow
-- vim.g.rainbow_active = 1

-- sneak
vim.g['sneak#label'] = 1
vim.g['sneak#use_ic_scs'] = 1

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
    { name = 'luasnip', keyword_length = 2 },
    { name = 'nvim_lsp', keyword_length = 2 },
    { name = "treesitter", keyword_length = 2 },
    { name = "nvim_lua", keyword_length = 2 },
    { name = "path" },
    { name = "buffer", keyword_length = 3 },
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        luasnip = '⋗',
        nvim_lsp = 'λ',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
}

-- devicons
require 'nvim-web-devicons'.setup {
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
    theme = 'tokyonight',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { {'filename', path=1} },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
  -- tabline = {},
  extensions = {}
}

-- lsp binds
vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references
    bufmap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})

-- indent lines
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    indent_blankline_char = "/",
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
