let mapleader="\<Space>"
let timeoutlen=3000

set nocompatible " be iMproved
filetype on

let g:ctrlsf_ackprg = 'ack'
let g:ctrlsf_default_view_mode = 'normal'
let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules', 'log', 'tmp', 'coverage', '.git', 'deps']
let g:ctrlsf_position = 'bottom'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'scrooloose/nerdcommenter'
Plugin 'chriskempson/base16-vim'
Plugin 'dracula/vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'aliou/sql-heredoc.vim'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'Yggdroot/indentLine'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kshenoy/vim-signature'
Plugin 'rizzatti/dash.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'haya14busa/incsearch.vim'

Plugin 'tpope/vim-endwise'
Plugin 'janko-m/vim-test'
Plugin 't9md/vim-ruby-xmpfilter'

Plugin 'elzr/vim-json'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'fatih/vim-go'
Plugin 'tomlion/vim-solidity'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'suan/vim-instant-markdown'

call vundle#end()
filetype plugin indent on

augroup vimrc_autocmd
  autocmd!
  autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif
  autocmd BufWritePre * StripWhitespace
  autocmd BufNewFile,BufRead *.html.eex set syntax=html
  autocmd BufNewFile,BufRead *.html.slim set syntax=slim
  autocmd BufNewFile,BufRead *.coffee set syntax=coffee
  autocmd BufNewFile,BufRead *.ex,*.exs set filetype=elixir
  autocmd BufNewFile,BufRead *.sol set filetype=solidity
augroup END

runtime macros/matchit.vim

" Styles

let g:indentLine_enabled = 1
let g:indentLine_color_gui = '#44475a'
let base16colorspace=256
colorscheme base16-dracula
let g:airline_theme='dracula'
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Meslo_LG_S_for_Powerline:h13
set colorcolumn=80
set number " Always show line number
set clipboard=unnamedplus
set expandtab " Converting tabs to spaces
set tabstop=2
set shiftwidth=2
set splitbelow
set splitright
set ttyfast " Scroll faster
set lazyredraw
set completeopt+=menuone,preview
set omnifunc=syntaxcomplete#Complete
set ignorecase
set hlsearch
hi Search guibg=#64666d guifg=NONE

if has("gui_macvim")
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

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
  nnoremap <leader>cf :let @+ = expand("%:p")<CR>
endif

let g:ale_completion_enabled = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:ale_linters = {
    \ "ruby": ["rubocop", "ruby"]
    \ }

" NERDTree
autocmd VimEnter * NERDTree ~/Projects
autocmd TabEnter * NERDTreeMirror
autocmd VimEnter * wincmd p
autocmd TabEnter * wincmd p
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.DS_Store', '\.swo$', '\.swp$', '\.rdb$', 'tags']
let g:NERDSpaceDelims = 1
let g:nerdtree_tabs_open_on_console_startup=0

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

let test#strategy = "iterm"

let g:go_fmt_command = "goimports"

" CtrlSF
nmap <Leader>sf <Plug>CtrlSFPrompt
vmap <Leader>sf <Plug>CtrlSFVwordPath
nnoremap <Leader>st :CtrlSFToggle<CR>

" CtrlP ignored dirs and extensions
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,*/node_modules/*,*/deps/*

map <F4> <Plug>(xmpfilter-mark)
map <F5> <Plug>(xmpfilter-run)

" Place text under cursor to search and replace
nnoremap <Leader>sr :.,$s/<C-r><C-w>/
vnoremap <Leader>sr :.,$s/<C-r><C-w>/

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Move to next `def` method
nnoremap <Leader>m /def<CR><bar>z.

" Duplicate line in the normal and selected block in the visual
nnoremap <Leader>d :t.<CR>
vnoremap <Leader>d :t'><CR>

" Go to beginning/end of line
nnoremap <Leader>e $
nnoremap <Leader>b ^
vnoremap <Leader>e $h
vnoremap <Leader>b ^

" Puts binding.pry
nnoremap <Leader>pry Obinding.pry<ESC>

" Search word under cursor in Dash
nnoremap <Leader>g :Dash!<CR>
vnoremap <Leader>g :Dash!<CR>

" Move lines and blocks up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" Show current file in NERDTree
nnoremap <Leader>n :NERDTreeFind<CR>

nnoremap <S-k> Hz.
nnoremap <S-j> Lz.

nnoremap <esc> :noh<return><esc>
