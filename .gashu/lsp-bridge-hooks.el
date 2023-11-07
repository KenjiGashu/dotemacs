;; ===================================================
;;
;; html config
;;
;; =================================================
(add-hook 'html-mode-hook (lambda () (lsp-bridge-mode)))

;; ===================================================
;;
;; css config
;;
;; =================================================
(add-hook 'css-mode-hook (lambda () (lsp-bridge-mode)))


;; Javascript
(add-hook 'js-mode-hook (lambda () (lsp-bridge-mode)))
