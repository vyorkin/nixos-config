" Maintainer:     Cameron Grout (camerongrout@gmail.com)
" Last Change:    July 30th, 2010
" Initially based on 'wombat' by Lars H. Nielsen (dengmao@gmail.com)

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "glade"

" General colors 
" Keyword           Foreground      Background      Font Effect

" The character under the cursor
hi Cursor           guifg=NONE      guibg=#656565   gui=none

" Like Cursor, but used when in IME mode |CursorIM|
"hi CursorIM         guifg=NONE      guibg=NONE      gui=none

" The screen column that the cursor is in when 'cursorcolumn' is set
hi CursorColumn     guifg=NONE      guibg=#2d2d2d   gui=none

" The screen line that the cursor is in when 'cursorline' is set
hi CursorLine       guifg=NONE      guibg=#2d2d2d   gui=none

" Directory names (and other special names in listings)
"hi Directory        guifg=NONE      guibg=NONE      gui=none

" Diff mode: Added line |diff.txt|
hi DiffAdd          guifg=#0000ff   guibg=#95e454   gui=none

" Diff mode: Changed line |diff.txt|
hi DiffChange       guifg=#ff0000   guibg=#ffff66   gui=none

" Diff mode: Deleted line |diff.txt|
hi DiffDelete       guifg=#ffffff   guibg=#ff7777   gui=none

" Diff mode: Changed text within a changed line |diff.txt|
hi DiffText         guifg=#ff0000   guibg=#ffff00   gui=none

" Error messages on the command line
hi ErrorMsg         guifg=#ffffff   guibg=#ff0000   gui=none

" The column separating vertically split windows
hi VertSplit        guifg=#444444   guibg=#444444   gui=none

" Line used for closed folds
hi Folded           guifg=#a0a8b0   guibg=#384048   gui=none

" The column on the left if 'foldcolumn' is non-zero
hi FoldColumn       guifg=#a0a8b0   guibg=#384048   gui=none

" Column where signs are displayed
" hi SignColumn       guifg=NONE      guibg=NONE      gui=none

" 'incsearch' highlighting; also used for the text replaced with :s///c
hi IncSearch        guifg=NONE      guibg=#dd7700   gui=none

" Line number for :number and":# commands, and when 'number' option is set.
hi LineNr           guifg=#857b6f   guibg=#000000   gui=none

" Paired bracket highlighting for bracket under, or before cursor
hi MatchParen       guifg=#f6f3e8   guibg=#857b6f   gui=none

" 'showmode' message (e.g., -- INSERT --)
hi ModeMsg          guifg=#ffffff   guibg=NONE      gui=none

" 'more' message (e.g., -- More --) 
hi MoreMsg          guifg=#00cc00   guibg=NONE      gui=none

" '~' and '@' at the end of the window, characters from 'showbreak'
hi NonText          guifg=#808080   guibg=#303030   gui=none

" Normal text
hi Normal           guifg=#f6f3e8   guibg=#242424   gui=none

" Popup menu: normal item.
hi Pmenu            guifg=#f6f3e8   guibg=#444444   gui=none

" Popup menu: selected item.
hi PmenuSel         guifg=#000000   guibg=#cae682   gui=none

" Popup menu: scrollbar.
"hi PmenuSbar        guifg=NONE      guibg=NONE      gui=none

" Popup menu: Thumb of the scrollbar.
"hi PmenuThumb       guifg=NONE      guibg=NONE      gui=none

" |hit-enter| prompt and yes/no questions
hi Question         guifg=#00cc00   guibg=NONE      gui=none

" Last search pattern highlighting (see 'hlsearch')
"hi Search           guifg=NONE      guibg=NONE      gui=none

" Meta and special keys listed with :map, also unprintable chars
hi SpecialKey       guifg=#808080   guibg=#343434   gui=none

" Word that is not recognized by the spellchecker
"hi SpellBad         guifg=NONE      guibg=NONE      gui=none

" Word that should start with a capital
"hi SpellCap         guifg=NONE      guibg=NONE      gui=none

" Word that is recognized by the spellchecker as one that is in another region
"hi SpellLocal       guifg=NONE      guibg=NONE      gui=none

" Word that is recognized by the spellchecker as one that is hardly ever used
"hi SpellRare        guifg=NONE      guibg=NONE      gui=none

" Status line of current window
hi StatusLine       guifg=#f6f3e8   guibg=#444444   gui=none

" Status lines of not-current windows
hi StatusLineNC     guifg=#857b6f   guibg=#444444   gui=none

" Tab pages line, not active tab page label
"hi TabLine          guifg=NONE      guibg=NONE      gui=none

" Tab pages line, where there are no labels
"hi TabLineFill      guifg=NONE      guibg=NONE      gui=none

" Tab pages line, active tab page label
"hi TabLineSel       guifg=NONE      guibg=NONE      gui=none

" Titles for output from :set all, :autocmd etc.
hi Title            guifg=#f6f3e8   guibg=NONE      gui=none

" Visual mode selection
hi Visual           guifg=#f6f3e8   guibg=#444444   gui=none

" Visual mode selection when vim is 'Not Owning the Selection'.
hi VisualNOS        guifg=#f6f3e8   guibg=#444444   gui=none

" Warning messages
"hi WarningMsg       guifg=NONE      guibg=NONE      gui=none

" Current match in 'wildmenu' completion
"hi WildMenu         guifg=NONE      guibg=NONE      gui=none


" Syntax highlighting 

" Group "Comment"-------------------->> 


hi Comment          guifg=#999988   guibg=NONE      gui=none        " * "

" Group "Constant"------------------->> 


hi Constant         guifg=#ee7777   guibg=NONE      gui=none        " * "


hi String           guifg=#95e454   guibg=NONE      gui=none


hi Character        guifg=#ffcc00   guibg=NONE      gui=none


hi Number           guifg=#cb6300   guibg=NONE      gui=none


hi Boolean          guifg=#00ccff   guibg=NONE      gui=none


hi Float            guifg=#dd8822   guibg=NONE      gui=none

" Group "Identifier"----------------->> 


hi Identifier       guifg=#ffcc00   guibg=NONE      gui=none        " * "


hi Function         guifg=#ffcc00   guibg=NONE      gui=none

" Group "Statement"------------------>> 


hi Statement        guifg=#0099ff   guibg=NONE      gui=none        " * "


" Conditional


" Repeat


" Label


" Operator


hi Keyword          guifg=#8ac6f2   guibg=NONE      gui=none


" Exception

" Group "PreProc"-------------------->> 


hi PreProc          guifg=#cb6300   guibg=NONE      gui=none        " * "


" Include


" Define


" Macro


" PreCondit

" Group "Type"----------------------->> 


hi Type             guifg=#00cc00   guibg=NONE      gui=none        " * "


" StorageClass


" Structure


" TypeDef

" Group "Special"-------------------->> 


hi Special          guifg=#e7f6da   guibg=NONE      gui=none        " * "


" SpecialChar


" Tag


" Delimiter


" SpecialComment


" Debug

" Group "Underlined"----------------->> 


" Underlined                                                        " * "

" Group "Ignore"--------------------->> 


" Ignore                                                            " * "

" Group "Error"---------------------->> 


" Error                                                             " * "

" Group "Todo"----------------------->> 


hi Todo             guifg=#ff0000   guibg=#ffff33   gui=none        " * "

" Keyword           Foreground      Background      Font Effect
