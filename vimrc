set mouse=a			" mouse selects visually?	      
set scrolloff=3 " Minimum lines to keep above and below cursor

" Allows one to paste without smart indent
set pastetoggle=<F2>

"taglist relies on filetype mechanism
filetype on

set expandtab
set tabstop=4		" tabs are size 4
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set autoindent 		" set the cursor at same indent as line above
" smart autoindent?
set ai
filetype indent on
set shiftwidth=4 

set incsearch " highlight as we search

" persistent undo buffer
set undodir=/home/gunnarjv/.vimundo/
set undofile

nore ; :

" We want case sensitive search only if search contains uppercase
set ignorecase
set smartcase

" Open split windows at bottom
set splitbelow

set number			" Some interaction makes the first two lines show rel. num. except for current line 
set relativenumber " line numbers
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Plugins
set runtimepath^=~/.vim/bundle/nerdtree
set runtimepath^=~/.vim/bundle/taglist.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Requires installation. See github
set runtimepath^=~/.vim/bundle/YouCompleteMe
" Requires flake8:
set runtimepath^=~/.vim/bundle/syntastic
set runtimepath^=~/.vim/bundle/nerdcommenter
set runtimepath^=~/.vim/bundle/gundo.vim


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

"Overwrite <Leader>, that is backslash by default.
:let mapleader = ","

"Custom maps
:map <Leader>h <C-w>h " Navigate
:map <Leader>l <C-w>l
:map <Leader>j <C-w>j
:map <Leader>k <C-w>k

:map <Leader>w <C-w>q
:map <Leader>s :w<CR>
:map <Leader>n :NERDTreeToggle<CR>

:map <Leader>" <C-w>s 
:map <Leader>% <C-w>v

" We want to focus on Tlist when we open it.
let Tlist_GainFocus_On_ToggleOpen = 1
:map <Leader>t :TlistToggle<CR>

" Map commenter
:map <Leader>/ :call NERDComment(1, 'toggle')<CR>

:map <Leader>g :GundoToggle<CR>

"Appearance options

" The below might not do anything.
set bg=dark
let g:zenburn_high_Contrast = 1
let g:liquidcarbon_high_contrast = 1
let g:Powerline_symbols = 'compatible'
let g:Powerline_cache_enabled = 1
let g:Powerline_cache_file = expand('$TMP/Powerline.cache')
set t_Co=256
let g:rehash256 = 1

colorscheme molokai
let g:molokai_original = 1
" test line
