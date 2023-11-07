;; ==================================================================
;;
;; load paths
;;
;; =================================================================
;;(let ((default-directory  "~/.emacs.d/git/"))
;;  (normal-top-level-add-subdirs-to-load-path))

(setq load-path (append (list (expand-file-name "~/.emacs.d/lilypond-mode")) load-path))
(setq load-path (append (list (expand-file-name "~/.emacs.d/lilypond-mode/lilypond-init.el")) load-path))
(setq load-path (append (list (expand-file-name "/usr/share/emacs/site-lisp/uim-el")) load-path))
(setq load-path (append (list (expand-file-name "/usr/share/emacs/site-lisp")) load-path))

(add-to-list 'custom-theme-load-path "~/.emacs.d/theme/")

;=======================================================================
