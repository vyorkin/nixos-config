(require 'init-general)

(use-package hydra
  :requires init-general
  :after general)

(defhydra hydra-zoom ()
  "zoom"
  ("k" text-scale-increase "in")
  ("j" text-scale-decrease "out"))

(defhydra hydra-window ()
  "
Movement^^      ^Split^            ^Resize^
------------------------------------------------
_h_ ←          _v_ertical          _H_ X←
_j_ ↓          _s_ horizontal      _J_ X↓
_k_ ↑          _U_ undo            _K_ X↑
_l_ →          _R_ reset           _L_ X→
_f_ollow       _d_lt Other
_SPC_ cancel   _o_nly this
"
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)

  ("H" evil-window-increase-width)
  ("J" evil-window-increase-height)
  ("K" evil-window-decrease-height)
  ("L" evil-window-decrease-width)

  ("f" follow-mode)
  ("v"
   (lambda ()
     (interactive)
     (split-window-right)
     (windmove-right))
   )
  ("s"
   (lambda ()
     (interactive)
     (split-window-below)
     (windmove-down))
   )
  ("d" delete-window)
  ("o" delete-other-windows)
  ("i" ace-maximize-window)
  ("U"
   (progn
     (winner-undo)
     (setq this-command 'winner-undo))
   )
  ("R" winner-redo)
  ("SPC" nil))

(nmap
  "M-t" 'hydra-zoom/body
  "M-w" 'hydra-window/body)

(provide 'init-hydra)
