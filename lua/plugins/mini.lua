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
			require("mini.comment").setup({ ignore_blank_line = true })
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
			require("mini.splitjoin").setup()
		end,
	},
}
