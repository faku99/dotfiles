return {
    ['nvim-treesitter/nvim-treesitter'] = {
        override_options = {
            ensure_installed = {
                "vim",
                "lua",
                "bash",
                "c",
            },
            indent = {
                enable = false,
                disable = 'c',
            },
        },
    },
    ['tpope/vim-sleuth'] = {},
};
