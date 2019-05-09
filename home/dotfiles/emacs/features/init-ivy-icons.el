(require 'init-appearance)
(require 'init-navigation)
(require 'init-projectile)

(use-package all-the-icons-ivy
  :requires (init-appearance init-navigation init-projectile)
  :after (ivy projectile)
  :custom
  (all-the-icons-ivy-buffer-commands '() "Don't use for buffers.")
  (all-the-icons-ivy-file-commands
   '(counsel-find-file
     counsel-file-jump
     counsel-recentf
     counsel-projectile-find-file
     counsel-projectile-find-dir) "Prettify more commands.")
  :config
  (all-the-icons-ivy-setup))


(provide 'init-ivy-icons)
