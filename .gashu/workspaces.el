;; (use-package eyebrowse
;; 	:ensure t
;; 	:config (eyebrowse-mode 1))

;; (use-package persp-mode
;; 	:ensure t)

;; (use-package workgroups
;; 	:ensure t)

;; alternatively 
(desktop-save-mode 1)

;; (use-package desktop+
;; :ensure (:host github :repo "https://github.com/ffevotte/desktop-plus"))

;; (setq desktop+-base-dir (concat xdg-home "desktops"))

(use-package easysession
	:ensure t
	:after general
  ;; ':demand t' ensures the package is loaded immediately upon startup
  :demand t

  :config
  ;; Key mappings
	(general-define-key
   :states '(normal visual insert emacs)
	 :prefix "SPC"
   :keymaps '(override pdf-view-mode)
	 :non-normal-prefix "C-SPC"
	 "e" '(:ignore t :which-key "Easy Session")
   "el" 'easysession-switch-to
	 "es" 'easysession-save
	 "eL" 'easysession-switch-to-and-restore-geometry
	 "er" 'easysession-rename
	 "eR" 'easysession-reset
	 "eu" 'easysession-unload
	 "ed" 'easysession-delete)

  ;; Save every 10 minutes
  (setq easysession-save-interval (* 10 60))

  ;; Save the current session when using `easysession-switch-to'
  (setq easysession-switch-to-save-session t)

  ;; Do not exclude the current session when switching sessions
  (setq easysession-switch-to-exclude-current nil)

  ;; Display the active session name in the mode-line lighter.
  ;; (setq easysession-save-mode-lighter-show-session-name t)

  ;; Optionally, the session name can be shown in the modeline info area:
  ;; (setq easysession-mode-line-misc-info t)
  ;; non-nil: Make `easysession-setup' load the session automatically.
  ;; (nil: session is not loaded automatically; the user can load it manually.)
  (setq easysession-setup-load-session t)

  ;; The `easysession-setup' function adds hooks:
  ;; - To enable automatic session loading during `emacs-startup-hook', or
  ;;   `server-after-make-frame-hook' when running in daemon mode.
  ;; - To save the session at regular intervals, and when Emacs exits.
  (easysession-setup))

;; https://github.com/nflath/save-visited-files

;; https://github.com/tlh/workgroups.el

;; http://scottfrazersblog.blogspot.com/2009/12/emacs-named-desktop-sessions.html

;; https://github.com/Bad-ptr/persp-mode.el

