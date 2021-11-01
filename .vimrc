

" VUNDLE & PLUGINS

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'wakatime/vim-wakatime'  		" add wakatime to vim
Plugin 'junegunn/goyo.vim'      		" goyo focus mode for writing in vim
Plugin 'jiangmiao/auto-pairs'   		" auto close parentheses, brackets, quotes
Plugin 'scrooloose/nerdtree'			" directory listing in vim
Plugin 'arcticicestudio/nord-vim'		" colorscheme nord
Plugin 'vim-airline/vim-airline'		" status bar for the bottom of windows
Plugin 'wadackel/vim-dogrun'
Plugin 'tomasiser/vim-code-dark'
Plugin 'dracula/vim', {'name': 'dracula'}
Plugin 'embark-theme/vim', {'as': 'embark'}
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()						" required
filetype plugin indent on			" required


" THEMES

colorscheme nord	"colorthemese i like: dracula, default, codedark
let g:airline_theme = 'nord'

" NERDtree settings
map <C-n> :NERDTreeToggle<CR>	" open and close NERDTree with ctrl+n	

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"set a toggle switch for when i don't want NERDTree to automatically open
let nerd_auto=0
if (nerd_auto == 1)
	autocmd vimenter * NERDTree		" autmatically open NERDTree on vim startup
endif


" SETTINGS

syntax on								" syntax highlighting
set t_Co=256
set t_ut=

set tabstop=3 softtabstop=3		" tab -> 4 chars long, soft -> 4 spaces long
set shiftwidth=3						" better autotab spacing
set smartindent						" indent for me
set nowrap								" don't split words between lines
set nu									" show line numbers
set incsearch							" get results as you search
set backspace=indent,eol,start	" make backspace work properly
set textwidth=80
set laststatus=2						" show status bar, even if one file is open
set directory^=$HOME/.vim/tmp//	" put all .swp files here
set ignorecase							" search commands are case insensitive
set incsearch							" show search matches incrementally
set mouse=a								" allow mouse interaction
set visualbell							" turn off annoying sounds"
set cursorline							" Highlight current line
set noshowmode							" Don't show the current mode (airline.vim takes care of us)
set t_vb=								" disable flashing


set a toggle switch for relative line numbers
let rln=1
if (rln == 1)
	" turn relative line numbers on
	:set relativenumber
	:set rnu
endif
