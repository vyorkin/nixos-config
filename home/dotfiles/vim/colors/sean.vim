" Maintainer:  Sean Catchpole (sean@sunsean.com)
" Last Change: August 17, 2011
" Comments: Based on Twilight & Wombat

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "sean"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine   ctermbg=233 guibg=#1D1D1D
  hi CursorColumn ctermbg=236 guibg=#1D1D1D
  hi MatchParen   ctermfg=202 ctermbg=NONE cterm=bold    guifg=#F55B2C guibg=NONE gui=bold
  hi Pmenu        ctermfg=253 ctermbg=234  guifg=#FFFAFA guibg=#444444
  hi PmenuSel     ctermfg=16  ctermbg=133  guifg=#000000 guibg=#CAE682
endif

" General colors
hi Cursor       ctermfg=NONE ctermbg=246  cterm=none guifg=NONE    guibg=#555555 gui=none
hi Normal       ctermfg=231  ctermbg=232  cterm=none guifg=#FFFAFA guibg=#111111 gui=none
hi NonText      ctermfg=238  ctermbg=232  cterm=none guifg=#080808 guibg=#080808 gui=none
hi LineNr       ctermfg=239  ctermbg=16   cterm=none guifg=#857B6F guibg=#080808 gui=none
hi StatusLine   ctermfg=231  ctermbg=234  cterm=bold guifg=#FFFAFA guibg=#141414 gui=italic
hi StatusLineNC ctermfg=243  ctermbg=234  cterm=none guifg=#857B6F guibg=#141414 gui=none
hi TabLine      ctermfg=243  ctermbg=234  cterm=bold guifg=#857B6F guibg=#080808 gui=bold
hi TabLineFill  ctermfg=243  ctermbg=234  cterm=bold guifg=#857B6F guibg=#080808 gui=bold
hi TabLineSel   ctermfg=231  ctermbg=236  cterm=bold guifg=#FFFAFA guibg=#141414 gui=bold
hi VertSplit    ctermfg=234  ctermbg=234  cterm=none guifg=#141414 guibg=#141414 gui=none
hi Folded       ctermfg=251  ctermbg=233  cterm=none guifg=#AAAAAA guibg=#222222 gui=none
hi Title        ctermfg=230  ctermbg=NONE cterm=bold guifg=#FFFAFA guibg=NONE    gui=bold
hi Visual       ctermfg=231  ctermbg=236  cterm=none guifg=#FFFAFA guibg=#444444 gui=none
hi SpecialKey   ctermfg=244  ctermbg=236  cterm=none guifg=#808080 guibg=#343434 gui=none

" Syntax highlighting
hi Comment      ctermfg=245  guifg=#99968B gui=italic
hi Todo         ctermfg=247  ctermbg=NONE  cterm=bold guifg=#8F8F8F guibg=NONE gui=bold,italic
hi Constant     ctermfg=210  cterm=none guifg=#E5786D gui=none
hi String       ctermfg=113  cterm=none guifg=#95E454 gui=italic
hi Identifier   ctermfg=228  cterm=none guifg=#CAE682 gui=none
hi Function     ctermfg=228  cterm=none guifg=#CAE682 gui=none
hi Type         ctermfg=228  cterm=none guifg=#FFFF99 gui=none
hi Statement    ctermfg=111  cterm=none guifg=#8AC6F2 gui=none
hi Keyword      ctermfg=81   cterm=none guifg=#8AC6F2 gui=none
hi PreProc      ctermfg=210  cterm=none guifg=#E5786D gui=none
hi Number       ctermfg=203  cterm=none guifg=#E5786D gui=none
hi Special      ctermfg=225  cterm=none guifg=#FFFAFA gui=none
hi Search       guifg=NONE   guibg=NONE gui=underline
