;; ================================
;; 
;; Dired stuff
;;
;; ================================
(elpaca dired-hacks-utils :ensure t )
(elpaca dired-filter :ensure t )
(elpaca dired-subtree :ensure t )
(elpaca dired-ranger :ensure t )
(elpaca dired-collapse :ensure t )
(elpaca dired-sidebar :ensure t
	(setq dired-sidebar-width 65)

  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "o=" 'dired-sidebar-toggle-sidebar))


(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;;(add-hook 'dired-mode-hook 'dired-collapse-mode)


(elpaca dired-subtree
  (evil-define-key '(normal) dired-mode-map
    (kbd "TAB") 'dired-subtree-insert
    (kbd "<backtab>") 'dired-subtree-remove)
  )

