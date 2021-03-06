" robert's vimrc
" robertquitt@berkeley.edu
" ver. 2017-12-06
" designed for use with MinTTY/Git Bash
" see <https://github.com/mintty/mintty/wiki/Keycodes>

" command behavior
set showcmd
set wildmenu

" Use the built-in :help when navigating help use "K"
autocmd FileType help setlocal keywordprg=:help

" editor overall looks
set ruler
set number
set cursorline
set so=5
set colorcolumn=80
set cmdheight=2

" list characters
set listchars=tab:\|-,extends:>,precedes:<,nbsp:.,trail:.,eol:¬

" \+l to toggle listing characters
nnoremap <silent> <Leader>l :set invlist<CR>

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

" tab shortcuts
nnoremap <TAB> gt
nnoremap <S-TAB> gT

" allow movement in insert mode
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" backspace goes to indent
set backspace=indent,eol,start

" file behavior
set nobackup
set nowb
set noswapfile
set autoread

" plugin config
set nocompatible

" gVim settings
if has("gui_running")
	set background=light
	set guifont=Ubuntu_Mono:h14:cANSI:qDRAFT
else
	set background=dark
endif

" plugins
call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" commenting stuff
Plug 'tpope/vim-commentary'

" .tmux.conf syntax highlighting
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux'}

" airline (status bar at bottom)
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" Vim-surround to quickly change surrounding characters
Plug 'tpope/vim-surround'

" Fugitive - Git plugin
Plug 'tpope/vim-fugitive'

" easy motions - use \\<motion>
Plug 'easymotion/vim-easymotion'

" comfy colorscheme
Plug 'tomasr/molokai'

" Tagbar for viewing tags in side window
Plug 'majutsushi/tagbar'

" Better javascript syntax support, jsx syntax and indenting
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }

" dating increments (use Ctrl-A and Ctrl-X)
Plug 'tpope/vim-speeddating'

" vim/tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" remove trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Pair branckets in insert mode (works better than delimitmate)
Plug 'jiangmiao/auto-pairs'

" detect indent settings
Plug 'ciaranm/detectindent'

" for editing nginx .conf files
Plug 'chr4/nginx.vim', { 'for': 'nginx' }

" php syntax
Plug 'stanangeloff/php.vim', { 'for': 'php' }

" yank to system clipboard using OSC 52 terminal escape sequence
" (has to be enabled in terminal settings)
Plug 'greymd/oscyank.vim'


Plug 'junegunn/goyo.vim'

" Pandoc formatting, syntax, integration, etc.
Plug 'vim-pandoc/vim-pandoc', { 'for': 'md' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'md' }

" Pencil used for formatting text files (a bit more lightweight than vim-pandoc)
Plug 'reedes/vim-pencil'

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py', 'for': ['python', 'make'] }

call plug#end()

" F7 toggles NerdTree
nnoremap <silent> <Leader>7 :NERDTreeToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>

" F8 toggles Tagbar
nnoremap <silent> <Leader>8 :TagbarToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>

" colors (for MinTTY xterm-256)
colorscheme molokai
set t_Co=256
set background=dark
syntax on

" sublime-style commenting with Ctrl+/
" MinTTY handles Ctrl+/ as Ctrl+_
vmap <C-_> <Plug>Commentary
imap <C-_> <C-O><Plug>CommentaryLine
nmap <C-_> <Plug>CommentaryLine

" copy across ssh/tmux using OSC 52 Codes

noremap <leader>y :Oscyank<cr>

" MinTTY-Specific settings!
" see <https://github.com/mintty/mintty/wiki/Tips>
" see <https://github.com/mintty/mintty/wiki/Keycodes>

" need to use escape sequence due to how MinTTY handles Alt
execute "set <M-H>=h"
execute "set <M-J>=j"
execute "set <M-K>=k"
execute "set <M-L>=l"

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" switch to normal mode immediately after ESC is pressed and avoid ESC
" aliasing with Alt
set ttimeoutlen=0

" tmux navigations
" disable default Ctrl+HJKL mappings
let g:tmux_navigator_no_mappings = 1
" remap to Ctrl+HJKL
nnoremap <silent> <C-J> :TmuxNavigateDown<CR>
nnoremap <silent> <C-K> :TmuxNavigateUp<CR>
nnoremap <silent> <C-L> :TmuxNavigateRight<CR>
nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>
" handle Alt+HJKL as well (this doesn't work well on certain other terminals)
nnoremap <silent> <M-J> :TmuxNavigateDown<CR>
nnoremap <silent> <M-K> :TmuxNavigateUp<CR>
nnoremap <silent> <M-L> :TmuxNavigateRight<CR>
nnoremap <silent> <M-H> :TmuxNavigateLeft<CR>
