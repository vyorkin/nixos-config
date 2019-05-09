(use-package proof-site
  :load-path "lisp/PG/generic"
  :mode ("\\.v\\'" . coq-mode)
  :custom
  (proof-delete-empty-windows t)
  ;; see: https://github.com/ProofGeneral/PG/issues/404
  ;; (proof-shrink-windows-tofit t)
  :init
  (use-package coq-mode
    :ensure nil
    :commands coq-mode
    :init
    (setq
     company-coq-live-on-the-edge t
     company-coq-disabled-features '()
     company-coq-dynamic-autocompletion t)
    (use-package company-coq
      :commands company-coq-mode
      :preface
      (defun rc/company-coq/setup ()
        (interactive)
        (setq-local
         prettify-symbols-alist
         '((":=" . ?≜)
           ("Proof." . ?∵)
           ("Qed." . ?■)
           ("Defined." . ?□)))
        (sp-local-pair 'coq-mode "'" nil :actions nil)
        (company-coq-mode)
        (enable-coq-pretty-symbols)))
    :hook
    (coq-mode . rc/company-coq/setup))
  :config
  (custom-set-faces
   '(proof-queue-face ((t (:foreground "#eee"))))
   ;; '(proof-locked-face ((t (:background "#001800" :foreground "#00aa00"))))
   '(proof-locked-face ((t (:background "#002255" ))))
   '(proof-mouse-highlight-face  ((t (:background "#555" :foreground "#fff")))))
  :delight "coq")

(provide 'init-coq)
