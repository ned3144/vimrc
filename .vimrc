set nocompatible              " be iMproved, required
syntax on
filetype off                  " required
color dracula

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'dracula/vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'skywind3000/asyncrun.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

set splitbelow
set splitright

"split navigations
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

let g:SimpylFold_docstring_preview=1

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
autocmd BufWritePre * %s/\s\+$//e

set relativenumber
set number
set encoding=utf-8
set splitright

:command WQ wq
:command Wq wq
:command W w
:command Q q

nnoremap <C-S-PageDown> :tabprevious<CR>
nnoremap <C-S-PageUp>   :tabnext<CR>
nnoremap <C-t>          :tabnew<CR>

nnoremap <C-g> :Gstatus<CR>

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F3> :YcmCompleter GoTo<CR>


"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMapOpenInTab='t'

set backspace=2

let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {'javascript.jsx' : {'extends' : 'jsx',},}

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'

let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

autocmd Filetype html,javascript setlocal ts=2 sts=2 sw=2
autocmd FileType js UltiSnipsAddFiletypes javascript-es6

inoremap ( ()<Esc>i
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i

