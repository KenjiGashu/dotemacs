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

;;(load-file "~/.gashu/el-get.el")
(load-file "~/.gashu/straight.el")
(load-file "~/.gashu/auto-update-config.el")
(load-file "~/.gashu/setup-load-path.el")
(load-file "~/.gashu/ui.el")
(load-file "~/.gashu/general.el")
(load-file "~/.gashu/vertico.el")
(load-file "~/.gashu/tree-sit.el")
;;(load-file "~/.gashu/yasnippet.el")
(use-package async)
(use-package popup)
;;(load-file "~/.gashu/lsp-bridge.el")
(load-file "~/.gashu/eglot.el")
(load-file "~/.gashu/magit.el")
(load-file "~/.gashu/which-key.el")
(load-file "~/.gashu/ag.el")
(load-file "~/.gashu/flycheck.el")
;;(use-package hydra)
(load-file "~/.gashu/winum.el")
(load-file "~/.gashu/pdf.el")
(load-file "~/.gashu/undo.el")
(load-file "~/.gashu/editorconfig.el")
(load-file "~/.gashu//helpful.el")
(load-file "~/.gashu//avy.el")
(load-file "~/.gashu/search-config.el")
(load-file "~/.gashu//additional-hooks.el")
;;(load-file "~/.gashu/bookmark+.el")
(load-file "~/.gashu/bm.el")
;;(load-file "~/.gashu/dired+.el")
(load-file "~/.gashu/dired-stuff.el")
(load-file "~/.gashu/evil.el")
(load-file "~/.gashu/projectile.el")
(load-file "~/.gashu/corfu.el")
(load-file "~/.gashu/tempel.el")
;;(load-file "~/.gashu/company.el")
;;(load-file "~/.gashu/lsp.el")
(load-file "~/.gashu/debug.el")
;;(load-file "~/.gashu/flutter.el")
;;(load-file "~/.gashu/omnisharp.el")
(load-file "~/.gashu/csharp.el")
;;(load-file "~/.gashu/rust.el")
;;(load-file "~/.gashu/web.el")
(load-file "~/.gashu/smerge.el")
;;(load-file "~/.gashu/php.el")
;;(load-file "~/.gashu/lsp-bridge-hooks.el")
(load-file "~/.gashu/javascript.el")
;;(load-file "~/.gashu/react.el")
(load-file "~/.gashu/clojure.el")
;;(load-file "~/.gashu/schala.el")
(load-file "~/.gashu/cpp.el")
(load-file "~/.gashu/zig.el")
(load-file "~/.gashu/java.el")
(load-file "~/.gashu/lilypond.el")
;;(load-file "~/.gashu/hydra-keys.el")
;;(load-file "~/.gashu/slime.el")
(load-file "~/.gashu/sly.el")
(load-file "~/.gashu/config.el")
(load-file "~/.gashu/lisp.el")
(load-file "~/.gashu/eaf.el")
(load-file "~/.gashu/citre.el")
(load-file "~/.gashu/vterm.el")
(load-file "~/.gashu/ibuffer.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-visited-mode t)
 '(lsp-bridge-get-workspace-folder 'my-lsp-bridge-workspace)
 '(package-selected-packages nil)
 '(safe-local-variable-values
	 '((Package . CL-UNICODE) (Package . FLEXI-STREAMS) (package . puri)
		 (Package . CHUNGA) (Package . GMap) (Package . Lexical-Contexts)
		 (Package . CL-User)
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
