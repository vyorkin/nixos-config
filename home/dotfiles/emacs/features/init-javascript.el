(require 'init-company)
(require 'init-lsp)

(use-package tern
  :commands tern-mode
  :config
  ;; enable js completion between <script>...</script> etc
  (defadvice company-tern (before web-mode-set-up-ac-sources activate)
    "Set `tern-mode' based on current language before running company-tern."
    (message "advice")
    (if (equal major-mode 'web-mode)
        (let ((web-mode-cur-language (web-mode-language-at-pos)))
          (if (or (string= web-mode-cur-language "javascript")
                  (string= web-mode-cur-language "jsx"))
              (unless tern-mode (tern-mode))
            (if tern-mode (tern-mode -1)))))))

(use-package npm-mode
  :commands (npm-mode npm-global-mode)
  :config
  (npm-global-mode)
  :diminish npm-mode)

(use-package js2-mode
  :init
  ;; indent step is 2 spaces
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)
  (setq
   ;; configure indentation
   js2-enter-indents-newline t
   js2-auto-indent-p t
   ;; Idle timeout before reparsing buffer
   js2-idle-timer-delay 0.5
   ;; disable error parsing in favor of Flycheck
   js2-strict-missing-semi-warning nil)
  :commands js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  :delight "js2")

;; a very fast JS linter and fixer
(use-package eslintd-fix
  :hook
  (tide-mode . eslintd-fix-mode))

;; autofix missing imports.
(use-package import-js)

(use-package xref-js2
  :preface
  (defun rc/xref-js2/add-backend ()
    (add-hook 'xref-backend-functions
              'xref-js2-xref-backend nil t))
  :hook
  (js2-mode . rc/xref-js2/add-backend)
  :config
  (unbind-key "M-." js2-mode-map))

(use-package js2-refactor
  :hook
  (js2-mode . js2-refactor-mode)
  :config
  ;; enable minor mode for js refactoring
  ;; see: https://github.com/magnars/js2-refactor.el#refactorings
  (js2r-add-keybindings-with-prefix "C-c C-j"))

(use-package rjsx-mode
  :commands rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode)))

(use-package lsp-javascript-typescript
  :requires init-lsp
  :after lsp-mode
  :preface
  (defun rc/lsp-js-ts/company-transformer (candidates)
    (let ((completion-ignore-case t))
      (all-completions (company-grab-symbol) candidates)))

  (defun rc/lsp-js-ts/setup nil
    (make-local-variable 'company-transformers)
    (push 'rc/lsp-js-ts/company-transformer company-transformers))
  :hook
  (js-mode . rc/lsp-js-ts/setup)
  (js2-mode . rc/lsp-js-ts/setup)        ; for js2-mode support
  (js3-mode . rc/lsp-js-ts/setup)        ; for js3-mode support
  (typescript-mode . rc/lsp-js-ts/setup) ; for typescript support
  (rjsx-mode  . rc/lsp-js-ts/setup))     ; for rjsx-mode support

(use-package lsp-javascript-flow
  :requires init-lsp
  :after lsp-mode
  :hook
  (js-mode . lsp-javascript-flow-enable)
  (js2-mode . lsp-javascript-flow-enable)   ; for js2-mode support
  (js3-mode . lsp-javascript-flow-enable)   ; for js3-mode support
  (rjsx-mode . lsp-javascript-flow-enable)) ; for rjsx-mode support

(use-package prettier-js
  :hook
  ((js2-mode-hook web-mode-hook) . prettier-js-mode)
  :delight "pr")

(use-package graphql-mode
  :mode "\\.graphql\\'"
  :custom
  (graphql-url "http://localhost:8000/api/graphql/query"))

(use-package company-tern
  :requires init-company
  :after (company tern)
  :demand t
  :config
  (company-tern-meta-as-single-line t)
  (add-to-list 'company-backends 'company-tern))

(provide 'init-javascript)
