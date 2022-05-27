"----------------------------------------------------------------------------"
"   vimrc - breakthatbass                                                    "
"----------------------------------------------------------------------------"


"----------------------"
"   VUNDLE & PLUGINS   "
"----------------------"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/goyo.vim'                  " goyo focus mode for writing in vim
Plugin 'junegunn/fzf', {'do': { -> fzf#install()}}  " the greatness of fzf in vim
Plugin 'junegunn/fzf.vim'
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
Plugin 'cocopon/iceberg.vim'                " iceberg color theme
Plugin 'arcticicestudio/nord-vim'           " nord color theme
Plugin 'Badacadabra/vim-archery'            " archery color theme
Plugin 'nvie/vim-flake8'                    " PEP 8 python syntax checking
Plugin 'jistr/vim-nerdtree-tabs'            " like it syas, nerdtree tabs
Plugin 'dracula/vim'
Plugin 'breakthatbass/vim-ripgrep'
Plugin 'jaredgorski/spacecamp'              " colors for the final frontier
Plugin 'jeaye/color_coded'                  " get proper highlighting for c, c++, obj-c
Plugin 'vimwiki/vimwiki'
Plugin 'joshdick/onedark.vim'
Plugin 'sainnhe/sonokai'
Plugin 'marcopaganini/mojave-vim-theme'
Plugin 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plugin 'breakthatbass/tumnus.vim'
Plugin 'catppuccin/nvim', {'name': 'catppuccin'}
Plugin 'wojciechkepka/vim-github-dark'
Plugin 'xero/sourcerer.vim'
Plugin 'romainl/apprentice'


" All of your Plugins must be added before the following line
call vundle#end()						" required
filetype plugin indent on			" required

"----------------------------------------------------------------------------"
"   BASIC SETTINGS                                                           "
"----------------------------------------------------------------------------"

set number		    " line numbers
set numberwidth=1	" line nums space
set relativenumber  " line numbers relative to cursor
set wrap		    " write long lines into next line
set linebreak		" break lines between strings
set shiftwidth=2	" '<>' indents this many spaces
set ignorecase      " search commands are case insensitive
set backspace=indent,eol,start " make backspace work properly
set mouse=a         " allow mouse interaction
set visualbell      " turn off annoying sounds
set noshowmode      " Don't show the current mode (airline.vim takes care of us)
set t_vb=           " disable flashing
set nobackup        " no backups, swp files

colorscheme tumnus
syntax on


""""""""""""""""""
"    MAPPINGS    "
""""""""""""""""""

let vimrc_location = "~/projects/dotfiles/.vimrc"

let learning=0
let mapleader = ","
let maplocalleader = "\\"

" move a line down with '-' key
nnoremap - yyddp
" move a line up with '_' key
nnoremap _ yydd<Up><Up>p

" upper case a string in normal mode with ,-u
nnoremap <leader>u bveU <esc>

" delete a line in insert mode with ,-d
inoremap <leader>d <esc>ddi

" upper case a string in insert mode with ,-u
inoremap <leader>u <esc>bveU <esc>i

" open up vimrc in a split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source new changes in .vimrc without exiting vim
nnoremap <leader>sv :source $MYVIMRC<cr>

" put double quotes around a string with ,"
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" put single quotes around a string with ,'
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" shift H to move cursor to beginning of line
nnoremap H 0

" shift L to move cursor to end of line
nnoremap L $

" exit insert mode with jk
inoremap jk <esc>

" comment out entire lines easily
augroup comments
    autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType go nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType java nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END

""""""""""""""""""
"    fzf.vim     "
""""""""""""""""""

" use Ctrl-f to call fzf :Files to search files
nnoremap <silent> <C-f> :Files<CR>

" use Ctrl-h to show a history of commands in a window
nnoremap <silent> <C-h> :History:<CR>

" use Ctrl-c to show a history of git commits in a window (requires vim-fugitive)
nnoremap <silent> <C-c> :Commits<CR>

" Ctrl-g commits for current buffer (file)
nnoremap <silent> <C-g> :BCommits<CR>

" Ctrl-q to exit a buffer without saving
nnoremap <silent> <C-q> :q!<CR>

" turn off some buttons for learning
"    inoremap <esc> <nop>
"    nnoremap <Left> <nop>
"    nnoremap <Right> <nop>
"    nnoremap <Up> <nop>
"    nnoremap <Down> <nop>

""""""""""""""""""
"    ABBREVS     "
""""""""""""""""""

iabbrev adn and
iabbrev tehn then
iabbrev prinvate private



"++++++++++++
" GO STUFF  +
"++++++++++++
filetype plugin indent on

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    autocmd FileType go nmap <leader>t  <Plug>(go-test)


""""""""""""""""""
"  OTHER STUFF   "
""""""""""""""""""
" automatically run LimeLight when in Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!  " turn off the light when done!

let python_highlight_all=1

let g:airline_theme = 'minimalist'

" NERDtree settings ---------------------
map <C-n> :NERDTreeToggle<CR>	" open and close NERDTree with ctrl+n

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"set a toggle switch for when i don't want NERDTree to automatically open
let nerd_auto=0
if (nerd_auto == 1)
	autocmd vimenter * NERDTree		" autmatically open NERDTree on vim startup
endif


"++++++++++++++++++++++
" EXPERIMENTAL STUFF  +
"++++++++++++++++++++++

" compile and run c prgrams easier

" gcc: short cut to compile C programs in Vim
function! s:gcc()
    :exec system('gcc -Wall -fsanitize=address ' . expand('%'))
  endfunction

  command! Gcc :call <SID>gcc()

  " run a compiled c program with optional args
  " and output into a new buffer
  function! s:runc(...)
    if a:0 > 0
      let l:args = join(a:000[0:], ' ')
      let l:cmd = "./a.out " . l:args
    else
      let l:cmd = "./a.out"
    endif

    let p = system(l:cmd)
    :tabnew
    :put=p
  endfunction

  command! -nargs=* Runc :call <SID>runc(<f-args>)
