(use-package benchmark-init
  :hook
  ;; to disable collection of benchmark data after init is done.
  (after-init . benchmark-init/deactivate))

;; usage:
;; benchmark-init/show-durations-tabulated
;; benchmark-init/show-durations-tree

(provide 'init-benchmarking)
