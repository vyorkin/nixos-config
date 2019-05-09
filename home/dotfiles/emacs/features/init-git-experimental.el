(require 'init-general)

(use-package diff-hl
  ;; slow
  :disabled
  :requires init-general
  :after general
  :hook
  ((magit-post-refresh . diff-hl-magit-post-refresh)
   (prog-mode . diff-hl-mode)
   (org-mode . diff-hl-mode)
   (dired-mode . diff-hl-dired-mode))
  :config
  (nmap
    :prefix rc/leader
    "t G" 'global-diff-hl-mode))

(provide 'init-git-experimental)
