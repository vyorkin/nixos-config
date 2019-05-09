(require 'init-utils)
(require 'init-helpers)

(defvar rc/leader "SPC")

(use-package general
  :preface
  (defun rc/find-user-init-file ()
    "Edit the `user-init-file', in another window."
    (interactive)
    (find-file user-init-file))
  :config
  (general-define-key
   "C-h" 'windmove-left
   "C-l" 'windmove-right
   "C-k" 'windmove-up
   "C-j" 'windmove-down
   "M-q" 'rc/server-shutdown
   "M-a" 'rc/kill-others
   "C-c C-k" 'kill-region)
  (when (eq system-type 'darwin)
    ;; mostly taken from the @freetonik emacs dotfiles:
    ;; https://github.com/freetonik/emacs-dotfiles
    (general-define-key
     "s-<backspace>" 'kill-whole-line
     "M-S-<backspace>" 'kill-word
     ;; use super for movement and selection just like in macOS
     "s-<right>" (kbd "C-e")
     "S-s-<right>" (kbd "C-S-e")
     "s-<left>" (kbd "M-m")
     "S-s-<left>" (kbd "M-S-m")
     "s-<up>" 'beginning-of-buffer
     "s-<down>" 'end-of-buffer
     ;; basic things you should expect from macOS
     "s-a" 'mark-whole-buffer       ; select all
     "s-s" 'save-buffer             ; save
     "s-S" 'write-file              ; save as
     "s-q" 'save-buffers-kill-emacs ; quit
     ;; go to other windows easily with one keystroke
     ;; s-something instead of C-x something
     "s-o" (kbd "C-x o")
     "s-w" (kbd "C-x 0") ; just like close tab in a web browser
     "s-W" (kbd "C-x 1") ; close others with shift
     ;; move between windows with Control-Command-Arrow and
     ;; with Cmd just like in iTerm
     "s-[" 'windmove-left   ; Cmd+[ go to left window
     "s-]" 'windmove-right  ; Cmd+] go to right window
     "s-{" 'windmove-up     ; Cmd+Shift+[ go to upper window
     "<s-}>" 'windmove-down ; Ctrl+Shift+[ go to down window
     ;; prev/next buffer
     "s-<" 'previous-buffer
     "s->" 'next-buffer
     ;; instant access to init.el
     "s-i" 'rc/find-user-init-file))
  (general-evil-setup t)
  (nmap
    ;; swap : and ; to make colon commands
    ;; easier to type in Emacs
    ";" 'evil-ex
    ":" 'evil-repeat-find-char)
  (nmap 'messages-buffer-mode-map
    "0" 'evil-digit-argument-or-evil-beginning-of-line)
  (nmap
    :prefix rc/leader
    "RET" 'toggle-frame-fullscreen
    "v" 'split-window-horizontally
    "s" 'split-window-vertically
    "p" 'list-processes
    "P s" 'profiler-start
    "P S" 'profiler-stop
    "P r" 'profiler-report
    "h k" 'describe-key-briefly
    "h K" 'describe-key
    "h M" 'describe-mode
    "h m" 'info-display-manual
    "i" 'rc/find-user-init-file))

(provide 'init-general)
