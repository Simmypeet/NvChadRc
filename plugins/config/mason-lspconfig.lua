return function(_, opts)
    require('mason-lspconfig').setup(opts)

    local lspconfig = require("plugins.configs.lspconfig")
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

        -- try to load the 'custom.servers.<mason_name>' module
        local ok, custom_config = pcall(require, 'custom.servers.' .. mason_name)

        local config = {
            on_attach = lspconfig.on_attach,
            capabilities = lspconfig.capabilities,
            handlers = lspconfig.handlers,
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
