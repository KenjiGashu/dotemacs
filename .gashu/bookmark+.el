;; ================= install bookmark-plus =================

;; (let ((bookmarkplus-dir "~/.emacs.d/custom/bookmark-plus/")
;;       (emacswiki-base "https://www.emacswiki.org/emacs/download/")
;;       (bookmark-files '("bookmark+.el" "bookmark+-mac.el" "bookmark+-bmu.el" "bookmark+-key.el" "bookmark+-lit.el" "bookmark+-1.el")))
;;   (require 'url)
;;   (add-to-list 'load-path bookmarkplus-dir)
;;   (make-directory bookmarkplus-dir t)
;;   (mapcar (lambda (arg)
;;             (let ((local-file (concat bookmarkplus-dir arg)))
;;               (unless (file-exists-p local-file)
;;                 (url-copy-file (concat emacswiki-base arg) local-file t))))
;;           bookmark-files)
;;   (byte-recompile-directory bookmarkplus-dir 0)
;;   (require 'bookmark+)

;;   (general-define-key
;;    :states '(normal  visual insert emacs)
;;    :prefix "SPC"
;;    :keymaps '(override pdf-view-mode)
;;    :non-normal-prefix "C-SPC"
;;    "bm" 'bookmark-set
;;    "bv" 'list-bookmarks
;;    "bt" 'bmkp-switch-bookmark-file-create
;;    "bn" 'bmkp-next-bookmark
;;    "bp" 'bmkp-previous-bookmark)

;;   ;; config
;;   (setq bookmark-save-flag 1
;; 	bmkp-count-multi-mods-as-one-flag t)
;;   )

;; ================= install bookmark-plus ======================
;;

(use-package bookmark+
  :straight '(bookmark+ :type git :host github :repo "emacsmirror/bookmark-plus"))

(general-define-key
 :states '(normal  visual insert emacs)
 :prefix "SPC"
 :keymaps '(override pdf-view-mode)
 :non-normal-prefix "C-SPC"
 "bm" 'bookmark-set
 "bv" 'list-bookmarks
 "bt" 'bmkp-switch-bookmark-file-create
 "bn" 'bmkp-next-bookmark
 "bp" 'bmkp-previous-bookmark)


(setq bookmark-save-flag 1
			bmkp-count-multi-mods-as-one-flag t)
