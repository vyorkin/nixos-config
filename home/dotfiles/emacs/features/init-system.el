;; modernizing Emacs' Package Menu
;; with package ratings, usage statistics, customizability, and more
(use-package paradox
  :init
  (setq
   paradox-execute-asynchronously t
   paradox-automatically-star t)
  :config
  ;; replace the default interface with paradox
  (paradox-enable))

(use-package exec-path-from-shell
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  :config
  (exec-path-from-shell-copy-envs '("WAKATIME_API_KEY"))
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package use-package-ensure-system-package)

;; (use-package use-package-chords
;;   :config (key-chord-mode 1))

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(use-package auto-package-update
  :config
  (setq
   auto-package-update-delete-old-versions t
   auto-package-update-interval 10)
  (auto-package-update-maybe))

(provide 'init-system)
