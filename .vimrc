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
Plugin 'jiangmiao/auto-pairs'               " auto close parentheses, brackets, quotes
Plugin 'wakatime/vim-wakatime'              " add wakatime to vim
Plugin 'scrooloose/nerdtree'                " directory listing in vim
Plugin 'vim-airline/vim-airline'            " status bar for the bottom of windows
Plugin 'vim-airline/vim-airline-themes'     " themes for airline
Plugin 'tomasiser/vim-code-dark'            " colorscheme to match default vs code theme
Plugin 'editorconfig/editorconfig-vim'
Plugin 'maxbrunsfeld/vim-yankstack'         " save your most recent yanks. usage: :Yanks
Plugin 'fatih/vim-go'                       " go support in vim
Plugin 'arcticicestudio/nord-vim'           " nord color theme
Plugin 'nvie/vim-flake8'                    " PEP 8 python syntax checking
Plugin 'jistr/vim-nerdtree-tabs'            " like it syas, nerdtree tabs
Plugin 'breakthatbass/vim-ripgrep'
Plugin 'jeaye/color_coded'                  " get proper highlighting for c, c++, obj-c
Plugin 'vimwiki/vimwiki'
Plugin 'romainl/apprentice'


" All of your Plugins must be added before the following line
call vundle#end()						" required
filetype plugin indent on			" required

"----------------------------------------------------------------------------"
"   BASIC SETTINGS                                                           "
"----------------------------------------------------------------------------"

set number		      " line numbers
set numberwidth=1	  " line nums space
set relativenumber  " line numbers relative to cursor
set wrap		        " write long lines into next line
set linebreak		    " break lines between strings
set shiftwidth=2	  " '<>' indents this many spaces
set ignorecase      " search commands are case insensitive
set backspace=indent,eol,start " make backspace work properly
set mouse=a         " allow mouse interaction
set visualbell      " turn off annoying sounds
set noshowmode      " Don't show the current mode (airline.vim takes care of us)
set t_vb=           " disable flashing
set nobackup        " no backups, swp files
set tabstop=3 softtabstop=3   " tab -> 4 chars long, soft -> 4 spaces long
set smartindent
set laststatus=2    " show status bar even if one file is open
set ignorecase      " search command ignores cases
set noshowmode      " don't show current mode. airline does it
set t_vb=           " disable flashing
set nobackup        " no backups
set noswapfile
set incsearch       " get search results as you type

set cursorline


"seoul256 color theme stuff-------------
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 235
"
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253"

let g:seoul256_background = 233
colorscheme seoul256
syntax on

autocmd FileType c colorscheme tumnus
autocmd FileType go colorscheme tumnus
autocmd FileType python colorscheme tumnus

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

" insert a newline in normal mode
nnoremap <leader><return> $i<Right><return><esc>

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

" go to top of file with ,-t
nnoremap <leader>t :1<cr>

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

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

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


"
"   use ctrl-down to move down 25 lines from current position
function! s:move_down_25()
  let l:pos = line(".")
  let l:next_pos = l:pos + 25

  if l:next_pos >= line("$")
    echom "REACHED END OF FILE"
    execute line("$")
  else
    execute l:next_pos
  endif
endfunction

command! Down :call <SID>move_down_25()

nnoremap <silent> <C-Down> :Down<CR>

"
"   use ctrl-Up to move up 25 lines from current position
function! s:move_up_25() abort
  let l:pos = line(".")
  let l:next_pos = l:pos - 25

  if l:next_pos < 1
    echom "REACHED TOP OF FILE"
    execute 1
  else
    execute l:next_pos
  endif
endfunction

command! Up :call <SID>move_up_25()

nnoremap <silent> <C-Up> :Up<CR>

" dark: set dark mode
function! s:dark()
  colo seoul256
  set background=dark
endfunction

" light: set light mode
function! s:light()
  let g:seoul256_light_background = 256
  colo seoul256-light
  set background=light
endfunction

" set the functions as commands
command! Light :call <SID>light()
command! Dark :call <SID>dark()

