(require 'init-general)
(require 'init-quelpa)

(use-package undo-propose
  :requires (init-quelpa init-general)
  :after general
  :config
  (nmap
    :prefix rc/leader
    "u" 'undo-propose)
  (nmap 'undo-propose-mode-map
    :prefix rc/leader
    "d" 'undo-propose-diff)
  (nmap 'undo-propose-mode-map
    "RET" 'undo-propose-finish
    [escape] 'undo-propose-cancel))

(use-package undo-tree
  :disabled
  :requires (init-quelpa init-general)
  :after general
  ;; :quelpa
  ;; (undo-tree :url "https://www.lawlist.com/lisp/undo-tree.el" :fetcher url)
  :init
  (setq
   undo-tree-visualizer-timestamps t
   undo-tree-enable-undo-in-region nil

   ;; attempt to fix the "unrecognized entry in undo list" error
   undo-tree-auto-save-history nil

   undo-tree-history-directory-alist
   `(("." . ,(expand-file-name "undo" user-emacs-directory))))
  ;; diff is slow as hell and
  ;; it doesn't destroy the diff buffer automatically
  ;; I'd recommend turning it on/off manually when needed
  ;; (setq undo-tree-visualizer-diff t)
  :config
  (global-undo-tree-mode)
  (general-define-key
   :states 'motion
   :keymaps
   '(undo-tree-visualizer-mode-map
     undo-tree-visualizer-selection-mode-map)
   "k" 'undo-tree-visualize-undo
   "j" 'undo-tree-visualize-redo
   "l" 'undo-tree-visualize-switch-branch-right
   "h" 'undo-tree-visualize-switch-branch-left
   "t" 'undo-tree-visualizer-toggle-timestamps
   "K" 'undo-tree-visualize-undo-to-x
   "J" 'undo-tree-visualize-redo-to-x
   [escape] 'undo-tree-visualizer-abort
   "RET" 'undo-tree-visualizer-quit)
  (nmap
    :prefix rc/leader
    "u" 'undo-tree-visualize)
  :diminish undo-tree-mode)

(provide 'init-undo)
