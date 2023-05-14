return function()
    return {
        attach_mode = "global",
        backends = { "lsp", "treesitter", "markdown", "man" },
        layout = { min_width = 28 },
        show_guides = true,
        filter_kind = false,
        keymaps = {
            ["l"] = "actions.jump"
        }
    }
end
