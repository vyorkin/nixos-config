(require 'init-general)

(use-package yasnippet
  :requires init-general
  :after general
  :init
  (setq
   yas-wrap-around-region t
   yas-indent-line t
   yas-snippet-dirs '("~/.emacs.d/yasnippet-snippets/snippets"))
  :config
  (yas-global-mode 1)
  (nmap
    :prefix rc/leader
    "y i" 'yas-insert-snippet
    "y n" 'yas-new-snippet
    "y v" 'yas-visit-snippet-file
    "y r" 'yas-reload-all)
  (imap
    "C-l" 'yas-insert-snippet)
  :diminish yas-minor-mode)

(use-package ivy-yasnippet
  :config
  (imap
    "C-s" 'ivy-yasnippet))

(use-package auto-yasnippet
  :after (general yasnippet)
  :config
  (nmap
    :prefix rc/leader
    "y c" 'aya-create
    "y e" 'aya-expand
    "y o" 'aya-open-line))

;; I use my fork of yasnippet-snippet
;; instead of the packages below

;; (use-package aws-yasnippets :after yasnippet)
;; (use-package clojure-snippets :after yasnippet)
;; (use-package common-lisp-snippets :after yasnippet)
;; (use-package elixir-yasnippets :after yasnippet)
;; (use-package elm-yasnippets :after yasnippet)
;; (use-package go-snippets :after yasnippet)
;; (use-package haskell-snippets :after yasnippet)
;; (use-package java-snippets :after yasnippet)
;; (use-package pony-snippets :after yasnippet)
;; (use-package react-snippets :after yasnippet)

(provide 'init-yasnippet)
