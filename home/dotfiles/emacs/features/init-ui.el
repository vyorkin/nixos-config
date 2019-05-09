(use-package tool-bar
  :ensure nil
  :config
  (tool-bar-mode -1))

(use-package scroll-bar
  :ensure nil
  :config
  (scroll-bar-mode -1))

(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

;; I generally prefer to hide the menu bar,
;; but doing this on OS X simply makes it
;; update unreliably in GUI frames, so we make an exception
(if (eq system-type 'darwin)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (set-frame-parameter frame 'menu-bar-lines
                                     (if (display-graphic-p frame) 1 0))))
  (when (fboundp 'menu-bar-mode)
    (menu-bar-mode -1)))

(when (fboundp 'pixel-scroll-mode)
  (pixel-scroll-mode 1))

(when (boundp 'window-divider-mode)
  (setq window-divider-default-places t
        window-divider-default-bottom-width 0
        window-divider-default-right-width 0)
  (window-divider-mode +1))

;; disable native fullscreen support
;; I don't like sliding animation on macOS
(setq ns-use-native-fullscreen nil)

;; start maximized
(toggle-frame-maximized)

;; display tabs as 2 spaces
(setq-default tab-width 2)

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")

(setq
 frame-title-format
 '((:eval (if (buffer-file-name)
              (abbreviate-file-name (buffer-file-name))
            "%b"))))

;; non-zero values for `line-spacing' can mess up ansi-term and co,
;; so we zero it explicitly in those cases.
(add-hook
 'term-mode-hook
 (lambda () (setq line-spacing 0)))

;; highlight parens
(setq show-paren-style 'parenthesis)
(show-paren-mode 1)

;; set fringe size
(fringe-mode '(12 . 12))

;; over-write selection to make things
;; slightly less uncomfortable to others
(delete-selection-mode t)

;; don't wrap long lines
(setq-default truncate-lines t)

;; set left and right margins for every window
(setq-default left-margin-width 2)
(setq-default right-margin-width 2)

(set-window-buffer nil (current-buffer))

;; for smooth scrolling (could be slow):
;; scroll-conservatively 10000
;; scroll-preserve-screen-position t
(setq
 scroll-margin 0
 scroll-conservatively 0
 scroll-preserve-screen-position nil)

(use-package time
  :ensure nil
  :custom
  (display-time-default-load-average nil)
  (display-time-24hr-format t)
  :config
  (display-time-mode t))

;; wrap text at 80 characters
(setq-default fill-column 80)

(use-package hl-line
  ;; it is super-slow
  :disabled
  :if window-sytem
  :init
  ;; set the highlight line color
  (set-face-background 'hl-line "#222")
  :config
  ;; cursor position
  (global-hl-line-mode 0))

;; cursor look
(setq cursor-type 'bar)
(setq x-stretch-cursor t)

;; turn-off tooltips on cursor hover-over
(setq mode-line-default-help-echo nil)

(setq
 mode-line-position
 '((line-number-mode ("%l" (column-number-mode ":%c")))))

(provide 'init-ui)
