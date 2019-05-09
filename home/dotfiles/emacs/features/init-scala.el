(require 'init-general)

(use-package scala-mode
  :after general
  :if (executable-find "scala"))

(use-package ensime
  :requires init-general
  :after (general scala-mode)
  :commands ensime-mode
  :init
  (setq
   ensime-server-version "2.0.0-SNAPSHOT"
   ensime-default-buffer-prefix "ENSIME-"
   ensime-startup-notification nil
   ensime-startup-snapshot-notification nil)
  :config
  (unbind-key "M-p" ensime-mode-map)
  (nmap 'scala-mode-map
    :prefix rc/leader
    "s e" 'ensime)
  (nmap 'ensime-mode-map
    :prefix rc/leader
    "r" 'ensime-inf-run-scala
    "s r" 'ensime-sbt-do-run
    "s c" 'ensime-sbt-do-compile)
  ;; looks like a perfect candidate for a Hydra?
  (nmap 'ensime-mode-map
    :prefix rc/leader
    "s E" 'ensime-print-errors-at-point
    "s t" 'ensime-print-type-at-point
    "s o" 'ensime-import-type-at-point
    "s g" 'ensime-edit-definition-other-window
    "s ," 'ensime-pop-find-definition-stack
    "s ." 'ensime-edit-definition-of-thing-at-point))

(use-package sbt-mode
  :requires init-general
  :after (general scala-mode)
  :if (executable-find "sbt")
  :init
  (setq sbt:program-name "sbt -mem 2048 -v")
  (setq-default truncate-lines nil)
  :config
  (nmap 'scala-mode-map
    :prefix rc/leader
    "s" 'sbt-start
    "r" 'sbt-command
    "p" 'sbt-run-previous-command)
  (general-define-key
   :keymaps 'sbt-mode-map
   :states '(normal insert)
   "M-j" 'compilation-next-error
   "M-k" 'compilation-previous-error)
  (evil-set-initial-state 'sbt-mode 'normal))

(provide 'init-scala)
