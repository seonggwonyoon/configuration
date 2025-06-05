let mapleader = " "

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-terraform'
Plug 'pearofducks/ansible-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'stephpy/vim-yaml'
Plug 'fatih/vim-go'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'mg979/vim-visual-multi'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

if has("syntax")
    syntax on
endif

set ts=4
set shiftwidth=4
set smartindent
set et
set nu
set relativenumber
set cursorline
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set clipboard=unnamedplus
set mouse=a
set scrolloff=8
set signcolumn=yes
set updatetime=300
set timeoutlen=500
set hidden
set noswapfile
set nobackup
set undofile
set splitbelow splitright

colorscheme gruvbox
set background=dark

highlight Comment ctermfg=green cterm=italic gui=italic

nnoremap <leader>nerd :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

nnoremap tt :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap te :tabedit<Space>

nnoremap ]t :tabnext<CR>
nnoremap [t :tabprev<CR>

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>

nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Git log<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>

nnoremap <leader>nh :nohlsearch<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '__pycache__', '\.pyc$']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'yaml': ['yamllint'],
\   'dockerfile': ['hadolint'],
\   'terraform': ['tflint'],
\   'go': ['golint', 'govet'],
\}

let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'javascript': ['prettier'],
\   'yaml': ['prettier'],
\   'terraform': ['terraform'],
\   'go': ['gofmt'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

let g:terraform_fmt_on_save = 1
let g:terraform_align = 1

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
nnoremap <leader>gn <Plug>(GitGutterNextHunk)
nnoremap <leader>gp <Plug>(GitGutterPrevHunk)
nnoremap <leader>ga <Plug>(GitGutterStageHunk)
nnoremap <leader>gu <Plug>(GitGutterUndoHunk)

augroup FileTypeSettings
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType dockerfile setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType terraform setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
augroup END

set laststatus=2
set ruler
set showcmd

set path+=**
set wildignore+=*/node_modules/*,*/venv/*,*/.git/*,*/dist/*,*/build/*
