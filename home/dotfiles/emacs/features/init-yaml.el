(require 'init-flycheck)

(use-package yaml-mode
  :config
  :delight "yaml")

(use-package flycheck-yamllint
  :requires (init-flycheck)
  :after (flycheck yaml-mode)
  :if (executable-find "yamllint")
  :config
  (flycheck-yamllint-setup))

(provide 'init-yaml)
