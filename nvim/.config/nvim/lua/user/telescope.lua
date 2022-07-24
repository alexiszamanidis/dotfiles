local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('media_files')

local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    prompt_prefix = " >"
  },
  pickers = {
    find_files = {
        hidden = true
    }
  }
}
