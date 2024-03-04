local wk = require("which-key")
-- kickstart binds idk if i want to keep using whichkey for this
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>tw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>tr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- swap this to 's'
wk.register({
	["<leader>t"] = {
		name = "Telescope",
		z = { "<cmd>Telescope spell_suggest<cr>", "Fix Spelling" },
		f = { "<cmd>Telescope fd<cr>", "Find Files" },
		p = { "<cmd>Telescope builtin<cr>", "All Telescope Builtins" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
		m = { "<cmd>BookmarksGoto<cr>", "Bookmarks" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep" },
		d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		-- r = { "<cmd>Telescope builtin<cr>", "Lsp References" },
		R = { "<cmd>Telescope lsp_references<cr>", "Lsp References" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Lsp Symbols" },
		t = { "<cmd>Telescope lsp_type_definitions<cr>", "Lsp Type Defs" },
	},
	["<leader>b"] = {
		name = "DAP",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoints" },
		e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate Under Cursor" },
		t = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle DAP-UI" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		n = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		r = { "<cmd>lua require'dap'.repl.open()<cr>", "Repl" },
	},
	-- Individuals
	["<leader>g"] = { "<cmd>Telescope live_grep prompt_prefix=🔦<cr>", "Grep" },
	[","] = { "<cmd>QuickBufferJump<cr>", "Buffer Jump" },
	-- ["<C-n>"] = { "<cmd>Telescope fd prompt_prefix=🔍<cr>", "Find Files" },
	["<C-b>"] = { "<cmd>Telescope buffers prompt_prefix=📜<cr>", "Find Open Buffers" },
	["<leader>r"] = { "<cmd>Telescope registers prompt_prefix=📠<cr>", "Paste From Register" },
	["<C-t>"] = { "<cmd>Telescope resume<cr>", "Resume Last Telscope" },
	["<C-h>"] = { "<C-w>h", "Select 'Left' Window" },
	["<C-j>"] = { "<C-w>j", "Select 'Lower' Window" },
	["<C-k>"] = { "<C-w>k", "Select 'Upper' Window", noremap = true },
	["<C-l>"] = { "<C-w>l", "Select 'Right' Window" },
	["g"] = {
		l = { vim.diagnostic.open_float, "Float Diagnostics" },
		t = { "<cmd>Telescope lsp_type_definitions<cr>", "Lsp Type Defs" },
		j = { "<cmd>bp<cr>", "Previous Buffer" },
		k = { "<cmd>bn<cr>", "Next Buffer" },
	},
	["<leader>d"] = {
		name = "Trouble",
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "Lsp References" },
		f = { "<cmd>TroubleToggle quickfix<cr>", "Quick Fix" },
		j = { "<cmd>TroubleToggle<cr>", "Trouble" },
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
		g = { "<cmd>cd %:h<cr>:LazyGitCurrentFile<cr>", "LazyGit" },
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
	["<leader>H"] = { "<cmd>nohlsearch<cr>", "Clear Highlights" },
	["<leader>C"] = { "<cmd>set cuc!<cr>", "Cursor Column" },
	["<leader>R"] = { "<cmd>set relativenumber!<cr><cmd>set cursorline!<cr>", "Screen Sharing Mode" },
	["gf"] = { "<cmd>edit <cfile><cr>", "Edit File Under Cursor" },
	["<cr>"] = { "ciw", "Change Word Under Cursor" },
	["<leader>m"] = { "<cmd>MPToggle<cr>", "Open with Glow" },
	["<leader>x"] = { "<cmd>!xdg-open %<cr><cr>", "Open" },
	["<leader>q"] = { "<cmd>lua MiniBufremove.delete(0,true)<cr>", "Close Buffer" },
	["<leader>Q"] = { "<cmd>qa!<cr>", "The Nuclear Option" },
	["<M-d>"] = { "<cmd>call smooth_scroll#up(10, 5, 2)<cr>", "Smooth Scroll" },
	["<M-f>"] = { "<cmd>call smooth_scroll#down(10, 5, 2)<cr>", "Smooth Scroll" },
	["Y"] = { "y$", "Papa Yank" },
	["<leader>N"] = { '<cmd>lua require("ranger-nvim").open(true)<cr>', "Ranger" },
	["<leader>n"] = { "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>", "Ranger" },
	["<leader>gr"] = { "<cmd>w<cr><cmd>GoRun<cr>", "Go Run" },
	["ii"] = { "<esc>", "which_key_ignore", mode = "i" },
	["<F1>"] = { "<cmd>FloatermToggle<cr>", "Terminal" },
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
