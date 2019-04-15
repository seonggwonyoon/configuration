" Call vim-plug
call plug#begin('~/.vim/plugged')

" Input Using Plugins
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'arcticicestudio/nord-vim', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'

call plug#end()
" End vim-plug

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

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
colorscheme nord

" NERDTree
autocmd BufEnter * lcd %:p:h
autocmd VimEnter * if !argc() | NERDTree | endif
nmap <leader>ne :NERDTreeToggle<cr>
let NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos = "right"

" Others
set nu
set tabstop=4 shiftwidth=4 expandtab
