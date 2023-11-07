;; ===================================================
;;
;; evil config
;;
;; =================================================

(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(use-package evil :ensure t :demand t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config (evil-mode 1))

(use-package evil-collection
  :after evil
  :defer nil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-org
  :after (evil org-mode))

(use-package vimish-fold
  :ensure t
  :after evil)

(use-package evil-vimish-fold
  :ensure t
  :after vimish-fold
  :hook ((prog-mode conf-mode text-mode) . evil-vimish-fold-mode))

;; (use-package vimish-fold
;;   :ensure t
;;   :after (evil))

;; (use-package evil-vimish-fold
;;   :ensure t
;;   :after (evil vimish-fold))

;; (add-hook 'prog-mode-hook #'hs-minor-mode)


;; (evil-define-key '(normal) dired-mode-map
;;   (kbd "RET") 'dired-find-file)

;; multiple cursors evil mode
(use-package evil-mc :demand t
  :ensure t
  :after evil
  :config (global-evil-mc-mode 1))

