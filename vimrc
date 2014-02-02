set relativenumber			" line numbers
set number			" Some interaction makes the first two lines show rel. num. except for current line 
set mouse=a			" mouse selects visually?	      
set expandtab
set tabstop=4		" tabs are size 4
set autoindent 		" set the cursor at same indent as line above
set scrolloff=3 " Minimum lines to keep above and below cursor
" set indentexpr=4		" indentation behaviour based on filetype

"taglist relies on filetype mechanism
filetype on

" smart autoindent?
set ai
filetype indent on
set shiftwidth=4 

set incsearch " highlight as we search however

set backupdir-=.
set backupdir^=~/tmp,/tmp


" persistent undo buffer
set undodir=/home/gunnarjv/vimundo/
set undofile

nore ; :

" We want case sensitive search only if search contains uppercase
set ignorecase
set smartcase

" Open split windows at bottom and to the right.
set splitbelow
set splitright

" we want relative number not in insert mode
function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
	    set relativenumber
    endif
endfunc

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree
"set runtimepath^=~/.vim/bundle/supertab
set runtimepath^=~/.vim/bundle/taglist.vim

"Overwrite <Leader>, that is backslash by default.
:let mapleader = ","

"Custom maps
:map <Leader>h <C-w>h " Navigate
:map <Leader>l <C-w>l
:map <Leader>j <C-w>j
:map <Leader>k <C-w>k

:map <Leader>w <C-w>q "Close window
:map <Leader>s :w<CR>
:map <Leader>n :NERDTreeToggle<CR>

:map <Leader>" <C-w>s 
:map <Leader>% <C-w>v

" We want to focus on Tlist when we open it.
let Tlist_GainFocus_On_ToggleOpen = 1
:map <Leader>t :TlistToggle<CR>

"Appearance options
"
set bg=dark
let g:zenburn_high_Contrast = 1
let g:liquidcarbon_high_contrast = 1
let g:molokai_original = 1
let g:Powerline_symbols = 'compatible'
let g:Powerline_cache_enabled = 1
let g:Powerline_cache_file = expand('$TMP/Powerline.cache')
set t_Co=256
colorscheme molokai

