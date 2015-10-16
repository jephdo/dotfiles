" enable syntax highlighting
syntax enable

colorscheme kalisi
set background=dark

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
