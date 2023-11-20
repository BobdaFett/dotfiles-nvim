return {

    -- This is currently broken. For some reason cmake could not find my C compiler (which I definitely have installed)
    --[[ {   
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }, ]]

    {
        "nvim-telescope/telescope-fzy-native.nvim"
    },
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        event = "VeryLazy",
        branch = "0.1.x",
        lazy = false,
        dependencies = { 
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()   
            local telescope = require("telescope")

            telescope.setup({
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true,
                    },
                },
            })

            telescope.load_extension("fzy_native")


            -- Configure keybinds here - configuring in other files doesn't seem to work right.
            -- Supposedly this is due to lazy loading, but I've disabled that.
            local keys = vim.keymap
            local builtin = require("telescope.builtin")
            keys.set("n", "<leader>ff", builtin.find_files, {})
            keys.set("n", "<leader>fg", builtin.live_grep, {})
            keys.set("n", "<leader>fb", builtin.buffers, {})
            keys.set("n", "<leader>fh", builtin.help_tags, {})
        end
    },
}
