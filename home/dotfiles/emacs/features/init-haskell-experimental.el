(require 'init-quelpa)
(require 'init-general)
(require 'init-flycheck)
(require 'init-haskell)

(use-package hlint-refactor
  :disabled
  :requires init-general
  :after (general haskell-mode)
  :commands
  (hlint-refactor-refactor-buffer
   hlint-refactor-refactor-at-point)
  :hook
  (haskell-mode . hlint-refactor-mode)
  :config
  (nmap 'haskell-mode-map
    :prefix rc/leader
    "h r " 'hlint-refactor-refactor-at-point
    "h b" 'hlint-refactor-refactor-buffer)
  :diminish hlint-refactor-mode)

(use-package flycheck-haskell
  ;; LSP works well, no need for flycheck-haskell
  ;; see the lsp-ui package:
  ;; https://github.com/emacs-lsp/lsp-ui/blob/master/lsp-ui-flycheck.el
  :disabled
  :requires init-flycheck
  :after (haskell-mode flycheck)
  :hook
  ;; if you get the "suspicious state from syntax checker haskell-stack-ghc ..." error
  ;; first, try building your lib, exe, tests to see if this solves the problem
  (flycheck-mode . flycheck-haskell-setup))

(use-package ghc
  ;; I prefer LSP
  :disabled
  :hook
  (haskell-mode . ghc-init)
  (haskell-mode . ghc-toggle-check-command)
  :config
  (autoload 'ghc-init "ghc" nil t)
  (autoload 'ghc-debug "ghc" nil t)
  (nmap 'haskell-mode-map
    "C-c U" 'ghc-toggle-check-command
    "C-c C-i" 'ghc-insert-module
    "C-c I" 'ghc-initial-code-from-signature
    "C-c O" 'ghc-insert-template-or-signature))

(use-package company-ghc
  :disabled
  :requires (init-general init-haskell)
  :after (general ghc haskell-mode)
  :init
  (setq company-ghc-show-info t)
  :config
  (add-to-list 'company-backends 'company-ghc)
  (nmap 'haskell-mode-map
    "C-c h" 'company-ghc-complete-by-hoogle
    "C-c m" 'company-ghc-complete-in-module))

(use-package ghci-completion
  ;; I don't now what it does
  ;; GHCI completion seem to work without it
  :disabled
  :hook
  (inferior-haskell-mode . turn-on-ghci-completion))

(use-package hsearch-mode
  ;; haskell-mode already provides that
  :disabled
  :quelpa (hsearch-mode :fetcher github :repo "jschaf/hsearch")
  :config
  (nmap 'haskell-mode-map
    :prefix rc/leader
    "i" 'hsearch))

;; (use-package flycheck-stack
;;   :after (flycheck haskell-mode)
;;   :preface
;;   (defun rc/flycheck-stack/setup ()
;;     (flycheck-select-checker 'stack)
;;     (flycheck-mode))
;;   :hook
;;   (haskell-mode . rc/flycheck-stack/setup))

(use-package flycheck-ghcmod
  :disabled
  :requires init-flycheck
  :after (haskell-mode flycheck))

(use-package intero
  :disabled
  :requires init-general
  :after (general haskell-mode)
  :if (executable-find "stack")
  :config
  (intero-global-mode 1)
  (nmap 'intero-mode-map
    "C-c r" 'intero-restart
    "M-l" 'intero-goto-definition)
  :delight "int")

(provide 'init-haskell-experimental)
