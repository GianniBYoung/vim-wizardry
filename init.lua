local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", { ui = { border = "rounded" } })

require('genset')
require('keymaps')
require('autocmd')

-- lsp stuff
local wk = require("which-key")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    wk.register({
        ["gD"] = { vim.lsp.buf.declaration, "Go to Declaration", bufopts },
        ["gd"] = { vim.lsp.buf.definition, "Go to Definition", bufopts },
        -- something is overidding K binding and sending it to a split
        -- Its go-doc T-T I think an autocommand
        ["K"] = { vim.lsp.buf.hover, "Lsp Docs", bufopts },
        ["gi"] = { vim.lsp.buf.implementation, "Go to Implementation", bufopts },
        ["<C-i>"] = { vim.lsp.buf.signature_help, "Signature Help", bufopts },
        ["<space>D"] = { vim.lsp.buf.type_definition, "Go to Type", bufopts },
        ["<leader>ca"] = { vim.lsp.buf.code_action, "Code Action", bufopts },
        ["<leader>rn"] = { vim.lsp.buf.rename, "Refactor Name", bufopts },
        ["<leader>lr"] = { vim.lsp.buf.format, "Format", bufopts },
    })
end

require("neodev").setup({ })

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({ on_attach = lsp_attach, capabilities = lsp_capabilities })
    end,
})

lspconfig.terraformls.setup { filetypes = { "terraform" } }
lspconfig.tflint.setup { filetypes = { "terraform", "tf", "tfvars" } }


local luasnip = require 'luasnip'
local cmp = require 'cmp'

local types = require "cmp.types"
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping(
            cmp.mapping.select_prev_item { behavior = types.cmp.SelectBehavior.Select },
            { "i", "c" }
        ),
        ["<C-j>"] = cmp.mapping(
            cmp.mapping.select_next_item { behavior = types.cmp.SelectBehavior.Select },
            { "i", "c" }
        ),
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip',    keyword_length = 2 },
        { name = 'nvim_lsp',   keyword_length = 2 },
        { name = "treesitter", keyword_length = 2 },
        { name = "nvim_lua",   keyword_length = 2 },
        { name = "path" },
        { name = "emoji" },
        { name = "buffer",     keyword_length = 3 },
    }),
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = { emoji = '🥶', luasnip = '🔪', nvim_lsp = '🤓', buffer = '🧾', path = '🥾' }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
            col_offset = -3,
            side_padding = 1,
            scrollbar = false,
            scrolloff = 8,
        },
        documentation = {
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
        },
    },
}

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
-- Diagnostic config
local signs = { Error = "😡", Warn = "⚡", Hint = "💡", Info = "🧠" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({ virtual_text = false, severity_sort = true, float = { source = "if_many" } })

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = {
                globals = { 'vim', 'require' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false }
        },
    },
}

require("everforest").load()
