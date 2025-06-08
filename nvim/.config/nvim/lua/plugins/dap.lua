return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
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

        local mappings = {
            {
                "<leader>db",
                "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
                desc = "Breakpoint",
            },
            {
                "<leader>dc",
                "<cmd>lua require'dap'.continue()<cr>",
                desc = "Continue",
            },
            {
                "<leader>di",
                "<cmd>lua require'dap'.step_into()<cr>",
                desc = "Into",
            },
            {
                "<leader>do",
                "<cmd>lua require'dap'.step_over()<cr>",
                desc = "Over",
            },
            {
                "<leader>dO",
                "<cmd>lua require'dap'.step_out()<cr>",
                desc = "Out",
            },
            {
                "<leader>dr",
                "<cmd>lua require'dap'.repl.toggle()<cr>",
                desc = "Repl",
            },
            {
                "<leader>dl",
                "<cmd>lua require'dap'.run_last()<cr>",
                desc = "Last",
            },
            {
                "<leader>du",
                "<cmd>lua require'dapui'.toggle()<cr>",
                desc = "UI",
            },
            {
                "<leader>dx",
                "<cmd>lua require'dap'.terminate()<cr>",
                desc = "Exit",
            },
        }

        require("which-key").add(mappings)
    end,
}
