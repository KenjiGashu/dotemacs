(use-package sly
  ;;:demand t
  :commands sly
  :init
    ;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (when (string= system-type "windows-nt")
    (add-to-list 'exec-path "C:/Program Files/Steel Bank Common Lisp/2.0.0/")
    (setq inferior-lisp-program "sbcl")
    )

  (when (string= system-type "gnu/linux")
    (setq inferior-lisp-program "sbcl --dynamic-space-size 8192")
    ;; (setq inferior-lisp-program "C:/Users/lkenji/Downloads/ccl/wx86cl64.exe")
    ;; (setq inferior-lisp-program "wx86cl64")
    )

	(add-to-list 'sly-contribs 'sly-asdf 'append)
 )

;;(add-hook 'lisp-mode-hook #'company-mode)


(use-package sly-asdf
  ;;:demand t
  :after sly
 )

(add-hook 'sly-mrepl-mode-hook 'corfu-mode)
