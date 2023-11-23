return {
	{
		"github/copilot.vim",
		name = "copilot",
		lazy = false,
		config = function()
			-- setup keybinds for copilot accept
			vim.keymap.set("n", "<C-j>", "<Plug>(copilot-accept)", { noremap = false })
		end,
	},
}
