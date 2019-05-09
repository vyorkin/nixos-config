(require 'init-general)
(require 'init-appearance)
(require 'init-company)
(require 'init-projectile)

(use-package inf-ruby
  :hook
  ;; automatically switch from common ruby compilation modes
  ;; to interact with a debugger
  (compilation-filter . inf-ruby-auto-enter)
  ;; required to use binding.pry or byebug
  (after-init . inf-ruby-switch-setup))

(use-package robe
  :requires init-company
  :after company
  :hook
  (ruby-mode . robe-mode)
  :config
  (add-to-list 'company-backends 'company-robe)
  :delight "robe")

(use-package rubocop
  :after robe
  :hook
  (ruby-mode . rubocop-mode)
  :delight "rcop")

(use-package bundler
  :requires init-general
  :after general
  :config
  (nmap 'ruby-mode-map
    :prefix rc/leader
    "b i" 'bundle-install
    "b c" 'bundle-console
    "b o" 'bundle-outdated
    "b u" 'bundle-update
    "b e" 'bundle-exec))

(use-package rbenv
  :preface
  (defun rc/rbenv/modeline (current-ruby)
    (append
     '(" ruby [")
     (list (propertize current-ruby 'face 'rbenv-active-ruby-face))
     '("]")))
  :hook
  (ruby-mode . rbenv-use-corresponding)
  :init
  (setq
   rbenv-modeline-function 'rc/rbenv/modeline
   rbenv-installation-dir "/usr/local")
  :config
  (global-rbenv-mode)
  (nmap 'ruby-mode-map
    :prefix "C-c R"
    "c" 'rbenv-use-corresponding
    "u" 'rbenv-use))

(use-package rake
  :requires (init-general init-projectile)
  :after (general projectile)
  :init
  (setq rake-completion-system projectile-completion-system)
  :config
  (nmap 'ruby-mode-map
    :prefix rc/leader
    "r" 'rake))

(use-package rspec-mode)

(use-package projectile-rails
  :requires init-projectile
  :after projectile
  :init
  (setq
   projectile-rails-vanilla-command "bin/rails"
   projectile-rails-spring-command "bin/spring"
   projectile-rails-zeus-command "bin/zeus")
  :config
  (projectile-rails-global-mode)
  :diminish)

(use-package lsp-ruby
  ;; :requires init-quelpa
  :after lsp-mode
  ;; :quelpa
  ;; (lsp-ruby :fetcher github :repo "emacs-lsp/lsp-ruby")
  :init
  ;; for short messages on hover
  (setq lsp-hover-text-function 'lsp--text-document-signature-help)
  :config
  (add-hook 'ruby-mode-hook 'lsp-ruby-enable))

(provide 'init-ruby)
