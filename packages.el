;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

(package! f)
(package! s)
(package! pkg-info)
(package! epl)

(package! ggtags)
(package! sly-asdf)
;; (package! sly :disable t)
;; (package! sly-macrostep :disable t)
;; (package! sly-repl-ansi-color :disable t)
;; (package! slime)
(package! ag)

;;had problem wiht this package!
(package! dash)
(package! flx)
;;(package! bm)
(package! magit-section)

(package! posframe)
(package! markdown-mode)
(package! lsp-bridge
  :recipe (:repo "https://github.com/manateelazycat/lsp-bridge.git" ))

;; ================= install bookmark-plus =================

(let ((bookmarkplus-dir "~/.emacs.d/custom/bookmark-plus/")
      (emacswiki-base "https://www.emacswiki.org/emacs/download/")
      (bookmark-files '("bookmark+.el" "bookmark+-mac.el" "bookmark+-bmu.el" "bookmark+-key.el" "bookmark+-lit.el" "bookmark+-1.el")))
  (require 'url)
  (add-to-list 'load-path bookmarkplus-dir)
  (make-directory bookmarkplus-dir t)
  (mapcar (lambda (arg)
            (let ((local-file (concat bookmarkplus-dir arg)))
              (unless (file-exists-p local-file)
                (url-copy-file (concat emacswiki-base arg) local-file t))))
          bookmark-files)
  (byte-recompile-directory bookmarkplus-dir 0)
  ;;(require 'bookmark+)
  )

;; ================= install bookmark-plus ======================
;;
;; ================= download custom el files from emacs wiki =================

(let ((custom-el-dir "~/.emacs.d/custom/other-el/")
      (emacswiki-base "https://www.emacswiki.org/emacs/download/")
      (custom-el-files '("dired+.el" "frame-fns.el" "frame-cmds.el" "zoom-frm.el")))
  (require 'url)
  (add-to-list 'load-path custom-el-dir)
  (make-directory custom-el-dir t)
  (mapcar (lambda (arg)
            (let ((local-file (concat custom-el-dir arg)))
              (unless (file-exists-p local-file)
                (url-copy-file (concat emacswiki-base arg) local-file t))))
          custom-el-files)
  (byte-recompile-directory custom-el-dir 0)
  ;;(require 'dired+)
  )

;; ================= install bookmark-plus ======================

;;(package! eaf)

(package! gitconfig-mode
	  :recipe (:host github :repo "magit/git-modes"
			 :files ("gitconfig-mode.el")))
(package! gitignore-mode
	  :recipe (:host github :repo "magit/git-modes"
			 :files ("gitignore-mode.el")))

(package! yascroll)
(package! citre)
(package! beacon)
(package! dimmer)
(package! omnisharp)

(package! dired-hacks-utils)
(package! dired-filter)
(package! dired-subtree)
(package! dired-ranger)
(package! dired-collapse)
(package! dired-sidebar)

(package! all-the-icons-dired)

(package! highlight-indent-guides)

(package! dart-server)
(package! lsp-dart)

;; ============= THEMES ====================

(package! moe-theme)
(package! inkpot-theme)
(package! dracula-theme)
(package! zeno-theme)
(package! exotica-theme)
(package! abyss-theme)
(package! afternoon-theme)
(package! vs-dark-theme)
(package! tron-legacy-theme)
(package! tomorrow-night-paradise-theme)
(package! darcula-theme)
(package! melancholy-theme)
;; =========================================

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
