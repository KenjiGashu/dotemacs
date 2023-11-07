(use-package undo-tree :ensure t
  :after evil
  :config
  (global-undo-tree-mode 1)
  (evil-set-undo-system 'undo-tree))

(use-package vundo
  :config
  (setq vundo-glyph-alist vundo-unicode-symbols))
