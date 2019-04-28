" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 30

let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_focus_on_files = 1

let NERDTreeIgnore = ['\.tern-port']

nn <Leader>q :NERDTreeToggle<cr>
nn <Leader>a :NERDTreeFocus<cr>
nn <Leader>r :NERDTreeFind<cr>
