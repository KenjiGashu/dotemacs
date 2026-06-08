;;
;; lisp mode hook
;;
(use-package emacs
:after rainbow-delimiters
:init
(add-hook 'lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
			 (setq-local acm-enable-capf t)
	     (rainbow-delimiters-mode)))
	     
	 ;; corfu
;; (add-hook 'emacs-lisp-mode-hook 'corfu-mode)

;; (add-hook 'lisp-mode-hook 'corfu-mode)

;;
;;scheme mode
;;
(add-hook 'scheme-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
			 (setq-local acm-enable-capf t)
	     (rainbow-delimiters-mode)
	     (geiser-mode)))

;;
;;   emacs lisp mode hook
;;
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
	     ;;(corfu-mode)
			 (setq-local acm-enable-capf t)
	     (eldoc-mode)
	     (rainbow-delimiters-mode)))    
)


;;
;; geiser
;;
(use-package geiser
  :ensure t
  :init (setq geiser-active-implementations '(racket)))




