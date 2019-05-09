(require 'init-general)

(use-package format-sql
  :requires init-general
  :after general
  :config
  (nmap 'sql-mode-map
    :prefix "C-c s"
    "b" 'format-sql-buffer
    "r" 'format-sql-region))

(use-package sqlup-mode
  :requires init-general
  :after general
  :hook
  ;; capitalize keywords in SQL mode
  ;; capitalize keywords in an interactive session (e.g. psql)
  ((sql-mode sql-interactive-mode) . sqlup-mode)
  :config
  (add-to-list 'sqlup-blacklist "name")
  (add-to-list 'sqlup-blacklist "public")
  (add-to-list 'sqlup-blacklist "state")
  (nmap
    :keymaps '(sql-mode-map sql-interactive-mode-map)
    :prefix "C-c s"
    "u" 'sqlup-capitalize-keywords-in-region
    "U" 'sqlup-capitalize-keywords-in-buffer))

(provide 'init-sql)
