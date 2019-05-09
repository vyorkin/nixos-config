(require 'init-quelpa)

(use-package faces
  :ensure nil
  :custom
  (face-font-family-alternatives
   '(("Hack" "Consolas" "Monaco" "Monospace")))
  :init
  (set-face-attribute
   'default nil
   :family (caar face-font-family-alternatives)
   :weight 'regular
   :height 120
   :width 'semi-condensed)
  (set-fontset-font
   "fontset-default"
   'cyrillic
   (font-spec :registry "iso10646-1" :script 'cyrillic)))

(use-package font-lock+
  :quelpa
  (font-lock+ :repo "emacsmirror/font-lock-plus" :fetcher github))

(provide 'init-font)
