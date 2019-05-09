(require 'init-editor)
(require 'init-general)

(use-package company
  :requires init-general
  :preface
  (defun rc/company/complete-number ()
    "Forward to `company-complete-number'.

Unless the number is potentially part of the candidate.
In that case, insert the number."
    (interactive)
    (let* ((k (this-command-keys))
           (re (concat "^" company-prefix k)))
      (if (cl-find-if (lambda (s) (string-match re s))
                      company-candidates)
          (self-insert-command 1)
        (company-complete-number (string-to-number k)))))
  :hook
  ;; use company-mode in all buffers
  (after-init . global-company-mode)
  :custom
  (company-dabbrev-ignore-case nil)
  (company-dabbrev-code-ignore-case nil)
  (company-dabbrev-downcase nil)
  (company-idle-delay 0.4 "adjust this setting according to your typing speed")
  (company-minimum-prefix-length 3)
  ;; (company-show-numbers t "show numbers next to candidates")
  ;; (company-tooltip-align-annotations t "align annotation to the right hand side")
  ;; (company-tooltip-limit 10)
  ;; (company-transformers '(company-sort-by-occurrence))
  ;; (company-frontends
  ;;  '(company-tng-frontend
  ;;    company-pseudo-tooltip-frontend
  ;;    company-echo-metadata-frontend))
  :config
  ;; use the tab-and-go frontend
  ;; allows TAB to select and complete at the same time
  ;; (company-tng-configure-default)
  ;; TODO: Freezes emacs (?)
  ;; (let ((map company-active-map))
  ;;   (mapc
  ;;    (lambda (x)
  ;;      (define-key map (format "%d" x) 'rc/company/complete-number))
  ;;    (number-sequence 0 9))
  ;;   (define-key map " "
  ;;     (lambda ()
  ;;       (interactive)
  ;;       (company-abort)
  ;;       (self-insert-command 1)))
  ;;   (define-key map (kbd "<return>") nil))
  (custom-set-faces
   ;; company
   '(company-preview ((t (:foreground "#131313" :underline t))))
   '(company-preview-common ((t (:inherit company-preview))))
   '(company-tooltip ((t (:background "#131313" :foreground "#ddd"))))
   '(company-tooltip-selection ((t (:background "#1e1e1e" :foreground "#eee"))))
   '(company-tooltip-common
     ((((type x)) (:inherit company-tooltip :weight bold))
      (t (:inherit company-tooltip))))
   '(company-tooltip-common-selection
     ((((type x)) (:inherit company-tooltip-selection :weight bold))
      (t (:inherit company-tooltip-selection))))
   '(company-scrollbar-bg ((t (:background "#111"))))
   '(company-scrollbar-fg ((t (:background "#1a1a1a")))))
  (unbind-key "C-SPC")
  (imap
    "C-SPC" 'company-complete
    "M-SPC" 'company-complete)
  ;; some of the key bindings are
  ;; provided by the evil-collection
  (general-define-key
   :keymaps 'company-active-map
   "C-j" 'company-select-next-or-abort
   "C-k" 'company-select-previous-or-abort
   "C-o" 'company-other-backend
   "C-f" 'company-abort
   "C-d" 'company-show-doc-buffer
   "C-w" 'backward-kill-word)
  :diminish company-mode)

(use-package company-quickhelp
  :requires init-general
  :after company
  :custom
  (company-quickhelp-delay 3)
  :config
  (general-define-key
   :keymaps 'company-active-map
   "C-c h" 'company-quickhelp-manual-begin))

;; flx fuzzy matching for company
;; this only works with the company-capf backend.
(use-package company-flx
  :requires (init-company init-editor)
  :after (company flx)
  :demand t
  :config
  ;; use C-o to switch backend and
  ;; enable company mode fuzziness
  (company-flx-mode +1))

(provide 'init-company)
