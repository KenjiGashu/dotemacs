;; ===================================================
;;
;; omnisharp config
;;
;; =================================================
;; (use-package csharp-mode
;;   :mode "\\.cs"
;;   )
;; (use-package omnisharp
;;   :init
;;   (add-hook 'csharp-mode-hook 'omnisharp-mode)
;;   (add-hook 'csharp-mode-hook #'company-mode)
;;   :hook ((csharp-mode . (lambda ()
;; 			  (add-to-list (make-local-variable 'company-backends) 'company-omnisharp )))
;; 	 (csharp-mode . omnisharp-mode)
;; 	 (csharp-mode . company-mode)
;; 	 (csharp-mode . (lambda () (omnisharp-start-omnisharp-server))))
;;   )

;;(add-hook 'csharp-mode-hook (lambda () (lsp-bridge-mode)))

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
