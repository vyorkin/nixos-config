(require 'init-quelpa)
(require 'init-general)
(require 'init-company)
(require 'init-flycheck)
(require 'init-projectile)

(use-package lsp-mode
  :requires init-projectile
  :after projectile
  ;; :ensure nil
  ;; :load-path "~/projects/github/lsp-mode/"
  ;; :quelpa
  ;; (lsp-mode :fetcher github :repo "emacs-lsp/lsp-mode")
  :preface
  (defun rc/lsp-mode/set-projectile-root ()
    (when lsp--cur-workspace
      (setq
       projectile-project-root
       (lsp--workspace-root lsp--cur-workspace))))
  :init
  (setq
   ;; display only first line of hovered symbol's doc
   lsp-eldoc-render-all nil)
  :config
  (require 'lsp-clients)
  (add-hook 'python-mode-hook 'lsp)

  (add-hook 'lsp-before-open-hook 'rc/lsp-mode/set-projectile-root)
  ;; This function will turn lsp-mode on and call the command given to
  ;; start the LSP server.
  ;; Be careful not to enable this if
  ;; you're using some lang-specific lsp-mode (like lsp-haskell)
  ;; See https://github.com/tigersoldier/company-lsp/issues/51 for more info on this.
  ;; (add-hook 'prog-mode-hook 'lsp-mode)

  (nmap
    :prefix rc/leader
    "l r" 'lsp-restart-workspace)
  :delight "lsp")

(use-package lsp-ui
  :requires init-general
  :after (lsp-mode general)
  ;; :quelpa
  ;; (lsp-ui :fetcher github :repo "emacs-lsp/lsp-ui")
  :init
  (setq-default
   lsp-ui-doc-frame-parameters
   '((left . -1)
     (top . -1)
     (no-accept-focus . t)
     (min-width . 0)
     (width . 0)
     (min-height . 0)
     (height . 0)
     (internal-border-width . 5)
     (vertical-scroll-bars)
     (horizontal-scroll-bars)
     (left-fringe . 0)
     (right-fringe . 0)
     (menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (line-spacing . 0.1)
     (unsplittable . t)
     (undecorated . t)
     (minibuffer . nil)
     (visibility . nil)
     (mouse-wheel-frame . nil)
     (no-other-frame . t)
     (cursor-type)
     (no-special-glyphs . t)
     (visual-line-mode . -1)))
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  (add-hook
   'lsp-ui-doc-frame-hook
   (lambda (frame _w)
     (set-face-attribute 'default frame :font "Fira Code" :height 130)))
  (setq
   lsp-ui-sideline-enable nil
   lsp-enable-completion-at-point t
   lsp-ui-doc-position 'at-point
   lsp-ui-doc-header nil
   lsp-ui-doc-enable nil
   lsp-ui-doc-max-width 80
   lsp-ui-doc-max-height 10
   lsp-ui-doc-use-childframe t
   lsp-ui-doc-include-signature t
   lsp-ui-doc-background "#000"
   lsp-ui-doc-border "#222"
   lsp-ui-flycheck-enable t
   lsp-ui-peek-force-fontify nil
   lsp-ui-peek-expand-function (lambda (xs) (mapcar #'car xs)))
  (nmap
    :prefix rc/leader
    "t l" 'lsp-ui-mode
    "l l" 'lsp-ui-sideline-apply-code-actions
    "I" 'lsp-ui-imenu
    "1" 'lsp-ui-peek-find-definitions
    "2" 'lsp-ui-peek-find-references)
  (general-def 'lsp-ui-peek-mode-map
    "h" 'lsp-ui-peek--select-next-file
    "l" 'lsp-ui-peek--select-prev-file
    "j" 'lsp-ui-peek--select-next
    "k" 'lsp-ui-peek--select-prev))

(use-package company-lsp
  :requires (init-quelpa init-company)
  :after (lsp-mode company)
  ;; :quelpa
  ;; (company-lsp :fetcher github :repo "tigersoldier/company-lsp")
  :init
  (setq
   ;; don't filter results on the client side
   company-transformers nil
   company-lsp-cache-candidates 'auto
   company-lsp-async t
   company-lsp-enable-snippet t)
  :config
  (push 'company-lsp company-backends))

;; bash support for lsp-mode
(use-package lsp-sh
  :after lsp-mode
  :hook
  (sh-mode . lsp-sh-enable))

(provide 'init-lsp)
