local vim = vim
local opt = vim.opt
---
-- Keymaps
---

function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- leader
vim.g.mapleader = ' '
local opts = { noremap=true, silent=true }
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)

-- trouble
map('n', '<leader>xr', ':TroubleToggle lsp_references<CR>')
map('n', '<leader>xx', ':TroubleToggle<CR>')
map('n', '<leader>xd', ':TroubleToggle document_diagnostics<CR>')
map('n', '<leader>xk', ':TroubleToggle quickfix<CR>')

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

-- resize splits
map('n', '<M-J>', ':resize -2<CR>')
map('n', '<M-K>', ':resize +2<CR>')
map('n', '<M-H>', ':vertical resize -2<CR>')
map('n', '<M-L>', ':vertical resize +2<CR>')

-- navigate splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<leader>Q', ':bufdo bdelete<CR>')

-- navigate buffers
map('n', 'gk', ':bn<CR>')
map('n', 'gj', ':bp<CR>')
map('n', '<leader>K', ':tabn<CR>')
map('n', '<leader>J', ':tabp<CR>')

-- git
map('n', '<leader>lg', ':cd %:h<cr>:LazyGitCurrentFile<cr>')
map('n', '<leader>lr', ':source $MYVIMRC<cr>')

-- file hopping
map('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<cr>')
map('n', '<leader>vk', ':edit ~/.config/nvim/lua/keymaps.lua<cr>')
map('n', '<leader>vp', ':edit ~/.config/nvim/lua/plugins.lua<cr>')
map('n', '<leader>vl', ':edit ~/.config/nvim/lua/lsp.lua<cr>')
map('n', '<leader>vz', ':edit ~/.zshrc<cr>')
map('n', '<leader>va', ':edit ~/.config/nvim/lua/autocmd.lua<cr>')
map('n', '<leader>cd', ':cd %:h<cr>')
map('n', '<leader>a', ':Alpha<cr>')

-- saving
map('n', '<leader>s', ':w<CR>')
map('n', '<leader>S', ':wa<CR>')

-- misc
map('n', '<leader>H', ':nohlsearch<CR>')
map('n', '<leader>C', ':set cuc!<CR>')
map('n', 'gf', ':edit <cfile><cr>')
-- map('n', ' <Enter>', ' o<ESC>')
map('n', '<leader>m', ':set ft=markdown<CR>:PeekOpen <CR>')
map('n', '<Leader>kk', ':ColorizerToggle<CR>')
map('n', '<Leader>f', ':set ft=bash<CR>')
-- reload current file
map('n', '<Leader>vr', ':luafile %<CR>')


-- smooth scrolling

map('n', '<M-k>', ':call smooth_scroll#up(10, 5, 2)<CR>')
map('n', '<M-j>', ':call smooth_scroll#down(10, 5, 2)<CR>')

-- Make Y behave like the other capitals
map('n', 'Y', 'y$')


-- Reselect visual selection after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
map('v', 'y', 'myy`y')
map('v', 'Y', 'myY`y')

-- Paste replace visual selection without copying it
map('v', '<leader>p', '"_dP')

-- open link with default program
map('n', '<leader>x', ':!xdg-open %<cr><cr>')
-- nmap <leader>x :!xdg-open %<cr><cr>

-- Quicky escape to normal mode
map('i', 'ii', '<esc>')
map('c', 'w!!', '%!sudo tee > /dev/null %')

map('n', '<leader>q', ':Sayonara<CR>')

-- Ranger
map('n', '<leader>n', ':cd %:h<bar>RnvimrToggle<CR>')
map('t', '<leader>n', '<C-\\><C-n>:RnvimrToggle<CR>')

-- vim-go
map('n', '<Leader>gr', ':w<CR>:GoRun<CR>')

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 40

-- FloatTerm

map('n', '<F4>', ':FloatermNew<CR>')
map('t', '<F4>', '<C-\\><C-n>::FloatermNew<CR>')
map('t', '<F2>', '<C-\\><C-n>::FloatermNext<CR>')
map('n', '<F1>', ':FloatermToggle<CR>')
map('t', '<F1>', '<C-\\><C-n>::FloatermToggle<CR>')
map('t', '<F9>', '<C-\\><C-n>::FloatermKill<CR>')

-- lsp binds
map('n', '<Leader>w', ':LspZeroFormat<CR>')

-- telescope
map('n', '<Leader>tf', ':Telescope fd<CR>')
map('n', '<C-e>', ':Telescope fd<CR>')
map('n', '<Leader>z', ':Telescope spell_suggest<CR>')
map('n', '<Leader>tg', ':Telescope live_grep<CR>')
map('n', '<Leader>g', ':Telescope live_grep<CR>')
map('n', '<C-g>', ':Telescope live_grep<CR>')
map('n', '<Leader>tq', ':Telescope colorscheme<CR>')
map('n', '<Leader>td', ':Telescope diagnostics<CR>')
map('n', '<C-d>', ':Telescope diagnostics<CR>')
-- map('n', '<Leader>tt', ':Telescope filetypes<CR>')
map('n', '<Leader>tr', ':Telescope lsp_references<CR>')
map('n', '<Leader>tr', ':Telescope lsp_document_symbols<CR>')
map('n', '<Leader>tt', ':Telescope lsp_type_definitions<CR>')

