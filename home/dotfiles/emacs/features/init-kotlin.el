(require 'init-flycheck)

(use-package kotlin-mode)

(use-package flycheck-kotlin
  :requires (init-flycheck)
  :after (kotlin-mode flycheck)
  :config
  (flycheck-kotlin-setup))

(provide 'init-kotlin)
