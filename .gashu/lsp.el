;; important variables for lsp
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package lsp-mode
	:ensure t)

(use-package lsp-treemacs
	:ensure t)

