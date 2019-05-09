(require 'init-general)

(use-package docker
  :requires (init-general)
  :diminish docker-mode
  :config
  (nmap
    :prefix rc/leader
    "d" 'docker))

(use-package docker-compose-mode)

(provide 'init-docker)
