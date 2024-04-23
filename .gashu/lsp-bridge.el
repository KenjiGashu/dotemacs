(use-package posframe :ensure t
  :demand t)


(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;; install lsp-bridge if its not installed yet:
(unless (require 'lsp-bridge nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
	(package-vc-install
   '(lsp-bridge :url "https://github.com/manateelazycat/lsp-bridge.git"))
  ;;(package-install 'el-get)
  (require 'lsp-bridge))

(require 'lsp-bridge-jdtls)  

(global-lsp-bridge-mode)
(setq acm-enable-quick-access 1)

(general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"
   "ld" 'lsp-bridge-find-def
   "li" 'lsp-bridge-find-impl
   "lr" 'lsp-bridge-find-references
   "la" 'lsp-bridge-code-action
	 "lp" 'lsp-bridge-peek)

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

