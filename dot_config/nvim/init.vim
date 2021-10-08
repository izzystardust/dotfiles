set number
set cursorline
set mouse=a
set laststatus=2
set termguicolors
set scrolloff=4

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/vim-plugged')

" Color scheme of choice
Plug 'sjl/badwolf'

call plug#end()

colors badwolf

