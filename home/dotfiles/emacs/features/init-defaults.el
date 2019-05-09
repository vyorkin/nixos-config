;; don't create lock files, fuck collisions
(setq create-lockfiles nil)

(setq
 make-backup-files nil        ; disable backup files
 auto-save-list-file-name nil ; disable .saves files
 auto-save-default nil        ; disable auto saving
 ring-bell-function 'ignore)  ; turn off alarms completely

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; enable HideShow in programming modes,
;; useful for getting an overview of the code,
;; it works better in some languages and layouts than others
(add-hook 'prog-mode-hook (lambda () (hs-minor-mode t)))

;; enable recentf-mode and remember a lot of files
(recentf-mode 1)
(setq recentf-max-saved-items 200)

;; when gdb debugging, show the many windows (stack trace, break points,etc.)
(setq gdb-many-windows t)

;; automatically save place in each file
(save-place-mode 1)

;; set the location
(setq calendar-location-name "Moscow, RU")
(setq calendar-latitude 55.84)
(setq calendar-longitude 37.34)

(provide 'init-defaults)
