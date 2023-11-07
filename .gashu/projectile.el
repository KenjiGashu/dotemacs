(use-package projectile
  :init (setq projectile-project-search-path '("~/prog" "/media/prog/"))
  :commands (projectile-find-file) 
  :ensure t
  :config
  (projectile-global-mode)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "f SPC" 'projectile-find-file))


