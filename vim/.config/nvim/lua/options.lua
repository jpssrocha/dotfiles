-- [[ Setting options ]]
-- See `:help vim.opt`

local g_options = {

  -- Encoding (necessary to use ç)
  encoding = 'utf-8',

  -- General options
  number = true,
  relativenumber = true,
  autoindent = true,
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
  wildmenu = true,
  clipboard = 'unnamed',
  hlsearch = true,
  smartcase = true,
  smartindent = true,
  scrolloff = 5,
  wrap = false, --  Let text go of screen
  sidescroll = 3,

  -- Split options
  splitbelow = true,
  splitright = true,

  -- Let me do undo even after closing file
  undodir = os.getenv 'HOME' .. '/.nvim/undodir',
  undofile = true,

  cursorline = true, --  cursorcolumn

  colorcolumn = { textwidth = 81 }, -- Color Column
}

-- Apply configs

for key, val in pairs(g_options) do
  vim.opt[key] = val
end
