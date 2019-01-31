" plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'tikhomirov/vim-glsl'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" nerdtree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.rej$']

" gutter
set number
set relativenumber
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '◆'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_diff_base = 'HEAD'

" ui
set cursorline
set showcmd

if (has("termguicolors"))
	set termguicolors
endif

" no cursor styling
set guicursor=

" theme
syntax enable
colorscheme nord

" custom syntax
autocmd! BufNewFile,BufRead *.glsl set filetype=glsl

" columns
set cc=80
set textwidth=80
set nowrap
hi ColorColumn ctermbg=238 guibg=#223344

" indent
set tabstop=4
set shiftwidth=4
set expandtab

" trailing
autocmd BufWritePre * %s/\s\+$//e

" airline
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" no arrow
" http://jeetworks.org/vim-making-those-arrow-keys-work-for-you-or-why-the-anti-arrow-key-propoganda-is-wrong/
noremap		<Up>	<NOP>
noremap		<Down>	<NOP>
noremap		<Left>	<NOP>
noremap		<Right>	<NOP>
inoremap	<Up>	<NOP>
inoremap	<Down>	<NOP>
inoremap	<Left>	<NOP>
inoremap	<Right>	<NOP>

" big jump with J and K
nnoremap	J	15j
nnoremap	K	15k
vnoremap	J	15j
vnoremap	K	15k

" js
let g:javascript_plugin_jsdoc = 1

" buffers
nnoremap 	<C-h>	:bp<CR>
nnoremap	<C-l>	:bn<CR>

" buffer history
set undofile
set undodir=~/.local/share/nvim/undo/

" delete the current buffer without losing the window with :d
cabbrev d bp\|bd #

" remove highlighting
nnoremap	<C-f>	:nohl<CR>

" fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:fzf_layout = { 'down': '~30%' }
nnoremap	<C-p>	:FZF<CR>

" ack
nnoremap <Leader>a :Ack! <cword><CR>
nnoremap <Leader>f :Ack!<Space>

" ag replacing ack
if executable('ag')
	let g:ackprg = 'ag --vimgrep --word-regexp --case-sensitive'
endif

" goyo
let g:goyo_width = 81

" one space after comments
let g:NERDSpaceDelims = 1