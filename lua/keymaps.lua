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
    z = { "<cmd>Telescope spell_suggest<cr>", "Fix Spelling" },
    p = { "<cmd>Telescope builtin<cr>", "All Telescope Builtins" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    R = { "<cmd>Telescope lsp_references<cr>", "Lsp References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Lsp Symbols" },
    t = { "<cmd>Telescope lsp_type_definitions<cr>", "Lsp Type Defs" },
},
-- Individuals
["<leader>g"] = { "<cmd>Telescope live_grep prompt_prefix=🔦<cr>", "Grep" },
["<C-e>"] = { "<cmd>Telescope fd prompt_prefix=🔍<cr>", "Find Files" },
["<C-b>"] = { "<cmd>Telescope buffers prompt_prefix=📜<cr>", "Find Open Buffers" },
["<leader>r"] = { "<cmd>Telescope registers prompt_prefix=📠<cr>", "Paste From Register" },
-- ["<C-j>"] = { "<cmd>bp<cr>", "Previous Buffer" },
["<C-j>"] = { "<cmd>bn<cr>", "Next Buffer" },
["<C-t>"] = { "<cmd>Telescope resume<cr>", "Resume Last Telscope" },
["g"] = {
    l = { vim.diagnostic.open_float, "Float Diagnostics" },
    t = { "<cmd>Telescope lsp_type_definitions<cr>", "Lsp Type Defs" },
    j = { "<cmd>bp<cr>", "Previous Buffer" },
    k = { "<cmd>bn<cr>", "Next Buffer" },
},
["<leader>d"] = { name = "Trouble",
d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
r = { "<cmd>TroubleToggle lsp_references<cr>", "Lsp References" },
f = { "<cmd>TroubleToggle quickfix<cr>", "Quick Fix" },
j = { "<cmd>TroubleToggle<cr>", "Trouble"},
  },
["<leader>p"] = { name = "Projects",
p = { "<cmd>Telescope neovim-project discover<cr>", "Projects" },
o = { "<cmd>Telescope neovim-project history<cr>", "Open Project History" },
l = { "<cmd>NeovimProjectLoadRecent<cr>", "Open Last Project" },
  },
  -- Splits find better binds
  -- ["<C-J>"] = { "<cmd>resize -2<cr>", "Resize Splits"},
  -- ["<C-K>"] = { "<cmd>resize +2<cr>"},
  -- ["<C-H>"] = { "<cmd>vertical resize +2<cr>"},
  -- ["<C-L>"] = {"<cmd>vertical resize +2<cr>" },
  -- ["<M-Down>"] = { "<C-w>j"},
  -- ["<M-Up>"] = { "<C-w>k"},
  -- ["<M-Left>"] = { "<C-w>h"},
  -- ["<M-Right>"] = { "<C-w>l", "Navigate Split" },
  ["<leader>w"] = {name = "Wiki",
  w = { "<cmd>WikiIndex<cr>", "Wiki Index" },
  o = { "<cmd>WikiOpen<cr>", "Wiki Open" },
  e = { "<cmd>WikiExport -output ./pdfs<cr>", "Export Wiki Page to PDF" },
  },
  ["<M-Enter>"] = { "<cmd>WikiLinkFollow<cr>", "Follow link" },
  ["<leader>l"] = {name = "LazyGit",
  g = { "<cmd>cd %:h<cr>:LazyGitCurrentFile<cr>", "LazyGit" },
  l = { "<cmd>Lazy<cr>", "Lazy" },
  m = { "<cmd>Mason<cr>", "Mason" },
  c = { "<cmd>set cursorbind!<cr>", "Cursor Bind" },
  h = { "<cmd>set cursorline!<cr>", "Cursor Line" },
  },
  ["<leader>v"] = {name = "File Hopping",
  k = { "<cmd>e ~/.config/nvim/lua/keymaps.lua<cr>", "Edit Vim Keybinds" },
  p = { "<cmd>e ~/.config/nvim/lua/plugins.lua<cr>", "Edit Vim Plugins" },
  e = { "<cmd>e ~/.config/nvim/lua/keymaps.lua<cr>", "Edit Vim Plugins" },
  z = { "<cmd>e ~/.zsh/.zshrc<cr>", "Edit Zshrc" },
  a = { "<cmd>e ~/.config/nvim/lua/autocmd.lua<cr>", "Edit Autocmds" },
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
  ["<leader>m"] = { "<cmd>MPToggle<cr>", "Open with Glow" },
  ["<leader>x"] = { "<cmd>!xdg-open %<cr><cr>", "Open" },
  ["<leader>q"] = { "<cmd>lua MiniBufremove.delete(0,true)<cr>", "Close Buffer" },
  ["<leader>Q"] = { "<cmd>qa!<cr>", "The Nuclear Option" },
  ["<M-k>"] = { "<cmd>call smooth_scroll#up(10, 5, 2)<cr>", "Smooth Scroll"},
  ["<M-j>"] = { "<cmd>call smooth_scroll#down(10, 5, 2)<cr>", "Smooth Scroll"},
  ["Y"] = { "y$", "Papa Yank"},
  ["<leader>N"] = { "<cmd>lua require(\"ranger-nvim\").open(true)<cr>", "Ranger" },
  ["<leader>n"] = { "<cmd>lua MiniFiles.open()<cr>", "Ranger" },
  ["<leader>gr"] = { "<cmd>w<cr><cmd>GoRun<cr>", "Go Run" },
  ["ii"] = { "<esc>", "which_key_ignore", mode = "i"},
  ["<F1>"]= { "<cmd>FloatermToggle<cr>", "Terminal" },
  })

  wk.register({
  ["<F1>"]= { "<C-\\><C-n>::FloatermToggle<CR>", "Terminal", mode = "t" },
  -- ["<leader>n"] = { "<C-\\><C-ESC>:RnvimrToggle<CR>", "Exit Term Mode", mode = "t" },
  })


  wk.register({
  ["Y"]= { "myY`y", mode = "v", },
  ["<leader>r"]= { "<cmd>Hypersonic<cr>", mode = "v" },
  ["<"]= { "<gv", "Indent", mode = "v" },
  [">"]= { ">gv", "Dedent", mode = "v" },
  ["y"]= { "myy`y", mode = "v" },
  -- ["<leader>p"]= { '"_dP', mode = "v" }, paste from visual with P and your registers will not be harmed
  })
