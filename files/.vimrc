" Vundle
"--------------------------------------------------------------------------

" Vundle

    " Setting up Vundle - the vim plugin bundler
        let iCanHazVundle=1
        let vundle_readme=expand("~/.vim/bundle/vundle/README.md")
        if !filereadable(vundle_readme)
            echo "Installing Vundle.."
            echo ""
            silent !mkdir -p ~/.vim/bundle
            silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
            let iCanHazVundle=0
        endif
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
        Bundle 'gmarik/vundle'

    " Setting up Vundle - the vim plugin bundler end

    " Bundles

	" Core
	Bundle 'bling/vim-airline'
	Bundle 'altercation/vim-colors-solarized'
	Bundle 'sjl/vitality.vim'
	Bundle 'tpope/vim-fugitive'
    Bundle 'vim-scripts/EasyGrep'

	" Interface
	Bundle 'kien/ctrlp.vim'
	Bundle 'myusuf3/numbers.vim'
	Bundle 'scrooloose/nerdtree'
	Bundle 'bling/vim-bufferline'
    Bundle 'moll/vim-bbye'

	" Syntax
    Bundle 'editorconfig/editorconfig-vim'
	Bundle 'evanmiller/nginx-vim-syntax'
	Bundle 'plasticboy/vim-markdown'
	Bundle 'Glench/Vim-Jinja2-Syntax'
	Bundle 'groenewege/vim-less'
	Bundle 'hail2u/vim-css3-syntax'
	Bundle 'othree/html5.vim'
	Bundle 'saltstack/salt-vim'
    Bundle 'rodjek/vim-puppet'
    Bundle 'digitaltoad/vim-jade'
    Bundle 'wavded/vim-stylus'
    Bundle 'skammer/vim-css-color'

	" Python
	Bundle 'python.vim'
	Bundle 'nvie/vim-flake8'
	Bundle 'hynek/vim-python-pep8-indent'
	Bundle 'ervandew/supertab'

    " Bundles end
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
    :BundleInstall
    endif
" Vundle end

"--------------------------------------------------------------------------
" General Settings
"--------------------------------------------------------------------------
" be iMproved
set nocompatible

" Set vim to interpret modelines - disabled on OSX
set modelines=1

" Set vim to use 256 colors
set t_Co=256

" Ddefault color scheme
colorscheme solarized
set background=dark

" Remember line history
set history=700

" Enable filtype plugin
filetype on
filetype plugin on
filetype indent on

" Fast saving, instead of :w! just <leader>w
nmap <leader>w :w!<cr>

" Auto reload file when changed outside of vim
set autoread

" Map [ and ]  to buffer cycle
map <leader>[ :bprevious<CR>
map <leader>] :bnext<CR>

" Set Paste Toggle to <F2>
set pastetoggle=<F2>

" Enable Spell Checking
set spell

"--------------------------------------------------------------------------
" Interface
"--------------------------------------------------------------------------
" Always show line numbers
set number

" Always show ruler
set ruler

" Set command bar height to 2
set cmdheight=2

" Allow change buffer without saving
set hid

" Backspaces do their job
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
set smartcase

" Hilight searched strings
set hlsearch

" Search like modern browsers
set incsearch

" Don't redraw while executing macros
set nolazyredraw

" Use magic for regex
set magic

" Show matching braces
set showmatch

" Blink this many thenths of a second
set mat=2

" No sound on errors!!!
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" UTF-8 Encoding
set encoding=utf8

" Enable Syntax hilighting
syntax enable

" Line and Col Hilighting
set nocursorline nocursorcolumn

" GUI - Remove Scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=L
set guioptions-=l

"--------------------------------------------------------------------------
" Backups, files and undo
"--------------------------------------------------------------------------
" No backups as we version control
set nobackup
set nowb
set noswapfile

" Persistent undo
set undodir=~/.vim_runtime/undodir
set undofile

"--------------------------------------------------------------------------
" Text & indentation
"--------------------------------------------------------------------------
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500
set bs=2

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

"--------------------------------------------------------------------------
" Movement
"--------------------------------------------------------------------------
" Map space to search and ctrl-space to reverse search
map <space> /
map <c-space> ?

" Easier way to move windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Arrow keys do nothing, EVIL arrows
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Close current buffer
map <leader>x :Bdelete<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=usetab
    set stal=0
catch
endtry

" I don't know what this does :p
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif
    if bufnr("%") == l:currentBufNum
        new
    endif
    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

"--------------------------------------------------------------------------
" Status Line
"--------------------------------------------------------------------------
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %* "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

"--------------------------------------------------------------------------
" Delete white space
"--------------------------------------------------------------------------
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

"--------------------------------------------------------------------------
" Fugitive
"--------------------------------------------------------------------------
map <leader>gs :Gstatus<CR>
map <leader>gw :Gwrite<CR>
map <leader>gc :Gcommit<CR>

"--------------------------------------------------------------------------
" Python
"--------------------------------------------------------------------------

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def

" au FileType python set cc=80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#b30000
func! EightyColRuleOn()
    match OverLength /\%80v.\+/
endfunc
func! EightyColRuleOff()
    match
endfunc
autocmd BufEnter * call EightyColRuleOff()
autocmd BufEnter *.py call EightyColRuleOn()

set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Always check againt Pep8
autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="W404,F403"

"--------------------------------------------------------------------------
" Nerd Tree
"--------------------------------------------------------------------------
autocmd vimenter * if !argc() | NERDTree | endif
map <leader>nt :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc', '\.slsc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store', '\.egg-info$', '^dist$', '^build$', '^node_modules$', '\.vagrant', '\.tox', '^tmp$', '\.coverage$', '^__pycache__$']
let NERDTreeChDirMode=0
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1

"--------------------------------------------------------------------------
" CtrlP
"--------------------------------------------------------------------------

nmap <leader>p :CtrlP .<cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,/logs/*,*.pyc,*.git,*.log,*jpg,*.png,*.gif

"--------------------------------------------------------------------------
" Vim Numbers
"--------------------------------------------------------------------------
nnoremap <F3> :NumbersToggle<CR>

"--------------------------------------------------------------------------
" Jinja2
"--------------------------------------------------------------------------
au BufNewFile,BufRead *.jinja set filetype=jinja

"--------------------------------------------------------------------------
" Markdown
"--------------------------------------------------------------------------
let g:vim_markdown_folding_disabled=1

"--------------------------------------------------------------------------
" LESS
"--------------------------------------------------------------------------
au BufNewFile,BufRead *.less set filetype=less

"--------------------------------------------------------------------------
" SLS
"--------------------------------------------------------------------------
au BufNewFile,BufRead *.sls set filetype=sls

"--------------------------------------------------------------------------
" Nginx
"--------------------------------------------------------------------------
au BufNewFile,BufRead *.nginx.conf set filetype=nginx
au BufNewFile,BufRead nginx.conf set filetype=nginx

"--------------------------------------------------------------------------
" SuperTab
"--------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"

"--------------------------------------------------------------------------
" Bufferline
"--------------------------------------------------------------------------
let g:bufferline_echo = 0  " Do not echo to command bar
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = ' *'

"--------------------------------------------------------------------------
" Airline
"--------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
