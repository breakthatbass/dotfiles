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
Plugin 'mattn/webapi-vim'
Plugin 'cocopon/iceberg.vim'                " iceberg color theme
Plugin 'arcticicestudio/nord-vim'           " nord color theme
Plugin 'Badacadabra/vim-archery'            " archery color theme
Plugin 'nvie/vim-flake8'                    " PEP 8 python syntax checking
Plugin 'jistr/vim-nerdtree-tabs'            " like it syas, nerdtree tabs
Plugin 'dracula/vim'
Plugin 'breakthatbass/vim-ripgrep'
Plugin 'jaredgorski/spacecamp'              " colors for the final frontier
Plugin 'jeaye/color_coded'                  " get proper highlighting for c, c++, obj-c


" All of your Plugins must be added before the following line
call vundle#end()						" required
filetype plugin indent on			" required


"----------------------------------------------------------------------------"
"   BASIC SETTINGS                                                           "
"----------------------------------------------------------------------------"


syntax on                         " syntax highlighting
set t_Co=256
set t_ut=''

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
set visualbell                    " turn off annoying sounds
set cursorline                    " Highlight current line
set noshowmode                    " Don't show the current mode (airline.vim takes care of us)
set t_vb=                         " disable flashing
set nobackup                      " no backups, swp files
set nowb
set noswapfile
set encoding=utf-8
set listchars=tab:>-



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


"----------------------------------------------------------------------------"
"   MAPPINGS                                                                 "
"----------------------------------------------------------------------------

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


"++++++++++++
" GO STUFF  +
"++++++++++++

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

"
"
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

"seoul256 color theme stuff-------------
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 23
"
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253

let s:col = "seoul"
if (s:col == "seoul")
  " set dark mode as default
  let g:seoul256_background = 235
  colo seoul256
  set background=dark
else
  colorscheme nord
endif

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


"----------------------------------------------------------------------------"
"   FUNCTIONS                                                                "
"----------------------------------------------------------------------------"


" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


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


"++++++++++++++++++++++
" EXPERIMENTAL STUFF  +
"++++++++++++++++++++++

" compile and run c prgrams easier

" gcc: short cut to compile C programs in Vim
function! s:gcc()
  :exec system('gcc -Wall -fsanitize=address ' . expand('%'))
endfunction

command! Gcc :call <SID>gcc()

" run a compiled c program and direct the output into a buffer
function! s:runc()
  :new | r ! ./a.out
endfunction

command! Runc :call <SID>runc()


" short cut to 'go run' command in vim
function! s:gorun(...)
  if a:0 != 0
    :exec system('go run ' . expand('%'))
  else
    :exec system('go run ' . expand('%') . a:000)
  endif
endfunction
command! -nargs=+ Gr :call <SID>gorun(<f-args>)


" usage: :Nog [command] <year> <day>
function! s:Call_nog(...) abort
  if a:0 != 3
    echom "usage: :Nog [command] <year> <day>"
  endif

  let l:year = a:2
  let l:day = a:3

  if a:1 == "input"
    let l:cmd = "nog --input --year=" . l:year . " --day=" . l:day
    let p = system(cmd)
    :tabnew
    :put=p
  endif
endfunction

command! -nargs=+ Nog :call <SID>Call_nog(<f-args>)


" functions for working through the Go Programming
" Language book by Alan Donovan & Brian Kernighan
"
" usage:
" :Gopl [command] [a1, a2, ...]
" 
" commands:
" run
"         --> compile and run the current program
"         --> same as `go run prog.go`
" build
"         --> compile the current prog to an equivelent bin name
"         --> same as `go build -o prog prog.go`

function! s:gopl(...) abort
  " deal with arguments
  if a:0 < 1
    echom "usage: :Gopl [command] [arg1, args2, ...]"
    return 1
  endif

  if a:1 == "run"
    " check for additional args
    if a:0 > 1
      " if so, concat them to a string
      let l:args = join(a:000[1:], ' ')
      let l:cmd = "go run " . expand("%") . " " . l:args
    else
      let l:cmd = "go run " . expand("%")
    endif
  endif
  
  let p = system(l:cmd)
  :tabnew
  :put=p

endfunction

command! -nargs=* Gopl :call <SID>gopl(<f-args>)
