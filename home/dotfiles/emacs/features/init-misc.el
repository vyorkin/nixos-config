(require 'init-general)
(require 'init-quelpa)

;; provides a simple system for tracking and
;; displaying the uptimes of emacs sessions
(use-package uptimes)

;; measure how many time you execute commands
;; see: http://blog.binchen.org/posts/how-to-be-extremely-efficient-in-emacs.html
(use-package keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(use-package 0xc)
(use-package define-word)

(use-package engine-mode
  :config
  (engine-mode t)
  (engine/set-keymap-prefix (kbd "C-c C-s"))
  (defengine amazon
    "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")
  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "d")
  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s"
    :keybinding "G")
  (defengine google
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "g")
  (defengine google-images
    "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s"
    :keybinding "i")
  (defengine google-maps
    "http://maps.google.com/maps?q=%s"
    :docstring "Mappin' it up."
    :keybinding "m")
  (defengine project-gutenberg
    "http://www.gutenberg.org/ebooks/search/?query=%s")
  (defengine rfcs
    "http://pretty-rfc.herokuapp.com/search?q=%s")
  (defengine stack-overflow
    "https://stackoverflow.com/search?q=%s"
    :keybinding "s"
    :docstring "Search Stack Overlow")
  (defengine twitter
    "https://twitter.com/search?q=%s"
    :keybinding "t")
  (defengine wikipedia
    "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
    :keybinding "w"
    :docstring "Searchin' the wikis.")
  (defengine pursuit
    "https://pursuit.purescript.org/search?q=%s"
    :keybinding "p")
  (defengine hoogle
    "https://www.haskell.org/hoogle/?hoogle=%s"
    :keybinding "h")
  (defengine hayoo
    "http://hayoo.fh-wedel.de/?query=%s")
  (defengine wiktionary
    "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")
  (defengine wolfram-alpha
    "http://www.wolframalpha.com/input/?i=%s")
  (defengine youtube
    "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
    :keybinding "y"))

(use-package google-this
  ;; I use engine-mode instead
  :disabled
  :diminish google-this-mode
  :config
  (google-this-mode 1)
  (nmap
    :prefix rc/leader
    "G" google-this-mode-submap))

(use-package atomic-chrome
  :requires init-quelpa
  ;; Even the fork doesn't work for me
  :disabled
  :quelpa
  (atomic-chrome
   :fetcher github
   :repo "dakrone/atomic-chrome"
   :branch "add-server-running-check")
  :custom
  (atomic-chrome-url-major-mode-alist
   '(("reddit\\.com" . markdown-mode)
     ("github\\.com" . gfm-mode)
     ("redmine" . textile-mode))
   "Major modes for URLs.")
  :config
  (when (not (atomic-chrome-server-running-p))
    (atomic-chrome-start-server)))

(use-package net-utils
  :config
  (nmap
    :prefix "C-c n"
    "p" 'ping
    "i" 'ifconfig
    "w" 'iwconfig
    "n" 'netstat
    "p" 'ping
    "a" 'arp
    "r" 'route
    "h" 'nslookup-host
    "d" 'dig
    "s" 'smbclient))

(use-package speed-type)

;; speed reading
(use-package spray
  :requires init-general
  :after general
  :config
  (nmap
    :prefix rc/leader
    "S" 'spray-mode))

(provide 'init-misc)
