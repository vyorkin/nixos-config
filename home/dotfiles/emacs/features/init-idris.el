(use-package idris-mode
  :custom
  (idris-repl-banner-functions '(idris-repl-text-banner))
  (idris-repl-prompt-style 'short)
  :hook
  (idris-mode . enable-idris-pretty-symbols))

(provide 'init-idris)
