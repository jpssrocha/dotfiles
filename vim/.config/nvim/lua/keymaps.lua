-- Mappings --

local map = require('utils').map

-- -- Modes --

-- Normal       : n
-- Insert       : i
-- Visual       : v
-- Visual Block : x
-- Term         : t
-- Command      : c

-- Easy resizing
map('n', '<C-Up>', ':resize +2<CR>')
map('n', '<C-Down>', ':resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')

-- General mappings
map({ 'n', 'i' }, '<F6>', '<cmd>setlocal spell! spelllang=en_us<CR>')
map({ 'n', 'i' }, '<F7>', '<cmd>setlocal spell! spelllang=pt_br<CR>')
map({ 'n', 'i' }, '<leader>rc', 'split ~/.vimrc<CR>')
map({ 'n', 'i' }, '<C-s>', '<ESC>:w<Enter>')
map({ 'n', 'i' }, '<leader>t', '<cmd>.!date +"\\# \\%d-\\%m-\\%Y \\%H:\\%M" <Enter>o<Enter>')

-- Dumb remaps
map('n', 'Y', 'y$')
map('n', 'Q', 'q')
map('n', 'gD', ':s/^.\\+$//<CR>') -- Delete line content keeping the line

-- Make Ctrl I and Ctrl O ocidental! (right goes foward)
map('n', '<C-o>', '<C-i>')
map('n', '<C-i>', '<C-o>')

-- Move text
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Copy and paste (need vim gtk or gvim)
map('v', '<leader>y', '"+y')
map('n', '<leader>y', '"+y')
map('i', '<C-v>', '<Esc>"+p')

-- Remap S to substitute all
map('n', '<leader>S', ':%s//g<Left><Left>')
map('v', '<leader>S', ':%s//g<Left><Left>')

-- Ident easier
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Better split navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

--  Guide navigation
map('n', '<leader>n', '<Esc>/<++><Enter>"_c4l')
