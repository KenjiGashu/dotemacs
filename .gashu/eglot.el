(require 'eglot)
;;(add-to-list 'eglot-server-programs '((js-mode typescript-mode) . (eglot-deno "deno" "lsp")))

(defclass eglot-deno (eglot-lsp-server) ()
  :documentation "A custom class for deno lsp.")

(cl-defmethod eglot-initialization-options ((server eglot-deno))
  "Passes through required deno initialization options"
  (list :enable t
				:lint t))

;; Option 1: Specify explicitly to use Orderless for Eglot
(setq completion-category-overrides '((eglot (styles orderless))
                                      (eglot-capf (styles orderless))))

;; Option 2: Undo the Eglot modification of completion-category-defaults
(with-eval-after-load 'eglot
   (setq completion-category-defaults nil))

(defun my/eglot-capf ()
  (setq-local completion-at-point-functions
              (list (cape-capf-super
                     #'eglot-completion-at-point
                     #'tempel-expand
                     #'cape-file))))

;;(add-to-list 'eglot-server-programs '((csharp-mode) . "omnisharp"))
;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;                `(csharp-mode . ("OmniSharp.exe" "--lsp"))))

(add-hook 'eglot-managed-mode-hook #'my/eglot-capf)

(general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :keymaps '(eglot-mode-map)
   :non-normal-prefix "C-SPC"
   "li" 'eglot-find-implementation
   "ld" 'eglot-find-declaration
   "la" 'eglot-code-actions
	 "lt" 'eglot-find-typeDefinition
	 "lo" 'eglot-code-action-organize-imports
	 "lz"  'eglot-shutdown-all)

;; (straight-use-package
;;  '(eglot-booster
;;    :type git
;;    :repo "https://github.com/jdtsmith/eglot-booster"))

;; (use-package eglot-booster
;; 	:ensure nil
;; 	:after eglot
;; 	:config	(eglot-booster-mode))
