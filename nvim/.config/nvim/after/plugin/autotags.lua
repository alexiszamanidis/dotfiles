local status_ok, n_autotags = pcall(require, "nvim-ts-autotag")
if not status_ok then
    return
end

n_autotags.setup({})
