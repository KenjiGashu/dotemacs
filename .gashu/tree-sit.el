(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp.git")
        (c "https://github.com/tree-sitter/tree-sitter-c.git")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))


;(mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

(require 'treesit)

;; (setq major-mode-remap-alist
;;       '((yaml-mode . yaml-ts-mode)
;;         (c-mode . c-ts-mode)
;;         (c++-mode . c++-ts-mode)
;;         (bash-mode . bash-ts-mode)
;;         (js2-mode . js-ts-mode)
;;         (typescript-mode . typescript-ts-mode)
;;         (json-mode . json-ts-mode)
;;         (css-mode . css-ts-mode)
;;         (python-mode . python-ts-mode)))

(use-package tree-sitter
	:ensure t
  :demand t
 )

(use-package tree-sitter-langs
	:ensure t
  :demand t
 )

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
