(use-package avy :ensure t
  :config
  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "gc" 'avy-goto-char-2
   "gw" 'avy-goto-word-1))
