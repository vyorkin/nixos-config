(require 'init-quelpa)
(require 'init-general)

(defun rc/customize-appearance ()
  (interactive)
  ;; set the background or vertical border to the main area background color
  (set-face-background 'vertical-border (face-background 'default))
  ;; set the foreground and background of the vertical-border face to
  ;; the same value so there is no line up the middle
  (set-face-foreground 'vertical-border (face-background 'vertical-border))
  ;; set the fringe colors to whatever is the background color
  (set-face-attribute
   'fringe nil
   :foreground (face-foreground 'default)
   :background (face-background 'default))
  ;; set the highlight color for selected text
  (set-face-attribute 'region nil :foreground "#fff")
  (set-face-attribute 'region nil :background "#282828")
  ;; set the highlight color and foreground color for matching search results
  (set-face-attribute 'lazy-highlight nil :foreground "black" :background "#ffd700")
  (require 'init-font))

;; required for emacsclient
(if (display-graphic-p)
    (rc/customize-appearance)
  (add-hook
   'after-make-frame-functions
   (lambda (frame)
     (when (display-graphic-p frame)
       (with-selected-frame frame
         (rc/customize-appearance))))))

(use-package delight
  :config
  (delight
   '((emacs-lisp-mode "elisp" :major)
     (ruby-mode "ruby" :major)
     (elixir-mode "ex" elixir)
     (alchemist-mode "al" alchemist)
     (alchemist-hex-mode "alhex" alchemist)
     (alchemist-test-mode "altest" alchemist)
     (rust-mode "rs" rust)
     (purescript-mode "purs" purescript)
     (javascript-mode "js" js)
     (eldoc-mode "eldoc" eldoc)
     (outline-minor-mode "outl" outline)
     ;; (hi-lock-mode "hi" hi-lock)
     (subword-mode "sw" subword))))

(use-package diminish
  :config
  (eval-after-load "purescript-indentation" '(diminish 'purescript-indentation-mode))
  (eval-after-load "dired" '(diminish 'dired-omit-mode))
  (eval-after-load "hideshow" '(diminish 'hs-minor-mode))
  (eval-after-load "eldoc" '(diminish 'eldoc-mode))
  (eval-after-load "hi-lock" '(diminish 'hi-lock-mode)))

;; display ugly ^L page breaks as tidy horizontal lines
(use-package page-break-lines
  :init
  (global-page-break-lines-mode 1)
  :diminish page-break-lines-mode)

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode)
  :diminish rainbow-delimiters-mode)

(use-package rainbow-identifiers
  :hook
  (prog-mode . rainbow-identifiers-mode)
  :diminish rainbow-identifiers-mode)

(use-package rainbow-mode
  :diminish rainbow-mode
  :hook prog-mode)

;; basically its the same as highlight-thing
;; but seems to be smarter and less distracting
(use-package idle-highlight-mode
  :custom
  (idle-highlight-idle-time 0.2)
  :hook
  (prog-mode . idle-highlight-mode)
  :config
  ;; (set-face-background 'idle-highlight "#c51060")
  (set-face-foreground 'idle-highlight "#999")
  (set-face-background 'idle-highlight "#222")
  (nmap
    :prefix rc/leader
    "t H" 'idle-highlight-mode))

(use-package hl-todo
  :config
  (global-hl-todo-mode))

(use-package highlight-indentation
  :requires init-general
  :after general
  :hook
  (yaml-mode . highlight-indentation-mode)
  (haskell-mode . highlight-indentation-mode)
  :config
  (set-face-background 'highlight-indentation-face "#121212")
  (set-face-background 'highlight-indentation-current-column-face "#111111")
  (highlight-indentation-current-column-mode)
  (nmap
    :prefix rc/leader
    "t i" 'highlight-indentation-mode)
  :diminish
  (highlight-indentation-mode
   highlight-indentation-current-column-mode))

(use-package highlight-chars
  :preface
  (defun rc/highlight-chars/setup ()
    (hc-highlight-tabs)
    (hc-highlight-trailing-whitespace)
    (hc-highlight-hard-spaces)
    (hc-highlight-hard-hyphens))
  :defer 1
  :quelpa (highlight-chars :fetcher github :repo "emacsmirror/highlight-chars")
  :hook
  ((lisp-mode-hook prog-mode-hook) . rc/highlight-chars/setup))

(use-package highlight-leading-spaces
  ;; has issues with face color (becomes white sometimes)
  ;; so I only enable it when needed
  ;; :hook
  ;; (prog-mode . highlight-leading-spaces-mode)
  :custom-face
  (highlight-leading-spaces ((t (:foreground "#212121"))))
  :config
  (nmap
    :prefix rc/leader
    "t s" 'highlight-leading-spaces-mode))

(use-package vi-tilde-fringe
  :config
  (global-vi-tilde-fringe-mode)
  :diminish vi-tilde-fringe-mode)

(use-package all-the-icons
  :config
  (add-to-list
   'all-the-icons-mode-icon-alist
   '(package-menu-mode all-the-icons-octicon "package" :v-adjust 0.0)))

(provide 'init-appearance)
