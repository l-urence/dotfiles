" Plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Autocompletion
Plug 'prettier/vim-prettier'                      " Prettify code
Plug 'wincent/command-t'                          " Fuzzy finder
Plug 'easymotion/vim-easymotion'                  " Move fast in vim
Plug 'tpope/vim-fugitive'                         " Git stuff like blame, etc.
Plug 'vim-airline/vim-airline'                    " Neat statusline
Plug 'sonph/onehalf', {'rtp': 'vim/'}             " Vim airline theme
Plug 'joshdick/onedark.vim'                       " Vim theme
call plug#end()

" Editor config
set number                                        " Show line numbers
set cursorline                                    " Show current line
autocmd BufWritePre * %s/\s\+$//e                 " Remove trainling space on save (:w)
autocmd FileType gitcommit setlocal spell         " Enable spell for git commits
set noswapfile                                    " Disable swap file

" Mappings
let mapleader=","                                 " Remap leader to ','

" Indention
filetype plugin indent on
set tabstop=2 		                                " show existing tab with 2 spaces width
set shiftwidth=2 	                                " when indenting with '>', use 2 spaces width
set expandtab                                     " On pressing tab, insert 2 spaces

" Colors
syntax on
colorscheme onedark
hi Normal ctermbg=none ctermfg=255                " No background color, white text
hi Pmenu guibg=brown
hi Pmenu ctermfg=255 ctermbg=238
hi PmenuSel ctermfg=255 ctermbg=236
hi LineNr ctermfg=white
hi Cursor ctermfg=white ctermbg=233
hi CursorLineNr cterm=bold ctermfg=255
hi CursorLine cterm=bold ctermbg=236

" airline
let g:airline_theme='onedark'

" Command-t
set wildignore+=node_modules
let g:CommandTFileScanner = 'watchman'

" Coc
hi CocHintSign ctermfg=White
let g:airline#extensions#coc#enabled = 1
