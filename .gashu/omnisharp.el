(use-package projectile
  :init (setq projectile-project-search-path '("~/prog" "/media/prog/"))
  :commands (projectile-find-file) 
  :ensure t
  :config
  (general-define-key
   :states '(insert emacs)
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "n" 'next-line
	 "l" 'forward-char))
