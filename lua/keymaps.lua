vim.g.mapleader = ' '
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
telescope.setup { defaults = { mappings = {
    i = { ["<c-t>"] = trouble.open_with_trouble },
    n = { ["<c-t>"] = trouble.open_with_trouble },
},},
}

local vim = vim
local wk = require("which-key")

wk.register({
    ["<leader>t"] = { name = "Telescope",
    f = { "<cmd>Telescope fd<cr>", "Find File" },
    z = { "<cmd>Telescope spell_suggest<cr>", "Fix Spelling" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep" },
    q = { "<cmd>Telescope colorscheme<cr>", "Color Schemes" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    r = { "<cmd>Telescope lsp_references<cr>", "Lsp References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Lsp Symbols" },
    t = { "<cmd>Telescope lsp_type_definitions<cr>", "Lsp Type Defs" },
},
-- Individuals
["<leader>g"] = { "<cmd>Telescope live_grep<cr>", "Grep" },
["<C-e>"] = { "<cmd>Telescope fd<cr>", "Find Files" },
["<C-d>"] = { "<cmd>Telescope live_grep<cr>", "Diagnostics" },
["g"] = {
    l = { vim.diagnostic.open_float, "Float Diagnostics" },
    t = { "<cmd>Telescope lsp_type_definitions<cr>", "Lsp Type Defs" },
    j = { "<cmd>bp<cr>", "Previous Buffer" },
    k = { "<cmd>bn<cr>", "Next Buffer" },
},
["d"] = { "<cmd>TroubleToggle<cr>", "Trouble" },
["<leader>d"] = { name = "Trouble",
d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
r = { "<cmd>TroubleToggle lsp_references<cr>", "Lsp References" },
f = { "<cmd>TroubleToggle quickfix<cr>", "Quick Fix" },
  },
  -- Splits find better binds
  ["<M-J>"] = { "<cmd>resize -2<cr>", "Resize Splits"},
  ["<M-K>"] = { "<cmd>resize +2<cr>"},
  ["<M-H>"] = { "<cmd>vertical resize +2<cr>"},
  ["<M-L>"] = {"<cmd>vertical resize +2<cr>" },
  -- ["<M-j>"] = { "<C-w>j"},
  -- ["<M-k>"] = { "<C-w>k"},
  ["<M-h>"] = { "<C-w>h"},
  ["<M-l>"] = { "<C-w>l", "Navigate Split" },
  ["<leader>"] = {name = "Vim Wiki",
  ww = { "<cmd>VimwikiIndex<cr>", "Vim Wiki" },
  lc = { "<cmd>set cursorbind<cr>", "Vim Wiki" },
  },
  ["<leader>l"] = {name = "LazyGit",
  g = { "<cmd>cd %:h<cr>:LazyGitCurrentFile<cr>", "LazyGit" },
  l = { "<cmd>Lazy<cr>", "Lazy" },
  m = { "<cmd>Mason<cr>", "Mason" },
  },
  ["<leader>y"] = {name = "Surround",
  y = { 'ysiw"', "Surround in Quotes" },
  p = { 'ysiw(', "Surround in Parens" },
  },
  ["<leader>v"] = {name = "File Hopping",
  k = { "<cmd>e ~/.config/nvim/keymaps.lua<cr>", "Edit Vim Keybinds" },
  p = { "<cmd>e ~/.config/nvim/plugins.lua<cr>", "Edit Vim Plugins" },
  e = { "<cmd>e ~/.config/nvim/keymaps.lua<cr>", "Edit Vim Plugins" },
  z = { "<cmd>e ~/.zshrc<cr>", "Edit Zshrc" },
  a = { "<cmd>e ~/.config/nvim/autocmd.lua<cr>", "Edit Autocmds" },
  r = { "<cmd>luafile %<cr>", "Reload Vim Confs" },
  },
  ["<leader>cd"] = { "<cmd>cd %:h<cr>", "Cd" },
  ["<leader>s"] = { "<cmd>w<cr>", "Save Buffer" },
  ["<leader>S"] = { "<cmd>wa<cr>", "Save All Buffers" },
  ["<leader>kk"] = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
  ["<leader>H"] = { "<cmd>nohlsearch<cr>", "Clear Highlights" },
  ["<leader>C"] = { "<cmd>set cuc!<cr>", "Cursor Column" },
  ["<leader>R"] = { "<cmd>set relativenumber!<cr>", "Toggle Relative Numbers" },
  ["gf"] = { "<cmd>edit <cfile><cr>", "Edit File Under Cursor" },
  ["<cr>"] = { "ciw", "Change Word Under Cursor" },
  ["<leader>m"] = { "<cmd>set ft=markdown<CR>:PeekOpen <CR>", "Open in Peek" },
  ["<leader>x"] = { "<cmd>!xdg-open %<cr><cr>", "Open" },
  ["<leader>q"] = { "<cmd>Sayonara<cr>", "Close Buffer" },
  ["<M-k>"] = { "<cmd>call smooth_scroll#up(10, 5, 2)<cr>", "Smooth Scroll"},
  ["<M-j>"] = { "<cmd>call smooth_scroll#down(10, 5, 2)cr>", "Smooth Scroll"},
  ["Y"] = { "y$", "Papa Yank"},
  ["<leader>n"] = { "<cmd>cd %:h<bar>RnvimrToggle<cr>", "Ranger" },
  ["<leader>n"] = { "<C-\\><C-n>:RnvimrToggle<CR>", "Ranger", mode = "t" },
  ["<leader>gr"] = { "<cmd>w<cr><cmd>GoRun<cr>", "Go Run" },
  ["ii"] = { "<esc>", "which_key_ignore", mode = "i"},
  ["<F1>"]= { "<cmd>FloatermToggle<cr>", "Terminal" },
  ["<F1>"]= { "<C-\\><C-n>::FloatermToggle<CR>", "Terminal", mode = "t" },
  ["<"]= { "<gv", "Indent", mode = "v" },
  [">"]= { ">gv", "Dedent", mode = "v" },
  ["y"]= { "myy`y", mode = "v" },
  ["Y"]= { "myY`y", mode = "v" },
  ["<leader>p"]= { '"_dP', mode = "v" },
  ["<leader>r"]= { "<cmd>Hypersonic<cr>", mode = "v" },

  })

  -- |g:AutoPairsMapBS|                                                          int
  -- Default: 1
  -- Map <BS> to delete brackets and quotes in pair, executes:
  --     inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>
