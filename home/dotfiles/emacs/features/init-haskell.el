(require 'init-quelpa)
(require 'init-general)
(require 'init-eldoc)
(require 'init-projectile)
(require 'init-company)
(require 'init-lsp)
(require 'init-org)

;; TODO: pretty good haskell config: https://github.com/sergv/dotemacs/blob/e27d912611ef25aa309cf1d7486b9dcad9793406/src/haskell/haskell-misc.el#L138

(use-package haskell-mode
  :requires
  (init-general
   init-eldoc
   init-company
   init-org)
  :after
  (general company eldoc)
  :quelpa
  (haskell-mode :fetcher github :repo "haskell/haskell-mode")
  :mode
  (("\\.hs\\(c\\|-boot\\)?\\'" . haskell-mode)
   ("\\.lhs\\'" . literate-haskell-mode)
   ("\\.cabal\\'" . haskell-cabal-mode))
  :preface
  (defun rc/haskell-mode/setup ()
    ;; tread symbol (e.g. "_") as a word
    (defalias 'forward-evil-word 'forward-evil-symbol)
    ;; (subword-mode 1)
    ;; (eldoc-overlay-mode)       ; annoying
    ;; (haskell-indentation-mode) ; hi2 ftw
    ;; there are some tools that dont't work with unicode symbols
    ;; (turn-on-haskell-unicode-input-method)
    ;; affects haskell-indentation-mode
    (setq-local evil-auto-indent nil)
    (face-remap-add-relative
     'font-lock-doc-face
     'font-lock-comment-face)
    (flymake-mode-off))
  (defvar haskell-process-use-ghci nil)
  (defun rc/haskell-mode/toggle-process-type ()
    "Toggle GHCi process between cabal and ghci"
    (interactive)
    (if haskell-process-use-ghci
        (progn
          ;; you could set it to "cabal-repl" if
          ;; you're using the old cabal workflow
          (setq haskell-process-type 'cabal-new-repl)
          (setq haskell-process-use-ghci nil)
          (message "Using cabal new-repl"))
      (progn
        (setq haskell-process-type 'stack-ghci)
        (setq haskell-process-use-ghci t)
        (message "Using stack ghci"))))
  (defun rc/haskell-mode/show-process-log ()
    "Display *haskell-process-log* buffer in other window"
    (interactive)
    (switch-to-buffer-other-window "*haskell-process-log*"))
  :hook
  (haskell-mode . rc/haskell-mode/setup)
  :init
  (setq
   ;; enable debug logging to *haskell-process-log* buffer
   haskell-process-log t
   ;; don't generate tags via hasktags after saving
   haskell-tags-on-save nil
   ;; don't run stylish-haskell on the buffer before saving
   ;; something it just inserts a bunch of spaces at the end of the line for no reason
   haskell-stylish-on-save nil

   ;; don't show debugging tips when starting the process
   haskell-process-show-debug-tips nil
   ;; don't suggest removing import lines as warned by GHC
   haskell-process-suggest-remove-import-lines nil
   ;; don't suggest adding packages to .cabal file
   haskell-process-suggest-add-package nil
   ;; don't suggest restarting the f*****g process
   haskell-process-suggest-restart nil
   ;; don't suggest adding the OverloadedStrings extensions
   haskell-process-suggest-overloaded-strings nil

   ;; auto import the modules reported by GHC to have been loaded
   haskell-process-auto-import-loaded-modules t
   ;; don't popup errors in a separate buffer
   haskell-interactive-popup-errors nil
   ;; use "cabal new-repl" as the inferior haskell process
   haskell-process-type 'cabal-new-repl
   ;; haskell-process-args-stack-ghci '("--ghci-options=-ferror-spans")
   ;; use "stack build" as the default build command
   ;; haskell-compile-cabal-build-command "stack build --no-library-profiling"
   haskell-compile-cabal-build-command "cd %s && make build")
  :config
  ;; common
  (nmap '(haskell-mode-map haskell-cabal-mode-map haskell-interactive-mode-map)
    "C-c C-b" 'haskell-compile
    "C-c C-k" 'haskell-interactive-mode-kill
    "C-c C-r" 'haskell-process-restart
    "C-c C-d" 'haskell-cabal-add-dependency
    "C-c C-l" 'haskell-interactive-mode-clear
    "C-c C-h" 'haskell-hoogle
    "C-c SPC" 'haskell-session-change-target
    "C-c C-c" 'rc/haskell-mode/show-process-log)
  (nmap '(haskell-mode-map haskell-cabal-mode-map)
    "C-c C-j" 'haskell-interactive-switch)
  (nmap '(haskell-mode-map haskell-interactive-mode-map)
    "C-c c v" 'haskell-cabal-visit-file
    "C-c c b" 'haskell-process-cabal-build
    "C-c c r" 'haskell-process-cabal)
  (nmap 'haskell-compilation-mode-map
    "C-k" 'windmove-up ;; bind it back
    "M-k" 'compilation-previous-error
    "M-j" 'compilation-next-error)
  (nmap 'haskell-mode-map
    "C-c T" 'rc/haskell-mode/toggle-process-type
    "C-c H" 'haskell-hayoo
    "C-c C-m" 'haskell-auto-insert-module-template
    "C-c ." 'haskell-hide-toggle
    "C-c C-o" 'haskell-process-load-file
    "C-c C-SPC" 'haskell-interactive-copy-to-prompt
    "C-c C-f" 'haskell-mode-stylish-buffer
    "C-c C-t" 'haskell-process-do-type
    "C-c C-i" 'haskell-process-do-info
    ;; hit it repeatedly to jump between groups of imports
    "C-c C-u" 'haskell-navigate-imports)
  (require 'haskell-interactive-mode)
  (unbind-key "C-j" haskell-interactive-mode-map)
  (nmap 'haskell-interactive-mode-map
    "C-c C-j" 'haskell-interactive-switch-back)
  (imap 'haskell-interactive-mode-map
    "C-c C-l" 'haskell-interactive-mode-clear)
  (add-to-list 'org-babel-load-languages '(haskell . t))
  :delight "hs")

(use-package lsp-haskell
  ;; it enables flymake for some reason
  ;; which creates "_flymake" files
  :disabled
  :requires (init-general init-lsp)
  :after (lsp-mode lsp-ui general haskell-mode)
  :init
  (setq
   lsp-haskell-process-path-hie "hie-wrapper"
   lsp-haskell-set-completion-snippets-on t)
  :config
  (add-hook 'haskell-mode-hook #'lsp))

(use-package hi2
  :after haskell-mode
  :init
  (setq
   hi2-layout-offset 2
   hi2-left-offset 2
   hi2-where-post-offset 2)
  :config
  (put 'hi2-where-post-offset 'safe-local-variable 'numberp)
  (put 'hi2-left-offset 'safe-local-variable 'numberp)
  (put 'hi2-layout-offset 'safe-local-variable 'numberp)
  (imap
    'hi2-mode-map
    "<tab>" 'hi2-indent-line)
  :diminish hi2-mode)

(use-package hindent
  ;; bear in mind that it doesn't support unicode syntax
  ;; so all your cool unicode operators will be replaced
  :requires init-general
  :after (general haskell-mode)
  :hook
  (haskell-mode . hindent-mode)
  :config
  ;; "r" - reformat
  (vmap 'haskell-mode-map
    "C-c r" 'hindent-reformat-region)
  (nmap 'haskell-mode-map
    "C-c r" 'hindent-reformat-buffer
    "C-c R" 'hindent-reformat-decl)
  :diminish hindent-mode)

(use-package company-cabal
  :after haskell-mode
  :config
  (add-to-list 'company-backends 'company-cabal))

(use-package hasky-stack
  :requires init-general
  :after (general haskell-mode)
  :config
  (nmap 'haskell-mode-map
    :prefix rc/leader
    "h s" 'hasky-stack-execute
    "h n" 'hasky-stack-new))

(use-package hasky-extensions
  :requires init-general
  :after (general haskell-mode)
  :config
  (nmap 'haskell-mode-map
    :prefix rc/leader
    "h e" 'hasky-extensions
    "h d" 'hasky-extensions-browse-docs))

(provide 'init-haskell)
