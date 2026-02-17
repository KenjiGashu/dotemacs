;;(add-hook 'csharp-mode-hook 'eglot-ensure)
(add-hook 'csharp-mode-hook 'lsp)
(add-hook 'csharp-mode-hook 'corfu-mode)

;;(add-to-list 'lsp-disabled-clients 'csharp-ls)
;;(add-to-list 'lsp-disabled-clients 'csharp-roslyn)
