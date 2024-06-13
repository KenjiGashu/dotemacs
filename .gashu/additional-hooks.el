(use-package ah
	:ensure t
	:after evil-search-highlight-persist
	:config
	(ah-mode 1)
	(add-hook 'ah-after-c-g-hook (lambda () (evil-search-highlight-persist-remove-all)))
	)
