(require 'init-appearance)

(use-package dashboard
  ;; I don't like it
  :disabled
  :after page-break-lines
  :init
  (setq
   ;; dashboard-startup-banner "~/.emacs.d/images/lambda-cube.png"
   ;; dashboard-banner-logo-title "each axis represents a new form of abstraction"
   ;; dashboard-banner-logo-title nil
   dashboard-startup-banner nil
   dashboard-banner-logo-title "just do it"
   dashboard-items
   '((bookmarks . 10)
     (recents  . 2)
     (projects . 10)
     (agenda . 8)
     (registers . 5)))
  :config
  (dashboard-setup-startup-hook))

(provide 'init-dashboard)
