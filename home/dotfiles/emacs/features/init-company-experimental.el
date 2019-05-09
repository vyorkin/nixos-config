(require 'init-company)
(require 'init-general)

;; if none of the current completions look good,
;; call the command again to try the next backend
(use-package company-try-hard
  ;; Not sure if I really need it
  :disabled
  :requires (init-general init-company)
  :after company
  :config
  (imap
    "C-M-SPC" 'company-try-hard)
  (general-define-key
   :keymaps 'company-active-map
   "C-h" 'company-try-hard)) ; "h" - hard

(use-package company-tabnine
  ;; TODO: play around with it later
  :disabled
  :requires init-company
  :after company
  :config
  (add-to-list 'company-backends 'company-tabnine))

;; (use-package company-box
;;   :requires init-company
;;   :quelpa (company-box :fetcher github :repo "sebastiencs/company-box")
;;   :hook (company-mode . company-box-mode))

(use-package company-emoji
  :disabled
  :config
  (add-to-list 'company-backends 'company-emoji)
  (set-fontset-font
   t 'symbol
   (font-spec
    :family
    (if (eq system-type 'darwin)
        "Apple Color Emoji"
      "Symbola"))
   nil 'prepend))

(use-package company-shell
  :disabled
  :config
  (add-to-list 'company-backends 'company-shell))

(provide 'init-company-experimental)
