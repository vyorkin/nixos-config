(require 'init-general)
(require 'init-company)
(require 'init-flycheck)
(require 'init-org)

(use-package clojure-mode
  :requires (init-general init-company init-org)
  :after (general company org)
  :mode
  (("\\.clj\\'" . clojure-mode)
   ("\\.edn\\'" . clojure-mode)
   ("\\.boot\\'" . clojure-mode)
   ("\\.cljs.*\\'" . clojure-mode))
  :init
  (setq inferior-lisp-program "lein repl")
  :config
  (add-to-list 'org-babel-load-languages '(clojure . t))
  (nmap 'clojure-mode-map
    :prefix rc/leader
    "C s" 'cider-start-http-server
    "C r" 'cider-refresh
    "C u" 'cider-user-ns
    "C R" 'cider-restart)
  (define-clojure-indent (fact 1))
  (define-clojure-indent (facts 1)))

(use-package clojure-mode-extra-font-locking
  :after clojure-mode
  :init
  (font-lock-add-keywords
   nil
   '(("(\\(facts?\\)"
      (1 font-lock-keyword-face))
     ("(\\(background?\\)"
      (1 font-lock-keyword-face)))))

(use-package cider
  :after clojure-mode
  :commands cider-mode
  :custom
  (cider-repl-result-prefix ";; => ")
  :init
  (setq
   ;; go right to the REPL buffer when it's finished connecting
   cider-repl-pop-to-buffer-on-connect t
   ;; when there's a cider error, show its buffer and switch to it
   cider-show-error-buffer t
   cider-auto-select-error-buffer t
   cider-repl-history-file "~/.emacs.d/cider-history"
   cider-repl-wrap-history t)
  :hook
  ((cider-mode . clojure-mode-hook)
   (eldoc-mode . cider-mode-hook)))

(use-package kibit-helper)

(use-package flycheck-clojure
  :requires init-flycheck
  :after (flycheck clojure-mode))

(use-package 4clojure
  ;; TODO: Doesn't work for some reason
  :disabled)

(provide 'init-clojure)
