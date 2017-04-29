autocmd! bufwritepost .vimrc source %

set laststatus=2
set nocompatible   " be iMproved
filetype off       " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'The-NERD-Commenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ajh17/Spacegray.vim'
Plugin 'fugitive.vim' " Interace with Git
Plugin 'gabrielelana/vim-markdown'
Plugin 'gmarik/vundle'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/emmet-vim' " Do things like html:5 C-Y + leader
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'wincent/command-t'

call vundle#end()
filetype plugin indent on  " required!

set guifont=Sauce\ Code\ Powerline:h11
set bs=2
set ts=2
set sw=2
set nowrap
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftwidth=2
set tabstop=2
set number
set colorcolumn=80
set cursorline
set relativenumber

" Colors
syntax off
set t_Co=256
colorscheme spacegray
highlight Normal  ctermbg=none

set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

" Copy / Paste to OSX clipboard
set clipboard=unnamed

" Autoremovens_modified trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Disable swap files
set nobackup
set nowritebackup
set noswapfile

set wildignore+=node_modules,target,*.class,build,__pycache__

" Shortcuts
let mapleader=","
map <leader>d :bd<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-C>:update<CR>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-x>"

" Emmit
let g:user_emmet_leader_key='<C-Y>'

" NERDTree
map <C-c> :NERDTreeTabsToggle<CR>

"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" airline
"let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

" ale
let g:ale_python_pylint_options = '--disable=C0111,E0401,C0411,C0330,E1101,R0201'
