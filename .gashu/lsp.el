;; important variables for lsp
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(use-package lsp-mode
	:custom
      (lsp-keymap-prefix "C-c l")           ; Prefix for LSP actions
      (lsp-completion-provider :none)       ; Using Corfu as the provider
      (lsp-diagnostics-provider :flycheck)
      (lsp-session-file (locate-user-emacs-file ".lsp-session"))
      (lsp-log-io nil)                      ; IMPORTANT! Use only for debugging! Drastically affects performance
      (lsp-keep-workspace-alive nil)        ; Close LSP server if all project buffers are closed
      (lsp-idle-delay 0.5)                  ; Debounce timer for `after-change-function'
      ;; core
      (lsp-enable-xref t)                   ; Use xref to find references
      (lsp-auto-configure t)                ; Used to decide between current active servers
      (lsp-eldoc-enable-hover t)            ; Display signature information in the echo area
      (lsp-enable-dap-auto-configure t)     ; Debug support
      (lsp-enable-file-watchers nil)
      (lsp-enable-folding nil)              ; I disable folding since I use origami
      (lsp-enable-imenu t)
      (lsp-enable-indentation nil)          ; I use prettier
      (lsp-enable-links nil)                ; No need since we have `browse-url'
      (lsp-enable-on-type-formatting nil)   ; Prettier handles this
      (lsp-enable-suggest-server-download t) ; Useful prompt to download LSP providers
      (lsp-enable-symbol-highlighting t)     ; Shows usages of symbol at point in the current buffer
      (lsp-enable-text-document-color nil)   ; This is Treesitter's job

      (lsp-ui-sideline-show-hover nil)      ; Sideline used only for diagnostics
      (lsp-ui-sideline-diagnostic-max-lines 20) ; 20 lines since typescript errors can be quite big
      ;; completion
      (lsp-completion-enable t)
      (lsp-completion-enable-additional-text-edit t) ; Ex: auto-insert an import for a completion candidate
      (lsp-enable-snippet t)                         ; Important to provide full JSX completion
      (lsp-completion-show-kind t)                   ; Optional
      ;; headerline
      (lsp-headerline-breadcrumb-enable t)  ; Optional, I like the breadcrumbs
      (lsp-headerline-breadcrumb-enable-diagnostics nil) ; Don't make them red, too noisy
      (lsp-headerline-breadcrumb-enable-symbol-numbers nil)
      (lsp-headerline-breadcrumb-icons-enable nil)
      ;; modeline
      (lsp-modeline-code-actions-enable nil) ; Modeline should be relatively clean
      (lsp-modeline-diagnostics-enable nil)  ; Already supported through `flycheck'
      (lsp-modeline-workspace-status-enable nil) ; Modeline displays "LSP" when lsp-mode is enabled
      (lsp-signature-doc-lines 1)                ; Don't raise the echo area. It's distracting
      (lsp-ui-doc-use-childframe t)              ; Show docs for symbol at point
      (lsp-eldoc-render-all nil)            ; This would be very useful if it would respect `lsp-signature-doc-lines', currently it's distracting
      ;; lens
      (lsp-lens-enable nil)                 ; Optional, I don't need it
      ;; semantic
      (lsp-semantic-tokens-enable nil)      ; Related to highlighting, and we defer to treesitter

  :init
  (defun my/orderless-dispatch-flex-first (_pattern index _total)
    (and (eq index 0) 'orderless-flex))

  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless))
    ;; Optionally configure the first word as flex filtered.
    (add-hook 'orderless-style-dispatchers #'my/orderless-dispatch-flex-first nil 'local)
    ;; Optionally configure the cape-capf-buster.
    (setq-local completion-at-point-functions (list (cape-capf-buster #'lsp-completion-at-point))))
	
  :hook
  (lsp-completion-mode . my/lsp-mode-setup-completion)

	:ensure t
	:config
	(setq lsp-keymap-prefix "SPC l")
  (fset 'lsp-command-map lsp-command-map)
	)


(use-package lsp-ui :ensure t :commands lsp-ui-mode)

;; (use-package lsp-treemacs
;; 	:ensure t)

(use-package lsp-java
	:ensure t)

(general-define-key
   :states '(normal visual insert emacs)
	 :prefix "SPC"
   :keymaps '(lsp-command-map)
	 :non-normal-prefix "C-SPC"
   "ld" 'lsp-find-definition
	 "lr" 'lsp-find-references
	 "la" 'lsp-execute-code-action)

;; (defun lsp-booster--advice-json-parse (old-fn &rest args)
;;   "Try to parse bytecode instead of json."
;;   (or
;;    (when (equal (following-char) ?#)
;;      (let ((bytecode (read (current-buffer))))
;;        (when (byte-code-function-p bytecode)
;;          (funcall bytecode))))
;;    (apply old-fn args)))
;; (advice-add (if (progn (require 'json)
;;                        (fboundp 'json-parse-buffer))
;;                 'json-parse-buffer
;;               'json-read)
;;             :around
;;             #'lsp-booster--advice-json-parse)

;; (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
;;   "Prepend emacs-lsp-booster command to lsp CMD."
;;   (let ((orig-result (funcall old-fn cmd test?)))
;;     (if (and (not test?)                             ;; for check lsp-server-present?
;;              (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
;;              lsp-use-plists
;;              (not (functionp 'json-rpc-connection))  ;; native json-rpc
;;              (executable-find "emacs-lsp-booster"))
;;         (progn
;;           (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
;;             (setcar orig-result command-from-exec-path))
;;           (message "Using emacs-lsp-booster for %s!" orig-result)
;;           (cons "emacs-lsp-booster" orig-result))
;;       orig-result)))
;; (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)
