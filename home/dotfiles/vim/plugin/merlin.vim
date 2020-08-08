let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

nmap <silent> gd <Plug>

" Note that you need to run :
" :execute "helptags " . substitute(system('opam config var share'),'\n$','','''')
  "/merlin/vim/doc"
" to manually to update the documentation.
