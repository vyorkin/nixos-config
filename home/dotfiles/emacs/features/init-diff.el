(use-package diff-mode
  :mode "/patch$"
  :init
  (setq
   ;; open patches in read-only mode by default.
   diff-default-read-only t))

(provide 'init-diff)
