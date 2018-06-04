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
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (auto-complete magit company general ranger counsel ivy use-package which-key evil highlight-blocks flycheck flycheck-lilypond editorconfig geiser rainbow-blocks rainbow-delimiters rainbow-mode slime multiple-cursors powerline sr-speedbar smartparens moe-theme)))
 '(speedbar-show-unknown-files t))
(package-initialize)


;;
;; load paths
;;
(let ((default-directory  "~/.emacs.d/git/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq load-path (append (list (expand-file-name "~/.emacs.d/lilypond-mode")) load-path))
(setq load-path (append (list (expand-file-name "~/.emacs.d/lilypond-mode/lilypond-init.el")) load-path))
(setq load-path (append (list (expand-file-name "/usr/share/emacs/site-lisp/uim-el")) load-path))
(setq load-path (append (list (expand-file-name "/usr/share/emacs/site-lisp")) load-path))

;;
;;   ==========       requires      =========
;;
(require 'highlight-sexp)
(require 'powerline)
(require 'moe-theme)

;;
;;moe theme
;;

(moe-dark)
(powerline-moe-theme)


;;
;; lilypond
;;

(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode)) 

;;
(use-package which-key :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05)
  )
(use-package ranger :ensure t
  :commands (ranger)
  :bind (("C-x d" . deer))
  :config
  (setq ranger-cleanup-eagerly t)
  )
(use-package general :ensure t
  :config
  (general-evil-setup t)

  (general-define-key
   :states '(normal insert emacs)
   :prefix "C-SPC"
   :non-normal-prefix "C-SPC"
   "l" '(avy-goto-line)
   "a" 'align-regexp
   )
  (general-def :states '(normal motion emacs) "SPC" nil)
  (general-define-key
   :states '(normal motion emacs)
   :prefix "SPC"
   "ar" '(ranger :which-key "call ranger")
   "g"  '(:ignore t :which-key "Git")
   "gs" '(magit-status :which-key "git status")
   "ff" '(find-file :which-key "find file")
   "w TAB" '(other-window :which-key "other window c-x o")
   "bb" '(switch-to-buffer :which-key "switch buffer")
   "w1" '(delete-other-windows :which-key "delete-other-windows - buffer tela cheia")
   "w0" '(delete-window :which-key "delete-window - fecha tela atual")
   "w2" '(split-window-below :which-key "split-window-below - splita em cima e embaixo")
   "w3" '(split-window-right :which-key "split-window-right - splita lado a lado")
   "fs" '(save-buffer :which-key "save-buffer - salva file")
   )
)
(use-package ivy :ensure t
  :diminish (ivy-mode . "") ; does not display ivy in the modeline
  :init (ivy-mode 1)        ; enable ivy globally at startup
  :bind (:map ivy-mode-map  ; bind in the ivy buffer
         ("C-'" . ivy-avy)) ; C-' to ivy-avy
  :config
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq ivy-height 20)               ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ") ; count format, from the ivy help page
  )

(use-package counsel :ensure t
  :bind*                           ; load counsel when pressed
  (("M-x"     . counsel-M-x)       ; M-x use counsel
   ("C-x C-f" . counsel-find-file) ; C-x C-f use counsel-find-file
   ("C-x C-r" . counsel-recentf)   ; search recently edited files
   ("C-c f"   . counsel-git)       ; search for files in git repo
   ("C-c s"   . counsel-git-grep)  ; search for regexp in git repo
   ("C-c /"   . counsel-ag)        ; search for regexp in git repo using ag
   ("C-c l"   . counsel-locate))   ; search for files or else using locate
  )
;;


;;
;; uim
;;
;;

(require 'uim)


;;
;;typescript usage
;;
;; (require 'typescript)
;; (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; (require 'tss)

;;key bindings
;; (add-hook 'typescript-mode
;; 	  '(lambda ()
;; 	     (local-set-key (kbd "C-t C-:") 'tss-popup-help)
;; 	     (local-set-key (kbd "C-t C->") 'tss-jump-to-definition)
;; 	     (local-set-key (kbd "C-t C-c i") 'tss-implement-definition)
;; 	     )
;; 	  )



;; (tss-config-default)

;;
;; typescript end
;;



;; ===================
;; slime configuration
;; ===================

(setq inferior-lisp-program "/usr/bin/sbcl")

;; ===================
;; slime end 
;; ===================





;; (add-to-list 'load-path "~/.emacs.d/theme/") 
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/")
;;(require 'tomorrow-night-paradise-theme) 
;;(load-theme 'tomorrow-night-paradise)
;; (add-to-list 'load-path "~/.emacs.d/sr-speedbar-master/")
;; (add-to-list 'load-path "~/.emacs.d/emacs-rails-reloaded-master/")


;;
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


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
      kept-old-versions 100               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 100               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;; (require 'auto-complete-config)

(ac-config-default)

(use-package auto-complete)
(auto-complete-mode)

     

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

;;
;; lisp mode hook
;;

(add-hook 'lisp-mode-hook
	  '(lambda ()
	     (highlight-sexp-mode)
	     (highlight-blocks-mode)
	     (rainbow-delimiters-mode)))

;;
;; geiser
;;
(setq geiser-active-implementations '(racket))


;;
;;scheme mode
;;

(add-hook 'scheme-mode-hook
	  '(lambda ()
	     (highlight-sexp-mode)
	     (highlight-blocks-mode)
	     (rainbow-delimiters-mode)
	     (geiser-mode)))

;;
;;   emacs lisp mode hook
;;

(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (highlight-sexp-mode)
	     (highlight-blocks-mode)
	     (rainbow-delimiters-mode)))

;;
;;
;; general translation
;;

(evil-mode)
