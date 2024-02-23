return {
    {'mfussenegger/nvim-dap',
    dependencies = {'leoluz/nvim-dap-go','rcarriga/nvim-dap-ui', {'mfussenegger/nvim-dap-python', config = function ()
        require('dap-python').setup('/Users/gyoung/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
    end}},
    config = function ()
        require("dapui").setup({
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 0.50 },
                        { id = "breakpoints", size = 0.35 },
                        { id = "watches", size = 0.15 },
                    },
                    size = 60,
                    position = "left",
                },
                {
                    elements = { "repl", "console", },
                    size = 0.25, -- 25% of total lines
                    position = "bottom",
                },
            },
        }

        )
        require("dap-go").setup()
        local dap, dapui = require("dap"), require("dapui")

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end

},

}
