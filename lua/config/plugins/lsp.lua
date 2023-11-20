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
            
            mason.setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "cmake",
                "texlab",
                "pyright",
                "rust_analyzer",
                "sqlls",
                "taplo",
                "csharp_ls"
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
    },
}
