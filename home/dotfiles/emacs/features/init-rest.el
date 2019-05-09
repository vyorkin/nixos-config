(require 'init-company)
(require 'init-org)

(use-package restclient
  :requires (init-company init-org)
  :after (company company-restclient org)
  :commands restclient-mode
  :config
  (add-to-list 'company-backends 'company-restclient)
  (add-to-list 'org-babel-load-languages '(restclient . t)))

(use-package company-restclient
  :requires init-company
  :after (restclient company))

(use-package ob-restclient
  :requires init-org
  :after (org restclient)
  :commands org-babel-execute:restclient)

(provide 'init-rest)
