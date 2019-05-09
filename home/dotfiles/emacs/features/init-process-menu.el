(require 'init-general)

(nmap 'process-menu-mode-map
  "M-d" 'process-menu-delete-process
  "q" 'kill-buffer-and-window)

(provide 'init-process-menu)
