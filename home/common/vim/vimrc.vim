
" ===== keybinds =====

"" === insert ===
inoremap jk <Esc>
inoremap jj <C-j>

"" === normal ===
nnoremap <C-j><C-f> :Files<CR>
nnoremap <C-j><C-b> :Buffers<CR>
nnoremap <C-j><C-g> :Rg<CR>
nnoremap <C-j><C-h> :History<CR>
nnoremap <C-j><C-m> :Maps<CR>
nnoremap <C-j><C-e> :NERDTree<CR>
nnoremap <C-j><C-w> :w<CR>
nnoremap <C-j><C-x> :q<CR>

nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>

" ===== configurations =====

"" === display ===
set nocompatible
set number
set cursorline

"" === indent ===
set cindent

"" === files ===
set hidden
set noswapfile
set nobackup
set autoread
set ttyfast
set lazyredraw

"" === search ===
set incsearch
set hlsearch
set showmatch

" === completion ===
set completeopt=menuone,noinsert,noselect

" ===== color schemes =====

set termguicolors
set background=dark

" === plugin schemes ===

colorscheme gruvbox
" let g:airline_theme='gruvbox'

" ===== default plugins =====

syntax on
filetype plugin indent on
highlight Normal ctermbg=NONE guibg=NONE
runtime! ftplugin/man.vim

" ===== user =====

:command! -nargs=1 ManFullScreen call s:_ManFullScreen(<q-args>)

function s:_ManFullScreen(cmd)
	execute "Man " . a:cmd
	wincmd o
endfunction

