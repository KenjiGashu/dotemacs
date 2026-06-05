(use-package which-key :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
	:custom
	(which-key-sort-order 'which-key-key-order-alpha)
	(which-key-side-window-max-width 1.00)
  (which-key-idle-delay 0.05)
	)
;; make which key show up faster
;;(setq which-key-idle-delay 0.1) ;; I need the help, I really do
