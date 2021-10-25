call plug#begin('~/.config/vim-plugged')

Plug 'vim-airline/vim-airline' "Status bar level up
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/badwolf'             "Color scheme of choice
Plug 'arcticicestudio/nord-vim' "Colors
Plug 'junegunn/fzf'            "Fuzzy finder for _everything_
Plug 'junegunn/fzf.vim'
Plug 'gcmt/taboo.vim'          "Tab convenience
Plug 'chaoren/vim-wordmotion'  "Better word movement
Plug 'tpope/vim-fugitive'      "Git integration
Plug 'preservim/tagbar'        "For universal ctags jumping
Plug 'sbdchd/neoformat'        "Auto-format on save
Plug 'sheerun/vim-polyglot'    "Syntax highlighting and indent settings
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:nord_italic=1
let g:nord_italic_comments = 1
colors nord

nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <leader>R :source ~/.config/nvim/init.vim<cr>

" configure expanding of tabs for various file types
" au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

set number
set cursorline
set mouse=a
set laststatus=2
set hidden
set termguicolors
set scrolloff=4
set tabstop=4
set shiftwidth=4
set smarttab
set colorcolumn=120
set expandtab
set backspace=indent,eol,start

filetype plugin indent on

"set showtabline=2
" Tab navigation
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <silent> <leader>0 :exe "tabn ".g:lasttab<cr>
" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
nnoremap <leader>l <c-w>l
nnoremap <leader>k <c-w>k
nnoremap <leader>j <c-w>j
nnoremap <leader>h <c-w>h

nnoremap <silent> <leader>t :TagbarToggle<cr>
let g:tagbar_autoclose=1
let g:tagbar_show_tag_linenumbers=1

" Provided by fzf.vim
nnoremap <silent> <leader>o :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>T :Tags<cr>

let g:taboo_tab_format=" [ %N %f%U%m ] "
let g:taboo_renamed_tab_format=" [ %N %l%U%m ] "
nnoremap <leader>r :TabooRename 

let g:neoformat_enabled_python = ['black']

augroup fmt
    autocmd!
    autocmd BufWritePre *.py undojoin | Neoformat
augroup END

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
