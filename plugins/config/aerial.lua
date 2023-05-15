return function(_, opts)
    require('aerial').setup(opts)

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            vim.keymap.set('n', '<leader>lp', ':AerialToggle right<CR>', { buffer = args.buf, desc = "toggle symbol outlines"})
        end,
    })
end
