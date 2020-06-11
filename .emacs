; emacs conf --- configuration
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

;; important variables for lsp
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb


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
;; (setq use-package-always-defer t
;;       use-package-always-ensure t)
(setq use-package-always-ensure t)

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


(use-package nlinum-relative
  :ensure t
  :config
  ;; something else you want
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))

;; can't download asnippet-snippets because it makes package install crash
(use-package ranger
  :ensure t)
(global-set-key [f8] 'treemacs)
(use-package yasnippet
  :demand t
  :config (yas-global-mode 1))
 (use-package yasnippet-snippets
   :after (yas-global-mode)
   :config (yas-reload-all)
   :ensure nil)

(use-package color-identifiers-mode
  :ensure t
  :hook (c-mode . color-identifiers-mode))

(use-package auto-highlight-symbol
  :ensure t
  :config (auto-highlight-symbol-mode)
  :hook (prog-mode . auto-highlight-symbol-mode)
  :commands (auto-highlight-symbol-mode))

(use-package rainbow-identifiers
  :ensure t)

(use-package avy
  :config (avy-setup-default))

(use-package frog-jump-buffer
  :bind (("C-x x" . frog-jump-buffer)))

;; (use-package helm-c-yasnippet
;;   :init
;;   (setq helm-yas-space-match-any-greedy t)
;;   (global-set-key (kbd "C-c y") 'helm-yas-complete))

(use-package async)
(use-package popup)
(use-package powerline
  :demand t)
(use-package moe-theme
  :demand t
  :after  (powerline)
  :config
  (moe-dark)
  (moe-theme-random-color)
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
;; (use-package ztree :ensure t)
(use-package magit :ensure t)
(use-package highlight-blocks)
(use-package rainbow-delimiters )
(use-package ag :demand t)
(use-package flycheck
  :ensure t
  :init
  ;;(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  (global-flycheck-mode)
  :demand t)
(use-package hydra)

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'")

(use-package projectile
  :init (setq projectile-project-search-path '("~/prog" "/media/prog/"))
  :ensure t)

(use-package helm
  :config (require 'helm-config)
  (helm-mode 1)
  :bind*                           ; load counsel when pressed
  (("M-x"     . helm-M-x)       ; M-x use counsel
   ("\t" . helm-execute-persistent-action)
   ) ; C-x C-f use counsel-find-file
)
(use-package org )

;; ===================================================
;;
;; evil config
;;
;; =================================================

(use-package evil :ensure t :demand t
  :init (setq evil-want-keybinding nil)
  :config (evil-mode))

(use-package vimish-fold
  :ensure t
  :after (evil))

(use-package evil-vimish-fold
  :ensure t
  :after (evil vimish-fold))

(add-hook 'prog-mode-hook #'hs-minor-mode)
;; (use-package origami
;;   :ensure t
;;   :after (evil)
;;   :hook (prog-mode . origami-mode)
;;   :commands (origami-mode))

(use-package evil-magit :ensure t)
(use-package evil-collection
  :ensure t
  :after evil
  :config (evil-collection-init))
;; (use-package smartparens :demand t
;;   :bind
;;   (("C-M-f" . sp-forward-sexp)
;;    ("C-M-b" . sp-backward-sexp)
;;    ("C-M-d" . sp-down-sexp)
;;    ("C-M-d" . sp-backward-down-sexp)
;;    ("C-S-u" . sp-up-sexp)
;;    ("C-M-u" . sp-backward-up-sexp)
;;    ("C-S-a" . sp-beginning-of-sexp)
;;    ("C-M-e" . sp-end-of-sexp)
;;    ("C-M-n" . sp-next-sexp)
;;    ("C-M-p" . sp-previous-sexp)
;;    ("C-S-b" . sp-backward-symbol)
;;    ("C-S-f" . sp-forward-symbol))
  
;;     :init (require 'smartparens-config))
;; (use-package paredit :demand t)
;; (use-package evil-smartparens :after evil
;;   ;;:init (add-hook 'evil-mode 'evil-smartparens-mode)
;;   :config (evil-smartparens-mode))
;; (use-package evil-paredit :after evil
;;   ;;:init(add-hook 'evil-mode #'evil-paredit-mode))
;;   :config (evil-paredit-mode))
;; (use-package evil-cleverparens
;;   :after evil
;;   :config (evil-cleverparens-mode))
(use-package evil-org )

;;treemacs 
(use-package treemacs-evil :demand t)


;; multiple cursors evil mode
(use-package evil-mc :demand t
  :ensure t
  :after evil
  :config (global-evil-mc-mode 1))

;; (evil-define-local-var evil-mc-custom-paused nil
;;   "Paused functionality when there are multiple cursors active.")

;; (defun evil-mc-pause-smartchr-for-mode (mode)
;;   "Temporarily disables the smartchr keys for MODE."
;;   (let ((m-mode (if (atom mode) mode (car mode)))
;;         (s-mode (if (atom mode) mode (cdr mode))))
;;     (let ((init (intern (concat "smartchr/init-" (symbol-name s-mode))))
;;           (undo (intern (concat "smartchr/undo-" (symbol-name s-mode)))))
;;       (when (eq major-mode m-mode)
;;         (funcall undo)
;;         (push `(lambda () (,init)) evil-mc-custom-paused)))))

;; (defun evil-mc-before-cursors-setup-hook ()
;;   "Hook to run before any cursor is created.
;; Can be used to temporarily disable any functionality that doesn't
;; play well with `evil-mc'."
;;   (mapc 'evil-mc-pause-smartchr-for-mode
;;         '(web-mode js2-mode java-mode (enh-ruby-mode . ruby-mode) css-mode))
;;   (when (boundp whitespace-cleanup-disabled)
;;     (setq whitespace-cleanup-disabled t)
;;     (push (lambda () (setq whitespace-cleanup-disabled nil)) evil-mc-custom-paused)))

;; (defun evil-mc-after-cursors-teardown-hook ()
;;   "Hook to run after all cursors are deleted."
;;   (dolist (fn evil-mc-custom-paused) (funcall fn))
;;   (setq evil-mc-custom-paused nil))

;; (add-hook 'evil-mc-before-cursors-created 'evil-mc-before-cursors-setup-hook)
;; (add-hook 'evil-mc-after-cursors-deleted 'evil-mc-after-cursors-teardown-hook)


;; =================================================




(use-package company
  :demand t
  :config (global-company-mode 1)
  (setq company-backends '((company-files company-keywords))
	)
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0)
  (evil-define-key nil evil-insert-state-map
  (kbd "C-M-y") 'company-complete))
;; ;; debugger package
;; (use-package dap-mode
;;    :after lsp-mode
;;   :config
;;   (dap-mode t)
;;   (dap-ui-mode t))


;; ===================================================
;;
;; python config
;;
;; =================================================
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; ===================================================
;;
;; flutter config
;;
;; =================================================
;; Assuming usage with dart-mode
(use-package dart-mode
  :ensure t)
(use-package lsp-dart
  :ensure t
  :init
  (setq lsp-dart-flutter-sdk-dir (concat (replace-regexp-in-string "\\\\" "/" (getenv "FLUTTER_HOME")) "/bin/cache/dart-sdk/"))
  (setq lsp-dart-sdk-dir (concat (replace-regexp-in-string "\\\\" "/" (getenv "FLUTTER_HOME")) "/bin/cache/dart-sdk/"))
  :config
  (or
   lsp-dart-server-command
   `(,(expand-file-name (f-join lsp-dart-sdk-dir "bin/dart"))
     ,(expand-file-name (f-join lsp-dart-sdk-dir "bin/snapshots/analysis_server.dart.snapshot"))
     "--lsp")))

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload)))


;; Optional Flutter packages
(use-package hover :ensure t) ;; run app from desktop without emulator


;; ===================================================
;;
;; omnisharp config
;;
;; =================================================
(use-package csharp-mode)
(use-package omnisharp
  ;; :init
  ;; (add-hook 'csharp-mode-hook 'omnisharp-mode)
  ;; (add-hook 'csharp-mode-hook #'company-mode)
  :hook ((csharp-mode . (lambda ()
			  (add-to-list (make-local-variable 'company-backends) '(company-capf company-omnisharp))))
	 (csharp-mode . omnisharp-mode))
  )
;; ===================================================
;;
;; rust config
;;
;; =================================================
(use-package rust-mode)
(use-package cargo
  :hook (rust-mode . cargo-minor-mode))
(use-package racer
  :init
  (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
  (setq racer-rust-src-path "~/git/projetos/rust/src") ;; Rust source code PATH)
  :hook (rust-mode . racer-mode))
(use-package eldoc
  :hook (racer-mode . eldoc-mode))
(use-package company-racer
  :hook (racer-mode . company-mode))
(use-package flycheck-rust)

;; ===================================================
;;
;; web config
;;
;; =================================================
(use-package company-web
    :ensure t)

(use-package web-mode
    :mode ("\\.blade.php\\'" "\\.html\\'" "\\.css\\'" "\\.tsx\\'" "\\.jsx\\'")
    :hook (web-mode . (lambda ()
			(require 'company-web-html)
			(require 'company-web-jade)
			(require 'company-web-slim)
			(when (string-equal "tsx" (file-name-extension buffer-file-name))
			  (setup-tide-mode))
			(when (string-equal "jsx" (file-name-extension buffer-file-name))
			  (setup-tide-mode))
			(add-to-list (make-local-variable 'company-backends) '(company-capf company-web-html company-web-jade company-web-slim)))))
(use-package vue-mode
  :mode "\\.vue")

;; ===================================================
;;
;; php config
;;
;; =================================================
(use-package php-mode
  :mode "\\php")


;; ===================================================
;;
;; javascript config
;;
;; =================================================
;; (use-package company-tern
;;    :ensure t )
;; (use-package rjsx-mode
;;   :mode "\\.js"
;;   :hook (rjsx-mode lsp)
;;   :init (add-hook 'python-mode-hook (lambda()
;; 				      (add-to-list
;; 				       (make-local-variable 'company-backends)
;; 				       'company-tern
;; 				       'company-lsp
;; 				       ))))
(use-package js2-mode
  :ensure t
  :mode "\\.js"
  :hook ((js2-mode . (lambda()
		       (add-to-list
			(make-local-variable 'company-backends)
			'(company-capf company-tern)
			)))))



(use-package tern
  :ensure t
  :hook (js2-mode . tern-mode))

(use-package import-js)

;; (use-package tide)
(use-package typescript-mode
  :ensure t)
;; (use-package tide
;;   :ensure t
;;   :after (typescript-mode company flycheck)
;;   :hook ((typescript-mode . tide-setup)
;;          (typescript-mode . tide-hl-identifier-mode)
;;          (before-save . tide-format-before-save)))
(use-package js2-refactor
  :hook (js2-mode . js2-refactor-mode))
(use-package skewer-mode
  :ensure t
  :hook ((js2-mode . skewer-mode)
	 (css-mode . skewer-css-mode)
	 (web-mode . skewer-html-mode)))
(use-package livid-mode
  :ensure t
  :after (js2-mode))
(use-package web-beautify)

(use-package nodejs-repl
  :ensure t)
(use-package js2-highlight-vars)
(use-package eslint-fix
  :init (add-hook 'rjsx-mode-hook 
          (lambda () 
             (add-hook 'after-save-hook 'eslint-fix nil 'make-it-local))))
(use-package xref-js2
  :hook (js2-mode . (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))
;; (use-package indium)
;; (use-package company-tern
;;   :hook (rjsx-mode tern-mode))


;; ===================================================
;;
;; angular  config
;;
;; =================================================
(use-package typescript-mode
  :hook (typescript-mode . lsp))
(use-package ng2-mode)




;;==============================================================
;;
;; Yaml
;;
;;==============================================================
(use-package yaml-mode
  :mode "\\y\\(aml\\|ml\\)$")
(use-package flycheck-yamllint
  :after yaml-mode)
;;==============================================================



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
;; (use-package cider-eval-sexp-fu)
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

(use-package lsp-scala
  :ensure t)

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

;; ;;ensime for scala
;; (use-package ensime :demand t)

;; ==================================================================



;; =================================================================
;;
;; LSP config
;;
;; =================================================================
(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :demand t
  :hook
  (((scala-mode java-mode js2-mode dart-mode) . lsp-deferred)
   (lsp-mode . (lambda () (add-to-list (make-local-variable 'company-backends)
				       '(company capf company-lsp)))))
  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-print-performance t)
  (setq lsp-prefer-capf t)
  (setq lsp-idle-delay 0.500)

  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (let ((should-display-ui (if (string= system-type "windows-nt")
			       nil
			     t)))
    (setq lsp-ui-doc-enable should-display-ui
	  lsp-ui-sideline-enable should-display-ui
	  lsp-ui-flycheck-enable t
	  lsp-ui-doc-position 'top))
  :after lsp-mode)

;; Add company-lsp backend for metals
(use-package company-lsp
  :commands company-lsp)

(setq lsp-prefer-capf t)

(use-package dap-mode
  :init (add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))
  :hook (
	 (js2-mode . (lambda ()
	 	       (require 'dap-chrome)
	 	       ;;(dap-chrome-setup)
		       ))
	 (js2-mode . (lambda ()
	 	       (require 'dap-firefox)
	  	       ;;(dap-firefox-setup)
		       ))
	 )
  :config
  (dap-mode t)
  (dap-ui-mode 1)
  ;; enables mouse hover support
  (dap-tooltip-mode 1)
  ;; use tooltips for mouse hover
  ;; if it is not enabled `dap-mode' will use the minibuffer.
  (tooltip-mode 1)
  ;; displays floating panel with debug buttons
  ;; requies emacs 26+
  (dap-ui-controls-mode 1))

;; (require 'dap-firefox)
;; (dap-firefox-setup)

(use-package lsp-java
  :init
  (defun jmi/java-mode-config ()
    (toggle-truncate-lines 1)
    (setq-local tab-width 4)
    (setq-local c-basic-offset 4)
    (lsp)
    (add-to-list (make-local-variable 'company-backends)
		 '(company-capf company-lsp)))

  :config
  ;; Enable dap-java
  (require 'dap-java)
  ;; Support Lombok in our projects, among other things
  (setq
   ;; path-to-lombok
   ;; (expand-file-name
   ;;      "~/.emacs.d/jmi/lombok.jar"
   ;;    )
   
   lsp-java-vmargs
            `("-noverify"
              "-Xmx1G"
              "-XX:+UseG1GC"
              "-XX:+UseStringDeduplication"
              ,(concat "-javaagent:" "/home/kenjigashu/.emacs.d/jmi/lombok.jar")
              ,(concat "-Xbootclasspath/a:" "/home/kenjigashu/.emacs.d/jmi/"))

   ;; lsp-java-vmargs
   ;; (list "-noverify"
   ;; 	 "-Xmx2G"
   ;; 	 "-XX:+UseG1GC"
   ;; 	 "-XX:+UseStringDeduplication"
   ;; 	 "-javaagent:~/.emacs.d/jmi/lombok.jar"
   ;; 	 "-Xbootclasspath/a:~/.emacs.d/jmi/")
   ;; lsp-java-vmargs
   ;;          `("-noverify"
   ;;            "-Xmx1G"
   ;;            "-XX:+UseG1GC"
   ;;            "-XX:+UseStringDeduplication"
   ;;            ,(concat "-javaagent:" "~/.emacs.d/jmi/lombok-1.18.0.jar")
   ;;            ,(concat "-Xbootclasspath/a:" "~/.emacs.d/jmi/lombok-1.18.0.jar"))
   lsp-file-watch-ignored
   '(".idea" ".ensime_cache" ".eunit" "node_modules"
  	   ".git" ".hg" ".fslckout" "_FOSSIL_"
           ".bzr" "_darcs" ".tox" ".svn" ".stack-work"
           "build")
   
   lsp-java-import-order '["" "java" "javax" "#"]
   ;; Don't organize imports on save
   lsp-java-save-action-organize-imports nil
   
   ;; Formatter profile
   ;;lsp-java-format-settings-url
   ;;(concat "file://" jmi/java-format-settings-file)
   )
  
  :hook (java-mode . jmi/java-mode-config
	 )

  :demand t
  :after (lsp lsp-mode dap-mode))

(use-package helm-lsp
  :demand t
  :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs
  :demand t
  :commands lsp-treemacs-errors-list
  :config (lsp-treemacs-sync-mode 1))
(use-package company-lsp
  :demand t)


;; ================================================================
;;
;; c mode config
;;
;; ================================================================

;; C-Like
;; (face-remap-add-relative 'font-lock-function-usage-face '(:foreground "PaleTurquoise"))
;; (face-remap-add-relative 'font-lock-attribute-access-face '(:foreground "Indianred2"))

;; (dolist (mode-iter '(c-mode c++-mode glsl-mode java-mode javascript-mode rust-mode))
;;   (font-lock-add-keywords
;;     mode-iter
;;     '(("\\([~^&\|!<>=,.\\+*/%-]\\)" 0 'font-lock-operator-face keep)))
;;   (font-lock-add-keywords
;;     mode-iter
;;     '(("\\([\]\[}{)(:;]\\)" 0 'font-lock-delimit-face keep)))
;;   ;; functions
;;   (font-lock-add-keywords
;;     mode-iter
;;     '(("\\([_a-z][_a-zA-Z0-9]*\\)\s*(" 1 'font-lock-function-usage-face keep)))
;;   ;;MACROS
;;   (font-lock-add-keywords
;;     mode-iter
;;     '(("\\([_A-Z][_a-zA-Z0-9]*\\)\s*(" 1 'font-lock-builtin-face keep))))

(use-package ggtags
    :hook ((c-mode c++-mode) . ggtags-mode)
    :init (add-hook 'ggtags-mode-hook (lambda ()
					(add-to-list
					 (make-local-variable 'company-backends)
					 '(company-capf company-gtags)
					 )
					))
    :config (require 'dap-gdb-lldb))
(use-package helm-gtags
  :hook ((ggtags-mode . helm-gtags-mode)))
;; (use-package counsel-gtags 
;;   :config
;;   (add-hook 'c-mode-hook 'counsel-gtags-mode))

;; (use-package flycheck-irony
;;   :ensure t)

;; (use-package irony
;;   :init
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'objc-mode-hook 'irony-mode)
  
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; (use-package irony-eldoc
;;   :ensure t)

;; (when (boundp 'w32-pipe-read-delay)
;;   (setq w32-pipe-read-delay 0))
;; ;; Set the buffer size to 64K on Windows (from the original 4K)
;; (when (boundp 'w32-pipe-buffer-size)
;;   (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

;;(use-package company-c-headers)

;; (use-package rtags
;;   :config
;;   (progn
;;     (unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
;;     (unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))

;;     (define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
;;     (define-key c-mode-base-map (kbd "M-,") 'rtags-find-references-at-point)
;;     (define-key c-mode-base-map (kbd "M-?") 'rtags-display-summary)
;;     (rtags-enable-standard-keybindings)

;;     (setq rtags-use-helm t)

;;     ;; Shutdown rdm when leaving emacs.
;;     (add-hook 'kill-emacs-hook 'rtags-quit-rdm)
;;     ))

;; ;; TODO: Has no coloring! How can I get coloring?
;; ;; (req-package helm-rtags
;; ;;   :require helm rtags
;; ;;   :config
;; ;;   (progn
;; ;;     (setq rtags-display-result-backend 'helm)
;; ;;     ))

;; ;; Use rtags for auto-completion.
;; (use-package company-rtags
;;   :config
;;   (progn
;;     (setq rtags-autostart-diagnostics t)
;;     (rtags-diagnostics)
;;     (setq rtags-completions-enabled t)
;;     (push 'company-rtags company-backends)
;;     ))

;; Live code checking.
;; (use-package flycheck-rtags
;;   :config
;;   (progn
;;     ;; ensure that we use only rtags checking
;;     ;; https://github.com/Andersbakken/rtags#optional-1
;;     (defun setup-flycheck-rtags ()
;;       (flycheck-select-checker 'rtags)
;;       (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
;;       (setq-local flycheck-check-syntax-automatically nil)
;;       (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
;;       )
;;     (add-hook 'c-mode-hook #'setup-flycheck-rtags)
;;     (add-hook 'c++-mode-hook #'setup-flycheck-rtags)
;;     ))

;; (use-package ccls
;;   :hook ((c-mode c++-mode objc-mode cuda-mode) .
;; 	 (lambda () (progn (require 'ccls) (lsp)))))

;;cquery backend
;; (defun cquery//enable ()
;;  (condition-case nil
;;      (lsp)
;;    (user-error nil))
;;  ;(require 'cquery)
;;  )

;; (use-package cquery 
;;   :ensure t
;;    :commands lsp
;;    :init
;;    (add-hook 'c-mode-hook 'cquery//enable
;; 	     (lambda () (require 'dap-gdb-lldb)
;; 	       (dap-gbd-lldb-setup)
;; 	       (make-local-variable 'company-backends)
;; 	       (setq company-backends (list (cons 'company-lsp (copy-tree (car company-backends)))))))
;;    (add-hook 'c++-mode-hook 'cquery//enable)
;;    (when (string= system-type "windows-nt")
;;      (setq cquery-executable "c:/Users/lkenji/Downloads/home/prog/cquery/build/release/bin/cquery")
;;      )
;;    (when (string= system-type "gnu/linux")
;;      (setq cquery-executable "/media/prog/cquery-linux/build/release/bin/cquery")
;;      )
;;    ;; :hook ((c-mode c++-mode objc-mode cuda-mode) .
;;    ;; 	  (lambda () (progn (require 'cquery) (lsp))))
;;   )

;;fix header not found when flycheck is enabled
(use-package flycheck-clang-tidy
  :after flycheck
  :hook
  (flycheck-mode . flycheck-clang-tidy-setup)
  )
;; ==================================================================






;;===================================================================
;;
;; Java
;;
;;===================================================================

;; eclipse-java-style is the same as the "java" style (copied from
;; cc-styles.el) with the addition of (arglist-cont-nonempty . ++) to
;; c-offsets-alist to make it more like default Eclipse formatting -- function
;; arguments starting on a new line are indented by 8 characters
;; (++ = 2 x normal offset) rather than lined up with the arguments on the
;; previous line
(defconst eclipse-java-style
  '((c-basic-offset . 4)
    (c-comment-only-line-offset . (0 . 0))
    ;; the following preserves Javadoc starter lines
    (c-offsets-alist . ((inline-open . 0)
                        (topmost-intro-cont    . +)
                        (statement-block-intro . +)
                        (knr-argdecl-intro     . 5)
                        (substatement-open     . +)
                        (substatement-label    . +)
                        (label                 . +)
                        (statement-case-open   . +)
                        (statement-cont        . +)
                        (arglist-intro  . c-lineup-arglist-intro-after-paren)
                        (arglist-close  . c-lineup-arglist)
                        (access-label   . 0)
                        (inher-cont     . c-lineup-java-inher)
                        (func-decl-cont . c-lineup-java-throws)
                        (arglist-cont-nonempty . ++)
                        )))
  "Eclipse Java Programming Style")
(c-add-style "ECLIPSE" eclipse-java-style)
(customize-set-variable 'c-default-style (quote ((java-mode . "eclipse") (awk-mode . "awk") (other . "gnu"))))

(use-package cc-mode)

;; optionally
(use-package lsp-ui
  :demand t
  :commands lsp-ui-mode)
(use-package company-lsp
  :demand t
  :commands company-lsp)
(use-package lsp-java 
  :demand t)

;; optionally if you want to use debugger
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
(use-package dap-mode
  :demand t
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1))

(use-package dap-java
  :demand t
  :ensure nil)

;STS4 support
(require 'lsp-java-boot)

;; ;; to enable the lenses
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
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


;; (use-package general :ensure t
;;   :config
;;   (general-evil-setup t)

;;   (general-define-key
;;    :states '(insert emacs)
;;    :prefix "C-SPC"
;;    :non-normal-prefix "C-SPC"
;;    "c" '(evil-avy-goto-char2 :which-key "avy goto char")
;;    "l" '(evil-avy-goto-line :which-key "avy goto line")
;;    "w" '(evil-avy-goto-word-0 :which-key "avy goto word0")
;;    "n" '(evil-avy-goto-word-1 :which-key "avy goto word1")
;;    "a" 'align-regexp
;;    )
;;   (general-def :states '(normal motion emacs) "SPC" nil)
;;   (general-define-key
;;    :states '(normal motion emacs)
;;    :prefix "SPC"
;; ;;   "ar" '(ranger :which-key "call ranger")
;;    "ac" '(evil-avy-goto-char :which-key "avy goto char")
;;    "al" '(evil-avy-goto-line :which-key "avy goto line")
;;    "aw" '(evil-avy-goto-word-0 :which-key "avy goto word0")
;;    "an" '(evil-avy-goto-word-1 :which-key "avy goto word1")
;;    "g"  '(:ignore t :which-key "Git")
;;    "gs" '(magit-status :which-key "git status")
;;    "ff" '(helm-find-files :which-key "helm find file")
;;    "bb" '(helm-buffers-list :which-key "helm buffer list")
;;    "w TAB" '(other-window :which-key "other window c-x o")
;;    "bk" '(kill-buffer :which-key "kill-buffer")
;;    "w1" '(delete-other-windows :which-key "delete-other-windows - buffer tela cheia")
;;    "w0" '(delete-window :which-key "delete-window - fecha tela atual")
;;    "w2" '(split-window-below :which-key "split-window-below - splita em cima e embaixo")
;;    "w3" '(split-window-right :which-key "split-window-right - splita lado a lado")
;;    "fs" '(save-buffer :which-key "save-buffer - salva file")
;;    )
;;   )

;; (general-define-key
;;  :keymaps 'counsel-gtags-mode-map
;;     :states '(normal motion emacs)
;;     :prefix "SPC"
;;     "gfd" '(counsel-gtags-find-definition :which-key "find definition gtags")
;;     "gfr" '(counsel-gtags-find-reference :which-key "find reference gtags")
;;     "gfs" '(counsel-gtags-find-symbol :which-key "find symbol gtags")
;;     "gff" '(counsel-gtags--find-file :which-key "find file gtags")
;;     "g>" '(counsel-gtags-go-forward :which-key "gtags go forward")
;;     "g<" '(counsel-gtags-go-backward :which-key "gtags go backward")
;;     "gdd" '(counsel-gtags-dwim :which-key "gtags dwin")
;;     )

;; (use-package ivy :ensure t
;;   :diminish (ivy-mode . "") ; does not display ivy in the modeline
;;   :init (ivy-mode 1)        ; enable ivy globally at startup
;;   :bind (:map ivy-mode-map  ; bind in the ivy buffer
;;          ("C-'" . ivy-avy)) ; C-' to ivy-avy
;;   :config
;;   (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
;;   (setq ivy-height 20)               ; set height of the ivy window
;;   (setq ivy-count-format "(%d/%d) ") ; count format, from the ivy help page
;;   )


;;================================================================
;;
;; hydra keymap
;;
;;================================================================
(defhydra hydra-evil-normal (:color red
			     :hint nil)
   "

   ^Avy^                     ^Misc^                   ^Window
    ^^^^^^------------------------------------------------------
  [_ac_] avy goto char  [_bk_] kill buffer        [_w TAB_] other window
  [_al_] avy goto line  [_gs_] git status toggle  [_w2_] split window below
  [_aw_] avy goto word0 [_ff_] helm-find-file  [_w1_]   delete other window
  [_an_] avy goto word1 [_bb_] helm-buffer        [_w0_]   delete window
                        [_fs_] save buffer        [_w3_] split right

  [_m_] LSP             [_gg_] GGTAGS
  [_p_] Projectile
"  
  ;; Smart Parens:
  ;; [_C-M-f_] forward     [_C-M-b_] backward
  ;; [_C-d_] down        [_M-d_] back down
  ;; [_C-u_] up            [_M-u_] back up
  ;; [_C-M-n_] next        [_C-M-p_] previous
  ;; [_C-M-a_] beggining   [_C-M-e_] end
  ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
  ;; "
   ("ac" evil-avy-goto-char)
   ("al" evil-avy-goto-line)
   ("aw" evil-avy-goto-word-0 )
   ("an" evil-avy-goto-word-1 )
   ("gs" magit-status )
   ("ff" helm-find-files )
   ("bb" helm-buffers-list )
   ("w TAB" other-window )
   ("bk" kill-buffer )
   ("w1" delete-other-windows )
   ("w0" delete-window )
   ("w2" split-window-below )
   ("w3" split-window-right )
   ("fs" save-buffer )
   ("m" hydra-lsp/body :exit t)
   ("p" hydra-projectile/body :exit t)
   ("gg" hydra-ggtags/body :exit t)
   ;; ("C-M-f" sp-forward-sexp)
   ;; ("C-M-b" sp-backward-sexp)
   ;; ("C-d>" sp-down-sexp)
   ;; ("M-d>" sp-backward-down-sexp)
   ;; ("C-u>" sp-up-sexp)
   ;; ("M-u>" sp-backward-up-sexp)
   ;; ("C-M-n" sp-next-sexp)
   ;; ("C-M-p" sp-previous-sexp)
   ;; ("C-M-a" sp-beginning-of-sexp)
   ;; ("C-M-e" sp-end-of-sexp)
   ;; ("C-S-f" sp-forward-symbol)
   ;; ("C-S-b" sp-backward-symbol)
   )

(define-key evil-normal-state-map (kbd "SPC") 'hydra-evil-normal/body)
(define-key evil-motion-state-map (kbd "SPC") 'hydra-evil-normal/body)

(defhydra hydra-lsp (:color blue
			    :hint nil)
"

   ^find^                     ^UI^                   ^Window
    ^^^^^^------------------------------------------------------
  [_gd_] find definition     [_pd_] find definition    
  [_ga_] find declaration    [_pr_] find reference   
  [_gs_] find implementation 
                             
"  
  ;; Smart Parens:
  ;; [_C-M-f_] forward     [_C-M-b_] backward
  ;; [_C-d_] down        [_M-d_] back down
  ;; [_C-u_] up            [_M-u_] back up
  ;; [_C-M-n_] next        [_C-M-p_] previous
  ;; [_C-M-a_] beggining   [_C-M-e_] end
  ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
  ;; "
   ("gd" lsp-find-definition)
   ("ga" lsp-find-declaration)
   ("gs" lsp-find-implementation)
   ("pd" lsp-ui-peek-find-definitions)
   ;;("pa" lsp-ui-peek-find-declarations)
   ;;("ps" lsp-ui-peek-find-implementations)
   ("pr" lsp-ui-peek-find-references)
   )

(defhydra hydra-projectile (:color blue
				   :hint nil)
   "
   ^find^  
    ^^^^^^------------------------------------------------------
  [_f_] find file                             
  [_s_] switch project
"  
  ;; Smart Parens:
  ;; [_C-M-f_] forward     [_C-M-b_] backward
  ;; [_C-d_] down        [_M-d_] back down
  ;; [_C-u_] up            [_M-u_] back up
  ;; [_C-M-n_] next        [_C-M-p_] previous
  ;; [_C-M-a_] beggining   [_C-M-e_] end
  ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
  ;; "
   ("f" projectile-find-file)
   ("s" projectile-switch-project)
   )

(defhydra hydra-ggtags (:color blue
				   :hint nil)
   "
   ^find^  
    ^^^^^^------------------------------------------------------
  [_n_] next     [_g_] grep  [_ff_] find [_fh_] find-here  [_d_] delete-tag  [_r_] f-regex [_fs_] find-symbol
  [_p_] previous [_v_] f-dwim  [_1_] f-reference [_s_] show-definition [_fr_] find-reference
  [_SPC_] register [_hh_] history [_o_] f-other [_m_] search-history [_b_] browse-hypertext 
  [_hn_] next-history [_hp_] prev-history [_ts_] show-stack
" 
  ;; Smart Parens:
  ;; [_C-M-f_] forward     [_C-M-b_] backward
  ;; [_C-d_] down        [_M-d_] back down
  ;; [_C-u_] up            [_M-u_] back up
  ;; [_C-M-n_] next        [_C-M-p_] previous
  ;; [_C-M-a_] beggining   [_C-M-e_] end
  ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
  ;; "
   ("n" ggtags-next-mark)
   ("p" ggtags-prev-mark)
   ("ff" helm-gtags-find-tag)
   ("fh" helm-gtags-find-tag-from-here)
   ("fr" helm-gtags-find-rtag)
   ("fs" helm-gtags-find-symbol)
   ("g" ggtags-grep)
   ("d" ggtags-delete-tags)
   ("r" ggtags-find-tag-regexp)
   ("v" helm-gtags-dwim)
   ("1" ggtags-find-reference)
   ("s" ggtags-show-definition)
   ("SPC" ggtags-save-to-register)
   ("hh" ggtags-view-tag-history)
   ("hn" helm-gtags-next-history)
   ("hp" helm-gtags-previous-history)
   ("o" ggtags-find-other-symbol)
   ("m" ggtags-view-search-history)
   ("b" ggtags-browse-file-as-hypertext)
   ("ts" helm-gtags-show-stack)
   )



(use-package counsel :ensure t
  ;; :bind*                           ; load counsel when pressed
  ;; (("M-x"     . counsel-M-x)       ; M-x use counsel
  ;;  ("C-x C-f" . counsel-find-file) ; C-x C-f use counsel-find-file
  ;;  ("C-x C-r" . counsel-recentf)   ; search recently edited files
  ;;  ("C-c f"   . counsel-git)       ; search for files in git repo
  ;;  ("C-c s"   . counsel-git-grep)  ; search for regexp in git repo
  ;;  ("C-c /"   . counsel-ag)        ; search for regexp in git repo using ag
  ;;  ("C-c l"   . counsel-locate)
  ;;  )   ; search for files or else using locate
  )

;
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
  :demand t
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
    (setq inferior-lisp-program "sbcl")
    ;; (setq inferior-lisp-program "C:/Users/lkenji/Downloads/ccl/wx86cl64.exe")
    ;; (setq inferior-lisp-program "wx86cl64")
    )
  (setq slime-contribs
        '(slime-fancy slime-asdf slime-quicklisp slime-cl-indent))

 )

;; (use-package sly
;;   :demand t
;;   :init (when (string= system-type "windows-nt")
;;     ;; (load (expand-file-name "C:/Users/lkenji/.roswell/helper.el"))
;;     ;; (add-to-list 'exec-path "C:/Program Files/Steel Bank Common Lisp/1.4.14/")
;;     ;; (add-to-list 'exec-path "C:/Users/lkenji/Downloads/roswell/")
;;     ;;(setq inferior-lisp-program "C:/Users/lkenji/Downloads/roswell/ros.exe -Q run")
;;     ;; (setq inferior-lisp-program "sbcl")
;; 	  (add-to-list 'exec-path "C:/Users/lkenji/Downloads/ccl/")
;;     )
;;   (when (string= system-type "gnu/linux")
;;     ;; (setq inferior-lisp-program "sbcl"))
;;     (setq inferior-lisp-program "wx86cl64")
;;     )
;;   )
  
 (use-package slime-repl-ansi-color
   :after (slime))
 (use-package slime-company
   :after (slime))
(use-package helm-slime
  :after (slime))




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

;; (if (not (file-exists-p ".emacs-backups"))
;;     (make-directory ".emacs-backups" t))
;; (setq backup-directory-alist `(("." . , ".emacs-backups")))
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
      backup-directory-alist `((".*" . "~/.backups-emacs"))
      auto-save-file-name-transforms `((".*" "~/.backups-emacs" t))
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


;; commands binding
;; (global-set-key [24 10] (quote sr-speedbar-toggle))
;; (global-set-key [24 8] (quote sr-speedbar-refresh-toggle))



;;
;; lisp mode hook
;;

(add-hook 'lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
	     (rainbow-delimiters-mode)))

;;
;;
;; clojure mode hook
;;
(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (rainbow-delimiters-mode)
	
	     ;;(highlight-blocks-mode)
	     ))


;;
;; geiser
;;
(use-package geiser
  :ensure t
  :init (setq geiser-active-implementations '(racket)))



;;
;;scheme mode
;;

(add-hook 'scheme-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
	     (rainbow-delimiters-mode)
	     (geiser-mode)))

;;
;;   emacs lisp mode hook
;;

(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     ;;(highlight-sexp-mode)
	     ;;(highlight-blocks-mode)
	     (eldoc-mode)
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
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(c-default-style
   '((java-mode . "eclipse")
     (awk-mode . "awk")
     (other . "gnu")))
 '(custom-safe-themes
   '("816bacf37139d6204b761fea0d25f7f2f43b94affa14aa4598bce46157c160c2" "7675ffd2f5cb01a7aab53bcdd702fa019b56c764900f2eea0f74ccfc8e854386" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" default))
 '(lsp-ui-peek-enable t)
 '(package-selected-packages
   '(origami evil-vimish-fold vimish-fold hide-if-def-mode nlinum-relative auto-highlight-symbol zenburn-theme highlight-symbol rainbow-identifiers color-identifiers-mode color-identifier color-identifiers evil-collection evil-colletion lsp-docker lsp-intellij lsp-mode lsp-dart lsp-scala helm-lsp dockerfile-mode yasnippet-snippets tide company-gtags ranger flycheck-clang-tidy company-capf omnisharp csharp-mode ztree geiser rtags magit typescript-mode prettier-js vue-mode web-mode iedit anzu comment-dwim-2 ws-butler dtrt-indent clean-aindent-mode volatile-highlights helm-gtags helm-projectile helm-swoop zygospore groovy-mode flycheck-gradle gradle-mode dante evil-mc sr-speedbar counsel ivy general which-key use-package treemacs-evil rainbow-delimiters powerline moe-theme highlight-blocks ggtags evil-org ensime async ag ack)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
