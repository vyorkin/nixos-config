(require 'init-general)

(use-package eldoc-overlay
  :requires init-general
  :after general
  :init
  (setq eldoc-overlay-in-minibuffer-flag t)
  :config
  (nmap
    :prefix rc/leader
    "t e" 'eldoc-overlay-toggle)
  :diminish "eo")

(provide 'init-eldoc)
