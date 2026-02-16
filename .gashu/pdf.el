(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode))

(use-package reader
  :straight '(reader :type git :host codeberg :repo "MonadicSheep/emacs-reader"
  									 :files ("*.el" "render-core.so")
  									 :pre-build ("make" "all")))
