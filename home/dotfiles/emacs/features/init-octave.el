(require 'init-general)

(use-package octave
  :requires init-general
  :after general
  :ensure nil
  :mode ("\.m$" . octave-mode))

(provide 'init-octave)
