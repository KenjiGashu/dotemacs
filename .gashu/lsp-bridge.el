(use-package posframe :ensure t
  :demand t)


(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(when (string= system-type "windows-nt")
	(add-to-list 'load-path (concat xdg-home ".emacs.d/site-lisp/lsp-bridge/"))
	(require 'lsp-bridge))

;;install lsp-bridge if its not installed yet:
(when (string= system-type "gnu/linux")
	(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :init
  ;;(global-lsp-bridge-mode)
	))

;;java
(setq lsp-bridge-enable-auto-import t) ;; 开启自动导入依赖，目前没有code action。补全时可以通过这个导入相应的依赖，建议开启。
(setq lsp-bridge-jdtls-jvm-args '("-javaagent:/home/kenjigashu/repo/lombok.jar"))
(require 'lsp-bridge-jdtls)

(if (string= system-type "windows-nt")
		(setq lsp-bridge-python-command "python")
	(setq lsp-bridge-python-command "python3"))

(setq lsp-bridge-user-multiserver-dir (concat xdg-home ".gashu/multiserver"))
(setq lsp-bridge-user-langserver-dir (concat xdg-home ".gashu/langserver"))


;; (defcustom lsp-bridge-multi-lang-server-extension-list
;;   '(
;;     (("js" "jsx")   . "javascript_tailwindcss")
;;     )
;;   "The multi lang server rule for file extension."
;;   :type 'cons)
(setq lsp-bridge-multi-lang-server-extension-list
  '(
    (("ts" )   . "typescript_eslint")
    (("tsx" )   . "typescriptreact_eslint_tailwindcss")
    (("jsx" )   . "javascript_tailwindcss")
		(("html") . "html_and_tailwindcss")
    )
  )

;;(global-lsp-bridge-mode)
(setq acm-enable-quick-access 1)
;; (setq lsp-bridge-get-workspace-folder nil)
(setq lsp-bridge-enable-log 1)
(setq acm-enable-tempel 1)
(setq acm-backend-lsp-show-progress 1)
(setq lsp-bridge-enable-debug 1)
(setq lsp-bridge-log-level 'debug)
(setq lsp-bridge-enable-completion-in-string t)
(setq acm-backend-lsp-candidates-max-number 80)
(add-hook 'rjsx-mode-hook (lambda () (setq-local acm-backend-lsp-match-mode "prefix")))
;;(setq acm-enable-citre 1)
;;(setq lsp-bridge-defaul-mode-hooks '(c-mode c++-mode zig-mode elisp-mode shell-script-mode))

;;hooks
;; (add-hook 'emacs-lisp-mode-hook 'lsp-bridge-mode)
;; (add-hook 'c-mode-hook 'lsp-bridge-mode)
;; (add-hook 'c++-mode-hook 'lsp-bridge-mode)
;; (add-hook 'js-mode-hook 'lsp-bridge-mode)
;; (add-hook 'zig-mode-hook 'lsp-bridge-mode)
;; (add-hook 'sh-mode-hook 'lsp-bridge-mode)


(general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(lsp-bridge-mode-map)
   :non-normal-prefix "C-SPC"
   "ld" 'lsp-bridge-find-def
   "li" 'lsp-bridge-find-impl
   "lr" 'lsp-bridge-find-references
   "la" 'lsp-bridge-code-action
	 "lp" 'lsp-bridge-peek)

(general-define-key
   :states '(insert emacs)
   :keymaps '(lsp-bridge-mode-map)
   "C-M-i" 'lsp-bridge-popup-complete-menu)


;;(setq lsp-bridge-csharp-lsp-server "omnisharp-mono")
;;(setq lsp-bridge-csharp-lsp-server "csharp-ls")
;;(setq lsp-bridge-csharp-lsp-server "omnisharp-dotnet")

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

