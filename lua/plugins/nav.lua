return {
    { 'sathishmanohar/quick-buffer-jump', opts = { ergonomic_alphabet = true } },
    { 'terryma/vim-smooth-scroll',        event = "VeryLazy" },
    { 'LintaoAmons/bookmarks.nvim',       event = "VeryLazy" },
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
            }
        },
        init = function()
            -- enable saving the state of plugins in the session
            vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
        end,
        dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" }, { "Shatur/neovim-session-manager" } },
    },
    {
        "kelly-lin/ranger.nvim",
        cmd = "Lua require(\"ranger-nvim\").open(true)",
        opts = { replace_netrw = true, ui = { border = "rounded", height = .65, width = .75, x = 0.5, y = 0.5 } }
    },
{
  'rasulomaroff/telepath.nvim',
  dependencies = {'ggandor/leap.nvim', config = function() require("leap").add_default_mappings() end },
  lazy = false,
  config = function()
    require('telepath').use_default_mappings()
  end
},
}
