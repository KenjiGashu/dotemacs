
;;change default font to iosevka
(if (equal system-type 'windows-nt)
    (add-to-list 'default-frame-alist '(font . "Iosevka-11"))
  (add-to-list 'default-frame-alist '(font . "Iosevka-14")))



(electric-pair-mode 1)

(setq vc-make-backup-files t)


;; ==============================================================
;;
;; emacs backups
;;
;; ============================================================

(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 100               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 100               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      backup-directory-alist `((".*" . "~/.backups-emacs"))
      auto-save-file-name-transforms `((".*" "~/.backups-emacs" t))
      )


