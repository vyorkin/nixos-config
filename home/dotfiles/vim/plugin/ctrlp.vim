if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g ""'
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.sass-cache|cache|\.rsync_cache|vendor/([^\/]+\/)*vendor)$\|\.yardoc\|node_modules\|bower_components\|tmp\|coverage\|build\|dist\',
    \ 'file': '\.jar$\|\.exe$\|\.dll\|\.so$\|\.dat$|\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\.zip$\|\.jpeg$\|\.jpg$\|\.png$\|\.gif$\|\.woff$\|\.eot$\|\.ttf$\|\.aux$\|\.class|\~$\|\.min\.js$|\.min\.css$\|\[\[buffergator-tabs\]\]$'
    \ }
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" use ctrlp-py-match that performs much faster (up to x22)
" see FelikZ/ctrlp-py-matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" default to filename searches - so that appctrl will find application controller
let g:ctrlp_by_filename = 0
let g:ctrlp_use_caching = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_clear_cache_on_exit = 1
" i want it to be on top & stay the same size
let g:ctrlp_match_window = 'top,order:btt,min:0,max:8,results:8'

let g:ctrlp_map = '<c-q>'

" Additional mapping for buffer search
nn <silent> <C-b> :CtrlPBuffer<CR>

" Alt-p to clear the cache
" nn <Esc>p :ClearCtrlPCache<CR>

"Ctrl-m is not good - it overrides behavior of Enter
nn ,jj :CtrlPBufTag<CR>
