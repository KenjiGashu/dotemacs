(use-package undo-tree :ensure t
  :after evil
  :config
  (global-undo-tree-mode 1)
  (evil-set-undo-system 'undo-tree)
	:custom
	(undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
	(undo-tree-visualizer-diff t)
	(undo-tree-visualizer-timestamps t))

(add-hook 'after-save-hook (lambda () (undo-tree-save-history nil t)))
(add-hook 'after-save-visited-mode-hook (lambda () (undo-tree-save-history nil t)))
(add-hook 'after-save-hook (lambda () (undo-tree-save-history nil t)))

;; (use-package vundo
;;   :config
;;   (setq vundo-glyph-alist vundo-unicode-symbols))
