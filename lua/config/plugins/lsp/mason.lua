-- This file will contain anything that has to do with LSP setup.
-- I think that I'm going to leave this part until tomorrow, but I'll start with the basic framework.

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
                        package_installed = "",  -- checkmark
                        package_pending = "",  -- arrow
                        package_uninstalled = ""  -- x
                    }
                }
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
                    "lua_ls"
                },
                automatic_installation = true
            })
        end
    },
}
