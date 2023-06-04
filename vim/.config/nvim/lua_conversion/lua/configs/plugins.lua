local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data" .. "/site/pack/packer/start/packer.nvim")

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Couldn't find packer!")
  return
end


-- Install your plugins here
return packer.startup(function(use)
    -- Default
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins

    -- Appearence
    use 'morhetz/gruvbox'

    -- File navigation
    use 'scrooloose/nerdtree'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- Movement
    use 'justinmk/vim-sneak'   -- Vertical movement helper
    use 'psliwka/vim-smoothie' -- Smooth scroll so i don't loose context

    -- Terminal task helpers
    use 'kassio/neoterm'
    use 'tpope/vim-fugitive'    -- Git support
    use 'vim-airline/vim-airline'
    use 'vimwiki/vimwiki'

    -- Language support
    use {'neoclide/coc.nvim', branch = 'release'} -- 3rt party LSP TODO: Use native LSP
    use 'lervag/vimtex'
    use 'pangloss/vim-javascript'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'maxmellon/vim-jsx-pretty'
    use 'pantharshit00/vim-prisma'                -- Get intelli-sense in prisma ORM files
    use {'cespare/vim-toml',  branch = 'main'}

    -- Formatting helpers
    use 'tpope/vim-surround' -- Ex: S( to surround selection with parenthesis ds( to remove
    use 'godlygeek/tabular'  -- Automatic alignment in respect to something :Tabularize /<tag>
    use 'alvan/vim-closetag'
    use 'sirver/UltiSnips'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
    require("packer").sync()
    end
end)
