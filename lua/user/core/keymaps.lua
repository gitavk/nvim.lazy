vim.g.mapleader = " "

local keymap = vim.keymap.set -- for conciseness
-- Silent keymap option
local opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Close buffers
keymap("n", "<leader>x", ":Bdelete!<CR>", opts)
keymap("n", "<leader>z", ":Bdelete!<CR>:q<CR>", opts)
keymap("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })

-- Plugins --
-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", {})

-- telescope
keymap("n", "<leader>t", ":Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap("n", "<leader>g", ":Telescope git_status<cr>", {})
keymap("n", "<leader>b", ":Telescope buffers<CR>", {})
keymap("n", "<leader>tr", ":Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap("n", "<leader>ft",":TodoTelescope<cr>", { desc = "Find todos" })

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- run current code, for curl
keymap("n", "<leader>r", ":set splitright | vnew | set filetype=sh | read !sh # | python3 -m json.tool<cr>", opts)
