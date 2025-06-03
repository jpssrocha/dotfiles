--[[
-- Helper functions module
]]

local M = {}

---Map: set mapping with defaults
---@param m string | table : Mode
---@param map string : Keys to map
---@param to string : Command to map to
function M.map(m, map, to)
  local opts

  if m ~= 't' then
    opts = { noremap = true, silent = true }
  else
    opts = { silent = true }
  end

  vim.keymap.set(m, map, to, opts)
end

return M
