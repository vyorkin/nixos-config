(require 'init-general)
(require 'init-geiser)

(use-package scheme
  :ensure nil
  :requires init-general
  :after geiser
  :preface
  (defun rc/scheme/setup ()
    (geiser-mode t))
  :hook
  (scheme-mode . rc/scheme/setup))

(use-package quack
  :after scheme
  :config
  (setq
   ;; use emacs-style fontification
   quack-fontify-style 'emacs))

(provide 'init-scheme)
