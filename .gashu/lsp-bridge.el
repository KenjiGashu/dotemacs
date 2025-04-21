(use-package posframe :ensure t
  :demand t)


(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;;(add-to-list 'load-path "~/.emacs.d/straight/build/lsp-bridge/")

;;install lsp-bridge if its not installed yet:
(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :init
  ;;(global-lsp-bridge-mode)
	)

;;(require 'lsp-bridge)

(require 'lsp-bridge-jdtls)  
(setq lsp-bridge-enable-auto-import t) 
(setq lsp-bridge-jdtls-jvm-args '("-javaagent:/home/kenjigashu/jars/lombok.jar"))

(setq lsp-bridge-python-command "python3")

;;(global-lsp-bridge-mode)
(setq acm-enable-quick-access 1)
;; (setq lsp-bridge-get-workspace-folder nil)
(setq lsp-bridge-enable-log 1)
(setq acm-enable-tempel 1)
(setq acm-backend-lsp-show-progress 1)
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

