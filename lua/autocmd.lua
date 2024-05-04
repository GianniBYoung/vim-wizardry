-- Set spellcheck on markdown and text
vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{ pattern = { "*.txt", "*.md", "*.tex", "*.wiki" }, command = "setlocal spell" }
)

vim.api.nvim_create_autocmd(
	"BufWritePre",
	{ desc = "strip trailing spaces on save", pattern = "*", command = "%s/\\s\\+$//e" }
)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
