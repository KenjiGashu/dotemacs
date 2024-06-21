;; ==================================================================
;;
;; some ui configuration
;;
;; =================================================================

;;change default font to iosevka
(if (equal system-type 'windows-nt)
    (add-to-list 'default-frame-alist '(font . "Iosevka-10"))
  (add-to-list 'default-frame-alist '(font . "Iosevka-12")))




(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(column-number-mode 1)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook
		pdf-view-mode-hook
		dired-mode))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(desktop-save-mode 1)

(setq-default tab-width 2)

;; display function definition
(which-function-mode)

;; Show the current function name in the header line
(which-function-mode)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
            ;; We remove Which Function Mode from the mode line, because it's mostly
            ;; invisible here anyway.
            (assq-delete-all 'which-func-mode mode-line-misc-info))


(use-package doom-themes
  :init (load-theme 'doom-palenight t))
  
(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package highlight-blocks)
(use-package rainbow-delimiters )

(use-package all-the-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

;; Whether display the icons.
(setq all-the-icons-ibuffer-icon t)

;; Whether display the colorful icons.
;; It respects `all-the-icons-color-icons'.
(setq all-the-icons-ibuffer-color-icon t)

;; The default icon size in ibuffer.
(setq all-the-icons-ibuffer-icon-size 1.0)

;; The default vertical adjustment of the icon in ibuffer.
(setq all-the-icons-ibuffer-icon-v-adjust 0.0)

;; Use human readable file size in ibuffer.
(setq  all-the-icons-ibuffer-human-readable-size t)


(use-package nav-flash :ensure t
  :config (nav-flash-show))


(use-package beacon :ensure t
  :config
  (beacon-mode 1))
;; (use-package dimmer :ensure t
;;   :config
;;   (setq dimmer-fraction 0.6)
;;   (dimmer-mode t))

(use-package highlight-indent-guides
  :config
  ;;(setq highlight-indent-guides-auto-character-face-perc 0)
  (setq highlight-indent-guides-auto-even-face-perc 40)
  (setq highlight-indent-guides-auto-odd-face-perc 60)
	(setq highlight-indent-guides-auto-top-odd-face-perc 90)
	(setq highlight-indent-guides-auto-top-even-face-perc 90)
  ;;(setq highlight-indent-guides-auto-character-face-perc 0)
  ;;(setq highlight-indent-guides-auto-top-character-face-perc 0)

  (setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-responsive 'top)
  (setq highlight-indent-guides-auto-enabled t)
  (set-face-foreground 'highlight-indent-guides-character-face "dim gray")
  (set-face-foreground 'highlight-indent-guides-top-character-face "white smoke")
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  )

;;customize search
(setq lazy-highlight-cleanup nil)
(setq lazy-highlight-max-at-a-time nil)
(setq lazy-highlight-initial-delay 0)

