return function()
    local config = require('plugins.configs.mason')
    table.insert(config.ensure_installed, 'rust-analyzer')
    return config
end
