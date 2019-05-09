(require 'init-general)

(use-package pomidor
  :requires init-general
  :after general
  :init
  ;; (setq alert-default-style 'mode-line)
  (setq
   alert-default-style
   (if (eq system-type 'darwin) 'osx-notifier 'libnotify))
  ;; use afplay on macOS
  (when (eq system-type 'darwin)
    (setq
     pomidor-play-sound-file
     (lambda (file)
       (start-process
        "my-pomidor-play-sound"
        nil
        "afplay"
        file))))
  (setq
   pomidor-seconds (* 25 60)      ; 25 minutes
   pomidor-break-seconds (* 5 60) ; 5 minutes
   pomidor-sound-tick nil
   pomidor-sound-tack nil)
  :config
  (nmap
    :prefix rc/leader
    "x x" 'pomidor
    "x s" 'pomidor-stop
    "x q" 'pomidor-quit
    "x b" 'pomidor-break
    "x r" 'pomidor-reset)
  (nmap 'pomidor-mode-map
    "Q" 'pomidor-quit
    "s" 'pomidor-stop    ; "RET"
    "b" 'pomidor-break   ; "SPC"
    "r" 'pomidor-reset))

(provide 'init-pomodoro)
