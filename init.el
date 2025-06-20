(require 'package)
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


(setq ac-disable-faces nil)

;;(setenv "LSP_USE_PLISTS" "true")
(defvar xdg-home (concat (getenv "XDG_CONFIG_HOME") "/emacs/"))

;; ;;(load-file (concat xdg-home "/.gashu/el-get.el"))
(use-package async)
(use-package popup)
(load-file (concat xdg-home ".gashu/straight.el"))
(load-file (concat xdg-home ".gashu/auto-update-config.el"))
(load-file (concat xdg-home ".gashu/setup-load-path.el"))
(load-file (concat xdg-home ".gashu/ui.el"))
(load-file (concat xdg-home ".gashu/general.el"))
(load-file (concat xdg-home ".gashu/vertico.el"))
(load-file (concat xdg-home ".gashu/tree-sit.el"))
(load-file (concat xdg-home ".gashu/yasnippet.el"))
(load-file (concat xdg-home ".gashu/lsp-bridge.el"))
;; ;;(load-file "~/.gashu/eglot.el")
(when (string= system-type "gnu/linux")
	(load-file (concat xdg-home ".gashu/lspce.el")))
(load-file (concat xdg-home ".gashu/magit.el"))
(load-file (concat xdg-home ".gashu/which-key.el"))
(load-file (concat xdg-home ".gashu/ag.el"))
(load-file (concat xdg-home ".gashu/flycheck.el"))
;; ;;(use-package hydra)
(load-file (concat xdg-home ".gashu/winum.el"))
;;(load-file "~/.gashu/pdf.el")
(load-file (concat xdg-home ".gashu/undo.el"))
(load-file (concat xdg-home ".gashu/editorconfig.el"))
(load-file (concat xdg-home ".gashu/helpful.el"))
(load-file (concat xdg-home ".gashu/avy.el"))
(load-file (concat xdg-home ".gashu/search-config.el"))
(load-file (concat xdg-home ".gashu/additional-hooks.el"))
(load-file (concat xdg-home ".gashu/bookmark+.el"))
;;(load-file (concat xdg-home ".gashu/bm.el"))
;; ;;(load-file (concat xdg-home "/.gashu/dired+.el"))
(load-file (concat xdg-home ".gashu/dired-stuff.el"))
(load-file (concat xdg-home ".gashu/evil.el"))
(load-file (concat xdg-home ".gashu/projectile.el"))
(load-file (concat xdg-home ".gashu/corfu.el"))
(load-file (concat xdg-home ".gashu/tempel.el"))
;;(load-file (concat xdg-home ".gashu/company.el"))
(load-file (concat xdg-home ".gashu/lsp.el"))
(load-file (concat xdg-home ".gashu/debug.el"))
;;; (load-file (concat xdg-home ".gashu/flutter.el"))
;;;(load-file (concat xdg-home ".gashu/omnisharp.el"))
(load-file (concat xdg-home ".gashu/csharp.el"))
;;; (load-file (concat xdg-home ".gashu/rust.el"))
;;;(load-file (concat xdg-home ".gashu/web.el"))
(load-file (concat xdg-home ".gashu/smerge.el"))
;;(load-file (concat xdg-home ".gashu/php.el"))
;;(load-file (concat xdg-home ".gashu/lsp-bridge-hooks.el"))
(load-file (concat xdg-home ".gashu/javascript.el"))
;;;(load-file (concat xdg-home ".gashu/react.el"))
;;(load-file (concat xdg-home ".gashu/clojure.el"))
;;(load-file (concat xdg-home ".gashu/schala.el"))
(load-file (concat xdg-home ".gashu/cpp.el"))
(load-file (concat xdg-home ".gashu/zig.el"))
(when (string= system-type "gnu/linux")
	(load-file (concat xdg-home ".gashu/java.el")))
(load-file (concat xdg-home ".gashu/lilypond.el"))
;; (load-file (concat xdg-home ".gashu/hydra-keys.el"))
;; (load-file (concat xdg-home ".gashu/slime.el"))
(load-file (concat xdg-home ".gashu/sly.el"))
(load-file (concat xdg-home ".gashu/config.el"))
(load-file (concat xdg-home ".gashu/lisp.el"))
;; (load-file (concat xdg-home ".gashu/eaf.el"))
;; (load-file (concat xdg-home ".gashu/citre.el"))
(when (string= system-type "gnu/linux")
	(load-file (concat xdg-home ".gashu/vterm.el")))
(load-file (concat xdg-home ".gashu/ibuffer.el"))
(load-file (concat xdg-home ".gashu/workspaces.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("1e6997bc08f0b11a2b5b6253525aed4e1eb314715076a0c0c2486bd97569f18a"
		 "21eb44ad0e958f71261c436a06577dc114b2850e5a82bc12314cf63c2d2d1db5"
		 "c341518f5a80752f3113699a7f845dfc7299667311858e7cdfe64677d359d87e"
		 "ca2ce81d33e0b4bd0fdf20caefdde9cb617fec42eeeaf5cd79c80d630bd5cf6a"
		 "3538194fff1b928df280dc08f041518a8d51ac3ff704c5e46d1517f5c4d8a0e0"
		 "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940"
		 "48d34b6afe72407ca494387c8bea495bb2deee96bd88516f302db1f11e1810a1"
		 "6fc9e40b4375d9d8d0d9521505849ab4d04220ed470db0b78b700230da0a86c1"
		 "76ddb2e196c6ba8f380c23d169cf2c8f561fd2013ad54b987c516d3cabc00216"
		 "257ee2d8d202ff5551dda3deb080b227926ff0d10b91be7971224e38cf44d167"
		 "4d16802de4686030ed8f30b5a844713d68edec9cc07322bef54493d15e68d8cd"
		 "e9aa348abd3713a75f2c5ba279aa581b1c6ec187ebefbfa33373083ff8004c7c"
		 "6454421996f0508c38215a633256e36c19a28591542fb0946cfc40f1dceb89cf"
		 "c46651ab216eb31e699be1bd5e6df8229b08005b534194c1ea92519b09661d71"
		 "e8183add41107592ee785f9f9b4b08d21bd6c43206b85bded889cea1ee231337"
		 "c0aa9e26715866404ac854a1023a177742b41a3a6b0fdbfe68d9f5414e24e170"
		 "77f281064ea1c8b14938866e21c4e51e4168e05db98863bd7430f1352cab294a"
		 "5e39e95c703e17a743fb05a132d727aa1d69d9d2c9cde9353f5350e545c793d4"
		 "aa545934ce1b6fd16b4db2cf6c2ccf126249a66712786dd70f880806a187ac0b"
		 "1ad12cda71588cc82e74f1cabeed99705c6a60d23ee1bb355c293ba9c000d4ac"
		 "ae20535e46a88faea5d65775ca5510c7385cbf334dfa7dde93c0cd22ed663ba0"
		 "3da6101810df2607bc08d0542c34095dcd27ecd5a49ca6e6bcf2fc0d7de59cb3"
		 "8899e88d19a37d39c7187f4bcb5bb596fba990728ef963420b93e2aea5d1666a"
		 "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
		 "5c7720c63b729140ed88cf35413f36c728ab7c70f8cd8422d9ee1cedeb618de5"
		 "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d"
		 "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af"
		 "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
		 "2b20b4633721cc23869499012a69894293d49e147feeb833663fdc968f240873"
		 "30d174000ea9cbddecd6cc695943afb7dba66b302a14f9db5dd65074e70cc744"
		 "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19"
		 "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec"
		 "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66"
		 "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
		 "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69"
		 "e14884c30d875c64f6a9cdd68fe87ef94385550cab4890182197b95d53a7cf40"
		 "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9"
		 "6f96a9ece5fdd0d3e04daea6aa63e13be26b48717820aa7b5889c602764cf23a"
		 "d6b934330450d9de1112cbb7617eaf929244d192c4ffb1b9e6b63ad574784aad"
		 "4e2e42e9306813763e2e62f115da71b485458a36e8b4c24e17a2168c45c9cf9d"
		 "691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b"
		 default))
 '(safe-local-variable-values
	 '((Package . BORDEAUX-THREADS-2) (Syntax . ANSI-Common-lisp)
		 (evil-shift-width . 2) (evil-shift-width . 3)
		 (evil-shift-width . 4) (Package . CL-UNICODE)
		 (Package . FLEXI-STREAMS) (package . puri) (Package . CHUNGA)
		 (Package . GMap) (Package . Lexical-Contexts) (Package . CL-User)
		 (eval put 'test-js-eval 'common-lisp-indent-function 1)
		 (eval put 'test-ps-js 'common-lisp-indent-function 1)
		 (Package . CL-PPCRE) (Package . containers)
		 (Package . metabang.moptilities) (Base . 10) (Package . DRAKMA)
		 (Syntax . COMMON-LISP) (Syntax . ANSI-Common-Lisp)
		 (Package . FSet)
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

