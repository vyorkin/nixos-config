(require 'init-lsp)

(use-package vue-mode)

(use-package lsp-vue
  requires init-lsp
  :after (lsp-mode vue-mode)
  :hook
  (vue-mode . lsp-vue-mmm-enable))

(provide 'init-vue)
