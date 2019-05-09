(require 'init-general)
(require 'init-navigation)

(use-package projectile
  :requires (init-general init-navigation)
  :after (general ivy)
  :init
  ;; projectile requires this setting for ivy completion
  (setq
   projectile-indexing-method 'alien
   projectile-completion-system 'ivy
   ;; useful for very large projects
   projectile-enable-caching t
   projectile-sort-order 'recently-active
   projectile-mode-line nil
   projectile-use-git-grep t
   projectile-file-exists-remote-cache-expire (* 10 60)
   projectile-file-exists-local-cache-expire (* 5 60)
   projectile-require-project-root nil
   projectile-globally-ignored-directories
   '(".git" ".svn" ".hg" "_darcs"
     "out" "output" "repl"
     "dist" "dist-newstyle"
     ".vagrant"
     "project" "target" "compiled" ".bundle"
     "*build" "jar"
     "venv" ".virtualenv"
     "*__pycache__*" "*.egg-info"
     ".tox" ".cache" ".cabal-sandbox" ".stack-work"
     ".emacs.d" "elpa" "site-lisp"
     "bin" "eclipse-bin" ".ensime_cache" ".idea"
     ".eunit" ".bzr"
     "vendor" "uploads" "assets"
     "node_modules" "bower_components"
     "_build" ".psci_modules" ".pulp-cache")
   projectile-globally-ignored-files
   '(".DS_Store" "TAGS" ".nrepl-port" "*.gz" "*.pyc" ".purs-repl"
     "*.jar" "*.tar.gz" "*.tgz" "*.zip" "package-lock.json"))
  :config
  ;; use projectile everywhere
  (projectile-mode)
  ;; remove the mode name for projectile-mode, but show the project name
  ;; :delight '(:eval (concat " " (projectile-project-name)))
  (nmap
    :prefix rc/leader
    "DEL" 'projectile-invalidate-cache)
  :diminish projectile-mode)

;; projectile replacements
(use-package counsel-projectile
  :requires (init-general init-navigation)
  :after (counsel projectile general)
  :config
  (nmap
    "C-q" 'counsel-projectile-find-file
    "C-a" 'counsel-projectile-switch-to-buffer
    "C-p" 'counsel-projectile-switch-project))

(provide 'init-projectile)
