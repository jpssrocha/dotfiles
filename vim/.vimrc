" Plugins

call plug#begin('~/.config/nvim/plugs')

Plug 'scrooloose/nerdtree'
Plug 'kassio/neoterm'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'                           " S( to surround selection ds( to remove
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'                            " Automatic alignment in respect to something :Tab /<tag>
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'psliwka/vim-smoothie'                         " Smooth scroll so i don't loose context
Plug 'sirver/UltiSnips'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'pantharshit00/vim-prisma'
Plug 'starcraftman/vim-eclim'
Plug 'tpope/vim-commentary'

call plug#end()

" Sourcings

source $HOME/.config/nvim/plug-config/coc.vim

let mapleader = "ç"

" Default stuff so this config works the same with vim and nvim
set nocompatible
filetype plugin indent on
syntax on

" Start up  hardtime
let g:hardtime_default_on = 1

" Gruuuvbox!
colorscheme gruvbox
set background=dark

" Encoding (necessary to use ç)
scriptencoding utf-8
set encoding=utf-8

" General options
set number relativenumber
set autoindent
set tabstop=4
set shiftwidth=4 softtabstop=4
set expandtab
set wildmenu
set path+=**
set clipboard=unnamed
set hlsearch
set smartcase
set smartindent
set scrolloff=5
set nowrap " Let text go of screen
set sidescroll=3

" Let me do undo even closing file
set undodir=~/.vim/undodir
set undofile

" Highlight line and column of cursor so we find it easier
au WinLeave * set nocursorline "nocursorcolumn
au WinEnter * set cursorline "cursorcolumn
set cursorline "cursorcolumn

" Color Column adjust to each language
highlight ColorColumn ctermbg=0 guibg=lightgrey
set colorcolumn=81

" General mappings
noremap <F6> :setlocal spell! spelllang=en_us<CR>
noremap <F7> :setlocal spell! spelllang=pt_br<CR>
noremap <leader>rc :split ~/.config/init.vim<CR>
noremap <C-s> :w<CR>
noremap <F8> :set nohls! hls?<CR>
noremap <leader>t :.!date +"\# \%d-\%m-\%Y \%H:\%M" <Enter>o<Enter>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

" Dumb remaps
nnoremap Y y$
nnoremap Q q
nnoremap gD :s/^.\+$//<CR>

"" Make Ctrl I and Ctrl O ocidental! (right goes foward)
noremap <C-o> <C-i>
noremap <C-i> <C-o>

" Move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Copy and paste (need vim gtk or gvim)
vnoremap <leader>y "+y
nnoremap <leader>y "+y
inoremap <C-v> <Esc>"+p

" Remap S to substitute all
nnoremap <leader>S :%s//g<Left><Left>
vnoremap <leader>S :%s//g<Left><Left>

" Ident easier
vnoremap < <gv
noremap > >gv

" Better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitbelow splitright

" Guide navigation
noremap <leader>n <Esc>/<++><Enter>"_c4l

" NERDTree

noremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowLineNumbers=1  " enable line numbers
autocmd FileType nerdtree setlocal relativenumber " make sure relative line numbers are used

" Latex

autocmd FileType tex noremap <F2> :w<Enter>:!pdflatex %  <Enter>
autocmd FileType tex noremap <F3> :!zathura $(echo $(echo %.pdf \| cut -f1 -d.).pdf) &<Enter><Enter>

" Markdown
" autocmd FileType markdown noremap <F2> :w<Enter> :!pandoc \
"             \--filter pandoc-citeproc \
"             \--from=markdown+tex_math_single_backslash+tex_math_dollars+raw_tex \
"             \--to=latex \
"             \--output=test.pdf \
"             \--pdf-engine=xelatex \
"             \-V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" \
"             \-o $(echo %:r.pdf) %  <Enter>
autocmd FileType markdown noremap <F3> :!zathura $(echo $(echo % \| rev \| cut -f1 -d/ \| rev \| cut -f1 -d.).pdf) &<Enter><Enter>
autocmd FileType markdown nnoremap <leader>h :r ~/Dropbox/.latex/markdown_header.md<Enter>kdd<leader>n
autocmd FileType markdown :hi link markdownError Normal<cr>
au BufEnter *.md :lcd %:p:h

" Python
autocmd FileType python noremap <F2> :w<Enter>:T python % <Enter>
autocmd FileType python set colorcolumn=80
autocmd FileType python vnoremap <leader>c I#  <Esc>
autocmd FileType python vnoremap <leader>uc :s/#//g<Enter>
autocmd FileType python noremap <leader>py :T acb; ipython<cr>

" HTML
autocmd FileType html noremap <F2> :w<Enter>:!xdg-open % & <Enter>

" JS
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Java
autocmd FileType java noremap <F2> :w<Enter>:T javac $(find . -name '*.java') && java % <Enter>
autocmd FileType java noremap <F3> :w<Enter>:T java % <Enter>

" NeoTerm
let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=11 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
nnoremap <leader><cr> :TREPLSendLine<cr>j " send current line and move down
vnoremap <leader><cr> :TREPLSendSelection<cr> " send current selection
noremap  <F5> :Ttoggle resize=10<cr> " toggle terminal
tnoremap <Esc> <C-\><C-n>

"""Shortcuts vim-fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gdf :Git diff<CR>

" Coc tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" fzf
noremap <leader>f :w<cr>:Files<cr>

" VimWiki
let g:vimwiki_list = [{'path': '~/Dropbox/eBrain/vimwiki',
                      \'path_html': '~/Dropbox/eBrain/vimwiki_html',
                      \'template_path': '$HOME/Dropbox/eBrain/vimwiki/templates',
                      \'template_default': 'default',
                      \'template_ext': '.html'}]

let g:vimwiki_global_ext = 0 " Fix markdown file bug due to vimwiki (issue 871)
autocmd FileType vimwiki noremap <F2> :w<Enter> :VimwikiAll2HTML<Enter>
autocmd FileType vimwiki noremap <F3> :Vimwiki2HTMLBrowse<Enter>

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" Symbol rename
nmap <leader>rn <Plug>(coc-rename) 

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Show documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Sneak
let g:sneak#label = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Fix bug with nvim python by showing a specific pynvim binary on an isolated
" environment
let g:python3_host_prog = "$HOME/Dropbox/py_quick_access/pynvim/bin/python"

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
