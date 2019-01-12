let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
