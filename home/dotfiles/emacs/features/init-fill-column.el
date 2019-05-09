(require 'init-general)
(require 'init-appearance)
(require 'init-company)

(use-package fill-column-indicator
  ;; doesn't work well with company-mode
  :disabled
  :requires (init-general init-appearance init-company)
  :after (general company)
  :preface
  ;; temporary disable fill column indicator
  ;; while showing company mode popup
  (defun rc/fci/before-company (command)
    (when (and (bound-and-true-p fci-mode)
               (string= "show" command))
      (turn-off-fci-mode))
    (when (and (bound-and-true-p fci-mode)
               (string= "hide" command))
      (turn-on-fci-mode)))
  :init
  (setq
   fci-rule-color "#cd3278"
   fci-rule-use-dashes t)
  :config
  (fci-mode)
  (advice-add
   'company-call-frontends
   :before 'rc/fci/before-company)
  (nmap
    :prefix rc/leader
    "t F" 'fci-mode))

(provide 'init-fill-column)
