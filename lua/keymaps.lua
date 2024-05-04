local wk = require("which-key")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>sf", "<cmd>Telescope fd<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>sz", "<cmd>Telescope spell_suggest<cr>", { desc = "Spelling Corrections" })
vim.keymap.set("n", "<leader>sb", "<cmd>BookmarksGoto<cr>", { desc = "List Bookmarks" })
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep prompt_prefix=🔦<cr>", { desc = "grep" })

--DAP
vim.keymap.set("n", "<leader>bc", "<cmd>DapContinue<cr>", { desc = "Continue" })
vim.keymap.set("n", "<leader>bb", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle  Breakpoints" })
vim.keymap.set("n", "<leader>bn", "<cmd>DapStepOver<cr>", { desc = "Step  Over" })
vim.keymap.set("n", "<leader>bi", "<cmd>DapStepInto<cr>", { desc = "Step  Into" })
vim.keymap.set("n", "<leader>bo", "<cmd>DapStepOut<cr>", { desc = "Step  Out" })
vim.keymap.set("n", "<leader>br", "<cmd>DapToggleRepl<cr>", { desc = "Repl" })
vim.keymap.set("n", "<C-g>", "<cmd>cprev<cr>", { desc = "Prev quick fix" })
vim.keymap.set("n", "<C-;>", "<cmd>cnext<cr>", { desc = "Next quick fix" })

--Misc
vim.keymap.set("n", "<leader>m", "<cmd>MPToggle<cr>", { desc = "Open with Glow" })
vim.keymap.set("n", "Y", "y$", { desc = "Papa Yank" })
vim.keymap.set("n", "<leader>N", '<cmd>lua require("ranger-nvim").open(true)<cr>', { desc = "Ranger" })
vim.keymap.set("n", "<leader>n", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>", { desc = "MiniFiles" })
vim.keymap.set("n", "<F1>", "<cmd>FloatermToggle<cr>", { desc = "Terminal" })

vim.keymap.set("n", "<leader>be", function()
	require("dapui").eval()
end, { desc = "Evaluate  Under Cursor" })

-- vim.keymap.set("n", "<leader>be", "<cmd>lua require'dapui'.eval()<cr>", { desc = "Evaluate  Under Cursor" })
-- vim.keymap.set("n", "<leader>bt", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "Toggle  DAP-UI" })
vim.keymap.set("n", "<leader>bt", function()
	require("dapui").toggle()
end, { desc = "Toggle  DAP-UI" })

wk.register({
	-- Individuals
	-- [","] = { "<cmd>QuickBufferJump<cr>", "Buffer Jump" },
	-- ["<C-n>"] = { "<cmd>Telescope fd prompt_prefix=🔍<cr>", "Find Files" },
	["<leader>r"] = { "<cmd>Telescope registers prompt_prefix=📠<cr>", "Paste From Register" },
	["<C-h>"] = { "<C-w>h", "Select 'Left' Window" },
	["<C-j>"] = { "<C-w>j", "Select 'Lower' Window" },
	["<C-k>"] = { "<C-w>k", "Select 'Upper' Window", noremap = true },
	["<C-l>"] = { "<C-w>l", "Select 'Right' Window" },
	["g"] = {
		j = { "<cmd>bp<cr>", "Previous Buffer" },
		k = { "<cmd>bn<cr>", "Next Buffer" },
	},
	["<leader>p"] = {
		name = "Projects",
		p = { "<cmd>Telescope neovim-project discover<cr>", "Projects" },
		o = { "<cmd>Telescope neovim-project history<cr>", "Open Project History" },
		l = { "<cmd>NeovimProjectLoadRecent<cr>", "Open Last Project" },
	},
	["<leader>w"] = {
		name = "Wiki",
		w = { "<cmd>WikiIndex<cr>", "Wiki Index" },
		o = { "<cmd>WikiOpen<cr>", "Wiki Open" },
		e = { "<cmd>WikiExport -output ./pdfs<cr>", "Export Wiki Page to PDF" },
	},
	["<M-Enter>"] = { "<cmd>WikiLinkFollow<cr>", "Follow link" },
	["<leader>l"] = {
		name = "LazyGit",
		g = { "<cmd>:LazyGitCurrentFile<cr>", "LazyGit" },
		l = { "<cmd>Lazy<cr>", "Lazy" },
		m = { "<cmd>Mason<cr>", "Mason" },
		c = { "<cmd>set cursorbind!<cr>", "Cursor Bind" },
		h = { "<cmd>set cursorline!<cr>", "Cursor Line" },
		R = { "<cmd>lua vim.lsp.buf.format()<cr>", "lsp format that shouldn't be here" },
	},
	["<leader>v"] = {
		r = { "<cmd>luafile %<cr>", "Reload a File" },
	},
	["<leader>cd"] = { "<cmd>cd %:h<cr>", "Cd" },
	["<leader>s"] = { "<cmd>w<cr>", "Save Buffer" },
	["<leader>S"] = { "<cmd>wa<cr>", "Save All Buffers" },
	["<leader>kk"] = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
	["<leader>C"] = { "<cmd>set cuc!<cr>", "Cursor Column" },
	["<leader>R"] = { "<cmd>set relativenumber!<cr><cmd>set cursorline!<cr>", "Screen Sharing Mode" },
	["gf"] = { "<cmd>edit <cfile><cr>", "Edit File Under Cursor" },
	["<cr>"] = { "ciw", "Change Word Under Cursor" },
	["<leader>q"] = { "<cmd>lua MiniBufremove.delete(0,true)<cr>", "Close Buffer" },
	["<leader>Q"] = { "<cmd>qa!<cr>", "The Nuclear Option" },
})

wk.register({
	["<F1>"] = { "<C-\\><C-n>::FloatermToggle<CR>", "Terminal", mode = "t" },
	-- ["<leader>n"] = { "<C-\\><C-ESC>:RnvimrToggle<CR>", "Exit Term Mode", mode = "t" },
})

wk.register({
	["Y"] = { "myY`y", mode = "v" },
	["<leader>r"] = { "<cmd>Hypersonic<cr>", mode = "v" },
	["<"] = { "<gv", "Indent", mode = "v" },
	[">"] = { ">gv", "Dedent", mode = "v" },
	["y"] = { "myy`y", mode = "v" },
	["<leader>b"] = {
		name = "DAP",
		mode = "v",
		v = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate Under Cursor" },
	},
})
