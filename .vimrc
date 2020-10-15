
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


syntax on                       " syntax highlighting
color default

set tabstop=4 softtabstop=4     " tab -> 4 chars long, soft -> 4 spaces long
set shiftwidth=4				" better autotab spacing
set smartindent                 " indent for me
set wrap						" don't split words between lines
set nu                          " show line numbers
set incsearch                   " get results as you search
set backspace=indent,eol,start  " make backspace work properly
set textwidth=80
set laststatus=2				" show status bar, even if one file is open

