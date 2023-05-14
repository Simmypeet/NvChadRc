return function(_, _)
    vim.g.auto_save = 1
    vim.g.auto_save_events = { "BufLeave" }
end
