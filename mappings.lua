local M = {}

M.general = {
    -- normal mode key mappings
    n = {
        ['<leader>fp'] = {
            function()
                vim.cmd('Telescope projects')
            end,
            'find projects'
        }
    },
    -- insert mode key mappings
    i = {
        -- save
        ['<C-s>'] = {
            function()
                vim.cmd('update')
            end,
            'save'
        }
    }
}

M.telescope = {
    n = {
        ['<leader>fs'] = {
            function()
                -- if lsp is available, use call :Telescope lsp_document_symbols
                if vim.lsp.buf.server_ready() then
                    vim.cmd('Telescope lsp_document_symbols')
                end
            end,
            'find symbols'
        },
        ['<leader>fS'] = {
            function()
                -- if lsp is available, use call :Telescope lsp_workspace_symbols
                if vim.lsp.buf.server_ready() then
                    vim.cmd('Telescope lsp_workspace_symbols')
                end
            end,
            'find workspace symbols'
        },
        ['<leader>fd'] = {
            function()
                -- if lsp is available, use call :Telescope lsp_document_diagnostics
                if vim.lsp.buf.server_ready() then
                    vim.cmd('Telescope diagnostics')
                end
            end
        }
    }
}

return M
