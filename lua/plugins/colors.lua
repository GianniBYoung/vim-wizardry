return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = "light"
			require("everforest").setup({
				background = "soft",
				---How much of the background should be transparent. 2 will have more UI
				transparent_background_level = 2,
				---Whether italics should be used for keywords and more.
				italics = false,
				disable_italic_comments = false,
				ui_contrast = "high",
				dim_inactive_windows = false,
				diagnostic_text_highlight = false,
				diagnostic_virtual_text = "coloured",
				diagnostic_line_highlight = false,
				spell_foreground = false,
				show_eob = true,
				float_style = "bright",
				---You can override specific highlights to use other groups or a hex colour.
				---This function will be called with the highlights and colour palette tables.
				---@param highlight_groups Highlights
				---@param palette Palette
				on_highlights = function(highlight_groups, palette) end,
				---You can override colours in the palette to use different hex colours.
				---This function will be called once the base and background colours have
				---been mixed on the palette.
				---@param palette Palette
				colours_override = function(palette)
					palette.bg_visual = "#C6B8D7"
					palette.bg1 = "#C6B8D7"
				end,
			})
		end,
	},
	{ "norcalli/nvim-colorizer.lua", lazy = true, cmd = "ColorizerToggle" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			{
				presets = {
					command_palette = true,
					lsp_doc_border = true,
				},
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		-- event = 'ColorScheme',
		opts = {
			options = {
				ignore_focus = {
					"dapui_watches",
					"dapui_breakpoints",
					"dapui_scopes",
					"dapui_console",
					"dapui_stacks",
					"dap-repl",
				},
				-- theme = 'horizon',
				theme = "everforest",
				-- theme = 'auto',
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				always_divide_middle = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						sources = { "nvim_diagnostic", "nvim_lsp" },
						symbols = { error = "😡", warning = "⚡", info = "🧠", hint = "💡" },
					},
				},
				lualine_c = {
					{ "filename", path = 3, shortening_target = 30 },
					{
						"harpoon2",
						indicators = { "a", "s", "d", "f", "h" },
						active_indicators = { "🌀a", "🌀s", "🌀d", "🌀f", "🌀h" },
						_separator = "  ",
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_c = { { "filename", path = 0 } },
				lualine_x = { "location" },
			},
			tabline = {
				lualine_a = {
					{
						"buffers",
						symbols = {
							-- TODO: Change this
							modified = " ●",
							directory = "🗂️",
						},
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						"filename",
						path = 4,
						symbols = {
							modified = "➕",
							readonly = "➖", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "[No Name]", -- Text to show for unnamed buffers.
							newfile = "🐤",
						},
					},
				},
			},
			extensions = { "quickfix" },
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"NStefan002/screenkey.nvim",
		cmd = "Screenkey",
		version = "*",
		config = true,
	},
}
