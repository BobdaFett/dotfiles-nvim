return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			-- enable mason and configure icons
			mason.setup({
				PATH = "prepend",
				ui = {
					icons = {
						package_installed = "", -- checkmark
						package_pending = "", -- arrow
						package_uninstalled = "", -- x
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"clangd",
					"texlab",
					"pyright",
					"rust_analyzer",
					"sqlls",
					"taplo",
					"csharp_ls",
					"html",
					"lua_ls",
					"lemminx",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"williamboman/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			-- enable mason and null-ls integration
			-- we're using mason-null-ls as the main source of truth,
			-- as null-ls has been deprecated.
			local mason_null_ls = require("mason-null-ls")
			mason_null_ls.setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"eslint",
				},
				automatic_installation = false,
				handlers = {},
			})

			-- add null-ls handlers to mason
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint_d,
				},
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			})
		end,
	},
}
