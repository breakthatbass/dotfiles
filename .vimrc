"----------------------------------------------------------------------------"
"   vimrc - breakthatbass                                                    "
"----------------------------------------------------------------------------"


"----------------------------------------------------------------------------"
"   VUNDLE & PLUGINS                                                         "
"----------------------------------------------------------------------------"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/goyo.vim'                  " goyo focus mode for writing in vim
Plugin 'junegunn/fzf'                       " the greatness of fzf in vim
Plugin 'junegunn/seoul256.vim'              " colortheme
Plugin 'junegunn/limelight.vim'             " hyper focus writing in vim
Plugin 'jiangmiao/auto-pairs'               " auto close parentheses, brackets, quotes
Plugin 'wakatime/vim-wakatime'              " add wakatime to vim
Plugin 'scrooloose/nerdtree'                " directory listing in vim
Plugin 'vim-airline/vim-airline'            " status bar for the bottom of windows
Plugin 'vim-airline/vim-airline-themes'     " themes for airline
Plugin 'tomasiser/vim-code-dark'            " colorscheme to match default vs code theme
Plugin 'editorconfig/editorconfig-vim'
Plugin 'amix/vim-zenroom2'
Plugin 'maxbrunsfeld/vim-yankstack'         " save your most recent yanks. usage: :Yanks
Plugin 'fatih/vim-go'                       " go support in vim
Plugin 'rust-lang/rust.vim'                 " rust support in vim
Plugin 'mattn/webapi-vim'
Plugin 'cocopon/iceberg.vim'                " iceberg color theme
Plugin 'arcticicestudio/nord-vim'           " nord color theme


"All of your Plugins must be added before the following line
call vundle#end()						" required
filetype plugin indent on			" required


"----------------------------------------------------------------------------"
"   BASIC SETTINGS                                                           "
"----------------------------------------------------------------------------"

syntax on                         " syntax highlighting
set t_Co=256
set t_ut=

set tabstop=3 softtabstop=3       " tab -> 4 chars long, soft -> 4 spaces long
set shiftwidth=3                  " better autotab spacing
set smartindent                   " indent for me
set nowrap                        " don't split words between lines
set nu                            " show line numbers
set incsearch                     " get results as you search
set backspace=indent,eol,start    " make backspace work properly
set textwidth=80
set laststatus=2                  " show status bar, even if one file is open
set directory^=$HOME/.vim/tmp//   " put all .swp files here
set ignorecase                    " search commands are case insensitive
set mouse=a                       " allow mouse interaction
set visualbell                    " turn off annoying sounds"
set cursorline                    " Highlight current line
set noshowmode                    " Don't show the current mode (airline.vim takes care of us)
set t_vb=                         " disable flashing
set nobackup                      " no backups, swp files
set nowb
set noswapfile


"----------------------------------------------------------------------------"
"   OTHER SETTINGS                                                           "
"----------------------------------------------------------------------------"

" automatically run LimeLight when in Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!  " turn off the light when done!

" set a toggle switch for relative line numbers
let rln=1
if (rln == 1)
	" turn relative line numbers on
	:set relativenumber
	:set rnu
endif

"COLOR THEME STUFF ---------------------


function! s:what_colors()

  let color_list = ['seoul256', 'seoul256-light', 'iceberg', 'nord-vim']
  
  for col in color_list
    echo col
  endfor
endfunction

command! Colors :call <SID>what_colors()

"seoul256 color theme stuff-------------
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 23
"
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253

" set dark mode as default
let g:seoul256_background = 235
colo seoul256
set background=dark

" dark: set dark mode
function! s:dark()
  let g:seoul256_background = 235
  colo seoul256
  set background=dark
endfunction

" light: set light mode
function! s:light()
  let g:seoul256_light_background = 252
  colo seoul256-light
  set background=light
endfunction

" set the functions as commands
command! Light :call <SID>light()
command! Dark :call <SID>dark()

function! s:get_input()
  let i = system("curl -s https://raw.githubusercontent.com/breakthatbass/advent_of_code2020/main/day01/input_test")
  echo i
endfunction

command! Input :call <SID>get_input()

command Exec new | read !curl -s https://raw.githubusercontent.com/breakthatbass/advent_of_code2020/main/day01/input_test


"--------------------------------------
" airline themes can be found at: https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme = 'minimalist'

" NERDtree settings ---------------------
map <C-n> :NERDTreeToggle<CR>	" open and close NERDTree with ctrl+n	

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"set a toggle switch for when i don't want NERDTree to automatically open
let nerd_auto=0
if (nerd_auto == 1)
	autocmd vimenter * NERDTree		" autmatically open NERDTree on vim startup
endif

" LANGUAGE STUFF ------------------------
" equired for rust plugin
syntax enable
filetype plugin indent on

