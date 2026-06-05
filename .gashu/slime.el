;; ===================
;; slime configuration
;; ===================
;; Setup load-path and autoloads
;; (add-to-list 'load-path "~/dir/to/cloned/slime")
;;(use-package slime-autoloads :ensure t)

;; Set your lisp system and some contribs
(use-package slime-company
  :ensure t
  :after (company)
  :config (setq slime-company-completion 'fuzzy
                slime-company-after-completion 'slime-company-just-one-space))

(use-package slime
  ;;:demand t
  :commands slime
  :init
    ;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (when (string= system-type "windows-nt")
    ;;(load (expand-file-name "C:/Users/lkenji/.roswell/helper.el"))
    ;;(add-to-list 'exec-path "C:/Program Files/Steel Bank Common Lisp/1.4.14/")
    ;;(add-to-list 'exec-path "C:/Users/lkenji/Downloads/roswell/")
    ;;(setq inferior-lisp-program "C:/Users/lkenji/Downloads/roswell/ros.exe -Q run"))
    (add-to-list 'exec-path "C:/Program Files/Steel Bank Common Lisp/2.0.0/")
    (setq inferior-lisp-program "sbcl")
    ;;(add-to-list 'exec-path "C:/Users/lkenji/Downloads/ccl/")
    ;;(setq inferior-lisp-program "C:/Users/lkenji/Downloads/ccl/wx86cl64")
    )
  (when (string= system-type "gnu/linux")
    (setq inferior-lisp-program "sbcl --dynamic-space-size 8192")
    ;; (setq inferior-lisp-program "C:/Users/lkenji/Downloads/ccl/wx86cl64.exe")
    ;; (setq inferior-lisp-program "wx86cl64")
    )
  (setq slime-contribs
        '(slime-fancy slime-company slime-asdf slime-quicklisp slime-cl-indent))
  :config (slime-setup '(slime-fancy slime-company slime-asdf slime-quicklisp slime-cl-indent))
 )

 
 (use-package slime-repl-ansi-color
   :after (slime))


;; ===================
;; slime end 
;; ===================

