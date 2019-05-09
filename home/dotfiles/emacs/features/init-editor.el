(require 'init-general)
(require 'init-quelpa)
(require 'init-evil)

(use-package frame-fns
  :demand t
  :quelpa (frame-fns :fetcher github :repo "emacsmirror/frame-fns"))

(use-package frame-cmds
  :demand t
  :quelpa (frame-cmds :fetcher github :repo "emacsmirror/frame-cmds"))

;; text-scale-increase/decrease doesn't play well with
;; company (suggestions popup alignment issue)
;; more info: https://github.com/company-mode/company-mode/issues/299#issuecomment-115056397
(use-package zoom-frm
  :requires init-general
  :quelpa (zoom-frm :fetcher github :repo "emacsmirror/zoom-frm")
  :config
  (nmap
    "C-=" 'zoom-frm-in
    "C--" 'zoom-frm-out
    "<s-triple-wheel-up>" 'zoom-frm-in
    "<s-triple-wheel-down>" 'zoom-frm-out))

(use-package seethru
  :config
  (seethru 100)
  ;; C-c 8, C-c 9
  (seethru-recommended-keybinds))

(use-package ace-window
  :requires init-general
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l) "Use home row for selecting.")
  (aw-scope 'frame "Highlight only current frame.")
  :config
  (nmap
    :prefix rc/leader
    "w" 'ace-window))

(use-package ace-link
  :config
  (nmap
    "C-c C-l" 'counsel-ace-link)
  :config
  (ace-link-setup-default))

;; make emacs kill ring and system clipboard independent
(use-package simpleclip
  :disabled
  :requires init-general
  :after general
  :config
  (simpleclip-mode 1)
  (nmap
    "s-c" 'simpleclip-copy
    "s-v" 'simpleclip-paste)
  (imap
    "s-c" 'simpleclip-copy
    "s-v" 'simpleclip-paste))

(use-package clipmon
  :requires init-general
  :after general
  :config
  (clipmon-mode)
  (nmap
    :prefix rc/leader
    ;; if no change is detected after a certain number of minutes,
    ;; autoinsert will turn itself off automatically with another beep
    "c" 'clipmon-autoinsert-toggle))

;; increases the selected region by semantic units
(use-package expand-region
  :requires init-general
  :after general
  :config
  (vmap
    "v" 'er/expand-region)
  (when (eq system-type 'darwin)
    (vmap
      "s-'" 'er/expand-region)))

(use-package copy-as-format
  :requires init-general
  :after general
  :config
  (vmap
    :prefix "C-c f"
    "f" 'copy-as-format
    "a" 'copy-as-format-asciidoc
    "b" 'copy-as-format-bitbucket
    "d" 'copy-as-format-disqus
    "g" 'copy-as-format-github
    "l" 'copy-as-format-gitlab
    "h" 'copy-as-format-html
    "j" 'copy-as-format-jira
    "m" 'copy-as-format-markdown
    "w" 'copy-as-format-mediawiki
    "o" 'copy-as-format-org-mode
    "p" 'copy-as-format-pod
    "r" 'copy-as-format-rst
    "s" 'copy-as-format-slack))

(use-package popwin
  :config
  (popwin-mode))

(use-package fullframe
  :config
  (fullframe list-packages quit-window)
  (fullframe package-list-packages quit-window))

;; restore split pane config, winner-undo, winner-redo
(use-package winner
  :requires init-general
  :demand t
  :init
  (setq
   winner-dont-bind-my-keys t
   winner-boring-buffers
   '("*Completions*"
     "*Compile-Log*"
     "*inferior-lisp*"
     "*Fuzzy Completions*"
     "*Apropos*"
     "*Help*"
     "*cvs*"
     "*Buffer List*"
     "*Ibuffer*"
     "*esh command on file*")
   )
  :config
  (winner-mode 1)
  :config
  (nmap
    :prefix rc/leader
    "U" 'winner-undo
    "R" 'winner-redo)
  (when (eq system-type 'darwin)
    (general-define-key
     "C-s-[" 'winner-undo
     "C-s-]" 'winner-redo)))

(use-package helpful)

(use-package with-editor
  :requires init-evil
  :config
  (nmap 'with-editor-mode-map
    ;; it closes the Magit's git-commit window
    ;; instead of switching to evil-normal-state
    ;; [escape] 'with-editor-cancel
    "RET" 'with-editor-finish)
  (evil-set-initial-state 'with-editor-mode 'insert))

;; fuzzy matching for Emacs ... a la Sublime Text
(use-package flx)

(provide 'init-editor)
