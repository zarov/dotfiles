set encoding=utf-8
scriptencoding utf-8

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	augroup PLUG
		au!
		autocmd VimEnter * PlugInstall
	augroup END
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme = 'nord'
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1

Plug 'airblade/vim-gitgutter'
	set number
	set relativenumber
	let g:gitgutter_sign_added = '+'
	let g:gitgutter_sign_modified = '◆'
	let g:gitgutter_sign_removed = '-'
	let g:gitgutter_sign_removed_first_line = '^'
	let g:gitgutter_sign_modified_removed = '~'
	let g:gitgutter_diff_base = 'HEAD'

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-sleuth'
Plug 'pangloss/vim-javascript'
	let g:javascript_plugin_jsdoc = 1

Plug 'dense-analysis/ale'
	let b:ale_fixers = {'javascript': ['eslint']}
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_lint_on_insert_leave = 0

Plug 'terryma/vim-multiple-cursors'
Plug 'tikhomirov/vim-glsl'
Plug 'scrooloose/nerdcommenter'
	let g:NERDSpaceDelims = 1

Plug 'mileszs/ack.vim'
	nnoremap <Leader>a :Ack! <cword><CR>
	nnoremap <Leader>f :Ack!<Space>
	if executable('ag')
		let g:ackprg = 'ag --vimgrep --word-regexp --case-sensitive'
	endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
	let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
	let g:fzf_layout = { 'down': '~30%' }
	nnoremap	<C-p>	:FZF<CR>

Plug 'Shougo/deoplete.nvim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
	let g:deoplete#enable_at_startup = 1

call plug#end()

" ui
set cursorline
set showcmd

if (has("termguicolors"))
	set termguicolors
endif

" theme
syntax enable
colorscheme nord

" custom syntax
autocmd! BufNewFile,BufRead *.glsl set filetype=glsl
autocmd! BufNewFile,BufRead *.vrt set filetype=xml

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

" buffers
nnoremap 	<C-h>	:bp<CR>
nnoremap	<C-l>	:bn<CR>

" buffer history
set undofile
set undodir=~/.config/nvim/undo/
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), 'p')
endif

" delete the current buffer without losing the window with :d
cabbrev d bp\|bd #

" remove highlighting
nnoremap	<C-f>	:nohl<CR>
