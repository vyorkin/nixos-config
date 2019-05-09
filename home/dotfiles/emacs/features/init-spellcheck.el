(require 'init-general)

(use-package ispell
  :ensure nil
  :custom
  ;;(ispell-dictionary-alist
  ;; '(("english" ; English
  ;;    "[a-zA-Z]"
  ;;    "[^a-zA-Z]"
  ;;    "[']"
  ;;    nil
  ;;    ("-d" "en")
  ;;    nil iso-8859-1)
  ;;   ("russian" ; Russian
  ;;    "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯабвгдеёжзийклмнопрстуфхцчшщьыъэюя]"
  ;;    "[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯабвгдеёжзийклмнопрстуфхцчшщьыъэюя]"
  ;;    "[-]"
  ;;    nil
  ;;    ("-C" "-d" "ru")
  ;;    nil utf-8)
  ;;   (nil ; Default
  ;;    "[A-Za-z]"
  ;;    "[^A-Za-z]"
  ;;    "[']"
  ;;    nil
  ;;     ("-C")
  ;;     nil iso-8859-1)))
  (ispell-program-name "aspell")
  ;; (ispell-dictionary "english")
  ;; (ispell-local-dictionary "russian")
  (ispell-really-aspell t)
  (ispell-really-hunspell nil)
  (ispell-extra-args '("--sug-mode=ultra"))
  (ispell-encoding8-command t)
  (ispell-silently-savep t)
  (ispell-have-new-look t)
  (ispell-enable-tex-parser t)
  :config
  (nmap
    "C-c i w" 'ispell-word
    "C-c i c" 'ispell-comments-and-strings
    "C-c i d" 'ispell-change-dictionary
    "C-c i k" 'ispell-kill-ispell
    "C-c i m" 'ispell-message
    "C-c i r" 'ispell-region)
  (when (eq system-type 'darwin)
    (general-define-key
     "s-\\" 'ispell-word)))

(use-package flyspell
  :ensure nil
  :requires init-general
  :after (general ispell)
  :custom
  (flyspell-delay 1)
  (flyspell-always-use-popup t)
  :init
  (setq
   ;; flyspell-default-dictionary "russian"
   ;; flyspell-dictionary "russian"
   flyspell-use-meta-tab nil
   flyspell-mode-line-string ""
   flyspell-auto-correct-binding (kbd ""))
  :hook
  ;; enable spellcheck on the fly for all text modes
  ;; for programming modes flyspell-prog-mode is useful for
  ;; spell checking in comments and strings
  ((text-mode . flyspell-mode)
   ;; too annoying
   ;; (prog-mode . flyspell-prog-mode)
   )
  :config
  (unbind-key "C-." flyspell-mode-map)
  (nmap
    "C-c i b" 'flyspell-buffer
    "C-c i f" 'flyspell-mode))

(provide 'init-spellcheck)
