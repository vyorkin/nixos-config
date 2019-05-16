" let $FZF_DEFAULT_COMMAND='ag -l -g ""'
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

nn <silent> <C-q> :Files<CR>
nn <silent> <C-s> :Snippets<CR>
nn <silent> <C-e> :Commits<CR>
nn <silent> <C-b> :Buffers<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

let g:fzf_layout = { 'down': '~20%' }

" mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
