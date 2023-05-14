-- Custom settings for rust_analyzer LSP
local M = {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
            rustfmt = {
                extraArgs = { "+nightly" },
            },
            imports = {
                granularity = {
                    enforce = true,
                }
            }
        },
    }
}
return M
