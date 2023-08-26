"config specific to latex files

setlocal spell
set spelllang=en,it
"splell check: Ctrl+l correct previous spelling mistake
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
