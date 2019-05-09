(require 'init-general)

(use-package flycheck
  :requires init-general
  :after general
  :init
  (setq-default
   flycheck-disabled-checkers
   '(emacs-lisp-checkdoc
     javascript-jshint
     haskell-stack-ghc
     haskell-ghc
     haskell-hlint))
  (setq
   flycheck-highlighting-mode 'lines
   flycheck-indication-mode 'left-fringe
   flycheck-mode-line-prefix "fly"
   flycheck-javascript-eslint-executable "eslint_d")
  :config
  ;; make the error list display like similar lists in contemporary IDEs
  ;; like VisualStudio, Eclipse, etc.
  (add-to-list
   'display-buffer-alist
   `(,(rx bos "*fucking errors*" eos)
     ;; (display-buffer-reuse-window
     ;;  display-buffer-in-side-window)
     (side            . bottom)
     (reusable-frames . visible)
     (window-height   . 0.33)))
  (global-flycheck-mode 1)
  (unbind-key "C-j" flycheck-error-list-mode-map)
  (nmap
    :prefix rc/leader
    "e e" 'flycheck-list-errors
    "e c" 'flycheck-clear
    "e i" 'flycheck-manual
    "e C" 'flycheck-compile
    "e n" 'flycheck-next-error
    "e p" 'flycheck-previous-error
    "e b" 'flycheck-buffer
    "e v" 'flycheck-verify-setup
    "e V" 'flycheck-verify-checker)
  :diminish flycheck-mode)

(use-package flycheck-inline
  ;; doesn't work well for long error stack traces
  :disabled
  :after flycheck
  :demand t
  :preface
  (defun rc/flycheck-inline/toggle ()
    (interactive)
    (if (equal flycheck-display-errors-function 'flycheck-inline-error-messages)
        (setq-local flycheck-display-errors-function 'flycheck-display-error-messages)
      (flycheck-inline-enable)))
  :hook
  (flycheck-mode . flycheck-inline-enable)
  :config
  (nmap
    :prefix rc/leader
    "e t" 'rc/flycheck-inline/toggle))

(provide 'init-flycheck)
