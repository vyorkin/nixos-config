(require 'init-system)

(use-package wakatime-mode
  :requires init-system
  :disabled
  :init
  (setq
   wakatime-api-key (getenv "WAKATIME_API_KEY")
   wakatime-cli-path "/usr/bin/wakatime")
  :config
  (global-wakatime-mode)
  :diminish wakatime-mode)

(provide 'init-stats)
