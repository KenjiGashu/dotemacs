;;; emacs conf --- configuration
;;; inicializacao package manage
(require 'package)
;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(custom-safe-themes
;;   (quote
;;    ("1a5c1be3b14ee44e9cd926c4fe23055bc74bbc9725b01ebee78a1d1cb2b266f4" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "021720af46e6e78e2be7875b2b5b05344f4e21fad70d17af7acfd6922386b61e" "42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" "8891c81848a6cf203c7ac816436ea1a859c34038c39e3cf9f48292d8b1c86528" "a4df5d4a4c343b2712a8ed16bc1488807cd71b25e3108e648d4a26b02bc990b3" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "a566448baba25f48e1833d86807b77876a899fc0c3d33394094cf267c970749f" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "9d9fda57c476672acd8c6efeb9dc801abea906634575ad2c7688d055878e69d6" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4cbec5d41c8ca9742e7c31cc13d8d4d5a18bd3a0961c18eb56d69972bbcf3071" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "1747d30c98ba414fc837d042d2557f65d0697fcc9236c5c3d2ccd57a93b92a9e" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "4aafea32abe07a9658d20aadcae066e9c7a53f8e3dfbd18d8fa0b26c24f9082c" "1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" "715fdcd387af7e963abca6765bd7c2b37e76154e65401cd8d86104f22dd88404" default)))
;; '(org-lowest-priority 70)
;; '(package-archives
;;   (quote
;;    (("gnu" . "http://elpa.gnu.org/packages/")
;;     ("melpa" . "https://melpa.org/packages/"))))
;; '(package-selected-packages
;;   (quote
;;    (dante evil-mc sr-speedbar counsel ivy general which-key async company ggtags evil-org treemacs-evil moe-theme powerline popup)))
;; '(speedbar-show-unknown-files t))
;;(package-initialize)


; list the repositories containing them
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;;package list
(setq package-list '(use-package))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Enable defer and ensure by default for use-package
(setq use-package-always-defer t
      use-package-always-ensure t)

;;can't download yasnippet-snippets because it makes package install crash
(use-package yasnippet
  :config (yas-global-mode 1))
;; (use-package yasnippet-snippets
;;   :config (yas-reload-all))

(use-package async)
(use-package popup)
(use-package powerline)
(use-package moe-theme
  :after  (powerline)
  :config (moe-dark)
  (powerline-moe-theme))


(use-package which-key :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05)
  )
(use-package highlight-blocks)
(use-package rainbow-delimiters )
(use-package ag :demand t)
(use-package evil :ensure t :demand t
  :config (evil-mode))
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :demand t)

(use-package treemacs-evil :demand t)
(global-set-key [f8] 'treemacs)
(use-package org )
(use-package evil-org )
(use-package company
  :init (global-company-mode))



;; debugger package
(use-package dap-mode
   :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))




;;==============================================================
;;
;; Gradle
;;
;;==============================================================

(use-package gradle-mode )
(use-package flycheck-gradle )
(use-package groovy-mode )
;===============================================================




;; ===============================================================
;;
;; clojure
;;
;; ===============================================================

(use-package clojure-mode
  :mode "\\.clj\\'")
(use-package cider
  :mode "\\.clj\\$")
(use-package cider-decompile)
(use-package cider-eval-sexp-fu)
(use-package cider-hydra)

;=================================================================



;; ==================================================================
;;
;; scala config
;;
;; ==================================================================

;; Enable scala-mode and sbt-mode
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

;; Enable nice rendering of diagnostics like compile errors.

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook (scala-mode . lsp)
  :config (setq lsp-prefer-flymake nil))

(use-package lsp-ui)

;; Add company-lsp backend for metals
(use-package company-lsp)

;;ensime for scala
(use-package ensime :demand t)

;; ==================================================================



;; ================================================================
;;
;; c mode config
;;
;; ================================================================
(use-package ggtags )
(use-package counsel-gtags 
  :config
  (add-hook 'c-mode-hook 'counsel-gtags-mode))
