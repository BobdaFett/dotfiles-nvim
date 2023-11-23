return {
	-- {
	--     "bluz71/vim-nightfly-guicolors",
	--     priority = 1000,
	--     config = function()
	--         -- load scheme here
	--         vim.cmd([[colorscheme nightfly]])
	--     end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,

		init = function()
			-- load scheme here
			vim.cmd([[colorscheme catppuccin]])
		end,
		opts = {
			flavour = "macchiato",
			transparent_background = false,
			term_colors = true,
			integrations = {
				mason = true,
				treesitter = true,
				telescope = true,
				cmp = true,
			},
			dim_inactive = { enabled = true },
		},
	},
}
