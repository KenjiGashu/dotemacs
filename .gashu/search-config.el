(use-package anzu
  :config (global-anzu-mode +1))
(use-package evil-anzu
  :after evil)

(use-package evil-search-highlight-persist
	:ensure t
	:config (global-evil-search-highlight-persist t))
