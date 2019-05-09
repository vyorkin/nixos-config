(defun rc/expand-emacs (path)
  "Expands `path` with Emacs home directory."
  (expand-file-name path user-emacs-directory))

(defun rc/expand-tmp (path)
  "Expand `path` with Emacs temporary directory."
  (rc/expand-emacs (format "tmp/%s" path)))

(defun rc/expand-lisp (path)
  "Expand `path` with Emacs LISP directory."
  (rc/expand-emacs (format "lisp/%s" path)))

(provide 'init-utils)
