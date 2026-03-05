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

(elpaca vundo
  (setq vundo-glyph-alist vundo-unicode-symbols))

(elpaca undo-fu
	(setq evil-undo-system 'undo-fu)
  (setq evil-set-undo-system 'undo-fu))

(elpaca undo-fu-session
	(undo-fu-session-global-mode))
