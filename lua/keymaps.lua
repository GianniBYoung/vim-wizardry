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
map('n', '<leader>lr', ':source $MYVIMRC<cr>')

-- file hopping
map('n', '<leader>ve', ':edit ~/.config/nvim/init.vim<cr>')
map('n', '<leader>vk', ':edit ~/.config/nvim/lua/keymaps.lua<cr>')
map('n', '<leader>vp', ':edit ~/.config/nvim/lua/plugins.lua<cr>')
map('n', '<leader>vr', ':source $MYVIMRC<cr>')
map('n', '<leader>cd', ':cd %:h<cr>')
map('n', '<leader>a', ':Alpha<cr>')

-- saving
map('n', '<leader>s', ':w<CR>')
map('n', '<leader>S', ':wa<CR>')

-- misc
map('n', '<leader>H', ':nohlsearch<CR>')
map('n', '<leader>C', ':set cuc!<CR>')
map('n', '<leader>i', ':IndentBlanklineToggle<CR>')
map('n', 'gf', ':edit <cfile><cr>')
map('n', '<Enter>', ' o<ESC>')

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
map('i', ';;', '<Esc>A;<Esc>')
map('i', ',,', '<Esc>A,<Esc>')

map('c', 'w!!', '%!sudo tee > /dev/null %')

map('n', '<leader>q', ':Sayonara<CR>')

-- Ranger
map('n', '<leader>n', ':cd %:h<bar>RnvimrToggle<CR>')
map('t', '<leader>n', '<C-\\><C-n>:RnvimrToggle<CR>')

-- vim-go
map('n', '<Leader>gr', ':w<CR>:GoRun<CR>')

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart= 40

