return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr

				-- set keybinds
				local keys = vim.keymap
				keys.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				keys.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				keys.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
				keys.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
				keys.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
				keys.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
				keys.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart rename
				keys.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for file
				keys.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions.
				keys.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- Show definition and references.
				keys.set("n", "gD", vim.lsp.buf.declaration, opts) -- show lsp definitions
				keys.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
				keys.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Show lsp implementations
			end

			-- configure autocompletion
			local capabilities = cmp_nvim_lsp.default_capabilities()

			--configure html server
			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["rust_analyzer"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["csharp_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["pyright"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["texlab"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["clangd"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["taplo"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["sqlls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						-- Allow server to recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- Make server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,
	},
}
