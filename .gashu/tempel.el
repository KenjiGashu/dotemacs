;;tempel
;; Configure Tempel
(use-package tempel
  ;; Require trigger prefix before template name when completing.
  ;; :custom
  ;; (tempel-trigger-prefix "<")

  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))

  :init

  ;; Setup completion at point
  ;; (defun tempel-setup-capf ()
  ;;   ;; Add the Tempel Capf to `completion-at-point-functions'.
  ;;   ;; `tempel-expand' only triggers on exact matches. Alternatively use
  ;;   ;; `tempel-complete' if you want to see all matches, but then you
  ;;   ;; should also configure `tempel-trigger-prefix', such that Tempel
  ;;   ;; does not trigger too often when you don't expect it. NOTE: We add
  ;;   ;; `tempel-expand' before the main programming mode Capf, such
  ;;   ;; that it will be tried first.
  ;;   (setq-local completion-at-point-functions
  ;;               (cons #'tempel-complete
  ;;                     completion-at-point-functions)))

  ;; (add-hook 'conf-mode-hook 'tempel-setup-capf)
  ;; (add-hook 'prog-mode-hook 'tempel-setup-capf)
  ;; (add-hook 'text-mode-hook 'tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  ;; (add-hook 'prog-mode-hook #'tempel-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
)

;; Optional: Add tempel-collection.
;; The package is young and doesn't have comprehensive coverage.
(use-package tempel-collection)


;; (defun tempel-include (elt)
;;   (when (eq (car-safe elt) 'i)
;;     (if-let (template (alist-get (cadr elt) (tempel--templates)))
;;         (cons 'l template)
;;       (message "Template %s not found" (cadr elt))
;;       nil)))
;; (add-to-list 'tempel-user-elements #'tempel-include)


;; (defun my-tempel (elt)
;; 	(message "ueeee %s" elt)
;; 	(when (eq (car-safe elt) 'g)
;; 		(cadr elt)))
;; (add-to-list 'tempel-user-elements #'my-tempel)




;; (defvar my-global-templates
;;   '((example "Global example template")
;; 		(header ";;; " (or (buffer-file-name) (buffer-name)) " -- " p
;;         " -*- lexical-binding: t -*-" n n)
;; 		(provide "(provide '" (file-name-base (or (buffer-file-name) (buffer-name))) ")" n
;;          ";;; " (file-name-nondirectory (or (buffer-file-name) (buffer-name))) " ends here" n)
;; 		(package (i header) r n n (i provide))
;; 		(src "#+begin_src " q n r n "#+end_src")
;; 		(incc "#include \"" (p (concat (file-name-base (or (buffer-file-name) (buffer-name))) ".h")) "\"")
;; 		(gashu "template<class " (s temp1)  (if (> (length (s temp2)) 0)
;; 																										 (concat ", class " temp2)
;; 																									 nil) ))
;;   "My global templates.")
;; (defvar-local my-local-templates nil
;;   "Buffer-local templates.")
;; (add-to-list 'tempel-template-sources 'my-global-templates)
;; (add-to-list 'tempel-template-sources 'my-local-templates)
