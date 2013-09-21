runtime! archlinux.vim

"Automatic reloading of .vimrc
au BufWritePost .vimrc so ~/.vimrc

" Start pathogen to handle plugins and then set up the rest of the plugins
filetype off
call pathogen#infect()
call pathogen#helptags()

"### General
set tw=79 " Width of document
set nowrap " Don't automatically wrap on load
set fo-=t " Don't automatically wrap during typing
highlight ColorColumn ctermbg=233
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
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autochdir
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set number
au WinEnter * setlocal number
au WinLeave * setlocal nonumber
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  filetype plugin indent on
  autocmd FileType c setlocal ts=8 sw=8 sts=8 noet ai list listchars=tab:┊\ 
  autocmd FileType py setlocal ts=4 sw=4 sts=4 et ai
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Gundo
map <leader>u :GundoToggle<CR>

" Nerdtree
map <leader>n :NERDTreeToggle<CR>
let NERDChristmasTree=1
" vim-airline
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
map <leader>l :bn<CR>
map <leader>h :bp<CR>
map <leader>q :bd<CR>
