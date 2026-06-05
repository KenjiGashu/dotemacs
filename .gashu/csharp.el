;;(add-hook 'csharp-mode-hook 'eglot-ensure)
(use-package emacs
	:after (lsp eglot)
	:init
	(add-hook 'csharp-mode-hook 'lsp)
	(add-hook 'csharp-mode-hook 'corfu-mode)

	(add-to-list 'lsp-disabled-clients 'csharp-ls)
	(add-to-list 'lsp-disabled-clients 'csharp-roslyn)
)
