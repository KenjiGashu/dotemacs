;; emacs conf --- configuration
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

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; Enable defer and ensure by default for use-package
;;(setq use-package-always-defer t)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;;(load-file "~/.gashu/el-get.el")

(load-file "~/.gashu/auto-update-config.el")

(load-file "~/.gashu/setup-load-path.el")

(load-file "~/.gashu/ui.el")

(load-file "~/.gashu/general.el")

(load-file "~/.gashu/vertico.el")

(load-file "~/.gashu/tree-sit.el")

(load-file "~/.gashu/yasnippet.el")

(load-file "~/.gashu/magit.el")

;; ==================================================================
;;
;; init some things
;;
;; =================================================================


(use-package async)
(use-package popup)

(load-file "~/.gashu/lsp-bridge.el")


(load-file "~/.gashu/which-key.el")

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

(load-file "~/.gashu/winum.el")

(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode))

(load-file "~/.gashu/undo.el")

(load-file "~/.gashu/editorconfig.el")

(load-file "~/.gashu//helpful.el")

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

(load-file "~/.gashu/search-config.el")

(use-package ah
	:ensure t
	:after evil-search-highlight-persist
	:config
	(ah-mode 1)
	(add-hook 'ah-after-c-g-hook (lambda () (evil-search-highlight-persist-remove-all)))
	)



(load-file "~/.gashu/bookmark+.el")


(load-file "~/.gashu/dired+.el")

(load-file "~/.gashu/dired-stuff.el")

(load-file "~/.gashu/evil.el")

;; (use-package dockerfile-mode
;;   :ensure t
;;   :mode "\\Dockerfile")

(load-file "~/.gashu/projectile.el")

(load-file "~/.gashu/company.el")

;;lsp config
;;(load-file "~/.gashu/lsp.el")

;;debugger
(load-file "~/.gashu/debug.el")

;;(load-file "~/.gashu/flutter.el")

(load-file "~/.gashu/omnisharp.el")

;;(load-file "~/.gashu/rust.el")

;;(load-file "~/.gashu/web.el")

(load-file "~/.gashu/smerge.el")

;; ===================================================
;;
;; php config
;;
;; =================================================
;; (use-package php-mode
;;   :mode "\\php")

;;(load-file "~/.gashu/lsp-bridge-hooks.el")

;;(load-file "~/.gashu/javascript.el")

;;(load-file "~/.gashu/react.el")

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


;;(load-file "~/.gashu/schala.el")


(load-file "~/.gashu/cpp.el")

(load-file "~/.gashu/zig.el")

(load-file "~/.gashu/java.el")


;;
;; lilypond
;;

(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode)) 


;;(load-file "~/.gashu/hydra-keys.el")

;;(load-file "~/.gashu/slime.el")
(load-file "~/.gashu/sly.el")

(load-file "~/.gashu/config.el")

(load-file "~/.gashu/hooks.el")

(load-file "~/.gashu/eaf.el")

(load-file "~/.gashu/citre.el")

(use-package vterm
    :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-bridge-get-workspace-folder 'my-lsp-bridge-workspace)
 '(package-selected-packages
	 '(ag ah all-the-icons-dired all-the-icons-ibuffer async
				auto-package-update auto-yasnippet beacon bui cider-decompile
				cider-hydra citre company-quickhelp consult dap-mode
				dap-netcore dimmer dired-collapse dired-filter dired-ranger
				dired-sidebar doom-modeline doom-themes editorconfig evil-anzu
				evil-collection evil-mc evil-org evil-search-highlight-persist
				evil-vimish-fold flycheck-clang-tidy geiser general helpful
				highlight-blocks highlight-indent-guides lsp-bridge lsp-docker
				lsp-treemacs magit marginalia modern-cpp-font-lock nav-flash
				omnisharp orderless pdf-tools projectile rainbow-delimiters
				realgud sly-asdf tree-sitter tree-sitter-lang
				tree-sitter-langs undo-tree vertico vterm vundo which-key
				winum yasnippet-snippets zig-mode))
 '(package-vc-selected-packages
	 '((lsp-bridge :url "https://github.com/manateelazycat/lsp-bridge.git")))
 '(safe-local-variable-values
	 '((Base . 10) (Package . DRAKMA) (Syntax . COMMON-LISP)
		 (Syntax . ANSI-Common-Lisp) (Package . FSet)
		 (eval cl-flet
					 ((enhance-imenu-lisp (&rest keywords)
																(dolist (keyword keywords)
																	(let
																			((prefix
																				(when (listp keyword)
																					(cl-second keyword)))
																			 (keyword
																				(if (listp keyword)
																						(cl-first keyword)
																					keyword)))
																		(add-to-list
																		 'lisp-imenu-generic-expression
																		 (list
																			(purecopy
																			 (concat (capitalize keyword)
																							 (if
																									 (string=
																										(substring-no-properties
																										 keyword -1)
																										"s")
																									 "es"
																								 "s")))
																			(purecopy
																			 (concat "^\\s-*("
																							 (regexp-opt
																								(list
																								 (if prefix
																										 (concat prefix
																														 "-"
																														 keyword)
																									 keyword)
																								 (concat prefix "-"
																												 keyword))
																								t)
																							 "\\s-+\\("
																							 lisp-mode-symbol-regexp
																							 "\\)"))
																			2))))))
					 (enhance-imenu-lisp '("bookmarklet-command" "define")
															 '("class" "define")
															 '("command" "define")
															 '("ffi-method" "define")
															 '("ffi-generic" "define")
															 '("function" "define")
															 '("internal-page-command" "define")
															 '("internal-page-command-global"
																 "define")
															 '("mode" "define")
															 '("parenscript" "define") "defpsmacro")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
