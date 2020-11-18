
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add wakatime to vim
Plugin 'wakatime/vim-wakatime'

" goyo focus mode for writing in vim
Plugin 'junegunn/goyo.vim'      

" auto close parentheses, brackets, quotes
Plugin 'jiangmiao/auto-pairs'   

" directory listing in vim
Plugin 'scrooloose/nerdtree'

" colorscheme nord
Plugin 'arcticicestudio/nord-vim'

" status bar for the bottom of windows
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


syntax on                       " syntax highlighting
colorscheme default

set tabstop=4 softtabstop=4     " tab -> 4 chars long, soft -> 4 spaces long
set shiftwidth=4				" better autotab spacing
set smartindent                 " indent for me
set wrap						" don't split words between lines
set nu                          " show line numbers
set incsearch                   " get results as you search
set backspace=indent,eol,start  " make backspace work properly
set textwidth=80
set laststatus=2				" show status bar, even if one file is open
set directory^=$HOME/.vim/tmp// " put all .swp files here
set ignorecase					" search commands are case insensitive
set incsearch					" show search matches incrementally
set mouse=a						" allow mouse interaction
"set termguicolors

let g:airline_theme='dracula'

" NERDtree settings
map <C-n> :NERDTreeToggle<CR>	" open and close NERDTree with ctrl+n	

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"set a toggle switch for when i don't wait airline to automatically open
let airline_auto=0
if (airline_auto == 1)
	autocmd vimenter * NERDTree		" autmatically open NERDTree on vim startup
endif

