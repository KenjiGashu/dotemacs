;; (use-package undo-tree :ensure t
;;   :after evil
;;   :config
;;   (global-undo-tree-mode 1)
;;   (evil-set-undo-system 'undo-tree)
;; 	:custom
;; 	(undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
;; 	(undo-tree-visualizer-diff t))

;;(add-hook 'after-save-hook (lambda () (undo-tree-save-history nil t)))
;;(add-hook 'after-save-visited-mode-hook (lambda () (undo-tree-save-history nil t)))
;;(add-hook 'after-revert-hook (lambda () (undo-tree-save-history nil t)))

(use-package vundo
  :config
  (setq vundo-glyph-alist vundo-unicode-symbols))

(use-package undo-fu
	:after evil
	:config
	(setq evil-undo-system 'undo-fu)
  (evil-set-undo-system 'undo-fu))

(use-package undo-fu-session
	:after undo-fu
	:config (undo-fu-session-global-mode))
