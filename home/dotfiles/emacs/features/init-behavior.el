(require 'init-general)

(setq
 ;; auto refresh dired, but be quiet about it
 global-auto-revert-non-file-buffers t
 auto-revert-verbose nil
 tags-revert-without-query 1
 tags-add-tables nil
 delete-by-moving-to-trash t
 trash-directory "~/.emacs.d/trash")

;; unobtrusively trim extraneous whitespace only in lines edited
(use-package ws-butler
  :config
  (ws-butler-global-mode)
  :diminish ws-butler-mode)

(use-package aggressive-indent
  :hook
  ((emacs-lisp-mode css-mode c++-mode) . aggressive-indent-mode)
  :config
  ;; prevent lines jumping around in c++-mode
  ;; when you haven't typed the ";" yet
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and
     (derived-mode-p 'c++-mode)
     (null (string-match
            "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
            (thing-at-point 'line))))))

;; save buffers when they lose focus
(use-package super-save
  :config
  (super-save-mode +1)
  :diminish)

;; goto last change in current buffer
(use-package goto-chg
  :requires init-general
  :after general
  :config
  (nmap
    :prefix rc/leader
    "." 'goto-last-change
    "," 'goto-last-change-reverse)
  ;; additional keybindings for macOS
  (when (eq system-type 'darwin)
    (nmap
      "s-." 'goto-last-change
      "s-," 'goto-last-change-reverse)))

;; key bindings are provided by evil-collection
(use-package which-key
  :diminish which-key-mode
  :init
  (setq
   which-key-idle-delay 0.5
   which-key-sort-order 'which-key-prefix-then-key-order-reverse
   ;; hack to make this work with Evil
   which-key-show-operator-state-maps t
   which-key-prefix-prefix ""
   which-key-side-window-max-width 0.5
   which-key-popup-type 'side-window
   which-key-side-window-location 'bottom)
  :config
  (which-key-mode)
  (with-eval-after-load 'evil-collection
    (add-to-list 'evil-collection-mode-list 'while-key)))

(use-package free-keys
  :commands free-keys)

(use-package sudo-edit)

(use-package try
  :defer t)

(use-package restart-emacs
  :requires init-general
  :after general
  :demand t
  :commands (restart-emacs)
  :config
  (nmap
    :prefix rc/leader
    "Z" 'restart-emacs))

(provide 'init-behavior)
