" ,# surround a word with #
nm ,# ysiw#
" #{ruby interpolation}
vn ,# c#{<C-R>"}<ESC>

" ," surround a word with "quotes"
nm ," ysiw"
vn ," c"<C-R>""<ESC>

" ,' surround a word with 'single quotes'
nm ,' ysiw'
vn ,' c'<C-R>"'<ESC>

" ,) or ,( surround a word with (parens)
" The difference is in whether a space is put in
nm ,( ysiw(
nm ,) ysiw)
vn ,( c( <C-R>" )<ESC>
vn ,) c(<C-R>")<ESC>

" ,[ surround a word with [brackets]
nm ,] ysiw]
nm ,[ ysiw[
vn ,[ c[ <C-R>" ]<ESC>
vn ,] c[<C-R>"]<ESC>

" ,{ surround a word with {braces}
nm ,} ysiw}
nm ,{ ysiw{
vn ,} c{ <C-R>" }<ESC>
vn ,{ c{<C-R>"}<ESC>
