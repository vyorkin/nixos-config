(require 'init-quelpa)

(use-package base16-theme
  :config
  (load-theme 'base16-chalk t)
  ;; (load-theme 'base16-default-dark t)
  ;; (load-theme 'base16-grayscale-dark t)
  ;; (load-theme 'base16-grayscale-light t)
  ;; (load-theme 'base16-one-light t)
  ;; (load-theme 'base16-gruvbox-light-hard t)
  ;; (load-theme 'base16-material-palenight t) ;; ****
  ;; (load-theme 'base16-rebecca t)
  ;; (load-theme 'base16-pop t)
  ;; (load-theme 'base16-tomorrow-night t)
  ;; (load-theme 'base16-twilight t)
  ;; (load-theme 'base16-irblack t)
  )

(use-package dracula-theme :defer t)
(use-package gotham-theme :defer t)
(use-package sublime-themes :defer t)

(use-package doom-themes
  :disabled
  :init
  (setq
   doom-themes-enable-bold nil
   doom-themes-enable-italic nil)
  :config
  (load-theme 'doom-dracula t)
  (load-theme 'doom-challenger-deep t)
  ;; enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  ;; corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

(use-package color-theme-modern :defer t)
(use-package twilight-theme :defer t)
(use-package gruber-darker-theme :defer t)
(use-package monokai-theme :defer t)
(use-package faff-theme :defer t)
(use-package badwolf-theme :defer t)
(use-package boron-theme :defer t)
(use-package bliss-theme :defer t)
(use-package busybee-theme :defer t)
(use-package color-theme-sanityinc-tomorrow :defer t)
(use-package badger-theme :defer t)
(use-package atom-one-dark-theme :defer t)
(use-package zenburn-theme :defer t)
(use-package hemisu-theme :defer t)
(use-package paganini-theme :defer t)
(use-package yoshi-theme :defer t)
(use-package rebecca-theme :defer t) ;; *****
(use-package moe-theme :defer t)
(use-package arjen-grey-theme :defer t)
(use-package darkmine-theme :defer t)
(use-package flatland-theme :defer t)
(use-package tao-theme :defer t)
(use-package liso-theme :defer t)
(use-package jazz-theme :defer t)
(use-package material-theme :defer t)
(use-package challenger-deep-theme :defer t) ;; ***
(use-package ample-theme
  :disabled
  :init
  (progn
    (load-theme 'ample t t)
    (load-theme 'ample-flat t t)
    (load-theme 'ample-light t t)
    (enable-theme 'ample-flat))
  :defer t)
(use-package cyberpunk-theme :defer t)
(use-package phoenix-dark-mono-theme :defer t) ;; *** (like grayscale-dark)
(use-package phoenix-dark-pink-theme :defer t) ;; **
(use-package cyberpunk-theme :defer t)
(use-package blackboard-theme :defer t) ;; ***
(use-package mustard-theme :defer t) ;; ****
(use-package labburn-theme :defer t) ;; *****
(use-package green-phosphor-theme :defer t) ;; *****
(use-package exotica-theme :defer t) ;; **
(use-package lush-theme :defer t) ;; ****

;; (use-package deep-thought-theme
;;   :disabled
;;   :quelpa (deep-thought-theme :fetcher github :repo "emacsfodder/emacs-deep-thought-theme")
;;   :defer t)

;; base16-unikitty-light ****

(use-package theme-changer
  :disabled
  :config
  (change-theme 'base16-gruvbox-light-hard 'labburn))

;; TODO: move here appearance customization code from rc/customize-appearance, use custom-set-faces
;; TODO: use custom-theme-set-faces everywhere

(provide 'init-themes)
