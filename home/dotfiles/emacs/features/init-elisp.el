(require 'init-general)
(require 'init-company)
(require 'init-smartparens)

(use-package elisp-mode
  :requires (init-general init-company init-smartparens)
  :after (general company smartparens)
  :ensure nil
  :config
  (nmap 'emacs-lisp-mode-map
   "M-." 'find-function-at-point
   "M-," 'find-variable-at-point)
  (add-to-list 'company-backends 'company-elisp)
  (sp-with-modes 'emacs-lisp-mode
    (sp-local-pair "'" nil :actions nil)))

(use-package elisp-refs
  :after elisp-mode)

(use-package auto-compile
  :init
  ;; prefer the newest version of file
  (setq load-prefer-newer t)
  ;; dont' display the Compile-Log buffer pop up when a file is being saved
  (setq auto-compile-display-buffer nil)
  ;; only show the number of compile warnings for the current file in the mode-line
  (setq auto-compile-mode-line-counter t)
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(use-package macrostep
  :requires init-general
  :after elisp-mode
  :demand t
  :commands macrostep-expand
  :mode ("\\*.el\\'" . emacs-lisp-mode)
  :config
  ;; support Macrostep in Evil mode
  (general-define-key
   :keymaps 'macrostep-keymap
   "q" 'macrostep-collapse-all
   "e" 'macrostep-expand)
  (nmap
    :keymaps 'emacs-lisp-mode-map
    :prefix rc/leader
    "m e" 'macrostep-expand))

(use-package autoinsert
  :hook
  (find-file . auto-insert))

(provide 'init-elisp)
