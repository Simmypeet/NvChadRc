return function()
    local default_opts = require('plugins.configs.nvimtree')
    local opts = {
        diagnostics = {
            enable = true,
        },
        view = {
            adaptive_size = true,
        },
        on_attach = function(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            -- copy default mappings here from defaults in next section
            vim.keymap.set('n', 'l', api.node.open.edit, opts('open'))
            api.config.mappings.default_on_attach(bufnr)
        end
    };

    return vim.tbl_deep_extend('force', default_opts, opts)
end
