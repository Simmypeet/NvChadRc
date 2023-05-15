---@type ChadrcConfig 
local M = {}

M.ui = { theme = 'tundra', nvdash = { load_on_startup = true }, lsp_semantic_tokens = false, }

M.plugins = 'custom.plugins'
M.mappings = require('custom.mappings')

return M
