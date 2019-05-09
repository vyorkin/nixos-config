(use-package emacs
  :ensure nil
  :init
  (put 'narrow-to-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  :custom
  (scroll-step 1)
  ;; disable *GNU Emacs* buffer on startup
  (inhibit-startup-screen t "Don't show splash screen")
  (use-dialog-box nil "Disable dialog boxes")
  (use-file-dialog nil "Disable file dialog")
  ;; allow minibuffer commands while in the minibuffer
  (enable-recursive-minibuffers t "Allow minibuffer commands in the minibuffer")
  ;; use spaces instead of tabs everywhere
  (indent-tabs-mode nil "Spaces!"))

(use-package files
  :ensure nil
  :hook
  (before-save . delete-trailing-whitespace)
  :custom
  (require-final-newline t)
  ;; backup settings
  (backup-by-copying t)
  ;; (backup-directory-alist
  ;;  '(("." . "~/.cache/emacs/backups")))
  (delete-old-versions t)
  (kept-new-versions 6)
  (kept-old-versions 2)
  (version-control t))

(use-package autorevert
  :ensure nil
  :diminish auto-revert-mode)

(use-package cus-edit
  :ensure nil
  :custom
  ;; alternatively, one can use `(make-temp-file "emacs-custom")'
  (custom-file null-device "Don't store customizations"))

(use-package epa
  :ensure nil
  :custom
  (epg-gpg-program "gpg")
  (epa-pinentry-mode nil))

(use-package uniquify
  :ensure nil
  :custom
  ;; use "foo/bar/qux"
  (uniquify-buffer-name-style 'forward))

(use-package frame
  :ensure nil
  :config
  ;; disabled blinking cursor
  (blink-cursor-mode 0)
  ;; disable suspending on C-z
  :bind
  ("C-z" . nil))

(use-package delsel
  :ensure nil
  ;; C-c C-g always quits minubuffer
  :bind
  ("C-c C-g" . minibuffer-keyboard-quit))

(use-package simple
  :ensure nil
  :diminish
  ((visual-line-mode . " ↩")
   (auto-fill-function . " ↵"))
  :config
  (line-number-mode t)
  (column-number-mode t)
  (toggle-truncate-lines 1)
  ;; enable automatic line breaking
  (auto-fill-mode t)
  ;; wrap lines always
  ;; (global-visual-line-mode)
  :bind
  ;; remap ctrl-w/ctrl-h
  (("C-c h" . help-command)
   ("C-x C-k" . kill-region)
   ("C-h" . delete-backward-char)))

(use-package prog-mode
  :ensure nil
  :init
  (setq prettify-symbols-unprettify-at-point 'right-edge)
  :config
  ;; convert certain words into symbols, e.g. lambda becomes λ.
  (global-prettify-symbols-mode t))

(use-package ibuffer
  :ensure nil
  :bind
  ([remap list-buffers] . ibuffer))

(use-package mule
  :ensure nil
  :config
  (prefer-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-language-environment "UTF-8"))

(use-package man
  :ensure nil
  :custom-face
  (Man-overstrike ((t (:inherit font-lock-type-face :bold t))))
  (Man-underline ((t (:inherit font-lock-keyword-face :underline t)))))

(use-package calendar
  :ensure nil
  :custom
  (calendar-week-start-day 1))

(provide 'init-common)
