(require 'init-general)

(use-package coffee-mode
  :custom
  (coffee-tab-width 2)
  :init
  ;; automatically clean up bad whitespace
  (setq whitespace-action '(auto-cleanup))
  ;; only show bad whitespace
  (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)))

(provide 'init-coffeescript)
