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
                    local content = require("telescope.actions.state").get_selected_entry()
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

                -- Background image picker
                {
                    "<leader>bi",
                    background_image_selector("Background images", "~/personal-projects/background-images"),
                    desc = "Background images",
                },
            }

            require("which-key").add(mappings)
        end,
    },
}
