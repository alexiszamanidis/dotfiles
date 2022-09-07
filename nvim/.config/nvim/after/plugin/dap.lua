local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    vim.notify("dap not found!")
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    vim.notify("dapui not found!")
    return
end

dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end
