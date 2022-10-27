local options = {

    -- Encoding (necessary to use ç)
    encoding="utf-8",

    -- Gruuuvbox!
    background="dark",

    -- General options
    number = true,
    relativenumber = true,
    autoindent = true,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    wildmenu = true,
    clipboard = "unnamed",
    hlsearch = true,
    smartcase = true,
    smartindent = true,
    scrolloff = 5,
    wrap = false,  --  Let text go of screen
    sidescroll = 3,

    -- Split options
    splitbelow = true,
    splitright = true,

    -- Let me do undo even after closing file
    undodir = "~/.nvim/undodir",
    undofile = true,

    cursorline = true,  --  cursorcolumn

    colorcolumn = 81, -- Color Column
}

-- Apply configs

for key, val in pairs(options) do
    vim.opt[key] = val
end

-- Commands

local commands = {
    -- Sane default configs to make sure that are in place
    [[filetype plugin indent on]],
    [[syntax on]],
    [[scriptencoding utf-8]],

    -- Operational commands
    [[highlight ColorColumn ctermbg=0 guibg = lightgrey]],
    [[path+=**]],

    -- Plugins
    [[source $HOME/.config/nvim/plug-config/coc.vim]],
    [[colorscheme gruvbox]],  -- Use Gruuuvbox!
}

-- Apply commands
for i = 1, #commands do
    vim.cmd(commands[i])
end

