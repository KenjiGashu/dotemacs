;;
;; lisp mode hook
;;
(add-hook 'lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
	     (rainbow-delimiters-mode)))

;;
;; geiser
;;
(use-package geiser
  :ensure t
  :init (setq geiser-active-implementations '(racket)))

;;
;;scheme mode
;;
(add-hook 'scheme-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
	     (rainbow-delimiters-mode)
	     (geiser-mode)))

;;
;;   emacs lisp mode hook
;;
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
	     (corfu-mode)
	     (eldoc-mode)
	     (rainbow-delimiters-mode)))

