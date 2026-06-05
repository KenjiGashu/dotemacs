(use-package projectile
	:after general
  :init 
	(general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "f SPC" 'projectile-find-file)
  :commands (projectile-find-file) 
  :ensure t
  :config
  (projectile-global-mode)
  )
