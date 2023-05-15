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

return M
