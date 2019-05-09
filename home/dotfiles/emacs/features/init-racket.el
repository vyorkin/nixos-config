(require 'init-general)
(require 'init-smartparens)
(require 'init-org)
(require 'init-geiser)

(use-package racket-mode
  :requires
  (init-general
   init-smartparens
   init-org
   init-geiser)
  :after
  (general
   smartparens
   org
   geiser)
  :if (executable-find "racket")
  :mode ("\\.rkt[dl]?\\'" . racket-mode)
  :interpreter ("racket" . racket-mode)
  :hook
  (racket-mode . smartparens-mode)
  :init
  (setq
   geiser-scheme-implementation 'racket
   racket-smart-open-bracket-enable t)
  :config
  (add-to-list 'org-babel-load-languages '(racket . t))
  (sp-local-pair 'racket-mode "'" nil :actions nil)
  (sp-local-pair 'racket-mode "`" nil :actions nil))

(provide 'init-racket)
