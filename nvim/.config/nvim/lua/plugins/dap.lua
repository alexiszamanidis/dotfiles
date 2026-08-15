return {
    "mfussenegger/nvim-dap",
    keys = {
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Breakpoint" },
        { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
        { "<leader>di", function() require("dap").step_into() end, desc = "Into" },
        { "<leader>do", function() require("dap").step_over() end, desc = "Over" },
        { "<leader>dO", function() require("dap").step_out() end, desc = "Out" },
        { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Repl" },
        { "<leader>dl", function() require("dap").run_last() end, desc = "Last" },
        { "<leader>du", function() require("dapui").toggle() end, desc = "UI" },
        { "<leader>dx", function() require("dap").terminate() end, desc = "Exit" },
    },
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "tpope/vim-fugitive",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        require("dapui").setup()

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
    end,
}

