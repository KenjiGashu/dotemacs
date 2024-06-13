(use-package clojure-mode
  :mode "\\.clj\\'")
(use-package cider
  :mode "\\.clj\\$")
(use-package cider-decompile
  :after (clojure-mode))
;; (use-package cider-eval-sexp-fu)
(use-package cider-hydra
  :after (clojure-mode))

;;
;;
;; clojure mode hook
;;
(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (rainbow-delimiters-mode)
	
	     ;;(highlight-blocks-mode)
	     ))
