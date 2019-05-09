(require 'init-general)
(require 'init-navigation)

;; (use-package org-plus-contrib)

(use-package org
  :requires (init-general init-navigation)
  :after (general counsel)
  ;; to be sure we have latest Org version
  ;; :ensure org-plus-contrib
  :mode ("\\.org\\'" . org-mode)
  :delight "org"
  :preface
  (defun rc/org/agenda-list (split)
    "Visit the org agenda, in the current window or a split"
    (interactive "P")
    (org-agenda-list)
    (when (not split)
      (delete-other-windows)))
  (defun rc/org/remove-empty-drawer-on-clock-out ()
    (interactive)
    (save-excursion
      (beginning-of-line 0)
      (org-remove-empty-drawer-at "LOGBOOK" (point))))
  :custom
  (org-src-tab-acts-natively t)
  :init
  (setq
   ;; forces to mark all child tasks as DONE before
   ;; you can mark the parent as DONE
   org-enforce-todo-dependencies t
   ;; insert an annotation in a task when
   ;; it is marked as done including a
   ;; timestamp of when exactly that happened
   org-log-done (quote time)
   ;; insert annotations when you change
   ;; the deadline of a task, which will note
   ;; the previous deadline date and when it was changed
   org-log-redeadline (quote time)
   ;; same as above, but for the scheduled dates
   org-log-reschedule (quote time)
   ;; hide leading stars
   org-hide-leading-stars t
   ;; use syntax highlighting in
   ;; source blocks while editing
   org-src-fontify-natively t
   ;; noticeable ellipsis
   ;; others: ▼,↴,⬎,⤷,…,⤵,⋱
   org-ellipsis "•••"
   ;; keep org files in Dropbox
   org-directory "~/Dropbox/org"
   org-agenda-files '("~/Dropbox/org/")
   org-highest-priority ?A
   org-lowest-priority ?C
   org-default-priority ?B
   ;; default task sequence / lifecycle
   org-todo-keywords
   '((sequence "TODO" "IN-PROGRESS" "WAITING" "HOLD" "|" "DONE" "CANCELLED"))
   org-todo-keyword-faces
   '(("TODO" :foreground "magenta2" :weight bold)
     ("IN-PROGRESS" :foreground "dodger blue" :weight bold)
     ("WAITING" :foreground "orange" :weight bold)
     ("DONE" :foreground "forest green" :weight bold)
     ("HOLD" :foreground "magenta" :weight bold)
     ("CANCELLED" :foreground "forest green" :weight bold)
     ("BUG" :foreground "red" :weight bold)
     ("UNTESTED" . "purple"))
   org-todo-state-tags-triggers
   '(("CANCELLED" ("CANCELLED" . t))
     ("WAITING" ("WAITING" . t))
     ("HOLD" ("WAITING") ("HOLD" . t))
     (done ("WAITING") ("HOLD"))
     ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
     ("IN-PROGRESS" ("WAITING") ("CANCELLED") ("HOLD"))
     ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))
   ;; custom templates
   org-capture-templates
   '(("t" "todo" entry (file "todos.org")
      "* TODO %?\n%U\n%a\n")
     ("n" "note" entry (file "notes.org")
      "* %?\n:NOTE:\n%U\n%a\n")
     ("i" "idea" entry (file "ideas.org")
      "* %?\n:IDEA:\n%U\n%a\n")
     ("j" "journal" entry (file+datetree "diary.org")
      "* %?\n%U\n")
     ("h" "habit" entry (file "habits.org")
      "* TODO %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: TODO\n:END:\n"))
   ;; do not dim blocked tasks
   org-agenda-dim-blocked-tasks nil
   ;; compact the block agenda view
   org-agenda-compact-blocks t)
  :config
  (add-hook 'org-clock-out-hook #'rc/org/remove-empty-drawer-on-clock-out 'append)
  (nmap
    :prefix rc/leader
    "o" 'org-todo-list
    "O" 'counsel-org-goto-all
    "c" 'counsel-org-capture
    "A" 'rc/org/agenda-list)
  (mmap 'org-agenda-mode-map
    "C-c C-l" 'org-agenda-log-mode))

(use-package evil-org
  :requires init-general
  :after (general org)
  :preface
  (defun rc/evil-org/setup ()
    (evil-org-set-key-theme)
    (evil-org-agenda-set-keys))
  :hook
  ((org-mode . evil-org-mode)
   (evil-org-mode . rc/evil-org/setup))
  :init
  (setq
   evil-org-key-theme
   '(textobjects
     insert
     navigation
     additional
     shift
     todo
     heading))
  :config
  (require 'evil-org-agenda)
  :diminish evil-org-mode)

(use-package org-bullets
  :after org
  :commands (org-bullets-mode)
  :preface
  (defun rc/org-bullets/setup ()
    (org-bullets-mode 1))
  :hook
  (org-mode . rc/org-bullets/setup)
  :custom
  ;; org-bullets-bullet-list
  ;; default: "◉ ○ ✸ ✿"
  ;; large: ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶
  ;; Small: ► • ★ ▸
  (org-bullets-bullet-list '("•")))

(use-package htmlize
  :custom
  (org-html-htmlize-output-type 'css)
  (org-html-htmlize-font-prefix "org-"))

(use-package org-password-manager
  :hook
  (org-mode . org-password-manager-key-bindings))

(provide 'init-org)
