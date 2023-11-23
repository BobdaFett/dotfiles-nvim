return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_compiler_method = "latexmk"

			-- setup keybind for vimtex autocompilation.
			vim.keymap.set("n", "<leader>vc", "<cmd>VimtexCompile<CR>")
		end,
	},
}
