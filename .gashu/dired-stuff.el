;; ================================
;; 
;; Dired stuff
;;
;; ================================
(use-package dired-hacks-utils :ensure t )
(use-package dired-filter :ensure t )
(use-package dired-subtree :ensure t )
(use-package dired-ranger :ensure t )
(use-package dired-collapse :ensure t )
(use-package dired-sidebar :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "o=" 'dired-sidebar-toggle-sidebar))

(use-package all-the-icons-dired :ensure t )

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


(use-package dired-subtree
  :config
  (evil-define-key '(normal) dired-mode-map
    (kbd "TAB") 'dired-subtree-insert
    (kbd "<backtab>") 'dired-subtree-remove)
  )

