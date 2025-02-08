;; ===================================================
;;
;; auto completion
;;
;; =================================================
(use-package company
  :demand t

  :config 
  (setq company-backends '(company-files company-keywords company-capf))
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0)
  (evil-define-key nil evil-insert-state-map
    (kbd "C-M-y") 'company-capf)

  ;;setup backends
  ;; :hook ((emacs-lisp-mode . (lambda ()
	;; 		      (set (make-local-variable 'company-backends) (push 'company-elisp company-backends)))))
)

(use-package company-quickhelp :ensure t
  :after company
  :config (company-quickhelp-mode))


