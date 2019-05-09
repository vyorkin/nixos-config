(require 'init-quelpa)
(require 'init-general)

(use-package eshell
  :ensure nil
  ;; :config
  ;; (unbind-key "C-j" eshell-mode-map)
  ;; (unbind-key "C-k" eshell-mode-map)
  )

(use-package em-smart
  :ensure nil
  :config
  (eshell-smart-initialize)
  :custom
  (eshell-where-to-jump 'begin)
  (eshell-review-quick-commands nil)
  (eshell-smart-space-goes-to-end t))

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))

(use-package eshell-toggle
  :ensure nil
  :requires (init-quelpa init-general)
  :after general
  :quelpa
  (eshell-toggle
   :repo "4DA/eshell-toggle"
   :fetcher github
   :version original)
  :config
  (nmap
    :prefix rc/leader
    "`" 'eshell-toggle))

(provide 'init-shell)
