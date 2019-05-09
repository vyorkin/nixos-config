(require 'init-general)

(use-package timonier
  :requires init-general
  :after general
  :init
  (setq timonier-k8s-proxy "http://localhost:8001"))

(provide 'init-k8s)
