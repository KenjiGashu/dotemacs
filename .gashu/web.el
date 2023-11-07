;; ===================================================
;;
;; web config
;;
;; =================================================
;; (use-package company-web
;;   :after (web-mode)
;;   :ensure t)

;; (use-package web-mode
;;   :mode ("\\.blade.php\\'" "\\.html\\'" "\\.css\\'" "\\.tsx\\'" "\\.jsx\\'")
;;   :hook (web-mode . (lambda ()
;; 		      (require 'company-web-html)
;; 		      (require 'company-web-jade)
;; 		      (require 'company-web-slim)
;; 			(when (string-equal "tsx" (file-name-extension buffer-file-name))
;; 			  (setup-tide-mode))
;; 			(when (string-equal "jsx" (file-name-extension buffer-file-name))
;; 			  (setup-tide-mode))
;; 			(add-to-list (make-local-variable 'company-backends) 'company-web-html t)
;; 			(add-to-list 'company-backends 'company-web-jade t)
;; 			(add-to-list 'company-backends 'company-web-slim t)
;; 			(lsp-deferred))))
;; (use-package vue-mode
;;   :mode "\\.vue")
