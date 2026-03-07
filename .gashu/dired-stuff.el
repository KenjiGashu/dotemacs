;; ================================
;; 
;; Dired stuff
;;
;; ================================
(elpaca dired-hacks-utils )
(elpaca dired-filter )
(elpaca dired-subtree )
(elpaca dired-ranger )
(elpaca dired-collapse
	(add-hook 'dired-mode-hook 'dired-collapse-mode)
	)
(elpaca dired-sidebar 
	(setq dired-sidebar-width 65)

  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "o=" 'dired-sidebar-toggle-sidebar))




(elpaca dired-subtree
  (evil-define-key '(normal) dired-mode-map
    (kbd "TAB") 'dired-subtree-insert
    (kbd "<backtab>") 'dired-subtree-remove)
  )

