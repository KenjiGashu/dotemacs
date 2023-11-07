(use-package winum
  :ensure t
  :demand t
  :config (winum-mode 1)
  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "w0" 'winum-select-window-0
   "w1" 'winum-select-window-1
   "w2" 'winum-select-window-2
   "w3" 'winum-select-window-3
   "w4" 'winum-select-window-4
   "w5" 'winum-select-window-5
   "w6" 'winum-select-window-6
   "w7" 'winum-select-window-7))

