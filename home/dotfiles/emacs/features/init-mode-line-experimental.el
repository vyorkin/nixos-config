(use-package feebleline
  ;; this one is cool
  :disabled
  :init
  (setq
   feebleline-mode-line-text
   '(("%6s" ((format "%s,%s" (format-mode-line "%l") (current-column))))
     (" : %s"
      ((if (buffer-file-name) (buffer-file-name)
         (buffer-name))) (face feebleline-bufname-face))
     ("%s" ((if (and (buffer-file-name) (buffer-modified-p)) "*" "" ))
      (face feebleline-asterisk-face))
     (" | %s" ((feebleline-previous-buffer-name))
      (face feebleline-previous-buffer-face))))
  :config
  (setq mode-line-format nil))

(use-package smart-mode-line
  :disabled
  :config
  (setq
   rm-blacklist
   '(" WK" " SP" " =>"
     " Undo-Tree" " ivy" " company"
     " Fly" " FlyC" " FlyC-" " FlyC:0/4"
     " FlyC:1/4" " FlyC:0/8" " es"
     " PgLn" " LR" " jk" " ARev"))
  (setq sml/theme 'respectful)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(use-package telephone-line
  :disabled
  :config
  (setq
   telephone-line-primary-left-separator 'telephone-line-flat
   telephone-line-secondary-left-separator 'telephone-line-flat
   telephone-line-primary-right-separator 'telephone-line-flat
   telephone-line-secondary-right-separator 'telephone-line-flat
   telephone-line-height 20
   telephone-line-evil-use-short-tag t)
  (require 'telephone-line-config)
  (telephone-line-evil-config))

(use-package powerline
  :disabled
  :init
  (setq
   powerline-height (truncate (* 1.0 (frame-char-height)))
   powerline-default-separator 'utf-8)
  :config
  ;; see: https://www.emacswiki.org/emacs/DelightedPowerLine
  (defadvice powerline-major-mode (around delight-powerline-major-mode activate)
    "Ensure that powerline's major mode names are delighted. See `delight-major-mode'."
    (let ((inhibit-mode-name-delight nil)) ad-do-it))
  (powerline-default-theme))

(use-package moody
  :disabled
  :config
  (let ((line (face-attribute 'mode-line :underline)))
    (set-face-attribute 'mode-line          nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :underline  line)
    (set-face-attribute 'mode-line          nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :background "#384047"))
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))


(provide 'init-mode-line-experimental)
