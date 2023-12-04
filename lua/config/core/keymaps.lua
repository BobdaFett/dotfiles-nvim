vim.g.mapleader = " " -- set the leader key to the space key. Default leader is "\"

local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>") -- In INSERT mode, jk will exit insert back into NORMAL mode.
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clears search highlights.
keymap.set("n", "x", '"_x') -- delete character, but do not copy into register.
keymap.set("n", "W", "b") -- move to the beginning of the word, this is the same as b

-- Increment and decrement numbers.
keymap.set("n", "<leader>+", "<C-a>") -- Increment numbers
keymap.set("n", "<leader>-", "<C-x>") -- Decrement numbers

-- Window split keys.
keymap.set("n", "<leader>ww", "<C-w>w") -- Switch selected window
keymap.set("n", "<leader>wv", "<C-w>v") -- Split window vertically
keymap.set("n", "<leader>wh", "<C-w>h") -- Split window horizontally
keymap.set("n", "<leader>we", "<C-w>=") -- Make the windows equal length/height
keymap.set("n", "<leader>wx", ":close<CR>") -- Close the corrently selected split window.

-- Tab keys
keymap.set("n", "<leader>to", ":tabnew<CR>") -- Open new tab.
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- Go to the next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- Go to the previous tab

-- vim-maximizer
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>") -- Maximizes current window

-- nvim-tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>") -- Toggle the file explorer.
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>") -- Toggle file finder.
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>") -- Collapses the file explorer.
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>") -- Refreshes the file explorer.

-- telescope
-- local telescope = require("telescope.builtin")
-- keymap.set("n", "<leader>ff", telescope.find_files, {})
-- keymap.set("n", "<leader>fg", telescope.live_grep, {})
-- keymap.set("n", "<leader>fb", telescope.buffers, {})
-- keymap.set("n", "<leader>fh", telescope.helptags, {})

-- noice
keymap.set("n", "<leader>nn", "<cmd>Noice<CR>") -- Open noice command history
keymap.set("n", "<leader>nt", "<cmd>Noice telescope<CR>") -- Open noice command history - uses telescope as an interface.
keymap.set("n", "<leader>ne", "<cmd>Noice errors<CR>") -- Open noice error history
keymap.set("n", "<leader>ns", "<cmd>Noice stats<CR>") -- Show debugging stats
keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<CR>") -- Dismiss all on-screen messages

-- trouble plugin
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>") -- Toggle the trouble window
keymap.set("n", "<leader>xr", "<cmd>TroubleRefresh<CR>") -- Manually refresh the trouble list
