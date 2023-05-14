return {
    opt = {
        number = true,
        numberwidth = 2,
        relativenumber = true,
        clipboard = "unnamedplus",
        cursorline = true,
        termguicolors = true,
        signcolumn = "yes",
        splitbelow = true,
        splitright = true,
        undofile = true,
        expandtab = true,
        shiftwidth = 4,
        tabstop = 4,
        softtabstop = 4,
        fillchars = { eob = ' ' },
        cmdheight = 0,
        completeopt = { "menuone", "noselect" },
        fileencoding = "utf-8",
        foldenable = true,
        foldlevel = 99,
        foldlevelstart = 99,
        foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil,
        history = 100,
        ignorecase = true,
        infercase = true,
        laststatus = 3,
        linebreak = true,
        mouse = "a",
        pumheight = 10,
        scrolloff = 8,
        showmode = false,
        showtabline = 0,
        sidescrolloff = 8,
        smartcase = true,
        timeoutlen = 500,
        updatetime = 300,
        virtualedit = "block",
        wrap = false,
        writebackup = false,
    },

    g = {
        highlighturl_enabled = true,
        mapleader = " ",
        autoformat_enabled = true,
        codelens_enabled = true,
        lsp_handlers_enabled = true,
        cmp_enabled = true,
        autopairs_enabled = true,
        diagnostics_mode = 3,
        icons_enabled = true,
        ui_notifications_enabled = true,
    },

    t = vim.t.bufs and vim.t.bufs or { bufs = vim.api.nvim_list_bufs() },
}