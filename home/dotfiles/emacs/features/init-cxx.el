(require 'init-general)
(require 'init-company)
(require 'init-flycheck)

(use-package compile
  :preface
  (paradox-require 'cl)
  (defun rc/compile/closest-pathname (&optional (file "Makefile"))
    "Determine the pathname of the first instance of FILE starting from the current directory towards root.
    This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
    of FILE in the current directory, suitable for creation"
    (let ((root (expand-file-name "/"))) ;; the win32 builds should translate this correctly
      (expand-file-name
       file
       (loop
        for d = default-directory then (expand-file-name ".." d)
        if (file-exists-p (expand-file-name file d))
        return d
        if (equal d root)
        return nil))))
  ;; need for running Make with the closest Makefile
  (defun rc/compile/setup-make ()
    (set
     (make-local-variable 'compile-command)
     (format "make -f %s" (rc/compile/closest-pathname))))
  :hook
  (c++-mode . rc/compile/setup-make))

;; always use the latest & greatest
(add-hook
 'c++-mode-hook
 (lambda ()
   (setq
    flycheck-gcc-language-standard "c++17"
    flycheck-clang-language-standard "c++17")))

(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

(use-package irony
  :defer t
  :commands irony-mode
  :hook
  (((c++-mode c-mode objc-mode) . irony-mode)
   (irony-mode . irony-cdb-autosetup-compile-options)))

(use-package irony-eldoc
  :after irony
  :hook
  (irony-mode . irony-eldoc))

;; disassemble C/C++ code under cursor
(use-package disaster
  ;; here is why: https://github.com/jart/disaster/issues/13
  :disabled
  :requires init-general
  :config
  :bind
  (:map c-mode-base-map
        ("C-c d") 'disaster))

(use-package company-irony
  :requires init-company
  :after (company irony)
  :demand t
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package company-irony-c-headers
  :requires init-company
  :after (company irony)
  :demand t
  :config
  (add-to-list 'company-backends 'company-irony-c-headers))

(use-package flycheck-irony
  :requires init-flycheck
  :after (flycheck irony))

(provide 'init-cxx)
