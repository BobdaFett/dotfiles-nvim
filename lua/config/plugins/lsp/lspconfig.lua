return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", lazy = false, config = true },
      "williamboman/mason-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    cmd = { "LspInstall", "LspUninstall", "LspInfo" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "rust_analyzer",
          "lua_ls",
          "clangd",
          "cssls",
          "texlab"
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function ()
            require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls())
          end,
        }
      })
    end,
  }
}
