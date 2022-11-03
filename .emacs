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


;; call this to byte compile emacs folder
;;(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

; list the repositories containing them
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

;; important variables for lsp
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;;temporary for package fetching
(setq package-check-signature nil)

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
;;(setq use-package-always-defer t)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;;(setq use-package-always-ensure t)


;; ==================================================================
;;
;; el get
;;
;; =================================================================
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; ==================================================================
;;
;; auto update
;;
;; =================================================================
(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))


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

(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/")

;=======================================================================



;; ==================================================================
;;
;; some ui configuration
;;
;; =================================================================
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(column-number-mode 1)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook
		pdf-view-mode-hook
		dired-mode))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(desktop-save-mode 1)

(setq-default tab-width 2)

;; display function definition
(which-function-mode)

;; Show the current function name in the header line
(which-function-mode)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
            ;; We remove Which Function Mode from the mode line, because it's mostly
            ;; invisible here anyway.
            (assq-delete-all 'which-func-mode mode-line-misc-info))




(use-package general :ensure t
  :config
  (general-create-definer my-leader-def
    ;; :prefix my-leader
    :prefix "SPC")

  (general-create-definer my-local-leader-def
    ;; :prefix my-local-leader
    :prefix "SPC m")

  ;; (general-override-mode)
  ;; (my-leader-def
  ;;  :keymaps 'normal
  ;;  :keymaps 'override
  ;;  ;; bind "SPC a"
  ;;  "a" 'org-agenda
  ;;  "b" 'counsel-bookmark
  ;;  "c" 'org-capture)
  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"

    ;; simple command
    "'"   '(iterm-focus :which-key "iterm")
    "?"   '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
    "/"   'counsel-ag
    "TAB" '(switch-to-other-buffer :which-key "prev buffer")
    "gc"  '(avy-goto-char-2  :which-key "go to char 2")

    "f" '(:ignore t :which-key "Files")
    "ff" 'find-file

    "s" '(:ignore t :which-key "Search")
    "ss" 'consult-line

    "b" '(:ignore t :which-key "Buffer")
    "bb" 'switch-to-buffer
    "bd" 'kill-buffer
    "bi" 'ibuffer

    "w" '(:ignore t :which-key "Window")
    "wmm" 'delete-other-windows
    "wv"  'split-window-horizontally
    "w-"  'split-window-vertically
    "wh"  'windmove-left
    "wl"  'windmove-right
    "wj"  'windmove-down
    "wk"  'windmove-up


    "o" '(:ignore t :which-key "toggle")

    ;; Applications
    "a" '(:ignore t :which-key "Applications")
    "ar" 'ranger
    "ad" 'dired)
  )



;; ==================================================================
;;
;; vertico
;;
;; =================================================================
;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)

  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous))

  :config
  ;; Use `consult-completion-in-region' if Vertico is enabled.
  ;; Otherwise use the default `completion--in-region' function.
  (setq completion-in-region-function
	(lambda (&rest args)
          (apply (if vertico-mode
                     #'consult-completion-in-region
                   #'completion--in-region)
		 args))))

