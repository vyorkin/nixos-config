(require 'init-general)

(use-package emmet-mode
  :requires init-general
  :after (general sgml-mode)
  :commands
  emmet-mode
  :hook
  ((sgml-mode ; auto-start on any markup modes
    css-mode  ; enable css abbreviation
    html-mode
    jade-mode) . emmet-mode)
  :config
  (imap
    "C-x C-o" 'emmet-expand-line)
  :delight "emmet")

(provide 'init-emmet)
