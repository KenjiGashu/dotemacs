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

(general-define-key
   :states '(insert emacs)
   :keymaps '(override pdf-view-mode)
   "C-x c 0" 'winum-select-window-0
   "C-x c 1" 'winum-select-window-1
   "C-x c 2" 'winum-select-window-2
   "C-x c 3" 'winum-select-window-3
   "C-x c 4" 'winum-select-window-4
   "C-x c 5" 'winum-select-window-5
   "C-x c 6" 'winum-select-window-6
   "C-x c 7" 'winum-select-window-7)
