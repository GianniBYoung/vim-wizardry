return {
	{ "terryma/vim-smooth-scroll", event = "VeryLazy" },
	{ "LintaoAmons/bookmarks.nvim", event = "VeryLazy" },
	{
		"coffebar/neovim-project",
		lazy = false,
		priority = 100,
		opts = {
			projects = {
				"~/chef/nulsc/*",
				"~/chef/nulsc/cookbooks/*",
				"~/chef/nulsc/policies/*",
				"~/chef/nulsc/profiles/*",
				"~/chef/nulsc/cookbooks/linux_cookbooks/*",
				"~/git/icon/*",
				"~/.config/*",
				"~/git/linux/*",
				"~/Documents/git/go/src/*",
			},
		},
		init = function()
			-- enable saving the state of plugins in the session
			vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		end,
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				event = "VimEnter",
				dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-ui-select.nvim" } },

				config = function()
					require("telescope").setup({
						extensions = {
							["ui-select"] = { require("telescope.themes").get_dropdown() },
						},
					})

					pcall(require("telescope").load_extension, "ui-select")

					local builtin = require("telescope.builtin")
					vim.keymap.set("n", "<leader>s/", function()
						builtin.live_grep({
							grep_open_files = true,
							prompt_title = "Live Grep in Open Files",
						})
					end, { desc = "[S]earch [/] in Open Files" })

					-- Shortcut for searching your neovim configuration files
					vim.keymap.set("n", "<leader>ve", function()
						builtin.find_files({ cwd = vim.fn.stdpath("config") })
					end, { desc = "[S]earch [N]eovim files" })
				end,
			},
			{
				"Shatur/neovim-session-manager",
				config = function()
					-- session_manager = require("session_manager")
					-- Auto save session
					vim.api.nvim_create_autocmd({ "BufWritePre" }, {
						callback = function()
							for _, buf in ipairs(vim.api.nvim_list_bufs()) do
								-- Don't save while there's any 'nofile' buffer open.
								if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
									return
								end
							end
							session_manager.save_current_session()
						end,
					})
				end,
			},
		},
	},
	{
		"kelly-lin/ranger.nvim",
		cmd = 'Lua require("ranger-nvim").open(true)',
		opts = { replace_netrw = true, ui = { border = "rounded", height = 0.65, width = 0.75, x = 0.5, y = 0.5 } },
	},
	{
		"rasulomaroff/telepath.nvim",
		dependencies = {
			"ggandor/leap.nvim",
			config = function()
				require("leap").add_default_mappings()
			end,
		},
		lazy = false,
		config = function()
			require("telepath").use_default_mappings()
		end,
	},
	{
		"letieu/harpoon-lualine",
		dependencies = {
			{
				"theprimeagen/harpoon",
				branch = "harpoon2",
				dependencies = { "nvim-lua/plenary.nvim" },
				config = function()
					require("harpoon"):setup()
				end,
				keys = {
					{
						"<leader>a",
						function()
							require("harpoon"):list():add()
						end,
						desc = "harpoon file",
					},
					{
						"<leader>A",
						function()
							local harpoon = require("harpoon")
							harpoon.ui:toggle_quick_menu(harpoon:list())
						end,
						desc = "harpoon quick menu",
					},
					{
						"<C-s>",
						function()
							require("harpoon"):list():prev()
						end,
						desc = "harpoon prev",
					},
					{
						"<C-d>",
						function()
							require("harpoon"):list():next()
						end,
						desc = "harpoon next",
					},
					{
						",a",
						function()
							require("harpoon"):list():select(1)
						end,
						desc = "harpoon to file 1",
					},
					{
						",s",
						function()
							require("harpoon"):list():select(2)
						end,
						desc = "harpoon to file 2",
					},
					{
						",d",
						function()
							require("harpoon"):list():select(3)
						end,
						desc = "harpoon to file 3",
					},
					{
						",f",
						function()
							require("harpoon"):list():select(4)
						end,
						desc = "harpoon to file 4",
					},
					{
						",h",
						function()
							require("harpoon"):list():select(5)
						end,
						desc = "harpoon to file 5",
					},
				},
			},
		},
	},
}
