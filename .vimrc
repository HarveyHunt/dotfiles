runtime! archlinux.vim

"Automatic reloading of .vimrc
au BufWritePost .vimrc so ~/.vimrc

" Start vundle to handle plugins and then set up the rest of the plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'davidhalter/jedi-vim'
Plugin 'sjl/gundo.vim'
call vundle#end()
filetype plugin indent on 

"### General
set tags=tags;/ " Look recursively upwards for a tags file
set tw=79 " Width of document
set nowrap " Don't automatically wrap on load
set fo-=t " Don't automatically wrap during typing
highlight ColorColumn ctermbg=233
call matchadd('ColorColumn', '\%80v', 100)
set number
set wildmenu
set wildmode=full " ZSH like autocompletion
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set foldmethod=syntax
set foldlevel=99
colorscheme xoria256 
set background=dark
syntax enable
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autochdir
set hlsearch
set mouse=a         " Enable the mouse for all modes
au WinEnter * setlocal number
au WinLeave * setlocal nonumber

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  filetype plugin indent on
  autocmd FileType c setlocal ts=8 sw=8 sts=8 noet ai
  autocmd FileType dts setlocal ts=8 sw=8 sts=8 noet ai
  autocmd FileType cpp setlocal ts=8 sw=8 sts=8 noet ai
  autocmd FileType py setlocal ts=4 sw=4 sts=4 et ai
  autocmd FileType rs setlocal ts=4 sw=4 sts=4 et ai
endif

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

"Allow the use of enter in normal mode.
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

map <space> <leader>

" Hide highlighting
map <leader>c :noh<CR>

" Python
map <leader>r :!python % <CR>

" Gundo
map <leader>u :GundoToggle<CR>

" Nerdtree
map <leader>n :NERDTreeToggle<CR>
let NERDChristmasTree=1

" Doxygen
map <leader>d :Dox<CR>

" vim-airline
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
map <leader>l :bn<CR>
map <leader>h :bp<CR>
map <leader>q :bd<CR>

" Syntastic
let g:syntastic_rust_checkers = ['rustc']
