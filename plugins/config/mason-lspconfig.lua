return function(_, opts)
    require('mason-lspconfig').setup(opts)

    local lspconfig_on_attach = require("plugins.configs.lspconfig").on_attach;
    local lspconfig_capabilities = require("plugins.configs.lspconfig").capabilities;

    local nvim_lspconfig = require("lspconfig")
    local registry = require("mason-registry")
    local mason_lspconfig = require("mason-lspconfig")

    -- get the list of installed server
    local mappings = mason_lspconfig.get_mappings()
    local installed_servers = registry.get_installed_package_names()

    for _, mason_name in pairs(installed_servers) do
        local lspconfig_name = mappings.mason_to_lspconfig[mason_name]

        if lspconfig_name == nil then
            goto continue
        end

        if lspconfig_name == 'lua_ls' then
            goto continue
        end

        -- try to load the 'custom.servers.<mason_name>' module
        local ok, custom_config = pcall(require, 'custom.server.' .. mason_name)
        local config = {
            on_attach = function(client, buffer)
                lspconfig_on_attach(client, buffer)

                -- code lens support
                if client.server_capabilities.codeLensProvider then
                    vim.lsp.codelens.refresh()

                    vim.keymap.set("n", "<leader>ll", function() vim.lsp.codelens.refresh() end,
                        { buffer = buffer, desc = "refresh code lens" })
                    vim.keymap.set("n", "<leader>lL", function() vim.lsp.codelens.run() end,
                        { buffer = buffer, desc = "run code lens" })
                end

                -- format support
                vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end,
                    { buffer = buffer, desc = "format buffer" })

                -- document symbol search
                vim.keymap.set("n", "<leader>lb", function() require('telescope.builtin').lsp_document_symbols() end,
                    { buffer = buffer, desc = "find document symbols", noremap = true, })

                -- diagnostic search
                vim.keymap.set("n", "<leader>lD", function() require('telescope.builtin').diagnostics() end,
                    { buffer = buffer, desc = "find workspace diagnostics" })

                -- float diagnostic
                vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end,
                    { buffer = buffer, desc = "show document diagnostics" })

                -- code actions
                vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end,
                    { buffer = buffer, desc = "code actions" })

                -- rename
                vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end,
                    { buffer = buffer, desc = "rename" })

                -- global serach query
                vim.keymap.set("n", "<leader>lS", function()
                        vim.ui.input({ prompt = "Symbol Query: " }, function(query)
                            if query then require("telescope.builtin").lsp_workspace_symbols { query = query } end
                        end)
                    end,
                    { buffer = buffer, desc = "find workspace symbols" })
            end,
            capabilities = lspconfig_capabilities,
        }

        if ok then
            -- if it is a table, extend the config
            -- if it is a function, call it with the config as an argument
            if type(custom_config) == 'table' then
                config = vim.tbl_extend('force', config, custom_config)
            elseif type(custom_config) == 'function' then
                config = custom_config(config)
                goto continue
            end
        end

        if lspconfig_name then
            nvim_lspconfig[lspconfig_name].setup(config)
        end

        ::continue::
    end
end
