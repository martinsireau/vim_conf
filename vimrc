" Install vundle if needed
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ide like
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'martinsireau/snipMate'
Plugin 'scrooloose/syntastic'

" fast editing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/AutoComplPop'

" Colorscheme
Plugin 'sjl/badwolf'
Plugin 'justinmk/vim-syntax-extra'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:tube_terminal = "xterm"
let current_compiler = "gcc"

let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -Wall -Werror -Wextra'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_c_include_dirs = ['../../../include', '../../include','../include','./include']

let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-l>'
let g:multi_cursor_quit_key='<Esc>'

let g:current_path_for_nerd_init=expand('%:p:h')

let g:ctrlp_map = '<C-f>'
let g:ctrlp_cmd = 'CtrlP'

" Foldmod
set foldmethod=manual
set foldlevel=0

syntax on
colorscheme badwolf

set encoding=utf-8
set ai
set nu
set ts=4
set t_Co=256
set shiftwidth=4

set whichwrap+=<,>,h,l,[,]

hi CursorLine term=bold cterm=bold guibg=black

set noswapfile

set splitright

set list listchars=tab:»·,trail:·

noremap <Space><Space>		:tabedit ~/.vimrc<CR>

noremap <C-h> :GundoToggle<CR>

noremap <S-Tab>				:tabprevious<CR>
noremap <Tab>				:tabnext<CR>
noremap <C-t>				:tabedit 
noremap <C-k>				:!(make)<CR>
noremap <C-g>				:NERDTreeToggle<CR>

inoremap <C-k>				<Esc>:help key-notation<CR>
inoremap <C-t>				<Esc>:tabedit 

noremap <S-Right>			<C-w><Right>
noremap <S-Left>			<C-w><Left>
noremap <S-Up>				<C-w><Up>
noremap <S-Down>			<C-w><Down>

noremap <C-p>				:!(open /System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app)<CR>
noremap <C-n>				:!norminette **/*.{c,h}<CR>

noremap <silent>	<C-s>	:w!<CR>
noremap <silent>	<C-q>	:qa<CR>

set textwidth=80

vnoremap <Tab>				>
vnoremap <S-Tab>			<

set autochdir
set backspace=indent,eol,start

autocmd VimEnter * call s:actionForOpen()
function! s:actionForOpen()
	let filename = expand('%:t')
	NERDTree
	if !empty(filename)
		wincmd l
	endif
endfunction

autocmd BufCreate * call s:addingNewTab()
function! s:addingNewTab()
	let filename = expand('%:t')
	if winnr('$') < 2 && exists('t:NERDTreeBufName') == 0
		NERDTree
		if !empty(filename)
			wincmd l
		endif
	endif
endfunction

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction
