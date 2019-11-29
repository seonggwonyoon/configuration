" Call vim-plug
call plug#begin('~/.vim/plugged')

" Input Using Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'arcticicestudio/nord-vim', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
" End vim-plug

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

color dracula

" Set TMUX
if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

" Set colorscheme
let g:airline_theme='dracula'

" NERDTree
autocmd BufEnter * lcd %:p:h
autocmd VimEnter * if !argc() | NERDTree | endif
nmap <leader>ne :NERDTreeToggle<cr>
let NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos = "right"

" Others
set number
set backspace=2
set autoindent
set nowrapscan
set ignorecase
set ruler
set tabstop=4
set shiftwidth=4
set showcmd
set showmatch
set linespace=3
set title
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
set expandtab "Tab to space"
set mouse=a

let g:indentLine_setColors = 0
