(general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(override smerge-mode-map)
   :non-normal-prefix "C-SPC"
   "mn" 'smerge-keep-lower
   "mp" 'smerge-keep-upper
   "mj" 'smerge-next
   "mk" 'smerge-prev)
