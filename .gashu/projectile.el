(elpaca projectile
	(general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "f SPC" 'projectile-find-file)
  (projectile-global-mode)
  )
