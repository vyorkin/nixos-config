(require 'init-quelpa)

(use-package sml-mode
  :quelpa (sml-mode :fetcher github :repo "emacsmirror/sml-mode")
  :mode "\\.sml$")

(provide 'init-sml)
