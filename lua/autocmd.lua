-- Set spellcheck on markdown and text
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex", "*.wiki" }, command = "setlocal spell" }
)
-- Set spellcheck on markdown and text
vim.api.nvim_create_autocmd(
    { "BufRead"},
    { pattern = "*tf.*", command = "set ft=tf" }
)

vim.api.nvim_create_autocmd(
    { "BufRead"},
    { pattern = "*tf.*", command = "setlocal commentstring=#\\ %s" }
)

-- Strip trailing whitespaces on save → figure our how to exclude markdown
vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = "*", command = "%s/\\s\\+$//e" }
    -- { pattern = "\\\.(?!md).*", command = "%s/\\s\\+$//e" }
)

-- autoformat terraform files
vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = "*.tf", command = 'lua vim.lsp.buf.format()' }
)

-- autoformat terraform files
vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = "*.go", command = 'lua vim.lsp.buf.format()' }
)

vim.api.nvim_create_autocmd(
    "BufWritePost",
    { pattern = ".*default.yml", command = "!espanso restart" }
)

