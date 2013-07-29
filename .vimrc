runtime! archlinux.vim

"Automatic reloading of .vimrc
au BufWritePost .vimrc so ~/.vimrc

" Start pathogen to handle plugins and then set up the rest of the plugins
filetype off
call pathogen#infect()
call pathogen#helptags()

" Line numbers and length.
set number " Show line numbers
set tw=79 " Width of document
set nowrap " Don't automatically wrap on load
set fo-=t " Don't automatically wrap during typing
highlight ColorColumn ctermbg=233

" Set tabs as spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Folding
set foldmethod=indent
set foldlevel=99

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
colorscheme xoria256 
syntax enable

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autochdir
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Tasklists
map <leader>td <Plug>TaskList

" Gundo
map <leader>g :GundoToggle<CR>

" Python-Mode settings
let g:pymode_doc = 1
let g:pymode_run = 1
let g:pymode_lint = 1
let g:pymode_rope = 1
let g:pymode_breakpoint = 1

let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E501,E128"
let g:pymode_lint_select = ""
let g:pymode_lint_onfly = 1
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_lint_cwindow = 1
let g:pymode_lint_message = 1
let g:pymode_lint_signs = 1
let g:pymode_lint_minheight = 3
let g:pymode_lint_maxheight = 6

let g:pymode_rope_autocomplete_map = '<C-Space>'
let g:pymode_rope_auto_project = 1
let g:pymode_rope_enable_autoimport = 1
let g:pymode_rope_autoimport_generate = 1
let g:pymode_rope_autoimport_underlineds = 1
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_global_prefix = "<C-x>p"
let g:pymode_rope_local_prefix = "<C-c>r"
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1

let g:pymode_virtualenv = 1
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_doc_key = 'K'
let g:pymode_run_key = '<leader>r'
let g:pymode_folding = 1
let g:pymode_utils_whitespaces = 1
let g:pymode_indent = 1

" Nerdtree
map <leader>n :NERDTreeToggle<CR>

" MBE
map <leader>t :MBEToggle<CR>
map <leader>l :MBEbn<CR>
map <leader>h :MBEbp<CR>
