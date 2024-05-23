return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- Recommended settings from the documentation.
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Configure nvim-tree
		nvimtree.setup({
			view = {
				width = 50,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			filters = {
        enable = true,
        dotfiles = false,
        git_ignored = false,
      },
      git = {
        enable = true,
      }
		})

		-- Configure keybinds.
		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>") -- Toggle the file explorer.
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>") -- Toggle file finder.
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>") -- Collapses the file explorer.
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>") -- Refreshes the file explorer.
	end,
}
