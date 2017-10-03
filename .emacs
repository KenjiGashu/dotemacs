;; inicializacao package manage
(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4cbec5d41c8ca9742e7c31cc13d8d4d5a18bd3a0961c18eb56d69972bbcf3071" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "1747d30c98ba414fc837d042d2557f65d0697fcc9236c5c3d2ccd57a93b92a9e" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "4aafea32abe07a9658d20aadcae066e9c7a53f8e3dfbd18d8fa0b26c24f9082c" "1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" "715fdcd387af7e963abca6765bd7c2b37e76154e65401cd8d86104f22dd88404" default)))
 '(org-lowest-priority 70)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("marmalade-repo" . "https://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (adjust-parens slime auto-complete typescript-mode tss web-mode ac-html ac-html-bootstrap ng2-mode ac-html-angular multiple-cursors powerline sr-speedbar smartparens moe-theme noctilux-theme nzenburn-theme ukrainian-holidays paganini-theme hamburg-theme ac-etags)))
 '(speedbar-show-unknown-files t))
(package-initialize)


;;
;; adjust-parens
;;
(require 'adjust-parens)
;;
;;
;;



;;
;;typescript usage
;;

(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)

;;key bindings
(add-hook 'typescript-mode
	  '(lambda ()
	     (local-set-key (kbd "C-t C-:") 'tss-popup-help)
	     (local-set-key (kbd "C-t C->") 'tss-jump-to-definition)
	     (local-set-key (kbd "C-t C-c i") 'tss-implement-definition)
	     )
	  )


(tss-config-default)

;;
;; typescript end
;;


;;
;;slime initialization
;;

(setq inferior-lisp-program "/usr/bin/sbcl")

;;
;; end slime
;;


;; (add-to-list 'load-path "~/.emacs.d/theme/") 
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/")
;;(require 'tomorrow-night-paradise-theme) 
;;(load-theme 'tomorrow-night-paradise)
;; (add-to-list 'load-path "~/.emacs.d/sr-speedbar-master/")
;; (add-to-list 'load-path "~/.emacs.d/emacs-rails-reloaded-master/")


;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; Replace "sbcl" with the path to your implementation



(require 'sr-speedbar)
(sr-speedbar-refresh-turn-off)



;; (require 'rails-autoload)




(electric-pair-mode 1)
(setq vc-make-backup-files t)


(if (not (file-exists-p ".emacs-backups"))
    (make-directory ".emacs-backups" t))
(setq backup-directory-alist `(("." . , ".emacs-backups")))
;; (defun make-backup-file-name (FILE)                                             
;;   (let ((dirname (concat "~/.backups/emacs/"                                    
;;                           (file-name-directory FILE))))                    
;;     (if (not (file-exists-p dirname))                                           
;;         (make-directory dirname t))                                             
;;     (concat dirname (file-name-nondirectory (concat FILE "~")))))

(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 1               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 100               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

(require 'auto-complete-config)

(ac-config-default)

(require 'auto-complete)

(require 'powerline)
(require 'moe-theme)
(moe-dark)
(powerline-moe-theme)


;;multiple cursors keybindings
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; commands binding
(global-set-key [24 10] (quote sr-speedbar-toggle))
(global-set-key [24 8] (quote sr-speedbar-refresh-toggle))


;; smart parens key bindings
(add-hook 'smartparens-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-c C-S-f") 'sp-forward-sexp)
	     (local-set-key (kbd "C-c C-S-b") 'sp-backward-sexp)
	     (local-set-key (kbd "C-c C-S-n") 'sp-next-sexp)
	     (local-set-key (kbd "C-c C-S-p") 'sp-previous-sexp)
	     (local-set-key (kbd "C-c C-S-d") 'sp-down-sexp)
	     (local-set-key (kbd "C-c C-S-- C-S-d") 'sp-backward-down-sexp)
	     (local-set-key (kbd "C-c C-S-a") 'sp-beginning-of-sexp)
	     (local-set-key (kbd "C-c C-S-e") 'sp-end-of-sexp)
	     (local-set-key (kbd "C-c C-S-u") 'sp-up-sexp)
	     (local-set-key (kbd "C-c C-S-k") 'sp-kill-sexp)
	     )
	  )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

