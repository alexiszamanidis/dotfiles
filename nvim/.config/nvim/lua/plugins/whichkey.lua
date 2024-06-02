return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local function set_background(content)
                print(content)
                vim.fn.system("feh --bg-max " .. content)
            end

            local function select_background(prompt_bufnr, map)
                local function set_the_background(close)
                    local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
                    set_background(content.cwd .. "/" .. content.value)
                    if close then
                        require("telescope.actions").close(prompt_bufnr)
                    end
                end

                map("i", "<C-p>", function()
                    set_the_background()
                end)

                map("i", "<CR>", function()
                    set_the_background(true)
                end)
            end

            local function background_image_selector(prompt, cwd)
                return function()
                    require("telescope.builtin").find_files({
                        prompt_title = prompt,
                        cwd = cwd,
                        previewer = false,

                        attach_mappings = function(prompt_bufnr, map)
                            select_background(prompt_bufnr, map)

                            return true
                        end,
                    })
                end
            end

            local mappings = {
                r = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace word" },
                g = {
                    name = "Git",
                    d = { ":DiffviewOpen<cr>", "Diff" },
                    ["dc"] = { ":DiffviewClose<cr>", "Diff Close" },
                    -- d = {
                    --     "<cmd>Gitsigns diffthis HEAD<cr>",
                    --     "Diff",
                    -- },
                },
                f = {
                    name = "Find",
                    f = { "<cmd>Telescope find_files<cr>", "Find files" },
                    g = { "<cmd>Telescope live_grep<cr>", "Find text in files" },
                    b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
                    t = { "<cmd>Telescope help_tags<cr>", "Find tags" },
                    r = { "<cmd>Telescope resume<cr>", "Last search" },
                    d = { "<cmd>Telescope diagnostics<cr>", "Find diagnostics" },
                },
                l = {
                    name = "LSP",
                    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                    i = { "<cmd>LspInfo<cr>", "Info" },
                    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
                    F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
                    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                    R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
                },
                s = {
                    name = "Tabs",
                    l = { ":vsp<cr>", "Split vertically" },
                    j = { ":sp<cr>", "Split horizontally" },
                    v = { "<C-w>t<C-w>H", "Change to vertical split" },
                    h = { "<C-w>t<C-w>K", "Change to horizontal split" },
                },
                d = {
                    name = "Debug",
                    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
                    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
                    i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
                    o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
                    O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
                    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
                    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
                    u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
                    x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
                },
                b = {
                    name = "Background",
                    i = {
                        background_image_selector("Background images", "~/personal-projects/background-images"),
                        "Background images",
                    },
                },
            }

            local opts = { prefix = "<leader>" }
            require("which-key").register(mappings, opts)
        end,
    },
}
