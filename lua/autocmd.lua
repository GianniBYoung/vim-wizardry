-- Set spellcheck on markdown and text
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

-- Set spellcheck on markdown and text
vim.api.nvim_create_autocmd(
    { "BufRead"},
    { pattern = "*tfvars", command = "set ft=tf" }
)


-- Strip trailing whitespaces on save → figure our how to exclude markdown
vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = "*", command = "%s/\\s\\+$//e" }
    -- { pattern = "\\\.(?!md).*", command = "%s/\\s\\+$//e" }
)

-- -- autoformat terraform files
-- vim.api.nvim_create_autocmd(
--     "BufWritePre",
--     { pattern = "*.tf", command = "terraform fmt" }
-- )

vim.api.nvim_create_autocmd(
    "BufWritePost",
    { pattern = ".*default.yml", command = "!espanso restart" }
)

vim.api.nvim_create_autocmd(
    "BufWritePost",
    { pattern = "*.go", command = "!gofmt -w %" }
)
