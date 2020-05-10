" common
Plug 'tpope/vim-abolish'              " easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-commentary'           " plugin to comment/uncomment stuff
Plug 'tpope/vim-endwise'              " helps to end certain structures automatically
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'             " quoting/parenthesizing
Plug 'tpope/vim-unimpaired'           " complementary pairs of mappings
Plug 'tpope/vim-scriptease'           " a Vim plugin for Vim plugins
Plug 'tpope/vim-vinegar'              " netrw enhancer
Plug 'tpope/vim-eunuch'               " unix shell commands in Vim
Plug 'tpope/vim-dispatch'             " asynchronous build and test dispatcher
Plug 'tpope/vim-rsi'                  " emacs mappings for insert and command line modes
Plug 'tpope/vim-sleuth'               " heuristically set buffer options
Plug 'tpope/vim-obsession'            " session management
Plug 'tpope/vim-capslock'             " software capslock (gC or <C-G>c)
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-speeddating'          " use <C-a>/<C-x> to increment dates, times and more

" displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

Plug 'chrisbra/vim-diff-enhanced'
Plug 'terryma/vim-expand-region'
Plug 'Wolfy87/vim-expand'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'

" navigation & search
Plug 'kshenoy/vim-signature'          " plugin to toggle, display and navigate marks
Plug 'junegunn/vim-slash'             " enhancing in-buffer search experience

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/git-bump'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'idanarye/vim-merginal'
Plug 'int3/vim-extradite'
Plug 'gregsexton/gitv'
Plug 'junegunn/gv.vim'

" clear and make transparent vim's background color in terminal
Plug 'miyakogi/seiya.vim'

" color schemes
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'MichaelMalick/vim-colors-bluedrake'
Plug 'wimstefan/Lightning'
Plug 'jeetsukumaran/vim-nefertiti'
Plug 'morhetz/gruvbox'
Plug 'ninja/sky'
Plug 'geoffharcourt/one-dark.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'zanglg/nova.vim'
Plug 'ajmwagar/vim-dues'

Plug 'vim-scripts/Sift'
Plug 'drzaal/vert-laiton'
Plug 'vim-scripts/oceandeep'
Plug 'AlessandroYorba/Alduin'
Plug 'kocakosm/hilal'

" languages, ft, syntax

" html, css, less, sass, stylus, sugarss
Plug 'othree/html5.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'mattn/emmet-vim'
Plug 'groenewege/vim-less'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'stephenway/postcss.vim'
Plug 'wavded/vim-stylus'

" javascript, jsx, json, tern
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'sheerun/vim-json'
Plug 'gutenye/json5.vim'
Plug 'marijnh/tern_for_vim'

Plug 'ruanyl/coverage.vim'

" typescript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim'

" flowtype
Plug 'flowtype/vim-flow'

" reasonml
Plug 'reasonml/vim-reason'

" julia
Plug 'dcjones/julia-minimalist-vim'

" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-heroku'
Plug 'tpope/vim-cucumber'
Plug 'keith/rspec.vim'
Plug 'slim-template/vim-slim'

" latex
Plug 'LaTeX-Box-Team/LaTeX-Box'

" c, c++
Plug 'kergoth/aftersyntaxc.vim'
Plug 'vim-jp/vim-cpp'
Plug 'octol/vim-cpp-enhanced-highlight'

" rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" pony
Plug 'dleonard0/pony-vim-syntax'

" scala
Plug 'derekwyatt/vim-scala'

" swift
Plug 'toyamarinyon/vim-swift'

" ocaml
Plug 'rgrinberg/vim-ocaml'
Plug 'let-def/ocp-indent-vim'

" coq
Plug 'the-lambda-church/coquille'

" erlang, elixir
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'elixir-lang/vim-elixir'

" go
Plug 'fatih/vim-go'

" perl
Plug 'vim-perl/vim-perl'

" clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'vim-scripts/vim-niji'

" it is too slow: https://github.com/tpope/vim-salve#faq
" Plug 'tpope/vim-salve'

" python
Plug 'mitsuhiko/vim-python-combined'

" haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
" Plug 'hspec/hspec.vim'
" Plug 'eagletmt/neco-ghc'
" Plug 'nbouscal/vim-stylish-haskell'
" Plug 'dag/vim2hs'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': './install.sh'
"     \ }

" elm
Plug 'lambdatoast/elm.vim'

" purescript
Plug 'purescript-contrib/purescript-vim'
" TODO: configure
" Plug 'FrigoEU/psc-ide-vim'

" idris
Plug 'idris-hackers/idris-vim'

" ats2
Plug 'bakpakin/ats2.vim'
" Plug 'vmchale/ats-vim'

" arduino
Plug 'sudar/vim-arduino-syntax'

" solidity
Plug 'tomlion/vim-solidity'

" markdown
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'nelstrom/vim-markdown-preview'

" brewfile
Plug 'bfontaine/Brewfile.vim'

" liquid
Plug 'tpope/vim-liquid'

" nginx
Plug 'mutewinter/nginx.vim'

" octave
Plug 'vim-scripts/octave.vim--'

" docker
Plug 'honza/dockerfile.vim'
Plug 'kevinhui/vim-docker-tools'

" dhall
Plug 'vmchale/dhall-vim'

" ansible
Plug 'pearofducks/ansible-vim'

" tmux
Plug 'tmux-plugins/vim-tmux'

Plug 'sheerun/vim-yardoc'
Plug 'stephpy/vim-yaml'
Plug 'uarun/vim-protobuf'
Plug 'tikhomirov/vim-glsl'
Plug 'zah/nim.vim'
Plug 'cespare/vim-toml'

" nix
Plug 'LnL7/vim-nix'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock'

" tools
Plug 'vim-scripts/paredit.vim'

Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'
Plug 'roktas/syntastic-more'

Plug 'sbdchd/neoformat'

Plug 'Konfekt/FastFold'
Plug 'duff/vim-bufonly'

Plug 'christoomey/vim-tmux-navigator'
Plug 'pbrisbin/vim-mkdir'
Plug 'terryma/vim-multiple-cursors'
Plug 'matze/vim-move'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" An ack/ag/pt/rg powered code search and view tool
Plug 'dyng/ctrlsf.vim'
Plug 'rking/ag.vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" try to use netrw + vinegar instead
"
Plug 'scrooloose/nerdtree'

Plug 'EinfachToll/DidYouMean'
Plug 'dietsche/vim-lastplace'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'mhinz/vim-signify'
Plug 'wellle/tmux-complete.vim'

Plug 'rizzatti/dash.vim'

Plug 'wakatime/vim-wakatime'

" snippets
Plug 'SirVer/ultisnips'
Plug 'ahmedelgabri/vim-ava-snippets'
Plug 'vyorkin/vim-snippets'