(use-package irony
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
(use-package company-c-headers)

;;cquery backend
;; (defun cquery//enable ()
;;   (condition-case nil
;;       (lsp)
;;     (user-error nil)))
;; (use-package cquery 
;;   :init
;;   :commands lsp
;;   :init
;;   (add-hook 'c-mode-hook #'cquery//enable)
;;   (add-hook 'c++-mode-hook #'cquery//enable)
;;   (setq cquery-executable "/usr/bin/cquery"))
;; ==================================================================



;; ==================================================================
;;
;; load paths
;;
;; =================================================================
;;(let ((default-directory  "~/.emacs.d/git/"))
;;  (normal-top-level-add-subdirs-to-load-path))

(setq load-path (append (list (expand-file-name "~/.emacs.d/lilypond-mode")) load-path))
(setq load-path (append (list (expand-file-name "~/.emacs.d/lilypond-mode/lilypond-init.el")) load-path))
(setq load-path (append (list (expand-file-name "/usr/share/emacs/site-lisp/uim-el")) load-path))
(setq load-path (append (list (expand-file-name "/usr/share/emacs/site-lisp")) load-path))
;=======================================================================



;;===================================================================
;;
;; Java
;;
;;===================================================================
(use-package lsp-java  :after lsp
  :config (add-hook 'java-mode-hook 'lsp))
;===================================================================


;; ================= fix dead keys   ===========================
;;(use-package iso-transl )


;;(use-package highlight-sexp )
;;
;; lilypond
;;

(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode)) 


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
;;   "ar" '(ranger :which-key "call ranger")
   "g"  '(:ignore t :which-key "Git")
   "gs" '(magit-status :which-key "git status")
   "ff" '(find-file :which-key "find file")
   "w TAB" '(other-window :which-key "other window c-x o")
   "bb" '(switch-to-buffer :which-key "switch buffer")
   "bk" '(kill-buffer :which-key "kill-buffer")
   "w1" '(delete-other-windows :which-key "delete-other-windows - buffer tela cheia")
   "w0" '(delete-window :which-key "delete-window - fecha tela atual")
   "w2" '(split-window-below :which-key "split-window-below - splita em cima e embaixo")
   "w3" '(split-window-right :which-key "split-window-right - splita lado a lado")
   "fs" '(save-buffer :which-key "save-buffer - salva file")
   )
  )

