return {
	{
		"VonHeikemen/lsp-zero.nvim",
    lazy = true,
    config = false,
		init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
			local lsp_zero = require("lsp-zero")

			-- setup the lsp_zero on_attach function.
			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)
		end,
	},
}
