-- Increment/Decrement
vim.api.nvim_set_keymap("n", "+", "<C-a>", { noremap = true })
vim.api.nvim_set_keymap("n", "-", "<C-x>", { noremap = true })

-- Make file executable
vim.api.nvim_set_keymap("n", "<leader>x", ":!chmod +x %<CR>", { noremap = true, silent = true })

-- Behave like the rest of the CAPITAL letters
vim.api.nvim_set_keymap("n", "Y", "yg$", { noremap = true })

-- Keep cursor at the beginning
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true })

-- Quit
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", { noremap = true })

-- Keep same paste
vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true })
-- vim.api.nvim_set_keymap("n", "p", '"_dP', { noremap = true })

-- Keeping it centered
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Do NOT lose your yank when you use
-- x
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })
-- d
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("v", "D", '"_D', { noremap = true })
-- c
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true })
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true })
vim.api.nvim_set_keymap("v", "C", '"_C', { noremap = true })

-- Save
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-s>", "<Esc>:w<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true })

-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true })

-- Move text up and down
-- Normal
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
-- Visual
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-Down>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-Up>", ":m .-2<CR>==", { noremap = true })
-- Visual Block
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", { noremap = true })

-- Move between splits
-- Vim
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
-- Arrows
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize +3<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize -3<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +3<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -3<CR>", { noremap = true })

-- Tmux
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>", { noremap = true })

-- Comment with 'Ctrl-/'
vim.api.nvim_set_keymap("n", "<C-_>", '<cmd>lua require("Comment.api").toggle.linewise()<CR>', { noremap = true })
vim.api.nvim_set_keymap("i", "<C-_>", '<esc><cmd>lua require("Comment.api").toggle.linewise()<CR>', { noremap = true })
vim.api.nvim_set_keymap(
	"v",
	"<C-_>",
	'<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
	{ noremap = true }
)

-- Source file
vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>so<CR>", { noremap = true })
