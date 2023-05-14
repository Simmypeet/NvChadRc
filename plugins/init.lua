local plugins = {
    -- github copilot extension
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        opts = require('custom.plugins.opts.copilot'),
        config = require('custom.plugins.config.copilot'),
    },

    -- disable default color highlights
    {
        "NvChad/nvim-colorizer.lua",
        enable = false,
    },

    -- mason lsp installer
    {
        "williamboman/mason.nvim",
        opts = require('custom.plugins.opts.mason'),
    },

    -- projects manager
    {
        'ahmedkhalf/project.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        lazy = false,
        config = require('custom.plugins.config.project')
    },

    -- lsp connfiguration
    {
        'neovim/nvim-lspconfig',
    },

    -- mason-lspconfig
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
        },
        lazy = false,
        config = require('custom.plugins.config.mason-lspconfig')
    },

    -- better UI prettifier
    {
        'stevearc/dressing.nvim',
        event = 'InsertEnter',
        config = require('custom.plugins.config.dressing'),
    },

    -- auto save
    {
        "907th/vim-auto-save",
        config = require('custom.plugins.config.vim-auto-save'),
        lazy = false,
    },

    -- undo tree
    {
        'mbbill/undotree',
        lazy = false,
    },

    -- file explorer
    {
        'nvim-tree/nvim-tree.lua',
        opts = require('custom.plugins.opts.nvim-tree')
    },

    -- nvim notify
    {
        'rcarriga/nvim-notify',
        lazy = false,
        config = require('custom.plugins.config.nvim-notify')
    },

    -- override nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = require('custom.plugins.opts.nvim-treesitter')
    },

    -- discord presence
    {
        "andweeb/presence.nvim",
        lazy = false,
        opts = require('custom.plugins.opts.presence'),
        config = require('custom.plugins.config.presence')
    },

    -- better escaping shortcuts
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = require('custom.plugins.config.better-escape'),
    },

    -- scroll bar
    {
        'petertriho/nvim-scrollbar',
        event = { 'BufRead' },
        opts = require('custom.plugins.opts.nvim-scrollbar'),
        config = require('custom.plugins.config.nvim-scrollbar'),
    },

    -- aerial symbol outline
    {
        'stevearc/aerial.nvim',
        event = { 'BufRead' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        opts = require('custom.plugins.opts.aerial'),
        config = require('custom.plugins.config.aerial')
    },
}

return plugins
