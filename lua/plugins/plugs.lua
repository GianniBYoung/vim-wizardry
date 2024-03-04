return {
	-- Do i need?
	{ "tpope/vim-endwise", event = "VeryLazy" },
	-- is this what is causing the tabs to spaces?
	{ "tpope/vim-sleuth" },
	--- misc
	{ "tpope/vim-eunuch", event = "VeryLazy" },
	{ "voldikss/vim-floaterm", lazy = true, cmd = "FloatermToggle" },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		cmd = "LazyGitCurrentFile",
	},
}
