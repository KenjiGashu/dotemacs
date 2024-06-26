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

	:hook
  ('prog-mode . #'hs-minor-mode)
  :config (evil-mode 1))

(setq evil-fold-list
  `(((hs-minor-mode)
     :open-all   hs-show-all
     :close-all  hs-hide-all
     :toggle     hs-toggle-hiding
     :open       hs-show-block
     :open-rec   nil
     :close      hs-hide-block)
   )
)

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

;; (add-hook 'prog-mode-hook #'hs-minor-mode)


;; (evil-define-key '(normal) dired-mode-map
;;   (kbd "RET") 'dired-find-file)

;; multiple cursors evil mode
(use-package evil-mc :demand t
  :ensure t
  :after evil
  :config (global-evil-mc-mode 1))

(use-package evil-snipe :demand t
	:ensure t
	:after evil
	:config
	(evil-snipe-mode +1)
	(evil-snipe-override-mode +1)
	(setq evil-snipe-scope 'visible)
	(setq evil-snipe-repeat-scope 'whole-visible))
