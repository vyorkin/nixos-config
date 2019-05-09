(require 'init-flycheck)
(require 'init-quelpa)

(use-package css-mode)

(use-package lsp-css
  :requires init-lsp
  :after lsp-mode
  :preface
  (defun rc/css-mode/setup ()
    (when (eq major-mode 'css-mode)
      ;; only enable in strictly css-mode, not scss-mode
      ;; (css-mode-hook fires for scss-mode because
      ;; scss-mode is derived from css-mode)
      (lsp-css-enable)))

  :hook
  (css-mode . rc/css-mode/setup)
  (less-mode . lsp-less-enable)
  (sass-mode .lsp-scss-enable)
  (scss-mode . lsp-scss-enable))

(use-package scss-mode
  :config
  :delight "scss")

(use-package flycheck-css-colorguard
  :requires init-flycheck
  :after flycheck
  :config
  (flycheck-css-colorguard-setup))

(use-package css-autoprefixer
  :if (executable-find "npx"))

(provide 'init-styles)
