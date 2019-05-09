(require 'init-general)
(require 'init-company)
(require 'init-lsp)
(require 'init-flycheck)

(use-package rust-mode
  :requires (init-general init-company)
  :after (company general)
  :if (executable-find "rustc")
  :commands rust-mode
  :config
  ;; enable rust-mode for .lalrpop files
  (add-to-list 'auto-mode-alist '("\\.lalrpop\\'" . rust-mode))
  (general-define-key
   :keymaps 'rust-mode-map
   "TAB" 'company-indent-or-complete-common
   "C-c C-b" 'rust-compile
   "C-c <tab>" 'rust-format-buffer))

;; some of key bindings
;; are provided by evil-collection
(use-package racer
  :after rust-mode
  :demand t
  :commands racer-mode
  :hook
  ((racer-mode . eldoc-mode)
   (racer-mode . company-mode)
   (rust-mode . racer-mode)))

(use-package cargo
  :requires init-general
  :after (general rust-mode)
  :config
  (nmap 'rust-mode-map
    :prefix rc/leader
    "c ." 'cargo-process-repeat
    "c c" 'cargo-process-clean
    "c b" 'cargo-process-build
    "c c" 'cargo-process-check
    "c d" 'cargo-process-doc
    "c e" 'cargo-process-bench
    "c f" 'cargo-process-current-test
    "c f" 'cargo-process-fmt
    "c i" 'cargo-process-init
    "c n" 'cargo-process-new
    "c o" 'cargo-process-current-file-tests
    "c s" 'cargo-process-search
    "c u" 'cargo-process-update
    "c x" 'cargo-process-run
    "c X" 'cargo-process-run-example
    "t" 'cargo-process-test))

(use-package company-racer
  :requires init-company
  :after (racer company)
  :config
  (add-to-list 'company-backends 'company-racer))

(use-package lsp-rust
  :requires init-lsp
  :after (lsp-mode rust-mode)
  :hook
  (rust-mode . lsp-rust-enable)
  :init
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls")))

(use-package flycheck-rust
  :requires (init-flycheck rust-mode)
  :after (rust-mode flycheck))

(provide 'init-rust)
