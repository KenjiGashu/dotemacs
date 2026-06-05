(use-package anzu
	:ensure t
  :config (global-anzu-mode +1))
(use-package evil-anzu
	:ensure t
  :after evil)

(use-package evil-search-highlight-persist
	:ensure t
	:config (global-evil-search-highlight-persist t))
