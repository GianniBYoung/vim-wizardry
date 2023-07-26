HOME = os.getenv("HOME")
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
vim.opt.wildmode = { longest = 'full', 'full' }
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.o.signcolumn = 'yes:2'
vim.o.listchars = 'tab:▸ ,trail:·'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.ic = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3
vim.opt.joinspaces = false
vim.opt.exrc = true
vim.opt.updatetime = 600 -- Reduce time for highlighting other references
vim.opt.redrawtime = 13000 -- Allow more time for loading syntax on large files
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.confirm = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 40

-- vim.opt.formatoptions = { 'j' }

-- " set backup
-- " set backupdir=~/.local/share/nvim/backup//
