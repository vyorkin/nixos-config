(require 'init-general)
(require 'init-flycheck)

(use-package elm-mode
  :requires init-general)

(use-package flycheck-elm
  :requires init-flycheck
  :after (elm-mode flycheck)
  :hook
  (flycheck-mode . flycheck-elm-setup))

(provide 'init-elm)
