return function()
    local default_opts = require('plugins.configs.treesitter')
    local opts = {
        indent = { enable = false },
        auto_install = true,
    }

    return vim.tbl_deep_extend('force', default_opts, opts)
end
