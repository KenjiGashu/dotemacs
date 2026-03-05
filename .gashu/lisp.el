;;
;; lisp mode hook
;;
(add-hook 'lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
			 (setq-local acm-enable-capf t)))

;;
;; geiser
;;
(elpaca geiser
  (setq geiser-active-implementations '(racket)))


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
	     (geiser-mode)))

;;
;;   emacs lisp mode hook
;;
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
			 (setq-local acm-enable-capf t)
	     (eldoc-mode)))

