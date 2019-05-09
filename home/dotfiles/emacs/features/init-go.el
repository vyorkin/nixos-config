(require 'init-company)
(require 'init-flycheck)
(require 'init-lsp)

(use-package go-mode
  :requires (init-company init-flycheck)
  :after (company flycheck)
  :if (executable-find "go")
  :preface
  (defun rc/go-mode/setup ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    (add-hook 'go-mode-hook 'flycheck-mode)
    (setq-default)
    (setq standard-indent 8)
    (setq tab-width 8)
    (setq indent-tabs-mode 1))
  :mode "\\.go\\'"
  :hook
  (go-mode . rc/go-mode/setup))

(use-package company-go
  :requires init-company
  :after (company go-mode)
  :hook
  (go-mode . company-mode)
  :config
  (add-to-list 'company-backends 'company-go))

(use-package lsp-go
  :requires init-lsp
  :after (lsp-mode go-mode)
  :hook
  (go-mode . lsp-go-enable))

(use-package go-stacktracer)

(use-package go-add-tags)

(use-package go-eldoc
  :hook
  (go-mode . go-eldoc-setup))

(use-package go-gopath)

(use-package go-direx)

(use-package gotest)

(use-package go-playground)

(provide 'init-go)
