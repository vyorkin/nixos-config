(require 'init-general)

(use-package powerthesaurus
  :requires init-general
  :after general
  :config
  (nmap
    :prefix rc/leader
    "L" 'powerthesaurus-lookup-word-at-point))

(use-package define-word
  ;; if you got the "error in process filter"
  ;; chances are the wordnik.com is down, try again later ;)
  :requires init-general
  :after general
  :config
  (nmap
    :prefix rc/leader
    "D" 'define-word-at-point))

(provide 'init-dictionary)
