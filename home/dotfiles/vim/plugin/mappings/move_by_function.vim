" move up/down quickly by using M-j, M-k
" which will move us around by functions
"
nn <silent> <M-j> }
nn <silent> <M-k> {
nn <silent> <D-j> }
nn <silent> <D-k> {

augroup movebyfunction
  autocmd!

  au FileType ruby map <buffer> <M-j> ]m
  au FileType ruby map <buffer> <M-k> [m
  au FileType rspec map <buffer> <M-j> }
  au FileType rspec map <buffer> <M-k> {
  au FileType javascript map <buffer> <M-j> }
  au FileType javascript map <buffer> <M-k> {

  au FileType ruby map <buffer> <D-j> ]m
  au FileType ruby map <buffer> <D-k> [m
  au FileType rspec map <buffer> <D-j> }
  au FileType rspec map <buffer> <D-k> {
  au FileType javascript map <buffer> <D-j> }
  au FileType javascript map <buffer> <D-k> {
augroup END
