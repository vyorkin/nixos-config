;; see: https://github.com/ethereum/emacs-solidity#interface-with-linters

(use-package solidity-mode
  :disabled
  :init
  (setq
   solidity-solc-path (executable-find "solc")
   solidity-solium-path (executable-find "solium")
   solidity-flycheck-solc-checker-active t
   solidity-flycheck-solium-checker-active t)
  :custom
  (solidity-comment-style 'slash))

(provide 'init-ethereum)
