(require 'init-system)
(require 'init-general)

(use-package google-translate
  :requires (init-system init-general)
  :after (general paradox)
  :init
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "ru")
  :config
  (paradox-require 'google-translate-default-ui)
  (nmap
   :prefix "C-c"
   "t" 'google-translate-at-point
   "q" 'google-translate-query-translate))

(provide 'init-translate)
