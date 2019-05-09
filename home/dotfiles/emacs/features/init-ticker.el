(use-package coin-ticker
  :init
  ;; set the update interval, in seconds (default 300)
  (setq coin-ticker-api-poll-interval 120)
  ;; set the currency list (default is BTC and ETH)
  (setq coin-ticker-syms '("BTC"))
  ;; just show prices (and no symbols)
  (setq coin-ticker-show-syms nil)

  ;; set the price unit to use
  ;; default is "USD"
  ;; (setq coin-ticker-price-convert "RUB")

  ;; set the symbol used to display prices (₽, €)
  ;; default is "$"
  ;; (setq coin-ticker-price-symbol "₽")

  :config
  ;; enable coin-ticker-mode
  (coin-ticker-mode 1))

(provide 'init-ticker)