;; Optionally use the `orderless' completion style. See
;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;; dispatcher. Additionally enable `partial-completion' for file path
;; expansion. `partial-completion' is important for wildcard support.
;; Multiple files can be opened at once with `find-file' if you enter a
;; wildcard. You may also give the `initials' completion style a try.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init (marginalia-mode))

(use-package consult
  :after vertico)



;; ==================================================================
;;
;; init some things
;;
;; =================================================================


(use-package async)
(use-package popup)
;; can't download asnippet-snippets because it makes package install crash
;; (use-package ranger
;;   :ensure t)
(use-package yasnippet
  ;;:demand t
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


(use-package posframe :ensure t
  :demand t)


(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))



;; lsp bridge
(el-get-bundle lsp-bridge
  :url "https://github.com/manateelazycat/lsp-bridge.git"
  :features lsp-bridge)
(el-get 'sync)

;; (global-lsp-bridge-mode)
(setq acm-enable-quick-access 1)

(general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "ld" 'lsp-bridge-find-define
   "li" 'lsp-bridge-find-impl
   "lr" 'lsp-bridge-find-references
   "la" 'lsp-bridge-code-action)

;; (use-package auto-highlight-symbol
;;   :ensure t
;;   :config (auto-highlight-symbol-mode)
;;   :hook (prog-mode . auto-highlight-symbol-mode)
;;   :commands (auto-highlight-symbol-mode))

;; (use-package powerline
;;   :demand t)
;; (use-package moe-theme
;;   :demand t
;;   :after  (powerline)
;;   :config
;;   (moe-dark)
;;   (moe-theme-random-color)
;;   (powerline-moe-theme))

(use-package doom-themes
  :init (load-theme 'doom-palenight t))
  
(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

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
(use-package ag
    ;;:demand t
    :commands ag)
(use-package flycheck
  :ensure t
  :init
  ;;(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  (global-flycheck-mode)
  :demand t)

;;(use-package hydra)

(use-package winum
  :ensure t
  :demand t
  :config (winum-mode 1)
  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "w0" 'winum-select-window-0
   "w1" 'winum-select-window-1
   "w2" 'winum-select-window-2
   "w3" 'winum-select-window-3
   "w4" 'winum-select-window-4
   "w5" 'winum-select-window-5
   "w6" 'winum-select-window-6
   "w7" 'winum-select-window-7))

(use-package all-the-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

;; Whether display the icons.
(setq all-the-icons-ibuffer-icon t)

;; Whether display the colorful icons.
;; It respects `all-the-icons-color-icons'.
(setq all-the-icons-ibuffer-color-icon t)

;; The default icon size in ibuffer.
(setq all-the-icons-ibuffer-icon-size 1.0)

;; The default vertical adjustment of the icon in ibuffer.
(setq all-the-icons-ibuffer-icon-v-adjust 0.0)

;; Use human readable file size in ibuffer.
(setq  all-the-icons-ibuffer-human-readable-size t)


(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode))

