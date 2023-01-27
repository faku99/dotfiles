local treesitter_options = {
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
};

return {
    ['mhartington/oceanic-next'] = {},
    ['neovim/nvim-lspconfig'] = {
        config = function()
            require 'plugins.configs.lspconfig'
            require 'custom.plugins.lspconfig'
        end,
    },
    ['NvChad/ui'] = {
        override_options = {
            statusline = {
                separator_style = "block",
                overriden_modules = function() return require('custom.plugins.statusline') end,
                override = {
                    run = function(config)
                        local modules = require('nvchad_ui.statusline.modules')
                        if (config.overriden_modules) then
                            modules = vim.tbl_deep_extend("force", modules, config.overriden_modules)
                        end

                        return table.concat({
                            modules.mode(),
                            modules.fileInfo(),
                        })
                    end,
                },
            },
        },
    },
    ['nvim-treesitter/nvim-treesitter'] = {
        override_options = treesitter_options
    },
    ['tpope/vim-sleuth'] = {},
};
