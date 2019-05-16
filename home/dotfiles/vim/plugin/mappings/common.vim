" C-h fix https://github.com/christoomey/vim-tmux-navigator#it-doesnt-work-in-neovim-specifically-c-h
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" hate holding <Shift> every time I need to enter a cmd
nn ; :
nn : ;

" start an external command with a single bang
nn ! :!

" make 0 go to the first character
" rather than the beginning of the line
nn 0 ^
nn ^ 0

" toggle paste mode
nn ,tt :set invpaste<CR>

" toggle numbers
nn <silent> <F12> :set number! relativenumber!<CR>

nn <Leader><Leader> V     " enter visual model with <Leader><Leader>

" format the entire file
nn ,ff :normal! gg=G``<CR>
nn ,ffa :Neoformat<CR>

" set text wrapping toggles
nn <silent> <Leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nn <silent> <Leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" open/close quickfix window faster
nn <silent> ,qc :cclose<CR>
nn <silent> ,qo :copen<CR>

" move back and forth through previous and next buffers with ,z and ,x
nn <silent> ,z :bp<CR>
nn <silent> ,x :bn<CR>

" easily move between next and previous errors
nn <silent> <Leader>J :lnext<CR>
nn <silent> <Leader>K :lprevious<CR>

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
nn <silent> ,cf :let @* = expand("%:~")<CR>
nn <silent> ,cn :let @* = expand("%:t")<CR>

"(v)imrc (r)eload
nn <silent> ,vr :so $MYVIMRC<CR>
