;;; midnight mode

;; I find that I need a more aggressive clear up.
;; Here is what I use to auto kill buffers not active for
;; more than 5 minutes every 15 mins.

(require 'midnight)

;; kill buffers if they were last disabled more than this seconds ago
(setq clean-buffer-list-delay-special 300) ; 5 mins

(defvar rc/clean-buffer-list-timer nil
  "Stores clean-buffer-list timer if there is one. You can disable clean-buffer-list by (cancel-timer rc/clean-buffer-list-timer).")

;; run clean-buffer-list every 15 mins
(setq rc/clean-buffer-list-timer (run-at-time t 900 'clean-buffer-list))

;; kill everything, clean-buffer-list is very intelligent at not killing
;; unsaved buffer
(setq clean-buffer-list-kill-regexps '("^.*$"))

;; keep these buffer untouched
;; prevent append multiple times
(defvar rc/clean-buffer-list-kill-never-buffer-names-init
  clean-buffer-list-kill-never-buffer-names
  "Init value for clean-buffer-list-kill-never-buffer-names")

(setq
 clean-buffer-list-kill-never-buffer-names
 (append
  '("*Messages*" "*cmd*" "*scratch*"
    "*w3m*" "*w3m-cache*" "*Inferior Octave*"
    "*eshell*" "*ert*" "*eww*" "*Process List*"
    "*psc-ide-server*" "*haskell-mode*"
    "*haskell-process-log*" "*HS-Error*")
  rc/clean-buffer-list-kill-never-buffer-names-init))

;; prevent append multiple times
(defvar rc/clean-buffer-list-kill-never-regexps-init
  clean-buffer-list-kill-never-regexps
  "Init value for clean-buffer-list-kill-never-regexps")

;; append to *-init instead of itself
(setq
 clean-buffer-list-kill-never-regexps
 (append
  '("^\\*Flycheck\\*.*$")
	rc/clean-buffer-list-kill-never-regexps-init))

(provide 'init-midnight)
