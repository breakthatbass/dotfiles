let g:fp = '~/projects/dotfiles/.zshrc'
let g:vrc = readfile('.vimrc')


function! s:strchr(str, substr)
  split(a:str)
  for l:s in a:str
    if l:s == a:substr
      echo a:str
    endif
  endfor
endfunction



for g:line in g:vrc
  call s:strchr(g:line, 'FUNCTIONS')
endfor
