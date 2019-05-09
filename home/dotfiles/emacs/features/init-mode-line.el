(require 'init-appearance)

(use-package spaceline
  :init
  (setq
   powerline-default-separator 'bar
   spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  ;; (spaceline-helm-mode)
  )

(use-package spaceline-all-the-icons
  :disabled
  :after spaceline
  :custom
  ;; other separators may look broken (e.g. when scaling text)
  (spaceline-all-the-icons-separator-type 'none)
  :config
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-package-updates)
  (spaceline-all-the-icons--setup-git-ahead)
  (spaceline-all-the-icons--setup-paradox))

(provide 'init-mode-line)
