;; ===================================================
;;
;; javascript config
;;
;; =================================================

;; (use-package js2-mode
;;   :ensure t
;;   :mode "\\.js"
;;   :hook ((js2-mode . (lambda()
;; 		       (add-to-list
;; 			(make-local-variable 'company-backends)
;; 			'company-tern
;; 			)))))

;; (use-package tern
;;   :ensure t
;;   :hook (js2-mode . tern-mode))

;; (use-package import-js
;;   :after js2-mode)

;; ;; (use-package tide)
;; (use-package typescript-mode
;;   :ensure t)
;; ;; (use-package tide
;; ;;   :ensure t
;; ;;   :after (typescript-mode company flycheck)
;; ;;   :hook ((typescript-mode . tide-setup)
;; ;;          (typescript-mode . tide-hl-identifier-mode)
;; ;;          (before-save . tide-format-before-save)))
;; (use-package js2-refactor
;;   :hook (js2-mode . js2-refactor-mode))
;; (use-package skewer-mode
;;   :ensure t
;;   :hook ((js2-mode . skewer-mode)
;; 	 (css-mode . skewer-css-mode)
;; 	 (web-mode . skewer-html-mode)))
;; (use-package livid-mode
;;   :ensure t
;;   :after (js2-mode))
;; (use-package web-beautify)

;; (use-package nodejs-repl
;;   :ensure t)
;; (use-package js2-highlight-vars)
;; (use-package eslint-fix
;;   :init (add-hook 'rjsx-mode-hook 
;;           (lambda () 
;;              (add-hook 'after-save-hook 'eslint-fix nil 'make-it-local))))
;; (use-package xref-js2
;;   :hook (js2-mode . (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))
;; (use-package indium)
;; (use-package company-tern
;;   :hook (rjsx-mode tern-mode))

(use-package rjsx-mode
	:ensure t)

(use-package web-mode
	:ensure t)

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(use-package emmet-mode
	:ensure t)

(add-hook 'web-mode-hook 'emmet-mode)

;; (use-package lsp-tailwindcss
;; 	:ensure t
;; 	:init
;; 	(setq lsp-tailwindcss-add-on-mode t)
;; 	:config
;; 	(setq lsp-tailwindcss-major-modes '(web-mode html-mode sgml-mode css-mode rjsx-mode))) 

(use-package lsp-tailwindcss
      :straight '(lsp-tailwindcss :type git :host github :repo "merrickluo/lsp-tailwindcss")
      :init (setq lsp-tailwindcss-add-on-mode t)
      :config
      (dolist (tw-major-mode
               '(css-mode
                 css-ts-mode
                 typescript-mode
                 typescript-ts-mode
                 tsx-ts-mode
								 rjsx-mode
                 js2-mode
                 js-ts-mode
                 clojure-mode))
        (add-to-list 'lsp-tailwindcss-major-modes tw-major-mode)))

(use-package typescript-mode
	:ensure t)

;;(add-hook 'js-mode-hook 'eglot-ensure)
;;(add-hook 'js-mode-hook 'lspce-mode)
;;(add-hook 'js-mode-hook 'corfu-mode)
;;(add-hook 'js-mode-hook 'lsp)
(add-hook 'js-mode-hook 'lsp-bridge-mode)
