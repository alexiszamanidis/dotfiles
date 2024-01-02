local plugin_name = "illuminate"
local status_ok, illuminate = pcall(require, plugin_name)
if not status_ok then
    vim.notify(plugin_name .. " not found!")
    return
end

require("illuminate").configure()
