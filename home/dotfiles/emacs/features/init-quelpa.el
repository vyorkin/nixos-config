(if (require 'quelpa nil t)
  ;; prevent quelpa from doing anyting
  ;; that requires network connection
  (setq
    quelpa-update-melpa-p nil    ; don't update MELPA git repo
    quelpa-checkout-melpa-p nil  ; don't clone MELPA git repo
    quelpa-upgrade-p nil         ; don't try to update packages
    quelpa-self-upgrade-p nil)   ; don't upgrade quelpa automatically

    ;; (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

;; install use-package and the quelpa handler
(quelpa
 '(quelpa-use-package
   :fetcher github
   :repo "quelpa/quelpa-use-package"))
(require 'quelpa-use-package)

;; advice setting :ensure nil for use-package + quelpa
(quelpa-use-package-activate-advice)

(provide 'init-quelpa)
