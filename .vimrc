let mapleader="\<Space>"
let timeoutlen=3000

set nocompatible " be iMproved
filetype on

let g:ctrlsf_ackprg = 'ack'
let g:ctrlsf_default_view_mode = 'normal'
let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules', 'log', 'tmp', 'coverage', '.git', 'deps', 'public/assets']
let g:ctrlsf_position = 'bottom'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'scrooloose/nerdcommenter'
Plugin 'joshdick/onedark.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kshenoy/vim-signature'
Plugin 'rizzatti/dash.vim'
Plugin 'easymotion/vim-easymotion'

Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'haya14busa/incsearch.vim'

Plugin 'tpope/vim-endwise'
Plugin 'janko-m/vim-test'
Plugin 't9md/vim-ruby-xmpfilter'

Plugin 'aliou/sql-heredoc.vim'
Plugin 'elzr/vim-json'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'fatih/vim-go'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'alvan/vim-closetag'
Plugin 'tpope/vim-abolish'
Plugin 'buoto/gotests-vim'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'AndrewRadev/splitjoin.vim'

if has('nvim')
  Plugin 'jodosha/vim-godebug'
  Plugin 'sebdah/vim-delve'
endif

call vundle#end()
filetype plugin indent on

augroup vimrc_autocmd
  autocmd!

  " autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif
  autocmd BufWritePre * StripWhitespace
  autocmd BufNewFile,BufRead *.html.eex set syntax=html
  autocmd BufNewFile,BufRead *.html.slim set syntax=slim
  autocmd BufNewFile,BufRead *.coffee set syntax=coffee
  autocmd BufNewFile,BufRead *.ex,*.exs set filetype=elixir
  autocmd BufNewFile,BufRead *.sol set filetype=solidity
  autocmd BufNewFile,BufRead *.tmpl set filetype=gohtmltmpl
  autocmd BufNewFile,BufRead *.yal set filetype=go

  autocmd VimEnter * GoPath ~/Projects/Go
augroup END

runtime macros/matchit.vim

if (has("termguicolors"))
  set termguicolors
endif

colorscheme onedark
let g:airline_theme='onedark'
syntax on
set colorcolumn=80
set number " Always show line number
set clipboard=unnamedplus
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab " Converting tabs to spaces
set autoindent
set copyindent
set splitbelow
set splitright
set ttyfast " Scroll faster
set lazyredraw
set completeopt+=menuone
set completeopt-=preview
set hlsearch
set mouse=a
set conceallevel=0
set ignorecase
set smartcase
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,*/node_modules/*,*/deps/*
hi directory ctermfg=lightblue

" Russian
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

if has("gui_macvim")
  noremap <C-S-Tab> :tabprev<CR>
  noremap <C-Tab> :tabnext<CR>

  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  noremap <D-0> :tablast<CR>

  " Copy current buffer path to clipboard
  nnoremap <leader>cp :let @+ = expand("%:p")<CR>
endif

let g:ale_completion_enabled = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:airline#extensions#ale#enabled = 0

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['.DS_Store', '\.swo$', '\.swp$', '\.rdb$', 'tags']
let NERDTreeAutoDeleteBuffer = 1
let g:NERDSpaceDelims = 1
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

function! LeaderNERDTree()
  if exists("t:NERDTreeBufName") && bufname("") == t:NERDTreeBufName
    execute "NERDTreeToggle"
    echo "0"
  else
    execute "NERDTreeFind"
    echo "1"
  endif
endfunction

" Show current file in NERDTree
nnoremap <Leader>n :call LeaderNERDTree()<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified": "M",
    \ "Staged": "S",
    \ "Untracked": "N",
    \ "Renamed": "R",
    \ "Unmerged": "═",
    \ "Deleted": "D",
    \ "Dirty": "M",
    \ "Clean": "✔︎",
    \ "Unknown": "?"
    \ }

" vim-test mappings
nmap <leader>tn :TestNearest<CR>
nmap <leader>tc :TestFile<CR>
nmap <leader>ta :TestSuite<CR>
nmap <leader>tl :TestLast<CR>

let test#strategy = "iterm"

" vim-go
let g:go_fmt_command = "goimports"
" let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'errcheck']
let g:go_auto_type_info = 1

" Go snippets
map <Leader>ierr iif err != nil {<CR><CR>}<C-c>ki<Tab>return <Esc>
map <Leader>fpl ifmt.Println()<Esc>h<Esc>
map <Leader>fpf ifmt.Printf("")<Esc>hh<Esc>
map <Leader>fsf ifmt.Sprintf("")<Esc>hh<Esc>

" CtrlSF
nmap <Leader>sf <Plug>CtrlSFPrompt
vmap <Leader>sf <Plug>CtrlSFVwordPath
nnoremap <Leader>st :CtrlSFToggle<CR>

" EasyMotion
let g:EasyMotion_do_mapping = 0
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>l <Plug>(easymotion-overwin-line)

map <F4> <Plug>(xmpfilter-mark)
map <F5> <Plug>(xmpfilter-run)

" Place text under cursor to search and replace
nnoremap <Leader>sr :%s/<C-r><C-w>/

let g:incsearch#auto_nohlsearch = 0
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Duplicate line in the normal and selected block in the visual
nnoremap <Leader>d :t.<CR>
vnoremap <Leader>d :t'><CR>

" Go to beginning/end of line
nnoremap <Leader>e $
nnoremap <Leader>b ^
vnoremap <Leader>e $h
vnoremap <Leader>b ^

" Move lines and blocks up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

nnoremap <esc> :noh<return><esc>

" Don't copy with d, D, c, C
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" Keep register after paste
xnoremap p pgvy
xnoremap P pgvy

" Delve
nnoremap <Leader>gt :GoToggleBreakpoint<CR>
nnoremap <Leader>gd :GoDebug<CR>
