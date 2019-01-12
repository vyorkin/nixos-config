let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'haskell': ['hie', '--lsp'],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'haskell': ['*.cabal'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> <Leader>? :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <Leader>R :call LanguageClient#textDocument_rename()<CR>
