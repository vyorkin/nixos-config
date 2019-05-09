(require 'init-general)

(use-package ix
  :requires init-general
  :after general
  :config
  (nmap
    :prefix rc/leader
    "G i i" 'ix
    "G i b" 'ix-browse
    "G i d" 'ix-delete))

(provide 'init-infra)
