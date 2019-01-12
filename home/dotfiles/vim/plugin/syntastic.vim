let g:syntastic_aggregate_errors = 1

let g:syntastic_css_checkers = ['stylelint']

let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_javascript_flow_exe = 'flow'
let g:syntastic_javascript_eslint_exec = 'eslint_d'

let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint --type-check']
" let g:syntastic_typescript_checkers = ["tscompletejob"]

let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_html_checkers = ['']

let g:syntastic_ocaml_checkers = ['merlin']

let g:syntastic_make_checkers = ['gnumake']
let g:syntastic_gitcommit_checkers = ['language_check']
let g:syntastic_python_checkers = ['pyflakes_with_warnings']
let g:syntastic_yaml_checkers = ['pyyaml']

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" angularjs specific ignores
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", "lacks \"src", "trimming empty"]

" careful, its super slow
let g:syntastic_check_on_open = 0

let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '>'
let g:syntastic_style_error_symbol = '~'
let g:syntastic_style_warning_symbol = '!'

let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_auto_jump = 0
let g:syntastic_enable_signs = 1

" see
" https://github.com/vim-syntastic/syntastic/issues/1082#issuecomment-43449150
autocmd FileType qf setlocal wrap
