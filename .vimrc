" robert's vimrc
" designed for use with MinTTY/Git Bash
" see <https://github.com/mintty/mintty/wiki/Keycodes>

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

" list characters
set listchars=tab:│·,extends:→,eol:¬

" \+l to toggle listing characters
nmap <Leader>l :set invlist<CR>

" wrap behavior
set textwidth=79

" indent behavior
set autoindent
set smartindent

" split behavior
set splitright
set splitbelow

" F5 to toggle paste mode
set pastetoggle=<F5>

" Ctrl+A to select all
nnoremap <C-A> ggVG

" backspace goes to indent
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

" deliminate for insert mode auto-completion
Plug 'raimondi/delimitmate'

" detect indent settings
Plug 'ciaranm/detectindent'

call plug#end()

" F7 toggles NerdTree
nnoremap <silent> <F7> :NERDTreeToggle<CR>

" F8 toggles Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" colors
colorscheme molokai
set t_Co=256
set background=dark
syntax on

" sublime-style commenting with Ctrl+/
" MinTTY handles Ctrl+/ as Ctrl+_
vmap <C-_> <Plug>Commentary
imap <C-_> <C-O><Plug>CommentaryLine
nmap <C-_> <Plug>CommentaryLine

" tmux split navigation using Alt+HJKL
" need to use escape sequence due to how MinTTY handles Alt
execute "set <M-H>=h"
execute "set <M-J>=j"
execute "set <M-K>=k"
execute "set <M-L>=l"

" switch to normal mode immediately after ESC is pressed and avoid ESC
" aliasing with Alt
set ttimeoutlen=0

" map the tmux navigations
" disable default Ctrl+HJKL mappings
let g:tmux_navigator_no_mappings = 1
" remap to Alt+HJKL
nnoremap <silent> <M-J> :TmuxNavigateDown<CR>
nnoremap <silent> <M-K> :TmuxNavigateUp<CR>
nnoremap <silent> <M-L> :TmuxNavigateRight<CR>
nnoremap <silent> <M-H> :TmuxNavigateLeft<CR>
inoremap <silent> <M-J> <C-O>:TmuxNavigateDown<CR>
inoremap <silent> <M-K> <C-O>:TmuxNavigateUp<CR>
inoremap <silent> <M-L> <C-O>:TmuxNavigateRight<CR>
inoremap <silent> <M-H> <C-O>:TmuxNavigateLeft<CR>

