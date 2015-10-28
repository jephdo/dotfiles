" enable syntax highlighting
syntax enable

colorscheme kalisi
set background=dark


set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

call pathogen#infect()
call pathogen#helptags()

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line 
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

set t_Co=256

" in case t_Co alone doesn't work, add this as well:
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm"

" enable all Python syntax highlighting features
let python_highlight_all = 1
" Python specific tabbing and pep8 stuff
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix


" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar -- za is the hotkey for folding
nnoremap <space> za
"The initial command, set foldmethod=indent, creates folds based upon line indents. 
"This however often creates more folds that you really want. But have no fear!
"There are several extensions that attempt to rectify that. We recommend SimpylFold.
Plugin 'tmhedberg/SimpylFold'


"split navigations
" Ctrl-j move to split below
" Ctrl-k move to split above
" Ctrl-l move to split right
" Ctrl-h move to split left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$']
map <C-n> :NERDTreeToggle<CR> "Map ctrl-n to open/close nerdtree


Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

