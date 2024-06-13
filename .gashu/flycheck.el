(use-package flycheck
  :ensure t
  :init
  ;;(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  (global-flycheck-mode)
  :demand t)
