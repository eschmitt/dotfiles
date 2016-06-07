set nocompatible  "required for vundle
filetype off      "required for vundle

" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
Plugin 'Townk/vim-autoclose'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'rking/ag.vim'   "requires silver searcher to be installed
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'altercation/vim-colors-solarized'
Plugin 'janko-m/vim-test'

" All of your Plugins must be added before the following line
call vundle#end()            " required for vundle
filetype plugin indent on    " required
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

" Don't write backup file if vim is being called by "crontab -e"
autocmd BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
autocmd BufWrite /private/etc/pw.* set nowritebackup

" show line numbers
set nu

" show row and column in footer
set ruler

" minimum lines above/below cursor
set scrolloff=2

" disable code folding
set nofoldenable

" continuously show filename in footer
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" set colorscheme
set background=dark
colorscheme solarized

" toggle spellcheck with <F5>
:map <F5> :setlocal spell! spelllang=en_au<cr>
:imap <F5> <ESC>:setlocal spell! spelllang=en_au<cr>

" show syntax highlighting
syntax on
filetype plugin indent on

" spell check on git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" set auto indent
set autoindent

" set indent to (n) spaces and expand
set ts=2
set shiftwidth=2
set expandtab
set softtabstop=2

" show bracket matches
set showmatch

" ignore case in search
set ignorecase

" pay attention to case when caps are used
set smartcase

" show search results as I type
set incsearch

" enable mouse support
set mouse=a

" enable visual bell (disable audio bell)
set vb

" highlight long lines
set colorcolumn=80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/

" set leader key to comma
let mapleader = ","

" jk is escape
inoremap jk <esc>

" <leader>w for navigating splits
nnoremap <leader>w <C-w><C-w>

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" gist.vim config
let g:gist_open_browser_after_post = 1

" NERDTree config
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapOpenSplit="s"

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
"let g:syntastic_quiet_warnings=1

" Sparkup config
augroup sparkup_types
  autocmd!
  autocmd FileType mustache,handlebars,hbs,php runtime! ftplugin/html/sparkup.vim
augroup END

" vim-test config
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

if filereadable("test/test-helper.js")
  let test#javascript#mocha#options = '--compilers js:babel-core/register --require ./test/test-helper.js'
else
  let test#javascript#mocha#options = '--compilers js:babel-core/register'
endif
