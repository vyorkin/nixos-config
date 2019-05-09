(require 'init-general)
(require 'init-evil)
(require 'init-editor)
(require 'init-navigation)

(use-package magit)

(use-package evil-magit
  :requires (init-general init-evil)
  :after (evil magit fullframe)
  :init
  (setq evil-magit-state 'normal)
  :config
  (fullframe magit-log-all quit-window)
  (fullframe magit-log-current quit-window)
  ;; when commiting, start in evil-insert state
  (with-eval-after-load 'evil
    (add-hook 'git-commit-mode-hook 'evil-insert-state)
    (evil-set-initial-state 'magit-log-edit-mode 'insert))
  (nmap
    :prefix rc/leader
    "g w" 'magit-stage-file      ; "w" - write
    "g r" 'magit-unstage-file    ; "r" - remove
    "g R" 'magit-reset-soft      ; "R" - soft reset
    "g s" 'magit-status          ; "s" - status
    "g d" 'magit-diff-range      ; "d" - diff
    "g m" 'magit-merge-plain     ; "m" - merge
    "g f" 'magit-file-popup      ; "f" - file
    "g b" 'magit-branch-checkout ; "b" - branch
    "g B" 'magit-branch-create   ; "B" - create a new branch
    "g g" 'magit-blame-addition  ; "g" - blame (for a quick access)
    "g c" 'magit-commit-create   ; "c" - commit
    "g z" 'magit-rebase-branch   ; "z" - rebase
    "g l" 'magit-log-all         ; "l" - log
    "g p" 'magit-push-other)     ; "p" - push
  (when (eq system-type 'darwin)
    (general-define-key
     "s-g 'magit-status")))

(use-package magit-todos
  :requires init-general
  :after (magit general)
  :config
  (magit-todos-mode)
  (nmap
    :prefix rc/leader
    "/" 'magit-todos-list))

(use-package forge)

(use-package git-gutter
  :requires init-general
  :after general
  :config
  (global-git-gutter-mode t)
  ;; (git-gutter:linum-setup)
  (custom-set-variables
   '(git-gutter:update-interval 2)
   '(git-gutter:modified-sign "*")
   '(git-gutter:added-sign "+")
   '(git-gutter:deleted-sign "-")
   '(git-gutter:hide-gutter nil))
  (set-face-foreground 'git-gutter:modified "#444")
  (set-face-foreground 'git-gutter:added "light green")
  (set-face-foreground 'git-gutter:deleted "maroon3")
  (nmap
    :prefix rc/leader
    "t g" 'git-gutter-mode)
  :diminish git-gutter-mode)

(use-package git-timemachine)

(use-package gitattributes-mode)
(use-package gitignore-mode)
(use-package gitconfig-mode)

(use-package gist
  :requires init-general
  :after general
  :config
  (nmap
    :prefix rc/leader
    "G l" 'gist-list
    "G b" 'gist-buffer
    "G B" 'gist-buffer-private
    "G r" 'gist-region
    "G R" 'gist-region-private))

(provide 'init-git)
