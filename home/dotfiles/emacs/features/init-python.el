(require 'init-general)
(require 'init-lsp)

(use-package python-mode
  :preface
  (defun rc/python-mode/setup ()
    (mapc (lambda (pair) (push pair prettify-symbols-alist))
          '(("def" . "𝒇")
            ("class" . "𝑪")
            ("and" . "∧")
            ("or" . "∨")
            ("not" . "￢")
            ("in" . "∈")
            ("not in" . "∉")
            ("return" . "⟼")
            ("yield" . "⟻")
            ("for" . "∀")
            ("!=" . "≠")
            ("==" . "＝")
            (">=" . "≥")
            ("<=" . "≤")
            ("[]" . "⃞")
            ("=" . "≝"))))
  :hook
  (python-mode . rc/python-mode/setup))

(provide 'init-python)
