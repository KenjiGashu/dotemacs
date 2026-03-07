;; ==================================================================
;;
;; some ui configuration
;;
;; =================================================================

;;change default font to iosevka
(if (equal system-type 'windows-nt)
    (add-to-list 'default-frame-alist '(font . "Iosevka-10"))
  (add-to-list 'default-frame-alist '(font . "Iosevka-10")))




(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(column-number-mode 1)

;; Disable line numbers for some modes
(dolist
		(mode '(org-mode-hook
            term-mode-hook
            shell-mode-hook
            treemacs-mode-hook
            eshell-mode-hook
		pdf-view-mode-hook
		dired-mode))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq-default tab-width 2)

;; Show the current function name in the header line
(which-function-mode)
(setq-default header-line-format
							'((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
      ;; We remove Which Function Mode from the mode line, because it's mostly
      ;; invisible here anyway.
      (assq-delete-all 'which-func-mode mode-line-misc-info))

(elpaca rainbow-delimiters :wait t
				(add-hook 'emacs-startup-hook (lambda () (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))))

(elpaca doom-themes)
(elpaca moe-theme)
(elpaca nordic-night-theme)
(elpaca ef-themes)
(elpaca standard-themes)
;;(elpaca modus-themes)
(when (string= system-type "gnu/linux")
	(elpaca (alabaster-theme :type git :host github :repo "reinh/flatwhite-emacs")))
(elpaca catppuccin-theme)
;; (setq catppuccin-flavor 'mocha)
;; (catppuccin-reload)
(elpaca autothemer :ensure t)

(elpaca
	(rose-pine-emacs
	 :host github :repo "thongpv87/rose-pine-emacs"
	 :files (:defaults "*.el")
	 :main "rose-pine-color-theme.el"))

(elpaca timu-caribbean-theme)
(elpaca color-theme-sanityinc-tomorrow)
(elpaca color-theme-sanityinc-solarized)
(elpaca 
 (emacs-material-theme
	 :host github
	 :repo "cpaulik/emacs-material-theme"
	 :files (:defaults "*.el")
	 :main "material-theme.el"
	 ))
(elpaca kaolin-themes)
  
(elpaca all-the-icons)
(elpaca all-the-icons-dired 
	(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
				)

(elpaca all-the-icons-ibuffer
	:init
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

  (add-hook 'ibuffer-mode-hook 'all-the-icons-ibuffer-mode))


(elpaca doom-modeline
(doom-modeline-mode 1)
(setq doom-modeline-height 15))

(elpaca highlight-blocks)





;; (elpaca nav-flash :ensure t
;;   :config (nav-flash-show))
(elpaca pulsar
  
  (general-define-key
   :keymaps 'global-map
   "C-x l" 'pulsar-pulse-line
   "C-x L" 'pulsar-highlight-permanently-dwim
   )
  ;; ( :map global-map
  ;;   ("C-x l" . pulsar-pulse-line) ; overrides `count-lines-page'
  ;;   ("C-x L" . pulsar-highlight-permanently-dwim)) ; or use `pulsar-highlight-temporarily-dwim'
  (pulsar-global-mode 1)
  (setq pulsar-delay 0.055)
  (setq pulsar-iterations 5)
  (setq pulsar-face 'pulsar-green)
  (setq pulsar-region-face 'pulsar-yellow)
  (setq pulsar-highlight-face 'pulsar-magenta))


;; (elpaca beacon :ensure t
;;   :config
;;   (beacon-mode 1))
;; (elpaca dimmer :ensure t
;;   :config
;;   (setq dimmer-fraction 0.6)
;;   (dimmer-mode t))

;; (elpaca indent-bars
;; 	:custom
;; 	(indent-bars-no-descend-lists t)
;; 	;;(indent-bars-no-descend-lists 'skip)
;; 	(indent-bars-starting-column 0)
;; 	(indent-bars-treesit-support t)
;; 	(indent-bars-treesit-ignore-blank-lines-types '("module"))
;; 	:init
;; 	(add-hook 'prog-mode-hook 'indent-bars-mode))

(elpaca highlight-indent-guides
  ;;(setq highlight-indent-guides-auto-character-face-perc 0)
  (setq highlight-indent-guides-auto-even-face-perc 17)
  (setq highlight-indent-guides-auto-odd-face-perc 33)
	(setq highlight-indent-guides-auto-top-odd-face-perc 60)
	(setq highlight-indent-guides-auto-top-even-face-perc 60)
  ;;(setq highlight-indent-guides-auto-character-face-perc 0)
  ;;(setq highlight-indent-guides-auto-top-character-face-perc 0)

  (setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-responsive 'top)
  (setq highlight-indent-guides-auto-enabled t)
  (set-face-foreground 'highlight-indent-guides-character-face "dim gray")
  ;;(set-face-foreground 'highlight-indent-guides-top-character-face "white smoke")
	(set-face-foreground 'highlight-indent-guides-top-character-face "light gray")
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  )

;;customize search
(setq lazy-highlight-cleanup nil)
(setq lazy-highlight-max-at-a-time nil)
(setq lazy-highlight-initial-delay 0)

(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)))
;;(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; (elpaca casual)
;; (add-hook 'dired-mode-hook #'casual-dired-tmenu)
;; (add-hook 'bookmark-bmenu-mode-hook #'casual-bookmarks-tmenu)
;; (add-hook 'ibuffer-hook #'casual-ibuffer-tmenu)

(elpaca rand-theme
	(setq rand-theme-wanted '(modus-vivendi-deuteranopia modus-vivendi modus-vivendi-tinted modus-vivendi-tritanopia
timu-caribbean moe-dark ef-symbiosis ef-trio-dark ef-tritanopia-dark ef-owl ef-night ef-maris-dark ef-elea-dark
ef-duo-dark ef-dream ef-deuteranopia-dark ef-dark ef-cherie ef-bio ef-autumn sanityinc-tomorrow-eighties catppuccin
material))
	(rand-theme))


;; ======= COLORFUL ==========
(elpaca colorful-mode
  ;; :diminish
  ;; :ensure t ; Optional
  (setq colorful-use-prefix t)
  (setq colorful-only-strings 'only-prog)
  (setq css-fontify-colors nil)
  (global-colorful-mode t)
  (add-to-list 'global-colorful-modes 'helpful-mode))


;; ========== breadcrumb =======
(elpaca breadcrumb
	(breadcrumb-mode 1))