(general-define-key
 :keymaps 'counsel-gtags-mode-map
    :states '(normal motion emacs)
    :prefix "SPC"
    "gfd" '(counsel-gtags-find-definition :which-key "find definition gtags")
    "gfr" '(counsel-gtags-find-reference :which-key "find reference gtags")
    "gfs" '(counsel-gtags-find-symbol :which-key "find symbol gtags")
    "gff" '(counsel-gtags--find-file :which-key "find file gtags")
    "g>" '(counsel-gtags-go-forward :which-key "gtags go forward")
    "g<" '(counsel-gtags-go-backward :which-key "gtags go backward")
    "gdd" '(counsel-gtags-dwim :which-key "gtags dwin")
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


;;(use-package  uim :enseure t)


;;
;;typescript usage
;;
;; (use-package typescript :ensure t)
;; (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; (use-package tss :ensure t)

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
;; Setup load-path and autoloads
;; (add-to-list 'load-path "~/dir/to/cloned/slime")
;;(use-package slime-autoloads :ensure t)

;; Set your lisp system and some contribs
(use-package slime
  :init (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-asdf slime-scratch slime-editing-commands)))




;; ===================
;; slime end 
;; ===================





;; (add-to-list 'load-path "~/.emacs.d/theme/") 
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/")
;;(use-package tomorrow-night-paradise-theme) :ensure t 
;;(load-theme 'tomorrow-night-paradise)
;; (add-to-list 'load-path "~/.emacs.d/sr-speedbar-master/")
;; (add-to-list 'load-path "~/.emacs.d/emacs-rails-reloaded-master/")


;;
;; (use-package web-mode :ensure t)
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; Replace "sbcl" with the path to your implementation



;;(use-package sr-speedbar :ensure t)
;;(sr-speedbar-refresh-turn-off)



;; (use-package rails-autoload :ensure t)




(electric-pair-mode 1)
(setq vc-make-backup-files t)


;; ==============================================================
;;
;; emacs backups
;;
;; ============================================================

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

;; (use-package auto-complete-config :ensure t)

;; (ac-config-default)

;; (use-package auto-complete)
;; (auto-complete-mode)

     

;;multiple cursors keybindings
;; (use-package multiple-cursors :ensure t)
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; ===================================================
;;
;; evil-mc
;;
;; =================================================

;; multiple cursors evil mode
(use-package evil-mc :ensure t)

(evil-define-local-var evil-mc-custom-paused nil
  "Paused functionality when there are multiple cursors active.")

(defun evil-mc-pause-smartchr-for-mode (mode)
  "Temporarily disables the smartchr keys for MODE."
  (let ((m-mode (if (atom mode) mode (car mode)))
        (s-mode (if (atom mode) mode (cdr mode))))
    (let ((init (intern (concat "smartchr/init-" (symbol-name s-mode))))
          (undo (intern (concat "smartchr/undo-" (symbol-name s-mode)))))
      (when (eq major-mode m-mode)
        (funcall undo)
        (push `(lambda () (,init)) evil-mc-custom-paused)))))

(defun evil-mc-before-cursors-setup-hook ()
  "Hook to run before any cursor is created.
Can be used to temporarily disable any functionality that doesn't
play well with `evil-mc'."
  (mapc 'evil-mc-pause-smartchr-for-mode
        '(web-mode js2-mode java-mode (enh-ruby-mode . ruby-mode) css-mode))
  (when (boundp whitespace-cleanup-disabled)
    (setq whitespace-cleanup-disabled t)
    (push (lambda () (setq whitespace-cleanup-disabled nil)) evil-mc-custom-paused)))

(defun evil-mc-after-cursors-teardown-hook ()
  "Hook to run after all cursors are deleted."
  (dolist (fn evil-mc-custom-paused) (funcall fn))
  (setq evil-mc-custom-paused nil))

(add-hook 'evil-mc-before-cursors-created 'evil-mc-before-cursors-setup-hook)
(add-hook 'evil-mc-after-cursors-deleted 'evil-mc-after-cursors-teardown-hook)

(global-evil-mc-mode 1)

;; =================================================

;; commands binding
;; (global-set-key [24 10] (quote sr-speedbar-toggle))
;; (global-set-key [24 8] (quote sr-speedbar-refresh-toggle))


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
;;
;; lisp mode hook
;;

(add-hook 'lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     (highlight-blocks-mode)
	     (rainbow-delimiters-mode)))

;;
;;
;; clojure mode hook
;;
(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (rainbow-delimiters-mode)
	     ;;(highlight-sexp-mode)
	     (highlight-blocks-mode)))


;;
;; geiser
;;
(setq geiser-active-implementations '(racket))


;;
;;scheme mode
;;

(add-hook 'scheme-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     (highlight-blocks-mode)
	     (rainbow-delimiters-mode)
	     (geiser-mode)))

;;
;;   emacs lisp mode hook
;;

(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     (highlight-blocks-mode)
	     (rainbow-delimiters-mode)))

;;
;;
;; general translation
;;


;; -------------------------------------------------
;; Haskell
;; (use-package dante
;;   :ensure t
;;   :after haskell-mode
;;   :commands 'dante-mode
;;   :init
;;   (add-hook 'haskell-mode-hook 'dante-mode)
  
;;   (add-hook 'haskell-mode-hook 'flycheck-mode)
;;   ;; OR:
;;   ;; (add-hook 'haskell-mode-hook 'flymake-mode)
;;   )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cquery iedit anzu comment-dwim-2 ws-butler dtrt-indent clean-aindent-mode volatile-highlights helm-gtags helm-projectile helm-swoop zygospore groovy-mode flycheck-gradle gradle-mode dante evil-mc sr-speedbar counsel ivy general which-key yasnippet-snippets use-package treemacs-evil rainbow-delimiters powerline moe-theme highlight-blocks ggtags evil-org ensime async ag ack))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
