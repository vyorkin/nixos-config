" use <Space> as leader key
let mapleader="\<Space>"

let $SKIP_HOOKUP = 1

call plug#begin('~/.config/nvim/plugged')

" load plugins if any
if filereadable(expand('~/.config/nvim/plugins.vim'))
  source ~/.config/nvim/plugins.vim
endif

call plug#end()

" load plugin settings
for f in split(glob('~/.config/nvim/plugin/**/*.vim'), '\n')
  exe 'source' f
endfor

if &t_Co > 1                    " if terminal supports colors
  syntax on                     " turn on syntax highlighting
  set hlsearch                  " highlight search matches
endif

" filetype detection
filetype plugin on              " ft plugin files
filetype indent on              " ft indent files

set secure                      " don't allow autocmd, shell and write commands in .vimrc
set exrc                        " search for .vimrc in the current dir

set hidden                      " buffer can be put to the background without writing to disk
set wildmenu                    " show completion options

let g:netrw_liststyle=3         " wide listing (multiple files in columns)

" numbers
set numberwidth=3               " min num of cols to use for the line numbers
set norelativenumber            " dont use relative numbers
set nonumber                    " turn off line numbers

" misc
set mouse=a                     " enable mouse (in all modes)
set backspace=indent,eol,start  " allow backspace in insert mode
set history=100                 " how many commands & search patterns to keep in history
set visualbell                  " no sounds
set lazyredraw                  " don't redraw while in macros
set ruler                       " always display the current cursor position (row, col)
set ttyfast                     " use fast terminal connection
set shortmess=atIO              " use short messages, skip :intro, truncate file msg to fit on the cmd line

set termguicolors

" folding
set foldnestmax=3               " deepest fold in 3 levels
set foldcolumn=1                " column on the left that indicates open and closed folds

set autoread                    " automatically read file when it has been changed outside of Vim
set autowriteall                " always write modified files (don't need to set autowrite)

set ttimeout                    " use key sequence timeouts
set ttimeoutlen=30              " how long to wait for a key seq to complete

" line wrapping & text formatting
set nowrap                      " don't wrap long lines
set linebreak                   " use 'breakat' to decide when to wrap long lines
set whichwrap=b,s,<,>,[,]       " allow wrap while moving with space, backspace, arrows (in normal & insert modes)
set textwidth=80                " maximum width of text (useful for formatting with gq)
set formatoptions=qlcrnj1       " format options that doesn't suck

" don't display hidden chars cuz its too distracting
set nolist
" strings to use in list mode (tabs, end of line, trailing spaces, etc)
set listchars=tab:▸\ ,eol:¬,trail:·,extends:>,precedes:<

" status line
set laststatus=2                " always show status line (even on single window)
set showcmd                     " display incomplete commands
set showmode                    " show current mode

" OmniCompletion settings
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,preview,longest

" mkview saves all except local buffer/window options
set viewoptions=cursor,folds,slash,unix

" indentation:
" keep tabstop on 8
" use softtabstop set to 2
set autoindent                  " copy indent from current line when starting a new line
set smartindent                 " enable smart indent
set smarttab                    " use shiftwidth to insert blanks on <Tab> in front of a line, same for <BS>
set shiftwidth=2                " number of spaces to use for each (auto)indent
set softtabstop=2               " number of spaces that a <Tab> counts for edit operations (treat 2 spaces like a real <Tab>)
set expandtab                   " always insert spaces instead of tabs
set shiftround                  " round indent when shifting

" search
set ignorecase                  " ignore case when searching
set smartcase                   " override ignorecase if the search pattern contains upper case letters
set incsearch                   " display the match for a search pattern when halfway typing it

" bracket matching
set showmatch                   " briefly jump to the matching bracket
set matchtime=1                 " how long to show matching paren

" don't squeeze window too much
set winwidth=50
set winminwidth=30

" window splitting
set splitbelow                  " put a new window on the right side
set splitright                  " put a new window below the current one (1/10 sec)

" scrolling
set scrolloff=12                " vertical offset
set sidescrolloff=12            " horizontal offset
set sidescroll=1                " minimal number of columns to scroll horizontally

" dir to store temp files: swaps, undo history
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

if has('persistent_undo')
  " keep undo history across sessions by storing it in file
  " auto save/restore undo history on buffer write/read
  set undodir=~/.vim-tmp/undo/,~/.vim/undo/,~/.tmp,~/tmp,/var/tmp,/tmp
  set undofile
endif

" turn off swap files & backups
" cuz its really annoying
set noswapfile                  " don't use buffer swap files
set nowritebackup               " don't write backups

set background=dark

if &background=="dark"
  colorscheme base16-black-metal
else
  colorscheme tomorrow
endif

" get rid of the vertical separator for split windows
:set fillchars+=vert:\ 

" colorscheme switching for vimdiff
au FilterWritePre * if &diff | colorscheme strange | AirlineTheme tomorrow | endif

" conceal settings
set conceallevel=2              " concealed text is completely hidden
set concealcursor=nc            " don't reveal the conceals unless on insert or visual modes

" allow mispelings when :wq-ing
cabbrev ew :wq
cabbrev qw :wq

" enable matchit.vim plugin
runtime macros/matchit.vim

" hack to make <c-h> mappings work
"
" btw it won't work without this:
" https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
"
" for more info see:
" https://github.com/neovim/neovim/issues/2294
if has('nvim')
  nmap <BS> <C-W>h
endif

" autocommands

" filetype detection
augroup ftdetection
  autocmd!
  au BufRead,BufNewFile *.tpp,*.inl,*.cxx,*.cc set filetype=cpp
  au BufRead,BufNewFile *.es6 set filetype=javascript
  au BufRead,BufNewFile *.nvim set filetype=vim
augroup END
