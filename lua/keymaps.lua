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
vim.keymap.set("n", "<leader>r", "<cmd>Telescope registers prompt_prefix=📠<cr>", { desc = "Paste From Register" })

--DAP
vim.keymap.set("n", "<leader>bc", "<cmd>DapContinue<cr>", { desc = "Continue" })
vim.keymap.set("n", "<leader>bb", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle  Breakpoints" })
vim.keymap.set("n", "<leader>bn", "<cmd>DapStepOver<cr>", { desc = "Step  Over" })
vim.keymap.set("n", "<leader>bi", "<cmd>DapStepInto<cr>", { desc = "Step  Into" })
vim.keymap.set("n", "<leader>bo", "<cmd>DapStepOut<cr>", { desc = "Step  Out" })
vim.keymap.set("n", "<leader>br", "<cmd>DapToggleRepl<cr>", { desc = "Repl" })

vim.keymap.set("n", "<leader>be", function()
	require("dapui").eval()
end, { desc = "Evaluate  Under Cursor" })

vim.keymap.set("v", "bv", "<cmd>lua require'dapui'.eval()<cr>", { desc = "Evaluate Under Cursor" })

-- vim.keymap.set("n", "<leader>be", "<cmd>lua require'dapui'.eval()<cr>", { desc = "Evaluate  Under Cursor" })
-- vim.keymap.set("n", "<leader>bt", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "Toggle  DAP-UI" })
vim.keymap.set("n", "<leader>bt", function()
	require("dapui").toggle()
end, { desc = "Toggle  DAP-UI" })

--Misc
vim.keymap.set("n", "<F1>", "<cmd>FloatermToggle<cr>", { desc = "Terminal" })
vim.keymap.set("t", "<F1>", "<C-\\><C-n>::FloatermToggle<CR>", { desc = "Toggle Term" })
vim.keymap.set("n", "<leader>m", "<cmd>MPToggle<cr>", { desc = "Open with Glow" })
vim.keymap.set("n", "<leader>kk", "<cmd>ColorizerToggle<cr>", { desc = "Colorizer" })

vim.keymap.set("n", "<leader>C", "<cmd>set cuc!<cr>", { desc = "Cursor Column" })
vim.keymap.set(
	"n",
	"<leader>R",
	"<cmd>set relativenumber!<cr><cmd>set cursorline!<cr>",
	{ desc = "Screen Sharing Mode For Normies" }
)
vim.keymap.set("n", "<leader>vr", "<cmd>luafile %<cr>", { desc = "Reload a File" })

-- enhanced motions
vim.keymap.set("n", "Y", "y$", { desc = "Papa Yank" })
vim.keymap.set("n", "<cr>", "ciw", { desc = "Change Word Under Cursor" })
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:h<cr>", { desc = "Cd" })
vim.keymap.set("n", "<leader>s", "<cmd>w<cr>", { desc = "Save Buffer" })
vim.keymap.set("n", "<leader>S", "<cmd>wa<cr>", { desc = "Save All Buffers" })

vim.keymap.set("v", "Y", "myY`y", { desc = "Maintain Cursor Position When Yanking" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Dedent" })

vim.keymap.set("i", "ii", "<ESC>", { desc = "quick exit" })
-- nav
vim.keymap.set("n", "<leader>n", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>", { desc = "MiniFiles" })
vim.keymap.set("n", "gf", "<cmd>edit <cfile><cr>", { desc = "Edit File Under Cursor" })
vim.keymap.set("n", "<leader>N", '<cmd>lua require("ranger-nvim").open(true)<cr>', { desc = "Ranger" })
vim.keymap.set("n", "<leader>q", "<cmd>lua MiniBufremove.delete(0,true)<cr>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "The Nuclear Option" })
vim.keymap.set("n", "<C-w>h", "", { desc = "Select 'Left' Window" })
vim.keymap.set("n", "<C-w>j", "", { desc = "Select 'Lower' Window" })
vim.keymap.set("n", "<C-w>k", "", { desc = "Select 'Upper' Window", noremap = true })
vim.keymap.set("n", "<C-w>l", "", { desc = "Select 'Right' Window" })
vim.keymap.set("n", "gj", "<cmd>bp<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "gk", "<cmd>bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>pp", "<cmd>Telescope neovim-project discover<cr>", { desc = "Projects" })
vim.keymap.set("n", "<leader>po", "<cmd>Telescope neovim-project history<cr>", { desc = "Open Project History" })
vim.keymap.set("n", "<leader>pl", "<cmd>NeovimProjectLoadRecent<cr>", { desc = "Open Last Project" })
vim.keymap.set("n", "<C-g>", "<cmd>cprev<cr>", { desc = "Prev quick fix" })
vim.keymap.set("n", "<C-;>", "<cmd>cnext<cr>", { desc = "Next quick fix" })

-- wiki
vim.keymap.set("n", "ww", "<cmd>WikiIndex<cr>", { desc = "Wiki Index" })
vim.keymap.set("n", "wo", "<cmd>WikiOpen<cr>", { desc = "Wiki Open" })
vim.keymap.set("n", "we", "<cmd>WikiExport -output ./pdfs<cr>", { desc = "Export Wiki Page to PDF" })
vim.keymap.set("n", "<M-Enter>", "<cmd>WikiLinkFollow<cr>", { desc = "Follow Wiki Link" })

-- Git (More to Come)
vim.keymap.set("n", "<leader>lg", "<cmd>:LazyGitCurrentFile<cr>", { desc = "" })

-- Plugin Management
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason" })
