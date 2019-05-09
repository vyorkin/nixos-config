(require 'init-company)
(require 'init-general)
(require 'init-flycheck)

(use-package typescript-mode
  :requires (init-flycheck)
  :after flycheck
  :init
  (setq
   typescript-indent-level 2
   flycheck-check-syntax-automatically '(save mode-enabled)
   flycheck-tslint-args . ("--type-check"))
  :delight "ts")

;; most of key bindings
;; are provided by evil-collection
(use-package tide
  :requires
  (init-general
   init-flycheck
   init-company)
  :after
  (typescript-mode
   general
   company
   flycheck)
  :preface
  (defun rc/tide/setup ()
    (tide-setup)
    (flycheck-mode +1)
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (add-to-list
     'compilation-error-regexp-alist
     '("ERROR in \\(.*\\)\n(\\([0-9]+\\),\\([0-9]+\\)):" 1 2 3))
    (company-mode +1))
  (defun rc/tide/setup-tsx ()
    (when (string-equal "tsx" (file-name-extension buffer-file-name))
      (rc/tide/setup)))
  :hook
  ((typescript-mode . rc/tide/setup)
   ;; enable tide for .tsx files
   (web-mode . rc/tide/setup-tsx))
  :config
  ;; alternative to evil-collection key bindings
  (mmap 'tide-mode-map
    "M-j" 'tide-find-next-reference
    "M-k" 'tide-find-previous-reference
    "M-l" 'tide-jump-to-definition
    "M-h" 'tide-jump-back
    "M-i" 'tide-jump-to-implementation)
  (mmap 'tide-mode-map
    :prefix rc/leader
    "!" 'tide-restart-server
    "." 'tide-documentation-at-point
    "r" 'tide-references
    "e" 'tide-project-errors
    "n" 'tide-rename-symbol
    "t" 'tide-format
    "x" 'tide-fix
    "@" 'tide-refactor))

(provide 'init-typescript)
