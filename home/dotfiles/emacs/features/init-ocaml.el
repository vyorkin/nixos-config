(require 'init-company)
(require 'init-flycheck)

(use-package utop
  :config
  ;; https://github.com/diml/utop#integration-with-emacs
  (require 'utop)
  (setq utop-command "opam config exec -- rtop -emacs")
  (add-hook 'reason-mode-hook #'utop-minor-mode))

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(use-package flycheck-ocaml
  :requires init-flycheck
  :after flycheck
  :config
  (with-eval-after-load 'merlin
    ;; disable merlin's own error checking
    (setq merlin-error-after-save nil)
    ;; enable flycheck checker
    (flycheck-ocaml-setup)))

(provide 'init-ocaml)
