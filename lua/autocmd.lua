-- Set spellcheck on markdown and text
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)
-- autocmd FileType apache setlocal commentstring=#\ %s
-- Set spellcheck on markdown and text
vim.api.nvim_create_autocmd(
    { "BufRead"},
    { pattern = "*tf*", command = "set ft=tf" }
)

vim.api.nvim_create_autocmd(
    { "BufRead"},
    { pattern = "*tf*", command = "setlocal commentstring=#\\ %s" }
)

-- Strip trailing whitespaces on save → figure our how to exclude markdown
vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = "*", command = "%s/\\s\\+$//e" }
    -- { pattern = "\\\.(?!md).*", command = "%s/\\s\\+$//e" }
)

-- -- autoformat terraform files
-- vim.api.nvim_create_autocmd(
--     "BufWrite",
--     { pattern = "*.tf", command = "!terraform fmt %" }
-- )

vim.api.nvim_create_autocmd(
    "BufWritePost",
    { pattern = ".*default.yml", command = "!espanso restart" }
)

vim.api.nvim_create_autocmd(
    "BufWritePost",
    { pattern = "*.go", command = "!gofmt -w %" }
)

-- vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
