(require 'init-company)
(require 'init-lsp)

(use-package web-mode
  :mode
  (("\\.html?\\'" . web-mode)
   ("\\.html\\.erb\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ("\\.tsx\\'" . web-mode)
   ("\\.jsx\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.jinja\\'" . web-mode)

   ("\\.css\\'" . web-mode)
   ("\\.scss\\'" . web-mode)

   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.as\\'" . web-mode)

   ("\\.phtml\\'" . web-mode)
   ("\\.tpl\\.php\\'" . web-mode)
   ("\\.php\\'" . web-mode))

  :init
  (setq
   ;; indent HTML automatically
   web-mode-indent-style 2
   ;; offsets
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2

   web-mode-engines-alist
   '(("\\.jinja\\'"  . "django")
     ("php" . "\\.php[3-5]?"))

   web-mode-enable-auto-pairing t
   web-mode-enable-css-colorization t
   web-mode-enable-current-element-highlight t
   web-mode-enable-current-column-highlight nil))

(use-package company-web
  :requires init-company
  :demand t)

(use-package lsp-html
  :requires init-lsp
  :after lsp-mode
  :hook
  (html-mode . lsp-html-enable))

(provide 'init-web)
