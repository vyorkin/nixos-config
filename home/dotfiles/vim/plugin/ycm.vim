let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_min_num_of_chars_for_completion = 1

let g:ycm_semantic_triggers =  {
\   'c' : ['->', '.'],
\   'objc' : ['->', '.'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::', '"', "'", 'use ', 'namespace ', '\'],
\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
\   'html': ['<', '"', '</', ' '],
\   'vim' : ['re![_a-za-z]+[_\w]*\.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\   'haskell' : ['.', 're!.']
\ }

let g:ycm_filetype_specific_completion_to_disable = {
\ 'gitcommit': 1
\ }
