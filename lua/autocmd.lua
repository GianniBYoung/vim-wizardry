-- Set spellcheck on markdown and text
vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{ pattern = { "*.txt", "*.md", "*.tex", "*.wiki" }, command = "setlocal spell" }
)

-- -- -- -- Set spellcheck on markdown and text
-- -- -- vim.api.nvim_create_autocmd(
-- -- --     { "BufRead" },
-- -- --     { pattern = { "*.tfvars" }, command = "set ft=tf" }
-- -- -- )
-- -- --
-- -- -- from terrafor-ls docs
-- -- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- --     pattern = { "*.tf", "*.tfvars" },
-- --     callback = function()
-- --         vim.lsp.buf.format()
-- --     end,
-- -- })
-- --
-- -- This is not being set by the lsp, I need to set the option below somehow (add a condition to the mini config function)
-- vim.api.nvim_create_autocmd(
--     { "BufRead" },
--     { pattern = "*tfvars", command = "lua vim.bo.commentstring='# %s'" }
-- )
--
vim.api.nvim_create_autocmd(
	"BufWritePre",
	{ desc = "strip trailing spaces on save", pattern = "*", command = "%s/\\s\\+$//e" }
	-- { pattern = "\\\.(?!md).*", command = "%s/\\s\\+$//e" }
)

-- vim.api.nvim_create_autocmd(
--     "BufWritePre",
--     { pattern = "*.go", command = 'lua vim.lsp.buf.format()' }
-- )
--

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
