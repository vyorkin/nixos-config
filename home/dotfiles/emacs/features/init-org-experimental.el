(require 'init-general)
(require 'init-org)
(require 'init-projectile)

(use-package org-super-agenda
  :disabled
  :requires init-general
  :after (general org)
  :config
  (org-super-agenda-mode)
  (setq org-super-agenda-groups
        '((:name "notes" :regexp "NOTE")
          (:name "today" :scheduled today)
          (:name "due today" :deadline today)
          (:name "overdue" :deadline past)
          (:name "due soon" :deadline future)
          (:name "quick picks" :effort< "0:30")
          (:name "important" :priority "A")
          (:name "scheduled earlier" :scheduled past))))

;; unable to make it work
;; (use-package org-projectile
;;   :disabled
;;   :requires (init-general init-projectile)
;;   :after (general projectile org)
;;   :preface
;;   (defconst rc/org-projectile/projects-file-name
;;     "Projects org file path"
;;     (substitute-in-file-name (substitute-in-file-name "$HOME/Dropbox/org/projects.org")))
;;   :config
;;   (org-projectile-per-project)
;;   (setq org-projectile-per-project-filepath rc/org-projectile/projects-file-name)
;;   (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
;;   (nmap
;;     :prefix rc/leader
;;     "r" 'org-projectile-project-todo-completing-read))

(provide 'init-org-experimental)
