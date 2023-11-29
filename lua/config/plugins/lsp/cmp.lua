return {
	-- Handles completion.
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	name = "luasnip",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		"rafamadriz/friendly-snippets",
	-- 	},
	-- },
	{
		"hrsh7th/nvim-cmp",
		name = "cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "L3MON4D3/LuaSnip", name = "luasnip" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lua" },
			-- { "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
      { "VonHeikemen/lsp-zero.nvim" },
		},
    event = "InsertEnter",
		config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

			require("luasnip.loaders.from_vscode").lazy_load()
			vim.opt.completeopt = "menu,menuone,noselect"

      local cmp = require("cmp")
      -- local cmp_action = lsp_zero.cmp_action()
			cmp.setup({
				-- snippet = {
				-- 	expand = function(args)
				-- 		luasnip.lsp_expand(args.body)
				-- 	end,
				-- },
				mapping = cmp.mapping.preset.insert({ -- Mappings are definitely subject to change.
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				-- sources = cmp.config.sources({
				-- 	{ name = "nvim_lsp" }, -- lsp
				-- 	{ name = "luasnip" }, -- snippets plugins
				-- 	{ name = "buffer" }, -- text within the current buffer
				-- 	{ name = "path" }, -- fs paths
				-- }),
				formatting = lsp_zero.cmp_format(),
			})
		end,
	},
}
