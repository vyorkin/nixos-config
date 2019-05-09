(require 'init-general)

(use-package smartparens
  :requires init-general
  :commands (smartparens-mode sp-with-modes sp-local-pairs)
  :hook
  ((conf-mode text-mode prog-mode) . smartparens-mode)
  :init
  (setq
   sp-autoinsert-if-followed-by-word t
   sp-autoskip-closing-pair 'always-end
   sp-hybrid-kill-entire-symbol nil)
  :config
  (use-package smartparens-config
    :ensure nil
    :demand t)
  (general-define-key
   :keymaps 'sp-keymap
   "M-F"   'sp-forward-symbol
   "M-B"   'sp-backward-symbol
   "C-M-k" 'sp-kill-sexp
   "C-M-w" 'sp-copy-sexp
   "C-M-t" 'sp-transpose-sexp

   "M-<left>"    'sp-forward-slurp-sexp
   "C-M-<left>"  'sp-forward-barf-sexp
   "M-<right>"   'sp-backward-slurp-sexp
   "C-M-<right>" 'sp-backward-barf-sexp

   "M-D" 'sp-splice-sexp

   "C-M-[" 'sp-select-previous-thing
   "C-M-]" 'sp-select-next-thing

   "C-c s u" 'sp-up-sexp
   "C-c s d" 'sp-down-sexp
   "C-c s t" 'sp-prefix-tag-object
   "C-c s p" 'sp-prefix-pair-object
   "C-c s c" 'sp-convolute-sexp
   "C-c s a" 'sp-absorb-sexp
   "C-c s e" 'sp-emit-sexp
   "C-c s p" 'sp-add-to-previous-sexp
   "C-c s n" 'sp-add-to-next-sexp
   "C-c s j" 'sp-join-sexp
   "C-c s s" 'sp-split-sexp)
  (sp-pair "(" ")" :wrap "C-(")
  (sp-pair "[" "]" :wrap "s-[")
  (sp-pair "\"" "\"" :wrap "C-\"")
  (sp-pair "{" "}" :wrap "C-{")
  :diminish smartparens-mode)

(provide 'init-smartparens)
