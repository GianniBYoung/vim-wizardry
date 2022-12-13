require('packer').startup(function(use)
  -- Ultra Important plugins
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  require('impatient')
  use 'kyazdani42/nvim-web-devicons'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'

  -- Regular Plugins
  use "lukas-reineke/indent-blankline.nvim"
  use 'p00f/nvim-ts-rainbow'
  use 'Konfekt/vim-wsl-copy-paste'
  use 'folke/lsp-colors.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-endwise'
  use 'jessarcher/vim-context-commentstring'
  -- use 'junegunn/vim-peekaboo'
  use 'voldikss/vim-floaterm'
  use 'junegunn/fzf'
  use 'jessarcher/vim-sayonara'
  use 'jessarcher/vim-heritage'
  use 'unblevable/quick-scope'
  use 'terryma/vim-smooth-scroll'
  use 'wellle/targets.vim'
  use 'folke/which-key.nvim'
  -- use 'vimwiki/vimwiki'
  use 'norcalli/nvim-colorizer.lua'
  use 'jiangmiao/auto-pairs'
  use 'machakann/vim-highlightedyank'
  use 'justinmk/vim-sneak'
  use 'kdheepak/lazygit.nvim'
  use 'kevinhwang91/rnvimr'
  use 'ellisonleao/glow.nvim'
  use {'fatih/vim-go', ft = {"go"}, }
  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
  use "nvim-telescope/telescope.nvim"
  use "nvim-lua/plenary.nvim"

  --theme
  use 'folke/tokyonight.nvim'

  use { 'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  }

  use { 'bennypowers/nvim-regexplainer',
      config = function() require'regexplainer'.setup() end,
      requires = {
          'nvim-treesitter/nvim-treesitter',
          'MunifTanjim/nui.nvim',
      } }
  require'regexplainer'.setup {
  mode = 'narrative',
  -- automatically show the explainer when the cursor enters a regexp
  auto = true,
  filetypes = { 'rb', 'go', 'py', },
  display = 'popup',
  mappings = { toggle = 'gR',},
  narrative = {
  separator = function(component)
    local sep = '\n';
    if component.depth > 0 then
      for _ = 1, component.depth do
        sep = sep .. '> '
      end
    end
    return sep
  end
  },
  }

  use { 'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {enable = false}
    end,
    requires = {'hoob3rt/lualine.nvim'}
  }

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'lewis6991/spellsitter.nvim',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  }

  use { 'hrsh7th/nvim-cmp',
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
  use { 'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- lualine
  use { 'nvim-lualine/lualine.nvim', }
  use { 'alvarosevilla95/luatab.nvim'}

  require('luatab').setup {}

  -- LSP
  use { 'VonHeikemen/lsp-zero.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    }
  }

  use{'vimwiki/vimwiki',
    config = function()
        vim.g.vimwiki_list = {
            { path = '/home/gianni/vimwiki', syntax = 'markdown', ext = '.md', }
        }
    end}
end)

-- Plugin Configuration
--

-- Markdown Preview
require('peek').setup({
  auto_load = true,
  close_on_bdelete = true,
  syntax = true,
  theme = 'dark',
  update_on_change = true,
  -- relevant if update_on_change is true
  throttle_at = 200000,     -- start throttling when file exceeds this
                            -- amount of bytes in size
  throttle_time = 'auto',   -- minimum amount of time in milliseconds
                            -- that has to pass before starting new render
})
vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

-- Tree Sitter
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "ruby", "yaml", "go", "bash", "dockerfile", "hcl", "json"  },

  highlight = { enable = true, },
    rainbow = {
    enable = true, extended_mode = true, max_file_lines = nil, }
}

-- Ranger
vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_bw = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_edit_cmd = 'drop'

-- quickscope
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.g.qs_max_chars = 150

-- sneak
vim.g['sneak#label'] = 1
vim.g['sneak#use_ic_scs'] = 1
-- devicons
require 'nvim-web-devicons'.setup {
  override = {
    zsh = { icon = "📺", color = "#428850", cterm_color = "65", name = "Zsh" }
  };
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
