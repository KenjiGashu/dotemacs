(use-package zig-mode
	:ensure t
  ;;:demand t
 )

(autoload 'zig-mode "zig-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.zig\\'" . zig-mode))

;; (add-hook 'zig-mode-hook 'lspce-mode)
(add-hook 'zig-mode-hook 'lsp)
(add-hook 'zig-mode-hook 'corfu-mode)
;;(add-hook 'zig-mode-hook 'lsp-bridge-mode)

