set relativenumber			" line numbers
set mouse=a			" mouse selects visually?	      
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

set incsearch                   " highlight as we search however

set backupdir-=.
set backupdir^=~/tmp,/tmp

nore ; :

" We want case sensitive search only if search contains uppercase
set ignorecase
set smartcase

" we want relative number not in insert mode
function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
	    set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

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
:map <Leader>n :NERDTreeToggle<CR>

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

