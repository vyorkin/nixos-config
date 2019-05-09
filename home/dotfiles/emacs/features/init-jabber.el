(use-package jabber
  ;; :secret
  ;; (jabber-connect-all "jabber.el.gpg")
  :config
  (setq jabber-history-enabled t
        jabber-use-global-history nil
        fsm-debug nil)
  (custom-set-variables
   '(jabber-auto-reconnect t)
   '(jabber-chat-buffer-format "*-jc-%n-*")
   '(jabber-groupchat-buffer-format "*-jg-%n-*")
   '(jabber-chat-foreign-prompt-format "▼ [%t] %n> ")
   '(jabber-chat-local-prompt-format "▲ [%t] %n> ")
   '(jabber-muc-colorize-foreign t)
   '(jabber-muc-private-buffer-format "*-jmuc-priv-%g-%n-*")
   '(jabber-rare-time-format "%e %b %Y %H:00")
   '(jabber-resource-line-format "   %r - %s [%p]")
   '(jabber-roster-buffer "*-jroster-*")
   '(jabber-roster-line-format "%c %-17n")
   '(jabber-roster-show-bindings nil)
   '(jabber-roster-show-title nil)
   '(jabber-roster-sort-functions (quote (jabber-roster-sort-by-status jabber-roster-sort-by-displayname jabber-roster-sort-by-group)))
   '(jabber-show-offline-contacts nil)
   '(jabber-show-resources nil)))

(use-package jabber-otr
  :after jabber)

(provide 'init-jabber)
