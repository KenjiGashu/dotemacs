;; (use-package eyebrowse
;; 	:ensure t
;; 	:config (eyebrowse-mode 1))

(elpaca persp-mode
	(add-hook 'elpaca-after-init-hook
						(lambda ()
							(setq wg-morph-on nil) ;; switch off animation
							(setq persp-autokill-buffer-on-remove 'kill-weak)
							(add-hook 'window-setup-hook #'(lambda () (persp-mode 1))))))

;; (use-package workgroups
;; 	:ensure t)

;; alternatively 
(desktop-save-mode 1)

;;(elpaca
;; (desktop-plus :type git :host github :repo "ffevotte/desktop-plus"))

;;(setq desktop+-base-dir (concat xdg-home "desktops"))


;; https://github.com/nflath/save-visited-files

;; https://github.com/tlh/workgroups.el

;; http://scottfrazersblog.blogspot.com/2009/12/emacs-named-desktop-sessions.html

;; https://github.com/Bad-ptr/persp-mode.el
