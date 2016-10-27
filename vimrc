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
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Plugin 'martinsireau/snipMate'

" For snipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" fast editing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'exvim/ex-autocomplpop'
"Plugin 'ervandew/supertab'

" Colorscheme
Plugin 'sjl/badwolf'
Plugin 'YorickPeterse/happy_hacking.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'justinmk/vim-syntax-extra'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin on

let g:airline_powerline_fonts = 1

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

" Enable bottom line
set laststatus=2

set omnifunc=syntaxcomplete#Complete

set hlsearch
set textwidth=80
set colorcolumn=80

set autochdir
set backspace=indent,eol,start

" Mouse
set mouse=a

" Foldmod
set foldmethod=manual
set foldlevel=0

syntax on
"colorscheme atom
"colorscheme onedark
"colorscheme happy_hacking
colorscheme badwolf

set encoding=utf-8
set ai
set relativenumber
set number
set ts=4
set t_Co=256
set shiftwidth=4
set cursorline

"set whichwrap+=<,>,h,l,[,]

hi CursorLine term=bold cterm=bold guibg=Grey40

set noswapfile
set splitright
set list listchars=tab:»·,trail:·

"Edit my vimrc superfast
noremap <Space><Space>		:tabedit ~/.vimrc<CR>

"Toggle nerdtree
noremap <C-h> :GundoToggle<CR>
noremap <C-g> :NERDTreeToggle<CR>
"Tab for tab
noremap <S-Tab>				:tabprevious<CR>
noremap <Tab>				:tabnext<CR>
noremap <C-t>				:tabedit 
"convenient shortcut
noremap <C-k>				:!(make)<CR>
noremap <S-Right>			<C-w><Right>
noremap <S-Left>			<C-w><Left>
noremap <S-Up>				<C-w><Up>
noremap <S-Down>			<C-w><Down>

inoremap <C-t>				<Esc>:tabedit 

vnoremap <Tab>				>
vnoremap <S-Tab>			<
