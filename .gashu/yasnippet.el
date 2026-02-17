(use-package yasnippet
  :demand t
  :config
  (yas-global-mode 1)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "si" 'yas-insert-snippet)
  (general-define-key
   :states '(insert)
   :non-normal-prefix "C-SPC"
   "C-M-u" 'yas-expand))

(use-package yasnippet-snippets
    :after (yas-global-mode)
    :config (yas-reload-all)
    :ensure t)


;;workaround for tree sitter
;; (advice-add 'yas--modes-to-activate :around
;;  (defun yas--get-snippet-tables@tree-sitter (orig-fn &optional mode)
;;    (funcall orig-fn
;;             (or (car (rassq (or mode major-mode) major-mode-remap-alist))
;;                 mode))))

;;fix hpp files
;; (add-hook 'c++-ts-mode-hook
;; 					(lambda ()
;; 						(yas-activate-extra-mode 'c++-mode))

;; (add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
;; (add-hook 'c-ts-mode-hook
;; 					(lambda ()
;; 						(yas-minor-mode)
;; 						(yas-activate-extra-mode 'c++-mode)))

;; (add-hook 'c++-ts-mode-hook
;; 					(lambda ()
;; 						(yas-minor-mode)
;; 						(yas-activate-extra-mode 'c++-mode)))
;; (add-hook 'c++-mode-hook
;; 					(lambda ()
;; 						(yas-minor-mode)
;; 						(yas-activate-extra-mode 'c++-mode)))

					
(use-package auto-yasnippet :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "sc" 'aya-create
   "st" 'aya-persist-snippet
   "sae" 'aya-expand
   "sah" 'aya-expand-from-history)
  )

