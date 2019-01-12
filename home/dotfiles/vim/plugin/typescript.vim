let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_completion_preview = 1

nn ,te :TsuGeterr<CR>
nn ,ti :TsuImport<CR>

autocmd FileType typescript nmap <buffer> <Leader>tr <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>tR <Plug>(TsuquyomiRenameSymbolC)

autocmd FileType typescript nmap <buffer> <Leader>L <Plug>(TsuquyomiDefinition)
autocmd FileType typescript nmap <buffer> <Leader>H <Plug>(TsuquyomiGoBack)

autocmd FileType typescript nmap <buffer> <Leader>k :TsuquyomiReferences<CR>
