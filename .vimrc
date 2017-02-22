let mapleader="\<Space>"

set nocompatible " be iMproved
filetype off

let g:ctrlsf_ackprg='ack'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'scrooloose/nerdcommenter'
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'

Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kshenoy/vim-signature'
Plugin 'rizzatti/dash.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'

Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 't9md/vim-ruby-xmpfilter'

Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Plugin 'elzr/vim-json'

call vundle#end()
filetype plugin indent on

autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif
autocmd BufWritePre * StripWhitespace

" Styles
let base16colorspace=256
colorscheme base16-default-dark
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Monaco:h13
set colorcolumn=80
set number " Always show line number
set clipboard=unnamedplus
set expandtab " Converting tabs to spaces
set tabstop=2
set shiftwidth=2
set splitbelow
set splitright
set ttyfast " Scroll faster

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
endif

" NERDTree
autocmd VimEnter * NERDTree
autocmd TabEnter * NERDTreeMirror
autocmd VimEnter * wincmd p
autocmd TabEnter * wincmd p
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.DS_Store']
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

" RSpec.vim mappings
map <Leader>rc :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm2"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']

" CtrlSF
nmap <Leader>sf <Plug>CtrlSFPrompt
vmap <Leader>sf <Plug>CtrlSFVwordPath
nnoremap <Leader>st :CtrlSFToggle<CR>

" CtrlP ignored dirs and extensions
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,*/node_modules/*,*/deps/*

map <F4> <Plug>(xmpfilter-mark)
map <F5> <Plug>(xmpfilter-run)

" Place text under cursor to search
nnoremap <Leader>ss /<C-r><C-w><CR>
vnoremap <Leader>ss /<C-r><C-w><CR>

" Place text under cursor to search and replace
nnoremap <Leader>sr :.,$s/<C-r><C-w>/
vnoremap <Leader>sr :.,$s/<C-r><C-w>/

" Move to next `def` method
nnoremap <Leader>m /def<CR><bar>z.

" Duplicate line in the normal and selected block in the visual
nnoremap <Leader>d :t.<CR>
vnoremap <Leader>d :t'><CR>

" Select word under cursor
nnoremap <D-d> viw

" Puts binding.pry
nnoremap <Leader>pry obinding.pry<ESC>

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
