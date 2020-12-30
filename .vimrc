runtime! archlinux.vim
let mapleader = "\<Space>"

"Automatic reloading of .vimrc
au BufWritePost .vimrc so ~/.vimrc

" Start vim-plug to handle plugins and then set up the rest of the plugins
call plug#begin("~/.vim/plugged")
" UI Plugins
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
Plug 'chriskempson/base16-vim'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Search
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" Misc
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
call plug#end()

" General
set tags=tags;/ " Look recursively upwards for a tags file
set tw=79 " Width of document
set nowrap " Don't automatically wrap on load
set fo-=t " Don't automatically wrap during typing
set undodir=~/.vimundo
set undofile

" UI changes
colorscheme base16-harmonic-dark
set background=dark
syntax enable
call matchadd('ColorColumn', '\%80v', 100)
set list lcs=tab:\┊\ 
set showcmd
set showmatch
set number
set hlsearch
set mouse=a
au WinEnter * setlocal number
au WinLeave * setlocal nonumber
set noshowmode
set laststatus=2

set wildmenu
set wildmode=full

" Tabs / spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set lazyredraw

" Folds
set foldenable
set foldmethod=syntax
set foldlevel=99

" Search
set ignorecase
set smartcase
set incsearch
set autochdir

" Keybinds
nnoremap <leader><leader> <c-^>
nmap <leader>w :w<CR> " Quick-save
map <leader>l :bnext<CR>
map <leader>h :bprevious<CR>
map <leader>q :bdelete<CR>
map <leader>c :nohlsearch<CR>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Per language settings
set nocompatible
filetype off

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

autocmd FileType c,cpp,java,php,ruby,python,rs autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Plugin config

" lightline.vim
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [['mode', 'paste'],
            \            ['gitbranch', 'readonly', 'filename', 'modified']]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }

" rust.vim
let g:rustfmt_autosave = 1

" Highlighting
highlight ALEWarning ctermbg=none cterm=underline
highlight ALEError ctermbg=none cterm=underline
highlight ColorColumn ctermbg=233

" ale
let g:ale_linters = {'rust': ['analyzer']}

" autocomplete
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rust-analyzer'],
    \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
