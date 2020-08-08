" prerequisites:
" opam install tuareg merlin ocp-indent

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')

execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"

" NOTE: that you need to run
" :execute "helptags " . substitute(system('opam config var share'),'\n$','','''')
  "/merlin/vim/doc"
" to manually to update the documentation.

nnoremap <Leader>t :MerlinTypeOf<CR>
nnoremap <Leader>n :MerlinGrowEnclosing<CR>
nnoremap <Leader>p :MerlinShrinkEnclosing<CR>
vmap <Leader>t :MerlinTypeOfSel<CR>

nnoremap gd :MerlinLocate<space>
