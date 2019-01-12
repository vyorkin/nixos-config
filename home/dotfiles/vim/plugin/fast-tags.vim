" taken from https://github.com/elaforge/fast-tags/blob/master/vimrc
augroup tags
au BufWritePost *.hs            silent !init-tags %
au BufWritePost *.hsc           silent !init-tags %
augroup END
