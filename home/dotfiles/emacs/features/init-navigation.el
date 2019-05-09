(require 'init-quelpa)
(require 'init-appearance)
(require 'init-editor)
(require 'init-general)
(require 'init-company)
(require 'init-hydra)
(require 'init-flycheck)
(require 'init-spellcheck)

(use-package ivy
  :requires (init-general init-editor)
  :after (general flx)
  :preface
  (defun rc/ivy/switch-buffer-occur ()
    "Occur function for `ivy-switch-buffer' using `ibuffer'."
    (ibuffer nil (buffer-name) (list (cons 'name ivy--old-re))))
  :custom
  (ivy-count-format "%d/%d " "Show anzu-like counter")
  :custom-face
  ;; (ivy-current-match ((t (:inherit 'hl-line))))
  ;; TODO: make this theme-dependent (use :inherit)
  (ivy-current-match ((t (:background "#4782b4" :foreground "#fff"))))
  :init
  (setq
   ;; enable bookmarks and recentf
   ;; (add 'recentf-mode' and bookmarks to 'ivy-switch-buffer')
   ivy-use-virtual-buffers t
   ;; display full buffer name
   ivy-virtual-abbreviate 'full
   ;; number of result lines to display
   ivy-height 10
   ;; current input becomes selectable as a candidate
   ;; solves the issue of creating a file or
   ;; a directory `foo` when a file `foobar` already exists
   ;; another way is to use C-M-j
   ivy-use-selectable-prompt t
   ;; wrap around ivy results
   ivy-wrap t
   ;; omit ^ at the beginning of regexp
   ivy-initial-inputs-alist nil)
  :config
  (ivy-mode 1)
  ;; enable/disable fuzzy matching
  ;; see: https://oremacs.com/2016/01/06/ivy-flx/
  ;; (setq ivy-re-builders-alist
  ;;       '((ivy-switch-buffer . ivy--regex-plus)
  ;;         (t . ivy--regex-fuzzy)))
  (setq ivy-re-builders-alist '((t . ivy--regex-plus)))
  (ivy-set-occur 'ivy-switch-buffer 'rc/ivy/switch-buffer-occur)
  (nmap
    :prefix rc/leader
    "a" 'ivy-switch-buffer)
  (nmap
    "C-c v"'ivy-push-view
    "C-c V"'ivy-pop-view)
  (when (eq system-type 'darwin)
    (general-define-key
     "s-b" 'ivy-switch-buffer
     "M-s-b" 'ivy-resume))
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "C-t" 'ivy-toggle-fuzzy
   "C-j" 'ivy-next-line
   "C-k" 'ivy-previous-line
   "C-n" 'ivy-next-history-element
   "C-p" 'ivy-previous-history-element
   "<C-return>" 'ivy-immediate-done
   "C-l" 'ivy-immediate-done
   "C-w" 'ivy-backward-kill-word)
  :diminish ivy-mode)

(use-package ivy-rich
  :after ivy
  :init
  (setq
   ;; to abbreviate paths using abbreviate-file-name
   ;; (e.g. replace “/home/username” with “~”)
   ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode 1))

(use-package ivy-xref
  :custom
  (xref-show-xrefs-function 'ivy-xref-show-xrefs "Use Ivy to show xrefs"))

(use-package ibuffer-vc
  :custom
  (ibuffer-formats
   '((mark modified read-only vc-status-mini " "
           (name 18 18 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " "
           filename-and-process)) "include vc status info")
  :hook
  (ibuffer . (lambda ()
               (ibuffer-vc-set-filter-groups-by-vc-root)
               (unless (eq ibuffer-sorting-mode 'alphabetic)
                 (ibuffer-do-sort-by-alphabetic)))))

(use-package flyspell-correct-ivy
  :requires (init-general init-spellcheck)
  :after (general flyspell ivy)
  :demand t
  :init
  (setq flyspell-correct-interface 'flyspell-correct-ivy)
  :config
  (nmap 'flyspell-mode-map
    "C-;" 'flyspell-correct-previous-word-generic))

(use-package fzf)

(use-package counsel
  :requires init-general
  :after general
  :init
  ;; much faster than grep
  (setq
   counsel-git-cmd "rg --files"
   ;;  truncate all lines that are longer than 120 characters
   counsel-grep-base-command
   "rg -i -M 120 --no-heading --line-number --color never %s .")
  :config
  (nmap
    "C-f" 'counsel-imenu)
  (imap
    "C-," 'counsel-unicode-char)
  (nmap
    :prefix rc/leader
    "f" 'counsel-rg
    "F" 'counsel-fzf
    "h v" 'counsel-describe-variable
    "h f" 'counsel-describe-function)
  (when (eq system-type 'darwin)
    (nmap
      "s-f" 'counsel-rg))
  (nmap
    "M-x" 'counsel-M-x)
  (nmap
    :prefix "C-x"
    "C-r" 'find-file
    "C-f" 'counsel-find-file
    "C-g" 'counsel-git-grep
    "p" 'counsel-package)
  (nmap
    :prefix rc/leader
    rc/leader 'counsel-M-x
    "T" 'counsel-load-theme
    "J" 'counsel-bookmark))

(use-package counsel-etags
  :requires init-general
  :after (general counsel))

(use-package swiper
  :requires init-general
  :after general
  :init
  ;; recenter after swiper is finished
  (setq swiper-action-recenter t)
  :config
  (general-define-key
   :keymaps 'swiper-map
   "C-r" 'swiper-query-replace)
  (nmap
    "C-s" 'swiper))

(use-package ivy-hydra
  :requires init-hydra
  :after hydra
  :config
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "M-i" 'hydra-ivy/body))

;; (use-package ranger)

(use-package ag
  :disabled
  :custom
  (ag-highlight-search t "Highlight the current search term."))

(use-package dumb-jump
  :custom
  (dumb-jump-selector 'ivy)
  (dumb-jump-prefer-searcher 'ag)
  (nmap
    "C-c C-j" 'dumb-jump-go))

(use-package avy
  :requires init-general
  :demand t
  :config
  (mmap
    :prefix "C-c j"
    "c" 'avy-goto-char
    "w" 'avy-goto-word-1
    "l" 'avy-goto-line))

(use-package avy-zap
  :bind
  ([remap zap-to-char] . avy-zap-to-char))

(use-package avy-flycheck
  :requires (init-general init-flycheck)
  :after (general avy flycheck)
  :init
  (setq avy-flycheck-style 'pre)
  :config
  (avy-flycheck-setup)
  (nmap
    :prefix rc/leader
    "n e" 'avy-flycheck-goto-error))

(use-package navigate
  :requires init-quelpa
  :quelpa (navigate :fetcher github :repo "keith/evil-tmux-navigator")
  :config
  (require 'navigate))

(provide 'init-navigation)
