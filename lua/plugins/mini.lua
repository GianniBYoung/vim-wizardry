return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.cursorword").setup()
			require("mini.ai").setup()
			require("mini.files").setup({
				windows = { preview = true },
				mappings = {
					go_in = "L",
					go_in_plus = "l",
					go_out = "H",
					go_out_plus = "h",
				},
			})
			local map_split = function(buf_id, lhs, direction)
				local rhs = function()
					-- Make new window and set it as target
					local new_target_window
					vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
						vim.cmd(direction .. " split")
						new_target_window = vim.api.nvim_get_current_win()
					end)

					MiniFiles.set_target_window(new_target_window)
				end

				-- Adding `desc` will result into `show_help` entries
				local desc = "Split " .. direction
				vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id
					-- Tweak keys to your liking
					map_split(buf_id, "gs", "belowright horizontal")
					map_split(buf_id, "gv", "belowright vertical")
				end,
			})
			require("mini.bufremove").setup()
			-- require("mini.comment").setup({ ignore_blank_line = true })
			require("mini.indentscope").setup({ symbol = "╎" })
			require("mini.operators").setup({ sort = { prefix = "" }, replace = { prefix = "cr" } })
			require("mini.pairs").setup()
			require("mini.surround").setup({
				mappings = {
					add = "ta", -- Add surrounding in Normal and Visual modes
					delete = "td", -- Delete surrounding
					find = "tf", -- Find surrounding (to the right)
					find_left = "tF", -- Find surrounding (to the left)
					highlight = "th", -- Highlight surrounding
					replace = "tr", -- Replace surrounding
					update_n_lines = "tn", -- Update `n_lines`
				},
			})
			require("mini.move").setup({
				mappings = {
					left = "<M-h>",
					right = "<M-l>",
					down = "<M-j>",
					up = "<M-k>",
					-- Move current line in Normal mode
					line_left = "<M-h>",
					line_right = "<M-l>",
					line_down = "<M-j>",
					line_up = "<M-k>",
				},
			})
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
			local miniclue = require("mini.clue")
			miniclue.setup({
				window = {
					config = {
						width = "auto",
						border = "double",
					},
				},
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			})
			-- require("mini.splitjoin").setup()
			--
		end,
	},
}