(use-package undo-tree :ensure t
  :after evil
  :config
  (global-undo-tree-mode 1)
  (evil-set-undo-system 'undo-tree))

(use-package vundo
  :config
  (setq vundo-glyph-alist vundo-unicode-symbols))

(use-package editorconfig :ensure t
  :config
  (editorconfig-mode 1))

(use-package nav-flash :ensure t
  :config (nav-flash-show))


(use-package beacon :ensure t
  :config
  (beacon-mode 1))
(use-package dimmer :ensure t
  :config
  (setq dimmer-fraction 0.6)
  (dimmer-mode t))


(use-package helpful :ensure t
  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  ;; Lookup the current symbol at point. C-c C-d is a common keybinding
  ;; for this in lisp modes.
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)

  ;; Look up *F*unctions (excludes macros).
  ;;
  ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
  ;; already links to the manual, if a function is referenced there.
  (global-set-key (kbd "C-h F") #'helpful-function)

  ;; Look up *C*ommands.
  ;;
  ;; By default, C-h C is bound to describe `describe-coding-system'. I
  ;; don't find this very useful, but it's frequently useful to only
  ;; look at interactive functions.
  (global-set-key (kbd "C-h C") #'helpful-command))


(use-package avy :ensure t
  :config
  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "gc" 'avy-goto-char-2
   "gw" 'avy-goto-word-1))

;; (use-package highlight-indentation)
;; (set-face-background 'highlight-indentation-face "#e3e3d3")
;; (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

(use-package highlight-indent-guides
  :config
  ;; (setq highlight-indent-guides-auto-character-face-perc 0)
  ;; (setq highlight-indent-guides-auto-even-face-perc 0)
  ;; (setq highlight-indent-guides-auto-odd-face-perc 0)
  ;; (setq highlight-indent-guides-auto-character-face-perc 0)
  ;; (setq highlight-indent-guides-auto-top-character-face-perc 0)
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top)
  (setq highlight-indent-guides-auto-enabled nil)
  (set-face-foreground 'highlight-indent-guides-character-face "dim gray")
  (set-face-foreground 'highlight-indent-guides-top-character-face "white smoke")
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  )

;;customize search
(setq lazy-highlight-cleanup nil)
(setq lazy-highlight-max-at-a-time nil)
(setq lazy-highlight-initial-delay 0)

(use-package anzu
  :config (global-anzu-mode +1))
(use-package evil-anzu
  :after evil)

(use-package evil-search-highlight-persist
	:ensure t
	:config (global-evil-search-highlight-persist t))

(use-package ah
	:ensure t
	:after evil-search-highlight-persist
	:config
	(ah-mode 1)
	(add-hook 'ah-after-c-g-hook (lambda () (evil-search-highlight-persist-remove-all)))
	)

;; make which key show up faster
(setq which-key-idle-delay 0.3) ;; I need the help, I really do

;;change default font to iosevka
(if (equal system-type 'windows-nt)
    (add-to-list 'default-frame-alist '(font . "Iosevka-11"))
  (add-to-list 'default-frame-alist '(font . "Iosevka-14")))

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




;; ================= install bookmark-plus =================

(let ((bookmarkplus-dir "~/.emacs.d/custom/bookmark-plus/")
      (emacswiki-base "https://www.emacswiki.org/emacs/download/")
      (bookmark-files '("bookmark+.el" "bookmark+-mac.el" "bookmark+-bmu.el" "bookmark+-key.el" "bookmark+-lit.el" "bookmark+-1.el")))
  (require 'url)
  (add-to-list 'load-path bookmarkplus-dir)
  (make-directory bookmarkplus-dir t)
  (mapcar (lambda (arg)
            (let ((local-file (concat bookmarkplus-dir arg)))
              (unless (file-exists-p local-file)
                (url-copy-file (concat emacswiki-base arg) local-file t))))
          bookmark-files)
  (byte-recompile-directory bookmarkplus-dir 0)
  (require 'bookmark+)

  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "bm" 'bookmark-set
   "bv" 'list-bookmarks
   "bt" 'bmkp-switch-bookmark-file-create
   "bn" 'bmkp-next-bookmark
   "bp" 'bmkp-previous-bookmark)

  ;; config
  (setq bookmark-save-flag 1
	bmkp-count-multi-mods-as-one-flag t)
  )

;; ================= install bookmark-plus ======================
;;
;; ================= download custom el files from emacs wiki =================

(let ((custom-el-dir "~/.emacs.d/custom/other-el/")
      (emacswiki-base "https://www.emacswiki.org/emacs/download/")
      (custom-el-files '("dired+.el" "frame-fns.el" "frame-cmds.el" "zoom-frm.el")))
  (require 'url)
  (add-to-list 'load-path custom-el-dir)
  (make-directory custom-el-dir t)
  (mapcar (lambda (arg)
            (let ((local-file (concat custom-el-dir arg)))
              (unless (file-exists-p local-file)
                (url-copy-file (concat emacswiki-base arg) local-file t))))
          custom-el-files)
  (byte-recompile-directory custom-el-dir 0)
  (require 'dired+)
  )



;; ================================
;; 
;; Dired stuff
;;
;; ================================
(use-package dired-hacks-utils :ensure t )
(use-package dired-filter :ensure t )
(use-package dired-subtree :ensure t )
(use-package dired-ranger :ensure t )
(use-package dired-collapse :ensure t )
(use-package dired-sidebar :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "o=" 'dired-sidebar-toggle-sidebar))

(use-package all-the-icons-dired :ensure t )

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)



;; ===================================================
;;
;; evil config
;;
;; =================================================

(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(use-package evil :ensure t :demand t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config (evil-mode 1))

(use-package evil-collection
  :after evil
  :defer nil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-org
  :after (evil org-mode))

(use-package vimish-fold
  :ensure t
  :after evil)

(use-package evil-vimish-fold
  :ensure t
  :after vimish-fold
  :hook ((prog-mode conf-mode text-mode) . evil-vimish-fold-mode))

;; (use-package vimish-fold
;;   :ensure t
;;   :after (evil))

;; (use-package evil-vimish-fold
;;   :ensure t
;;   :after (evil vimish-fold))

;; (add-hook 'prog-mode-hook #'hs-minor-mode)


;; (evil-define-key '(normal) dired-mode-map
;;   (kbd "RET") 'dired-find-file)

;; multiple cursors evil mode
(use-package evil-mc :demand t
  :ensure t
  :after evil
  :config (global-evil-mc-mode 1))




;; ===================================================
;;
;; other config
;;
;; =================================================

;; (use-package dockerfile-mode
;;   :ensure t
;;   :mode "\\Dockerfile")

(use-package projectile
  :init (setq projectile-project-search-path '("~/prog" "/media/prog/"))
  :commands (projectile-find-file) 
  :ensure t
  :config
  (projectile-global-mode)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "f SPC" 'projectile-find-file))

(use-package org
  :mode "\\.org")

(use-package dired-subtree
  :config
  (evil-define-key '(normal) dired-mode-map
    (kbd "TAB") 'dired-subtree-insert
    (kbd "<backtab>") 'dired-subtree-remove)
  )

;; ==================================================
;;
;; eglot
;;
;; ==================================================
;; (use-package eglot
;;   :ensure t
;;   :commands (eglot)
;;   :hook ((c++-mode c-mode rust-mode) . eglot-ensure))

;; =================================================

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
    (kbd "C-M-y") 'company-complete)

  ;;setup backends
  :hook ((emacs-lisp-mode . (lambda ()
			      (set (make-local-variable 'company-backends) (push 'company-elisp company-backends)))))
  )

(use-package company-quickhelp :ensure t
  :after company
  :config (company-quickhelp-mode))



;; ===================================================
;;
;; flutter config
;;
;; =================================================
;; Assuming usage with dart-mode
;; (use-package dart-mode
;;   :mode "\\.dart\\'"
;;   :ensure t)
;; (use-package lsp-dart
;;   :ensure t
;;   :init
;;   (setq lsp-dart-flutter-sdk-dir (concat (replace-regexp-in-string "\\\\" "/" (getenv "FLUTTER_HOME")) "/bin/"))
;;   (setq lsp-dart-sdk-dir (concat (replace-regexp-in-string "\\\\" "/" (getenv "FLUTTER_HOME")) "/bin/"))
;;   ;; :config
;;   ;; (or
;;   ;;  lsp-dart-server-command
;;   ;;  `(,(expand-file-name (f-join lsp-dart-sdk-dir "bin/dart"))
;;   ;;    ,(expand-file-name (f-join lsp-dart-sdk-dir "bin/snapshots/analysis_server.dart.snapshot"))
;;   ;;    "--lsp"))
;;   )

;; (use-package flutter
;;   :after dart-mode
;;   :bind (:map dart-mode-map
;;               ("C-M-x" . #'flutter-run-or-hot-reload)))


;; Optional Flutter packages
;; (use-package hover
;;   :after flutter
;;   :ensure t) 
;; run app from desktop without emulator


;; ===================================================
;;
;; omnisharp config
;;
;; =================================================
(use-package csharp-mode
  :mode "\\.cs"
  )
(use-package omnisharp
  :init
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  (add-hook 'csharp-mode-hook #'company-mode)
  :hook ((csharp-mode . (lambda ()
			  (add-to-list (make-local-variable 'company-backends) 'company-omnisharp )))
	 (csharp-mode . omnisharp-mode)
	 (csharp-mode . company-mode)
	 (csharp-mode . (lambda () (omnisharp-start-omnisharp-server))))
  )

;;(add-hook 'csharp-mode-hook (lambda () (lsp-bridge-mode)))
;; ===================================================
;;
;; rust config
;;
;; =================================================
;; (use-package rust-mode
;;   :mode "\\.rs")
;; (use-package cargo
;;   :after (rust-mode)
;;   :hook (rust-mode . cargo-minor-mode))
;; (use-package racer
;;   :after (rust-mode)
;;   :init
;;   (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
;;   (setq racer-rust-src-path "~/git/projetos/rust/src") ;; Rust source code PATH)
;;   :hook (rust-mode . racer-mode))
;; (use-package eldoc
;;   :after (rust-mode)
;;   :hook (racer-mode . eldoc-mode))
;; (use-package company-racer
;;   :after (rust-mode)
;;   :hook (racer-mode . company-mode))
;; (use-package flycheck-rust
;;   :after (rust-mode))

;; ===================================================
;;
;; web config
;;
;; =================================================
;; (use-package company-web
;;   :after (web-mode)
;;   :ensure t)

;; (use-package web-mode
;;   :mode ("\\.blade.php\\'" "\\.html\\'" "\\.css\\'" "\\.tsx\\'" "\\.jsx\\'")
;;   :hook (web-mode . (lambda ()
;; 		      (require 'company-web-html)
;; 		      (require 'company-web-jade)
;; 		      (require 'company-web-slim)
;; 			(when (string-equal "tsx" (file-name-extension buffer-file-name))
;; 			  (setup-tide-mode))
;; 			(when (string-equal "jsx" (file-name-extension buffer-file-name))
;; 			  (setup-tide-mode))
;; 			(add-to-list (make-local-variable 'company-backends) 'company-web-html t)
;; 			(add-to-list 'company-backends 'company-web-jade t)
;; 			(add-to-list 'company-backends 'company-web-slim t)
;; 			(lsp-deferred))))
;; (use-package vue-mode
;;   :mode "\\.vue")

;; ===================================================
;;
;; php config
;;
;; =================================================
;; (use-package php-mode
;;   :mode "\\php")

;; ===================================================
;;
;; html config
;;
;; =================================================
(add-hook 'html-mode-hook (lambda () (lsp-bridge-mode)))

;; ===================================================
;;
;; css config
;;
;; =================================================
(add-hook 'css-mode-hook (lambda () (lsp-bridge-mode)))


;; ===================================================
;;
;; javascript config
;;
;; =================================================
(add-hook 'javascript-mode-hook (lambda () (lsp-bridge-mode)))

;; (use-package js2-mode
;;   :ensure t
;;   :mode "\\.js"
;;   :hook ((js2-mode . (lambda()
;; 		       (add-to-list
;; 			(make-local-variable 'company-backends)
;; 			'company-tern
;; 			)))))

;; (use-package tern
;;   :ensure t
;;   :hook (js2-mode . tern-mode))

;; (use-package import-js
;;   :after js2-mode)

;; ;; (use-package tide)
;; (use-package typescript-mode
;;   :ensure t)
;; ;; (use-package tide
;; ;;   :ensure t
;; ;;   :after (typescript-mode company flycheck)
;; ;;   :hook ((typescript-mode . tide-setup)
;; ;;          (typescript-mode . tide-hl-identifier-mode)
;; ;;          (before-save . tide-format-before-save)))
;; (use-package js2-refactor
;;   :hook (js2-mode . js2-refactor-mode))
;; (use-package skewer-mode
;;   :ensure t
;;   :hook ((js2-mode . skewer-mode)
;; 	 (css-mode . skewer-css-mode)
;; 	 (web-mode . skewer-html-mode)))
;; (use-package livid-mode
;;   :ensure t
;;   :after (js2-mode))
;; (use-package web-beautify)

;; (use-package nodejs-repl
;;   :ensure t)
;; (use-package js2-highlight-vars)
;; (use-package eslint-fix
;;   :init (add-hook 'rjsx-mode-hook 
;;           (lambda () 
;;              (add-hook 'after-save-hook 'eslint-fix nil 'make-it-local))))
;; (use-package xref-js2
;;   :hook (js2-mode . (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))
;; (use-package indium)
;; (use-package company-tern
;;   :hook (rjsx-mode tern-mode))


;; ===================================================
;;
;; angular  config
;;
;; =================================================
;; (use-package typescript-mode
;;   :ensure t)
;; (use-package ng2-mode)




;;==============================================================
;;
;; Yaml
;;
;;==============================================================
;; (use-package yaml-mode
;;   :mode "\\y\\(aml\\|ml\\)$")
;; (use-package flycheck-yamllint
;;   :after yaml-mode)
;;==============================================================



;;==============================================================
;;
;; Gradle
;;
;;==============================================================

;; (use-package gradle-mode )
;; (use-package flycheck-gradle )
;; (use-package groovy-mode )
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
(use-package cider-decompile
  :after (clojure-mode))
;; (use-package cider-eval-sexp-fu)
(use-package cider-hydra
  :after (clojure-mode))

;=================================================================



;; ==================================================================
;;
;; scala config
;;
;; ==================================================================

;; Enable scala-mode and sbt-mode

;; (use-package scala-mode
;;   :mode "\\.s\\(cala\\|bt\\)$")

;; (use-package sbt-mode
;;   :commands sbt-start sbt-command
;;   :after (scala-mode)
;;   :config
;;   ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
;;   ;; allows using SPACE when in the minibuffer
;;   (substitute-key-definition
;;    'minibuffer-complete-word
;;    'self-insert-command
;;    minibuffer-local-completion-map))

;; Enable nice rendering of diagnostics like compile errors.

;; ;;ensime for scala
;; (use-package ensime :demand t)

;; ==================================================================




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

(add-hook 'c-mode-hook (lambda () (lsp-bridge-mode)))
;; ==================================================================






;;===================================================================
;;
;; Java
;;
;;===================================================================
(add-hook 'java-mode (lambda () (lsp-bridge-mode)))

;; (use-package meghanada
;;   :hook (java-mode . meghanada-mode)
;;   :config
;;   (flycheck-mode +1)
;;   (cond
;;    ((eq system-type 'windows-nt)
;;     (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
;;     (setq meghanada-maven-path "mvn.cmd"))
;;    (t
;;     (setq meghanada-java-path "java")
;;     (setq meghanada-maven-path "mvn"))))

;; eclipse-java-style is the same as the "java" style (copied from
;; cc-styles.el) with the addition of (arglist-cont-nonempty . ++) to
;; c-offsets-alist to make it more like default Eclipse formatting -- function
;; arguments starting on a new line are indented by 8 characters
;; (++ = 2 x normal offset) rather than lined up with the arguments on the
;; previous line
;; (defconst eclipse-java-style
;;   '((c-basic-offset . 4)
;;     (c-comment-only-line-offset . (0 . 0))
;;     ;; the following preserves Javadoc starter lines
;;     (c-offsets-alist . ((inline-open . 0)
;;                         (topmost-intro-cont    . +)
;;                         (statement-block-intro . +)
;;                         (knr-argdecl-intro     . 5)
;;                         (substatement-open     . +)
;;                         (substatement-label    . +)
;;                         (label                 . +)
;;                         (statement-case-open   . +)
;;                         (statement-cont        . +)
;;                         (arglist-intro  . c-lineup-arglist-intro-after-paren)
;;                         (arglist-close  . c-lineup-arglist)
;;                         (access-label   . 0)
;;                         (inher-cont     . c-lineup-java-inher)
;;                         (func-decl-cont . c-lineup-java-throws)
;;                         (arglist-cont-nonempty . ++)
;;                         )))
;;   "Eclipse Java Programming Style")
;; (c-add-style "ECLIPSE" eclipse-java-style)
;; (customize-set-variable 'c-default-style (quote ((java-mode . "eclipse") (awk-mode . "awk") (other . "gnu"))))

;; optionally
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



;;================================================================
;;
;; hydra keymap
;;
;;================================================================
;; (defhydra hydra-evil-normal (:color red
;; 			     :hint nil)
;;    "

;;    ^Avy^                     ^Misc^                   ^Window
;;     ^^^^^^------------------------------------------------------
;;   [_ac_] avy goto char  [_bk_] kill buffer        [_w TAB_] other window
;;   [_al_] avy goto line  [_gs_] git status toggle  [_w2_] split window below
;;   [_aw_] avy goto word0 [_ff_] helm-find-file  [_w1_]   delete other window
;;   [_an_] avy goto word1 [_bb_] helm-buffer        [_w0_]   delete window
;;                         [_fs_] save buffer        [_w3_] split right
;;   [_ss_] consult line   [_sm_] consult line multi

;;   [_m_] LSP             [_gg_] GGTAGS
;;   [_p_] Projectile
;; "  
;;   ;; Smart Parens:
;;   ;; [_C-M-f_] forward     [_C-M-b_] backward
;;   ;; [_C-d_] down        [_M-d_] back down
;;   ;; [_C-u_] up            [_M-u_] back up
;;   ;; [_C-M-n_] next        [_C-M-p_] previous
;;   ;; [_C-M-a_] beggining   [_C-M-e_] end
;;   ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
;;   ;; "
;;    ("ac" evil-avy-goto-char :exit t)
;;    ("al" evil-avy-goto-line :exit t)
;;    ("aw" evil-avy-goto-word-0 :exit t)
;;    ("an" evil-avy-goto-word-1 :exit t)
;;    ("gs" magit-status :exit t)
;;    ("ff" find-file :exit t)
;;    ("bb" switch-to-buffer :exit t)
;;    ("w TAB" other-window :exit t)
;;    ("bk" kill-buffer :exit t)
;;    ("w1" delete-other-windows :exit t)
;;    ("w0" delete-window :exit t)
;;    ("w2" split-window-below :exit t)
;;    ("w3" split-window-right :exit t)
;;    ("fs" save-buffer :exit t)
;;    ("m" hydra-lsp/body :exit t)
;;    ("p" hydra-projectile/body :exit t)
;;    ("gg" hydra-ggtags/body :exit t)
;;    ("ss" consult-line :exit t)
;;    ("sm" consult-line-multi :exit t)
;;    ;; ("C-M-f" sp-forward-sexp)
;;    ;; ("C-M-b" sp-backward-sexp)
;;    ;; ("C-d>" sp-down-sexp)
;;    ;; ("M-d>" sp-backward-down-sexp)
;;    ;; ("C-u>" sp-up-sexp)
;;    ;; ("M-u>" sp-backward-up-sexp)
;;    ;; ("C-M-n" sp-next-sexp)
;;    ;; ("C-M-p" sp-previous-sexp)
;;    ;; ("C-M-a" sp-beginning-of-sexp)
;;    ;; ("C-M-e" sp-end-of-sexp)
;;    ;; ("C-S-f" sp-forward-symbol)
;;    ;; ("C-S-b" sp-backward-symbol)
;;    )

;; ;;(evil-define-key 'normal 'global (kbd "SPC") 'hydra-evil-normal/body)
;; (evil-define-key nil evil-normal-state-map (kbd "SPC") 'hydra-evil-normal/body)
;; (evil-define-key 'normal dired-mode-map (kbd "SPC") 'hydra-evil-normal/body)

;; (defhydra hydra-lsp (:color blue
;; 			    :hint nil)
;; "

;;    ^find^                     ^UI^                   ^Window
;;     ^^^^^^------------------------------------------------------
;;   [_gd_] find definition     [_pd_] peek find definition    
;;   [_ga_] find declaration    [_pr_] peek find reference   
;;   [_gs_] find implementation [_sd_] show doc
;;                              [_si_] show imenu
;; "  
;;   ;; Smart Parens:
;;   ;; [_C-M-f_] forward     [_C-M-b_] backward
;;   ;; [_C-d_] down        [_M-d_] back down
;;   ;; [_C-u_] up            [_M-u_] back up
;;   ;; [_C-M-n_] next        [_C-M-p_] previous
;;   ;; [_C-M-a_] beggining   [_C-M-e_] end
;;   ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
;;   ;; "
;;    ("gd" lsp-find-definition)
;;    ("ga" lsp-find-declaration)
;;    ("gs" lsp-find-implementation)
;;    ("pd" lsp-ui-peek-find-definitions)
;;    ("sd" lsp-ui-doc-show)
;;    ("si" lsp-ui-imenu)
;;    ;;("pa" lsp-ui-peek-find-declarations)
;;    ;;("ps" lsp-ui-peek-find-implementations)
;;    ("pr" lsp-ui-peek-find-references)
;;    )

;; (defhydra hydra-projectile (:color blue
;; 				   :hint nil)
;;    "
;;    ^find^  
;;     ^^^^^^------------------------------------------------------
;;   [_f_] find file                             
;;   [_s_] switch project
;; "  
;;   ;; Smart Parens:
;;   ;; [_C-M-f_] forward     [_C-M-b_] backward
;;   ;; [_C-d_] down        [_M-d_] back down
;;   ;; [_C-u_] up            [_M-u_] back up
;;   ;; [_C-M-n_] next        [_C-M-p_] previous
;;   ;; [_C-M-a_] beggining   [_C-M-e_] end
;;   ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
;;   ;; "
;;    ("f" projectile-find-file)
;;    ("s" projectile-switch-project)
;;    )

;; (defhydra hydra-ggtags (:color blue
;; 				   :hint nil)
;;    "
;;    ^find^  
;;     ^^^^^^------------------------------------------------------
;;   [_n_] next     [_g_] grep  [_ff_] find [_fh_] find-here  [_d_] delete-tag  [_r_] f-regex [_fs_] find-symbol
;;   [_p_] previous [_v_] f-dwim  [_1_] f-reference [_s_] show-definition [_fr_] find-reference
;;   [_SPC_] register [_hh_] history [_o_] f-other [_m_] search-history [_b_] browse-hypertext 
;;   [_hn_] next-history [_hp_] prev-history [_ts_] show-stack
;; " 
;;   ;; Smart Parens:
;;   ;; [_C-M-f_] forward     [_C-M-b_] backward
;;   ;; [_C-d_] down        [_M-d_] back down
;;   ;; [_C-u_] up            [_M-u_] back up
;;   ;; [_C-M-n_] next        [_C-M-p_] previous
;;   ;; [_C-M-a_] beggining   [_C-M-e_] end
;;   ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
;;   ;; "
;;    ("n" ggtags-next-mark)
;;    ("p" ggtags-prev-mark)
;;    ("ff" helm-gtags-find-tag)
;;    ("fh" helm-gtags-find-tag-from-here)
;;    ("fr" helm-gtags-find-rtag)
;;    ("fs" helm-gtags-find-symbol)
;;    ("g" ggtags-grep)
;;    ("d" ggtags-delete-tags)
;;    ("r" ggtags-find-tag-regexp)
;;    ("v" helm-gtags-dwim)
;;    ("1" ggtags-find-reference)
;;    ("s" ggtags-show-definition)
;;    ("SPC" ggtags-save-to-register)
;;    ("hh" ggtags-view-tag-history)
;;    ("hn" helm-gtags-next-history)
;;    ("hp" helm-gtags-previous-history)
;;    ("o" ggtags-find-other-symbol)
;;    ("m" ggtags-view-search-history)
;;    ("b" ggtags-browse-file-as-hypertext)
;;    ("ts" helm-gtags-show-stack)
;;    )


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
    (setq inferior-lisp-program "sbcl")
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

(electric-pair-mode 1)
(setq vc-make-backup-files t)


;; ==============================================================
;;
;; emacs backups
;;
;; ============================================================

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
	     (lsp-bridge-mode)
	     (eldoc-mode)
	     (rainbow-delimiters-mode)))


(general-define-key
 :states '(normal  visual insert emacs)
 :prefix "SPC"
 :keymaps '(override pdf-view-mode)
 :non-normal-prefix "C-SPC"
 "za" 'find-file
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bmkp/stld-publ")
 '(c-default-style '((awk-mode . "awk") (other . "gnu")))
 '(custom-safe-themes
	 '("7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "816bacf37139d6204b761fea0d25f7f2f43b94affa14aa4598bce46157c160c2" "7675ffd2f5cb01a7aab53bcdd702fa019b56c764900f2eea0f74ccfc8e854386" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" default))
 '(package-selected-packages
	 '(ah evil-search-highlight-persist vundo evil-anzu anzu highlight-indentation omnisharp csharp-mode el-get use-package-git avy posframe markdown-mode company-quickhelp helpful auto-yasnippet highlight-indent-guides dimmer beacon evil-vimish-fold nav-flash editorconfig pdf-tools all-the-icons-dired dired-sidebar dired-collapse dired-ranger dired-filter all-the-icons-ibuffer slime-company general yasnippet-snippets dired-subtree meghanada magit ag)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
