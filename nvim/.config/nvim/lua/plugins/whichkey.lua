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
                -- Replace word under cursor
                {
                    "<leader>r",
                    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
                    desc = "Replace word",
                },

                -- Git mappings
                {
                    "<leader>gd",
                    ":DiffviewOpen<cr>",
                    desc = "Diff",
                },
                {
                    "<leader>gdc",
                    ":DiffviewClose<cr>",
                    desc = "Diff Close",
                },

                -- Find mappings
                {
                    "<leader>ff",
                    "<cmd>Telescope find_files<cr>",
                    desc = "Find files",
                },
                {
                    "<leader>fg",
                    "<cmd>Telescope live_grep<cr>",
                    desc = "Find text in files",
                },
                {
                    "<leader>fb",
                    "<cmd>Telescope buffers<cr>",
                    desc = "Find buffers",
                },
                {
                    "<leader>ft",
                    "<cmd>Telescope help_tags<cr>",
                    desc = "Find tags",
                },
                {
                    "<leader>fr",
                    "<cmd>Telescope resume<cr>",
                    desc = "Last search",
                },
                {
                    "<leader>fd",
                    "<cmd>Telescope diagnostics<cr>",
                    desc = "Find diagnostics",
                },

                -- LSP mappings
                {
                    "<leader>la",
                    "<cmd>lua vim.lsp.buf.code_action()<cr>",
                    desc = "Code Action",
                },
                {
                    "<leader>li",
                    "<cmd>LspInfo<cr>",
                    desc = "Info",
                },
                {
                    "<leader>lf",
                    "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
                    desc = "Format",
                },
                {
                    "<leader>lF",
                    "<cmd>LspToggleAutoFormat<cr>",
                    desc = "Toggle Autoformat",
                },
                {
                    "<leader>lr",
                    "<cmd>lua vim.lsp.buf.rename()<cr>",
                    desc = "Rename",
                },
                {
                    "<leader>lR",
                    "<cmd>TroubleToggle lsp_references<cr>",
                    desc = "References",
                },

                -- Tabs (Splits) mappings
                {
                    "<leader>sl",
                    ":vsp<cr>",
                    desc = "Split vertically",
                },
                {
                    "<leader>sj",
                    ":sp<cr>",
                    desc = "Split horizontally",
                },
                {
                    "<leader>sv",
                    "<C-w>t<C-w>H",
                    desc = "Change to vertical split",
                },
                {
                    "<leader>sh",
                    "<C-w>t<C-w>K",
                    desc = "Change to horizontal split",
                },

                -- Debug mappings
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

                -- Background image picker
                {
                    "<leader>bi",
                    background_image_selector("Background images", "~/personal-projects/background-images"),
                    desc = "Background images",
                },
            }


            local opts = { prefix = "<leader>" }
            require("which-key").add(mappings, opts)
        end,
    },
}
