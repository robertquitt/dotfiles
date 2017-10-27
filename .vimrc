" robert's vimrc

" command behavior
set showcmd
set wildmenu

" editor overall looks
set ruler
set number
set cursorline
set so=5
set colorcolumn=80
set cmdheight=2

" indent behavior
set autoindent
set smartindent

au BufRead,BufNewFile *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |

au BufRead,BufNewFile *.c,*.cpp,*.h
    \ set expandtab |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

au BufRead,BufNewFile Makefile*
    \ set noexpandtab

" split behavior
set splitright
set splitbelow

" rebind
set pastetoggle=<F5>
set backspace=indent,eol,start

" file behavior
set nobackup
set nowb
set noswapfile
set autoread

" plugin config
set nocompatible
filetype off


" plugins
call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree'

" commenting stuff
Plug 'tpope/vim-commentary'

" .tmux.conf syntax highlighting
Plug 'tmux-plugins/vim-tmux'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Surround
Plug 'tpope/vim-surround'

" Fugitive
Plug 'tpope/vim-fugitive'

" easy motions
Plug 'easymotion/vim-easymotion'

" comfy colorscheme
Plug 'tomasr/molokai'

" Tagbar
Plug 'majutsushi/tagbar'

" Better javascript support
Plug 'pangloss/vim-javascript'

" dating increments
Plug 'tpope/vim-speeddating'

" vim/tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" remove trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" Tagbar config
nmap <F8> :TagbarToggle<CR>

" colors
colorscheme molokai
set t_Co=256
set background=dark
syntax on

" sublime-style commenting with Ctrl+/
" Git bash/this terminal handles Ctrl+/ as Ctrl+_
vmap <C-_> <Plug>Commentary
nmap <C-_> <Plug>CommentaryLine

" vim/tmux navigations using Alt+hjkl
nnoremap <M-J> :TmuxNavigateDown<CR>
nnoremap <M-K> :TmuxNavigateUp<CR>
nnoremap <M-L> :TmuxNavigateLeft<CR>
nnoremap <M-H> :TmuxNavigateRight<CR>

