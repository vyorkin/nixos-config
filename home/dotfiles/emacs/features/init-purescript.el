(require 'init-general)
(require 'init-flycheck)

(use-package purescript-mode
  :requires init-general
  :after general
  :if (executable-find "purs")
  ;; I use my forked version:
  ;; https://github.com/vyorkin-forks/purescript-mode/tree/bugfix/conflicting-quail-rules
  ;; with some conflicting quail rules disabled from the local path
  :load-path "~/projects/github/purescript-mode/"
  :ensure nil
  :preface
  (defun rc/purescript-mode/setup ()
    (face-remap-add-relative
     'font-lock-doc-face
     'font-lock-comment-face))
  (defun rc/purescript-emmet ()
    (interactive)
    (let ((start (point))
          (end (save-excursion (beginning-of-line-text) (point))))
      (call-process-region start end "purescript-emmet" t t)))
  ;; TODO: the hook doesn't work here for some reason
  ;; :hook
  ;; (purescript-mode . rc/purescript-mode/setup)
  :config
  (require 'purescript-mode-autoloads)
  (add-to-list 'Info-default-directory-list "~/projects/github/purescript-mode/")
  (imap 'purescript-mode-map
    "C-c C-e" 'rc/purescript-emmet))

(use-package psc-ide
  :requires init-general
  :after (general purescript-mode)
  :preface
  (defun rc/psc-ide/setup ()
    (setq-local evil-auto-indent nil)
    (psc-ide-mode)
    (turn-on-purescript-unicode-input-method)
    (turn-on-purescript-indentation))
  :hook
  (purescript-mode . rc/psc-ide/setup)
  :init
  ;; use the psc-ide server that is
  ;; relative to npm bin directory
  (setq psc-ide-use-npm-bin t)
  :config
  (general-define-key
   :states 'normal
   :keymaps 'psc-ide-mode-map
   "C-t" 'psc-ide-goto-definition
   "C-]" 'psc-ide-goto-definition
   "g d" 'psc-ide-goto-definition)
  :delight "psc-ide")

(use-package psci
  :disabled
  :after purescript-mode
  :hook
  (purescript-mode . inferior-psci-mode)
  :delight "psci")

;; should be superseeded by psc-ide-mode's flycheck integration
;; https://github.com/dysinger/purescript-mode/pull/8
(use-package flycheck-purescript
  :requires init-flycheck
  :after flycheck
  :disabled
  :preface
  (defun rc/flycheck-purescript/setup ()
    (setq default-directory (locate-dominating-file default-directory "node_modules")))
  :after purescript-mode
  :init
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook 'flycheck-purescript-setup))
  :hook
  (purescript-mode . rc/flycheck-purescript/setup))

(provide 'init-purescript)
