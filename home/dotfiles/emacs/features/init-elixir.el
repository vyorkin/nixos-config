(require 'init-general)
(require 'init-quelpa)
(require 'init-flycheck)

(use-package elixir-mode
  :requires init-general
  :preface
  (defun rc/elixir-mode/setup ()
    (when (and
           (string-equal "exs" (file-name-extension buffer-file-name))
           (string-equal "mix" (file-name-base buffer-file-name)))
      (alchemist-hex-mode 1)))
  :hook
  ((elixir-mode . alchemist-mode)
   (elixir-mode . rc/elixir-mode/setup))
  :init
  (use-package alchemist
    :demand t
    :init
    (setq
     alchemist-goto-elixir-source-dir "~/projects/github/elixir"
     alchemist-goto-erlang-source-dir "/usr/local/Cellar/erlang/19.2.3")
    :config
    ;; additional keybindings are here
    ;; https://github.com/emacs-evil/evil-collection/blob/master/evil-collection-alchemist.el
    (evil-define-key 'normal alchemist-mode-map
      (kbd "C-j") nil
      (kbd "C-k") nil
      (kbd "M-j") 'alchemist-goto-jump-to-next-def-symbol
      (kbd "M-k") 'alchemist-goto-jump-to-previous-def-symbol)
    (nmap 'alchemist-mode-map
      :prefix rc/leader
      ;; elixir general key bindings
      "tt" 'alchemist-mix-test
      "tf" 'alchemist-project-run-tests-for-current-file
      "," 'alchemist-test-toggle-test-report-display
      "h" 'alchemist-help-search-at-point
      "H" 'alchemist-help
      "a" 'alchemist-project-toggle-file-and-tests
      "A" 'alchemist-project-toggle-file-and-tests-other-window
      "m" 'alchemist-mix
      ;; elixir IEx-specific key bindings
      "e" 'alchemist-iex-project-run
      "r" 'alchemist-iex-reload-module)
    (vmap 'alchemist-mode-map
      :prefix rc/leader
      "e" 'alchemist-iex-send-current-line
      "E" 'alchemist-iex-send-current-line-and-go
      "r" 'alchemist-iex-send-region
      "R" 'alchemist-iex-send-region-and-go)
    ;; elixir HEX-specific key bindings
    (nmap 'alchemist-hex-mode-map
      :prefix rc/leader
      "i" 'alchemist-hex-info-at-point
      "I" 'alchemist-hex-info
      "r" 'alchemist-hex-releases-at-point
      "R" 'alchemist-hex-releases
      "f" 'alchemist-hex-search)))

(use-package elixir-format
  :requires init-quelpa
  :quelpa (elixir-format :fetcher github :repo "anildigital/mix-format.el")
  :preface
  (defun rc/elixir-format/setup ()
    (add-hook 'before-save-hook 'elixir-format-before-save))
  :custom
  (elixir-format-mix-path "/usr/local/bin/mix")
  :hook
  (elixir-mode . rc/elixir-format/setup))

(use-package flycheck-elixir
  :requires init-flycheck
  :after (flycheck elixir-mode))

(use-package flycheck-mix
  :requires init-flycheck
  :after (flycheck elixir-mode)
  :config
  (flycheck-mix-setup))

(use-package flycheck-dialyxir
  :requires init-flycheck
  :after (flycheck elixir-mode))

(use-package flycheck-credo
  :requires init-flycheck
  :after (flycheck elixir-mode)
  :config
  (flycheck-credo-setup))

(provide 'init-elixir)
