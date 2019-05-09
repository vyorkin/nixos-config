(require 'init-general)
(require 'init-evil)
(require 'init-quelpa)

(use-package mu4e
  :requires init-general
  :ensure nil
  :hook
  (after-init . mu4e-alert-enable-mode-line-display)
  :init
  (setq
   mu4e-maildir "~/.Mail"
   mu4e-drafts-folder "/vasiliy.yorkin/[Gmail].Drafts"
   mu4e-sent-folder "/vasiliy.yorkin/[Gmail].Sent Mail"
   mu4e-trash-folder "/vasiliy.yorkin/[Gmail].Trash"
   ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
   mu4e-sent-messages-behavior 'delete
   ;; auto update every minute
   mu4e-update-interval (* 60 5)
   mu4e-headers-auto-update t
   mu4e-headers-date-format "%Y-%m-%d [%H:%M]"
   mu4e-headers-fields
   '((:date . 20)
     (:mailing-list . 14)
     (:from . 20)
     (:subject . nil))
   mu4e-view-fields '(:from :to :cc :subject :date :mailing-list :attachments :signature)
   ;; I was getting duplicate emails, this fixes it
   mu4e-headers-skip-duplicates t
   mu4e-view-show-addresses t
   mu4e-view-show-images t
   mu4e-use-fancy-chars t
   ;; sending
   message-send-mail-function 'message-send-mail-with-sendmail
   sendmail-program "/usr/bin/msmtp"
   user-full-name "Vasiliy Yorkin"
   ;; capturing
   org-mu4e-link-query-in-headers-mode nil
   ;; goobook
   external-abook-command "goobook query '%s' | cut -f 1,2"
   ;; mu4e alert
   mu4e-alert-interesting-mail-query "flag:unread AND NOT flag:trashed AND maildir:/vasiliy.yorkin/INBOX"
   mu4e-attachment-dir  "~/Downloads"
   mu4e-maildir-shortcuts
   '(("/vasiliy.yorkin/INBOX" . ?i)
     ("/vasiliy.yorkin/[Gmail].Sent Mail" . ?s)
     ("/vasiliy.yorkin/[Gmail].Trash" . ?t)
     ("/vasiliy.yorkin/[Gmail].Drafts" . ?d)
     ("/vasiliy.yorkin/[Gmail].All Mail" . ?a))
   mu4e-bookmarks
   '(("flag:unread AND NOT flag:trashed" "Unread messages"  ?u)
     ("date:today..now" "Today's messages" ?t)
     ("date:7d..now" "Last 7 days" ?w)
     ("date:1m..now" "Last month" ?m)
     ("mime:image/*" "Messages with images" ?p)
     (,(mapconcat
        'identity
        (mapcar
         (lambda (maildir)
           (concat "maildir:" (car maildir)))
         mu4e-maildir-shortcuts) " OR ")
      "All inboxes" ?i)))
  :config
  (require 'mu4e-contrib)
  (setq
   ;; mu4e-html2text-command 'mu4e-shr2text
   ;; shr-color-visible-distance-min 5
   ;; shr-use-colors nil
   ;; when using a dark theme the messages are hard to read
   ;; it can help to change the luminosity
   ;; shr-color-visible-luminance-min 80
   ;; textutil is an alternative to html2text for macOS
   ;; mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout"
   mu4e-html2text-command "html2text -b 72")
  (advice-add 'shr-colorize-region :around (defun shr-no-colourise-region (&rest ignore)))
  (nmap
    :prefix rc/leader
    "M" 'mu4e))

(use-package external-abook
  :after quelpa
  :quelpa (external-abook :fetcher github :repo "emacsmirror/external-abook"))

(use-package mu4e-alert
  :after mu4e
  :config
  (mu4e-alert-enable-mode-line-display)
  (mu4e-alert-enable-notifications)
  (mu4e-alert-set-default-style 'notifier))

(provide 'init-email)
