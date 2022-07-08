;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(use-package! ggtags
  ;; if you omit :defer, :hook, :commands, or :after, then the package is loaded
  ;; immediately. By using :hook here, the `hl-todo` package won't be loaded
  ;; until prog-mode-hook is triggered (by activating a major mode derived from
  ;; it, e.g. python-mode)
  :hook ((c-mode . ggtags-mode)
         (c++-mode . ggtags-mode)
         (objc-mode .ggtags-mode))
  :init
  ;; code here will run immediately
  :config
  ;; code here will run after the package is loaded
  (setq hl-todo-highlight-punctuation ":"))


;; (use-package! sly-asdf
;;   :after sly
;;   :init
;;   (add-to-list 'sly-contribs 'sly-asdf 'append)

;;   :config
;;   (map!
;;    (:localleader
;;     :map lisp-mode-map
;;     (:prefix ("c" . "compile")
;;      :desc "Load System" "s" #'sly-asdf-load-system
;;      :desc "Open System" "o" #'sly-asdf-open-system))))

(use-package! ag)


;; =============== unused bm bindings ================================
;;
;; (use-package! bm
;;   :config
;;   (set-face-attribute 'bm-face nil :background "RoyalBlue4" :foreground 'unspecified))
;;
;;
;; bm bookmarks on evil mode bindings
;; (map! :leader
;;       (:prefix-map ("b" . "buffer")
;;        :desc "toggle bm bookmark"              "t"   #'bm-toggle
;;        :desc "next bm bookmark"                "o"   #'bm-next
;;        :desc "previous bm bookmark"            "y"   #'bm-previous))
;;
;; ===============================================================

;;=============== bookmark+ ================================
(use-package! bookmark+
  :config
  (setq bookmark-version-control t
        delete-old-versions t
        bookmark-save-flag t)
  :load-path "~/.emacs.d/custom/bookmark-plus")

(map! :leader
      (:prefix-map ("b" . "buffer")
       :desc "list bmkp"                          "v"   #'bookmark-bmenu-list
       :desc "switch bmkp file"                   "t"   #'bmkp-switch-bookmark-file-create
       :desc "describe bmkp"                      "h"   #'bmkp-describe-bookmark
       :desc "file bookmark bmkp"                 "o"   #'bmkp-set-bookmark-file-bookmark
       :desc "edit bmkp"                          "e"   #'bmkp-edit-bookmark-record))
;;=============== bookmark+ ================================

(use-package! zoom-frm
  :load-path "~/.emacs.d/custom/other-el")

;;=============== dired+ ================================
;; (use-package! dired+
;;   :config
;;   (setq diredp-toggle-find-file-reuse-dir t)
;;   :load-path "~/.emacs.d/custom/dired-plus")
;;=============== dired+ ================================


;;
;;
;; centaur tabs
(map! (:when (featurep! :editor snippets)
       :i  [C-tab] nil
       :nv [C-tab] nil))
(map! (:when (featurep! :ui tabs)
       :nv [C-tab]           #'centaur-tabs-forward-tab
       :nv [C-S-tab]         #'centaur-tabs-backward-tab
       :nv [C-S-iso-lefttab] #'centaur-tabs-backward-tab))

;;=============== yascroll ================================
;; (use-package! yascroll
;;   :config
;;   (global-yascroll-bar-mode 1)
;;   (setq yascroll:delay-to-hide nil))
;;=============== yascroll ================================

(use-package! citre
  :init
  ;; This is needed in `:init' block for lazy load to work.
  (require 'citre-config)
  :config
  (setq
   ;; By default, when you open any file, and a tags file can be found for it,
   ;; `citre-mode' is automatically enabled.  If you only want this to work for
   ;; certain modes (like `prog-mode'), set it like this.
   citre-auto-enable-citre-mode-modes '(prog-mode)))

(use-package! beacon
  :config
  (beacon-mode 1))
(use-package! dimmer
  :config
  (setq dimmer-fraction 0.4)
  (dimmer-mode t))

(use-package! omnisharp
  :commands omnisharp-start-omnisharp-server
  :config
  (set-company-backend! 'csharp-mode 'company-omnisharp))
;; (use-package! omnisharp
;;   :hook (csharp-mode . omnisharp-mode)
;;    :config
;;     (set-company-backend! 'csharp-mode 'company-omnisharp)
;;     (omnisharp-install-server nil)
;;     (omnisharp-start-omnisharp-server)
;;     )

(use-package! dired-subtree)
(use-package! dired-filter)
(use-package! dired-subtree)
(use-package! dired-ranger)
(use-package! dired-collapse)
(use-package! dired-sidebar
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (map!
   :leader
   (:prefix-map ("o" . "open")
    :desc "dired-toggle" "=" #'dired-sidebar-toggle-sidebar)
   ))
(use-package! all-the-icons-dired
  :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

;; EAF
;; (use-package! eaf
;;   :config
;;   (require 'eaf-browser)
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework")

(use-package! flutter
  :custom
  (setq flutter-sdk-path "~/Downloads/dev/flutter/"))

;; (after! eglot
;;   (setq eglot-server-programs
;;       `((dart-mode . ("dart"
;;                       ,(expand-file-name "snapshots/analysis_server.dart.snapshot"
;;                                          (file-name-directory
;;                                           (file-truename
;;                                            (executable-find "dart"))))
;;                       "--lsp")))))


(use-package! dart-server
  :init (setq dart-server-sdk-path "/home/kenjigashu/Downloads/dev/flutter/bin/cache/dart-sdk/"))


;; (use-package! slime
;;   :init
;;   (setq inferior-lisp-program "sbcl")
;;   :config
;;   (slime-setup '(slime-fancy slime-asdf slime-trace-dialog)))

(use-package! eglot
  :config
  (add-to-list 'eglot-server-programs '(dart-mode . ("dart" "language-server"))))

(use-package! highlight-indent-guides
  :config
  ;; (setq highlight-indent-guides-auto-character-face-perc 0)
  ;; (setq highlight-indent-guides-auto-even-face-perc 0)
  ;; (setq highlight-indent-guides-auto-odd-face-perc 0)
  ;; (setq highlight-indent-guides-auto-character-face-perc 0)
  ;; (setq highlight-indent-guides-auto-top-character-face-perc 0)
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top)
  (setq highlight-indent-guides-auto-enabled nil)
  (set-face-foreground 'highlight-indent-guides-character-face "dim gray")
  (set-face-foreground 'highlight-indent-guides-top-character-face "white smoke")
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  )

;; make which key show up faster
(setq which-key-idle-delay 0.3) ;; I need the help, I really do

;;; change font
;;; Add to ~/.doom.d/config.el
(when (eq system-type 'gnu/linux)
  (setq doom-font (font-spec :family "Iosevka" :size 18 :weight 'semi-light)))

;;change c style indentation
(setq c-default-style "ellemtel"
      c-basic-offset 2)

;;fix indentation on c++ templates
;;https://stackoverflow.com/questions/7830428/c-templates-and-emacs-customizing-indentation
(defun c++-template-args-cont (langelem)
"Control indentation of template parameters handling the special case of '>'.
Possible Values:
0   : The first non-ws character is '>'. Line it up under 'template'.
nil : Otherwise, return nil and run next lineup function."
  (save-excursion
    (beginning-of-line)
    (if (re-search-forward "^[\t ]*>" (line-end-position) t)
        0)))

(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-offset 'template-args-cont
                          '(c++-template-args-cont c-lineup-template-args +))))

;; disable emacs quit confimation prompt
(setq confirm-kill-emacs nil)

(when (eq system-type 'windows-nt)
  (setenv "PATH" (concat "C:\\ProgramData\\chocolatey\\bin" (getenv "PATH"))))

(add-hook 'c-mode-common-hook
          (lambda ()
            (semantic-mode 1)
            (global-semantic-stickyfunc-mode)) )

(map!
 :desc "scroll right"                          "C-M-y"   #'evil-scroll-column-right
 :desc "scroll left"                           "C-M-g"   #'evil-scroll-column-left
 )
