;; shutdown emacs server instance
(defun rc/server-shutdown ()
  "Save buffers, quit and shutdown (kill) server."
  (interactive)
  (save-some-buffers)
  (kill-emacs))

(substitute-key-definition 'kill-buffer 'kill-buffer-and-its-windows global-map)

(defun rc/kill-others ()
  "Kill other buffers and delete other windows."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (delete-other-windows))

(defun rc/kill-dired-buffers ()
	(interactive)
	(mapc (lambda (buffer)
          (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

(defun rc/close-and-kill-this-pane ()
  "If there are multiple windows, then close this pane and kill the buffer in it also."
  (interactive)
  (kill-this-buffer)
  (if (not (one-window-p))
      (delete-window)))

(defun rc/close-and-kill-next-pane ()
  "If there are multiple windows, then close the other pane and kill the buffer in it also."
  (interactive)
  (other-window 1)
  (kill-this-buffer)
  (if (not (one-window-p))
      (delete-window)))

(provide 'init-helpers)
