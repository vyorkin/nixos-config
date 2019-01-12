" When using vimdiff or diff mode
hi DiffAdd    term=bold         ctermbg=green ctermfg=white  cterm=bold guibg=DarkGreen  guifg=White    gui=bold
hi DiffText   term=reverse,bold ctermbg=red   ctermfg=yellow cterm=bold guibg=DarkRed    guifg=yellow   gui=bold
hi DiffChange term=bold         ctermbg=black ctermfg=white  cterm=bold guibg=Black      guifg=White    gui=bold
hi DiffDelete term=none         ctermbg=blue  ctermfg=blue   cterm=none guibg=DarkBlue   guifg=DarkBlue gui=none
if &background == "light"
  " Changes when bg=white fg=black
  hi DiffAdd                   ctermfg=black cterm=bold guibg=green      guifg=black
  hi DiffText   ctermbg=yellow ctermfg=red   cterm=bold guibg=yellow     guifg=red
  hi DiffChange ctermbg=none   ctermfg=none  cterm=bold guibg=white      guifg=black
  hi DiffDelete                                         guibg=lightblue  guifg=lightblue
endif

" When viewing a diff or patch file
hi diffRemoved term=bold ctermbg=black   ctermfg=red    cterm=bold guibg=DarkRed     guifg=white gui=none
hi diffAdded   term=bold ctermbg=black   ctermfg=green  cterm=bold guibg=DarkGreen   guifg=white gui=none
hi diffChanged term=bold ctermbg=black   ctermfg=yellow cterm=bold guibg=DarkYellow  guifg=white gui=none
hi diffLine    term=bold ctermbg=magenta ctermfg=white  cterm=bold guibg=DarkMagenta guifg=white gui=none
hi diffFile    term=bold ctermbg=yellow  ctermfg=black  cterm=none guibg=DarkYellow  guifg=white gui=none
if &background == "light"
  " Changes when bg=white fg=black
  hi diffRemoved cterm=none guibg=Red     guifg=black
  hi diffAdded   cterm=none guibg=Green   guifg=black
  hi diffChanged cterm=none guibg=Yellow  guifg=black
  hi diffLine    cterm=none guibg=Magenta guifg=black
  hi diffFile    cterm=none guibg=Yellow  guifg=black
endif
