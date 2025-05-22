
;;change c style indentation
(setq c-default-style "ellemtel"
      c-basic-offset 2)


;;fix indentation on c++ templates
;;https://stackoverflow.com/questions/7830428/c-templates-and-emacs-customizing-indentation
(defun c++-template-args-cont (langelem)
"Control indentation of template parameters handling the special case of '>'.
Possible Values:
0   : The first non-ws character is '>'. Line it up under 'template'.
nil : Otherwise, return nil and run next lineup function."
  (save-excursion
    (beginning-of-line)
    (if (re-search-forward "^[\t ]*>" (line-end-position) t)
        0)))

(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-offset 'template-args-cont
                          '(c++-template-args-cont c-lineup-template-args +))))




;; ================================================================
;;
;; c/c++ mode config
;;
;; ================================================================

(use-package modern-cpp-font-lock
  :ensure t
  :hook ((c-mode c++-mode) . modern-c++-font-lock-mode))

;;fix header not found when flycheck is enabled
(use-package flycheck-clang-tidy
  :after flycheck
  :hook
  (flycheck-mode . flycheck-clang-tidy-setup)
  )

;;(add-hook 'c-mode-hook (lambda () (lsp-bridge-mode)))
;;(add-hook 'c-mode-hook 'lsp-bridge-mode)
;;(add-hook 'c-mode-common-hook 'lsp-bridge-mode)
;;(add-hook 'c-mode-common-hook 'eglot-ensure)

;;(add-hook 'c-mode-hook 'lspce-mode)
;; (add-hook 'c-mode-hook 'lsp)
;; (add-hook 'c-mode-hook 'corfu-mode)
(add-hook 'c-mode-hook 'lsp-bridge-mode)

;; (add-hook 'c++-mode-hook 'lsp)
;; (add-hook 'c++-mode-hook 'corfu-mode)
;;(add-hook 'c++-mode-hook 'lspce-mode)
(add-hook 'c++-mode-hook 'lsp-bridge-mode)

;; ==================================================================

