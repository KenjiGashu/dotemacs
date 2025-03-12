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


;;(setenv "LSP_USE_PLISTS" "true")

;; ;;(load-file "~/.gashu/el-get.el")
(load-file "~/.gashu/straight.el")
(load-file "~/.gashu/auto-update-config.el")
(load-file "~/.gashu/setup-load-path.el")
(load-file "~/.gashu/ui.el")
(load-file "~/.gashu/general.el")
(load-file "~/.gashu/vertico.el")
(load-file "~/.gashu/tree-sit.el")
(load-file "~/.gashu/yasnippet.el")
(use-package async)
(use-package popup)
;; ;;(load-file "~/.gashu/lsp-bridge.el")
;; ;;(load-file "~/.gashu/eglot.el")
(load-file "~/.gashu/lspce.el")
(load-file "~/.gashu/magit.el")
(load-file "~/.gashu/which-key.el")
(load-file "~/.gashu/ag.el")
(load-file "~/.gashu/flycheck.el")
;; ;;(use-package hydra)
(load-file "~/.gashu/winum.el")
;;(load-file "~/.gashu/pdf.el")
(load-file "~/.gashu/undo.el")
(load-file "~/.gashu/editorconfig.el")
(load-file "~/.gashu//helpful.el")
(load-file "~/.gashu//avy.el")
(load-file "~/.gashu/search-config.el")
(load-file "~/.gashu//additional-hooks.el")
;; ;;(load-file "~/.gashu/bookmark+.el")
(load-file "~/.gashu/bm.el")
;; ;;(load-file "~/.gashu/dired+.el")
(load-file "~/.gashu/dired-stuff.el")
(load-file "~/.gashu/evil.el")
(load-file "~/.gashu/projectile.el")
(load-file "~/.gashu/corfu.el")
(load-file "~/.gashu/tempel.el")
;; ;;(load-file "~/.gashu/company.el")
(load-file "~/.gashu/lsp.el")
(load-file "~/.gashu/debug.el")
;; ;;(load-file "~/.gashu/flutter.el")
;; ;;(load-file "~/.gashu/omnisharp.el")
;; ;;(load-file "~/.gashu/csharp.el")
;; ;;(load-file "~/.gashu/rust.el")
;; ;;(load-file "~/.gashu/web.el")
(load-file "~/.gashu/smerge.el")
;; ;;(load-file "~/.gashu/php.el")
;; ;;(load-file "~/.gashu/lsp-bridge-hooks.el")
(load-file "~/.gashu/javascript.el")
;; ;;(load-file "~/.gashu/react.el")
;; ;;(load-file "~/.gashu/clojure.el")
;; ;;(load-file "~/.gashu/schala.el")
(load-file "~/.gashu/cpp.el")
(load-file "~/.gashu/zig.el")
(load-file "~/.gashu/java.el")
(load-file "~/.gashu/lilypond.el")
;; ;;(load-file "~/.gashu/hydra-keys.el")
;; ;;(load-file "~/.gashu/slime.el")
(load-file "~/.gashu/sly.el")
(load-file "~/.gashu/config.el")
(load-file "~/.gashu/lisp.el")
;; ;;(load-file "~/.gashu/eaf.el")
;; ;;(load-file "~/.gashu/citre.el")
(load-file "~/.gashu/vterm.el")
(load-file "~/.gashu/ibuffer.el")
(load-file "~/.gashu/workspaces.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
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

