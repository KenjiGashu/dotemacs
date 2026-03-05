;; important variables for lsp
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(elpaca lsp-mode
      (setq lsp-keymap-prefix "C-c l")           ; Prefix for LSP actions
      (setq lsp-completion-provider :none)       ; Using Corfu as the provider
      (setq lsp-diagnostics-provider :flycheck)
      (setq lsp-session-file (locate-user-emacs-file ".lsp-session"))
      (setq lsp-log-io nil)                      ; IMPORTANT! Use only for debugging! Drastically affects performance
      (setq lsp-keep-workspace-alive nil)        ; Close LSP server if all project buffers are closed
      (setq lsp-idle-delay 0.5)                  ; Debounce timer for `after-change-function'
      ;; core
      (setq lsp-enable-xref t)                   ; Use xref to find references
      (setq lsp-auto-configure t)                ; Used to decide between current active servers
      (setq lsp-eldoc-enable-hover t)            ; Display signature information in the echo area
      (setq lsp-enable-dap-auto-configure t)     ; Debug support
      (setq lsp-enable-file-watchers nil)
      (setq lsp-enable-folding nil)              ; I disable folding since I use origami
      (setq lsp-enable-imenu t)
      (setq lsp-enable-indentation nil)          ; I use prettier
      (setq lsp-enable-links nil)                ; No need since we have `browse-url'
      (setq lsp-enable-on-type-formatting nil)   ; Prettier handles this
      (setq lsp-enable-suggest-server-download t) ; Useful prompt to download LSP providers
      (setq lsp-enable-symbol-highlighting t)     ; Shows usages of symbol at point in the current buffer
      (setq lsp-enable-text-document-color nil)   ; This is Treesitter's job

      (setq lsp-ui-sideline-show-hover nil)      ; Sideline used only for diagnostics
      (setq lsp-ui-sideline-diagnostic-max-lines 20) ; 20 lines since typescript errors can be quite big
      ;; completion
      (setq lsp-completion-enable t)
      (setq lsp-completion-enable-additional-text-edit t) ; Ex: auto-insert an import for a completion candidate
      (setq lsp-enable-snippet t)                         ; Important to provide full JSX completion
      (setq lsp-completion-show-kind t)                   ; Optional
      ;; headerline
      (setq lsp-headerline-breadcrumb-enable t)  ; Optional, I like the breadcrumbs
      (setq lsp-headerline-breadcrumb-enable-diagnostics nil) ; Don't make them red, too noisy
      (setq lsp-headerline-breadcrumb-enable-symbol-numbers nil)
      (setq lsp-headerline-breadcrumb-icons-enable nil)
      ;; modeline
      (setq lsp-modeline-code-actions-enable nil) ; Modeline should be relatively clean
      (setq lsp-modeline-diagnostics-enable nil)  ; Already supported through `flycheck'
      (setq lsp-modeline-workspace-status-enable nil) ; Modeline displays "LSP" when lsp-mode is enabled
      (setq lsp-signature-doc-lines 1)                ; Don't raise the echo area. It's distracting
      (setq lsp-ui-doc-use-childframe t)              ; Show docs for symbol at point
      (setq lsp-eldoc-render-all nil)            ; This would be very useful if it would respect `lsp-signature-doc-lines', currently it's distracting
      ;; lens
      (setq lsp-lens-enable nil)                 ; Optional, I don't need it
      ;; semantic
      (setq lsp-semantic-tokens-enable nil)      ; Related to highlighting, and we defer to treesitter

  (defun my/orderless-dispatch-flex-first (_pattern index _total)
    (and (eq index 0) 'orderless-flex))

  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless))
    ;; Optionally configure the first word as flex filtered.
    (add-hook 'orderless-style-dispatchers #'my/orderless-dispatch-flex-first nil 'local)
    ;; Optionally configure the cape-capf-buster.
    (setq-local completion-at-point-functions (list (cape-capf-buster #'lsp-completion-at-point))))
	
  (add-hook 'lsp-completion-mode #'my/lsp-mode-setup-completion)

  ;; 	(setq lsp-keymap-prefix "SPC l")
  ;; (fset 'lsp-command-map lsp-command-map)
	)


(elpaca lsp-ui )

;; (use-package lsp-treemacs
;; 	:ensure t)

(elpaca lsp-java)

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
