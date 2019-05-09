(require 'init-general)

;; key bindings are provided by evil-collection
(use-package neotree
  :requires init-general
  :after general
  :preface
  (defvar rc/neotree/open-app
    (if (eq system-type 'darwin)
        "open" "xdg-open"))
  (defun rc/neotree/setup (_unused)
    (linum-mode -1)
    (visual-line-mode -1)
    (vi-tilde-fringe-mode -1))
  :init
  (setq
   neo-autorefresh t
   neo-theme (if (display-graphic-p) 'nerd 'arrow)
   neo-smart-open t
   neo-window-width 25
   neo-auto-indent-point t
   neo-create-file-auto-open t
   neo-mode-line-type 'none
   neo-confirm-create-file 'off-p
   neo-confirm-delete-file 'off-p
   neo-confirm-delete-directory-recursively 'off-p
   neo-confirm-kill-buffers-for-files-in-directory 'off-p
   neo-default-system-application rc/neotree/open-app
   neo-confirm-create-directory 'off-p
   neo-confirm-change-root 'off-p)
  :config
  (add-hook 'neo-after-create 'rc/neotree/setup)
  (nmap 'neotree-mode-map
    "gg" 'evil-goto-first-line
    "G" 'evil-goto-line
    "C" 'neotree-change-root)
  (nmap
    :prefix rc/leader
    "q" 'neotree-show
    "Q" 'neotree-hide
    "r" 'neotree-find)
  (when (eq system-type 'darwin)
    (general-define-key
     "s-B" 'neotree-toggle)))

(provide 'init-neotree)
