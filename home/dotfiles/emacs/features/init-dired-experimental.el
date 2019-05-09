(require 'init-quelpa)
(require 'init-general)
(require 'init-dired)

(use-package all-the-icons-dired
  :disabled
  :hook
  (dired-mode . all-the-icons-dired-mode))

(use-package dired-rainbow
  :disabled
  :after (dired dired-hack-utils)
  :demand t
  :config
  (dired-rainbow-define dotfiles "gray" "\\..*")
  (dired-rainbow-define html "#4e9a06" rc/dired-html-files-extensions)
  (dired-rainbow-define styles "#cc31cc" rc/dired-styles-files-extensions)
  (dired-rainbow-define xml "#b4fa70" rc/dired-xml-files-extensions)

  (dired-rainbow-define document "#fce94f" rc/dired-document-files-extensions)
  (dired-rainbow-define text "yellow green" rc/dired-text-files-extensions)
  (dired-rainbow-define excel "#3465a4" ("xlsx"))
  (dired-rainbow-define sh "green yellow" rc/dired-sh-files-extensions)

  (dired-rainbow-define log "#c17d11" (".*\\.log"))
  (dired-rainbow-define sourcefile "#fcaf3e" rc/dired-source-files-extensions)

  (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
  (dired-rainbow-define compressed "#ad7fa8" rc/dired-compressed-files-extensions)
  (dired-rainbow-define packaged "#e6a8df" ("deb" "rpm"))
  (dired-rainbow-define encrypted "LightBlue" ("gpg" "pgp"))
  (dired-rainbow-define misc "gray50" rc/dired-misc-files-extensions)

  ;; highlight executable files, but not directories
  (dired-rainbow-define-chmod executable-unix "green" "-[rw-]+x.*")

  (dired-rainbow-define image "#ff4b4b" rc/dired-image-files-extensions)
  (dired-rainbow-define audio "#329ee8" rc/dired-audio-files-extensions)
  (dired-rainbow-define video "#b3ccff" rc/dired-video-files-extensions)

  ;; boring regexp due to lack of imagination
  (dired-rainbow-define
   log (:inherit default :italic t) ".*\\.log")

  ;; highlight executable files, but not directories
  (dired-rainbow-define-chmod
   executable-unix "Green" "-[rw-]+x.*"))

(use-package dired-hide-dotfiles
  ;; doesn't work
  :disabled
  :after dired
  :config
  (nmap 'dired-mode-map
    "." 'dired-hide-dotfiles-mode)
  :hook
  (dired-mode . dired-hide-dotfiles-mode))

(use-package dired-collapse
  ;; it is too slow
  :disabled
  :after dired
  :hook
  (dired-mode . dired-collapse-mode))

;; highlights dired buffer like k
(use-package dired-k
  ;; dired+ looks better
  :disabled
  :requires init-general
  :after (dired general)
  :init
  (setq
   dired-k-padding 1
   dired-k-human-readable t)
  :config
  (nmap 'dired-mode-map
    "C-c C-k" 'dired-k))

(provide 'init-dired-experimental)
