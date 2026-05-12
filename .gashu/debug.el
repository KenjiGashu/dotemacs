(elpaca dap-mode
;; ;; Enabling only some features
;; (setq dap-auto-configure-features '(sessions locals controls tooltip))
(dap-mode 1)
(dap-auto-configure-mode 1)

;; The modes below are optional

(dap-ui-mode 1)
;; enables mouse hover support
(dap-tooltip-mode 1)
;; use tooltips for mouse hover
;; if it is not enabled `dap-mode' will use the minibuffer.
(tooltip-mode 1)
;; displays floating panel with debug buttons
;; requies emacs 26+
(dap-ui-controls-mode 1)

;;(add-hook 'dap-mode-hook 'dap-auto-configure-mode)

;;(require 'dap-java)
(require 'dap-netcore)
(require 'dap-lldb)
(require 'dap-gdb-lldb)

	)

(elpaca dape
  ;;:preface
  ;; By default dape shares the same keybinding prefix as `gud'
  ;; If you do not want to use any prefix, set it to nil.
  ;; (setq dape-key-prefix "\C-x\C-a")

  ;;:hook
  ;; Save breakpoints on quit
  ;; (kill-emacs . dape-breakpoint-save)
  ;; Load breakpoints on startup
  ;; (after-init . dape-breakpoint-load)

  ;;:custom
  ;; Turn on global bindings for setting breakpoints with mouse
  ;; (dape-breakpoint-global-mode +1)

  ;; Info buffers to the right
  ;; (dape-buffer-window-arrangement 'right)
  ;; Info buffers like gud (gdb-mi)
  ;; (dape-buffer-window-arrangement 'gud)
  ;; (dape-info-hide-mode-line nil)

  ;; Projectile users
  ;; (dape-cwd-function #'projectile-project-root)

  ;;:config
  ;; Pulse source line (performance hit)
  ;; (add-hook 'dape-display-source-hook #'pulse-momentary-highlight-one-line)

  ;; Save buffers on startup, useful for interpreted languages
  ;; (add-hook 'dape-start-hook (lambda () (save-some-buffers t t)))

  ;; Kill compile buffer on build success
  ;; (add-hook 'dape-compile-hook #'kill-buffer)

	;; (repeat-mode +1)
	;; (window-sides-vertical t)
  )

;; ;; For a more ergonomic Emacs and `dape' experience
;; (use-package repeat
;;   :custom
;;   (repeat-mode +1))

;; ;; Left and right side windows occupy full frame height
;; (use-package emacs
;;   :custom
;;   (window-sides-vertical t))

;; (use-package realgud
;; 	:ensure t)

