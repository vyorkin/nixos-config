(use-package reason-mode
  :quelpa
  ;; (reason-mode :repo "arichiardi/reason-mode" :fetcher github :stable t)
  (reason-mode :repo "reasonml-editor/reason-mode" :fetcher github :stable t)
  :config
  (add-hook
   'reason-mode-hook
   (lambda ()
     (add-hook 'before-save-hook #'refmt-before-save)))
  (add-hook 'reason-mode-hook 'merlin-mode)
  (add-hook 'reason-mode-hook 'utop-minor-mode)
  (add-hook 'reason-mode-hook 'flycheck-mode)
  :delight "re")

(provide 'init-reason)
