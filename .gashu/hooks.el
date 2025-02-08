;;
;; lisp mode hook
;;

(add-hook 'lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
	     (rainbow-delimiters-mode)))

;;
;;
;; clojure mode hook
;;
(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (rainbow-delimiters-mode)
	
	     ;;(highlight-blocks-mode)
	     ))


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
	     ;;(lsp-bridge-mode)
	     (eldoc-mode)
	     (rainbow-delimiters-mode)))

