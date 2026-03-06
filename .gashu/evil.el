;; ===================================================
;;
;; evil config
;;
;; =================================================

(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(elpaca (evil :wait t)
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)

  (add-hook 'prog-mode-hook #'hs-minor-mode)
  (evil-mode 1))

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

(elpaca evil-collection
  (evil-collection-init))

(elpaca evil-org)

(elpaca vimish-fold)

(elpaca (evil-vimish-fold)
  (add-hook 'prog-mode-hook 'evil-vimish-fold-mode)
  (add-hook 'conf-mode-hook 'evil-vimish-fold-mode)
  (add-hook 'text-mode-hook 'evil-vimish-fold-mode))

;; (add-hook 'prog-mode-hook #'hs-minor-mode)


;; (evil-define-key '(normal) dired-mode-map
;;   (kbd "RET") 'dired-find-file)

;; multiple cursors evil mode
(elpaca evil-mc
  (global-evil-mc-mode 1))

(elpaca evil-snipe
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1)
  (setq evil-snipe-scope 'visible)
  (setq evil-snipe-repeat-scope 'whole-visible))
