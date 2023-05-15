-- Custom settings for rust_analyzer LSP
local M = {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    }
}
return M
