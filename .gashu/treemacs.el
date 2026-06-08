(use-package treemacs
	:ensure t)

(use-package treemacs-evil
	:ensure t
	:after treemacs)

(use-package treemacs-projectile
	:ensure t
	:after (treemacs projectile))
