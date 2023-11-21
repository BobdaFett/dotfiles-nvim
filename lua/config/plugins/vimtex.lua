return {
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_view_method = "C:\\Users\\lvas4\\Appdata\\Local\\sumatrapdf.exe --reuse-instance --forward-search @tex @line @pdf"


            -- setup keybind for vimtex autocompilation.
            vim.keymap.set("n", "<leader>vc", "<cmd>VimtexCompile<CR>")
        end
    }
}
