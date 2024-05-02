(use-package undo-tree :ensure t
  :after evil
  :config
  (global-undo-tree-mode 1)
  (evil-set-undo-system 'undo-tree)
	(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

;; (use-package vundo
;;   :config
;;   (setq vundo-glyph-alist vundo-unicode-symbols))
