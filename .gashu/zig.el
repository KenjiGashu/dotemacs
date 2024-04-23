(use-package zig-mode
	:ensure t
  ;;:demand t
 )

(autoload 'zig-mode "zig-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.zig\\'" . zig-mode))

