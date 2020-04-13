" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" goto code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" symbol renaming
nmap <leader>e <Plug>(coc-rename)

" formatting selected code
xmap <leader>,  <Plug>(coc-format-selected)
nmap <leader>,  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" applying codeAction to the selected region.
" Example: `<leader>ccp` for current paragraph
xmap <leader>c  <Plug>(coc-codeaction-selected)
nmap <leader>c  <Plug>(coc-codeaction-selected)

" remap keys for applying codeAction to the current line
nmap <leader>cc  <Plug>(coc-codeaction)
" apply AutoFix to problem on the current line.
nmap <leader>.  <Plug>(coc-fix-current)

" introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" mappings using CoCList:
" show all diagnostics
nnoremap <silent> <space>da  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>de  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>dc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>do  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>ds  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>dj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>dk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>dp  :<C-u>CocListResume<CR>
