(use-package slack
  ;; :secret
  ;; (slack-start "work.el.gpg")
  :commands (slack-start)
  :custom
  (slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (slack-prefer-current-team t))

(provide 'init-slack)
