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

(use-package! org)

;;=============== bookmark+ ================================
(use-package! bookmark+
  :config
  (setq bookmark-version-control t
        delete-old-versions t
        bookmark-save-flag 1
		bmkp-count-multi-mods-as-one-flag t)
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


(use-package! moe-theme)
(use-package! inkpot-theme)
(use-package! dracula-theme)
(use-package! zeno-theme)
(use-package! exotica-theme)
(use-package! abyss-theme)
(use-package! afternoon-theme)
(use-package! vs-dark-theme)
(use-package! tron-legacy-theme)
(use-package! tomorrow-night-paradise-theme)
(use-package! darcula-theme)
(use-package! melancholy-theme)

;;
;;
;; centaur tabs
(map! (:when (modulep! :editor snippets)
       :i  [C-tab] nil
       :nv [C-tab] nil))
(map! (:when (modulep! :ui tabs)
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

;; (use-package! flutter
;;   :custom
;;   (setq flutter-sdk-path "~/Downloads/dev/flutter/"))

;; (after! eglot
;;   (setq eglot-server-programs
;;       `((dart-mode . ("dart"
;;                       ,(expand-file-name "snapshots/analysis_server.dart.snapshot"
;;                                          (file-name-directory
;;                                           (file-truename
;;                                            (executable-find "dart"))))
;;                       "--lsp")))))


;; (use-package! dart-server
;;   :init (setq dart-server-sdk-path "/home/kenjigashu/Downloads/dev/flutter/bin/cache/dart-sdk/"))


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


;; (add-load-path! "lisp")
;; (add-load-path! "lisp/lsp-bridge")
;; (add-load-path! "lisp/lsp-bridge/acm")
(add-to-list 'load-path "~/.doom.d/lisp/lsp-bridge")


(require 'lsp-bridge)
;;(global-lsp-bridge-mode)

;; add hooks to use lsp bridge instead of company
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (company-mode 0)
            (lsp-bridge-mode 1)))
;;javascript mode hook
(add-hook 'rjsx-mode-hook
          (lambda ()
            (company-mode 0)
            (lsp-bridge-mode 1)))

;;c
(add-hook 'c-mode-common-hook
          (lambda ()
            (company-mode 0)
            (lsp-bridge-mode 1)))

(add-hook 'java-mode-hook
          (lambda ()
            (company-mode 0)
            (lsp-bridge-mode 1)))

(add-hook 'sh-mode-hook
          (lambda ()
            (company-mode 0)
            (lsp-bridge-mode 1)))

(use-package! auto-yasnippet
  :init (setq aya-persist-snippets-dir "~/.doom.d/snippets/"))

;; (use-package! lsp-bridge
;;   :config
;;   (global-lsp-bridge-mode))

;; (use-package! eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
;;   :init
;;   :custom
;;   (eaf-browser-continue-where-left-off t)
;;   (eaf-browser-enable-adblocker t)
;;   (browse-url-browser-function 'eaf-open-browser) ;; Make EAF Browser my default browser
;;   :config
;;   (defalias 'browse-web #'eaf-open-browser)

;;   (require 'eaf-file-manager)
;;   (require 'eaf-music-player)
;;   (require 'eaf-image-viewer)
;;   (require 'eaf-camera)
;;   (require 'eaf-demo)
;;   (require 'eaf-airshare)
;;   (require 'eaf-terminal)
;;   (require 'eaf-markdown-previewer)
;;   (require 'eaf-video-player)
;;   (require 'eaf-vue-demo)
;;   (require 'eaf-file-sender)
;;   (require 'eaf-pdf-viewer)
;;   (require 'eaf-mindmap)
;;   (require 'eaf-netease-cloud-music)
;;   (require 'eaf-jupyter)
;;   (require 'eaf-org-previewer)
;;   (require 'eaf-system-monitor)
;;   (require 'eaf-rss-reader)
;;   (require 'eaf-file-browser)
;;   (require 'eaf-browser)
;;   (require 'eaf-org)
;;   (require 'eaf-mail)
;;   (require 'eaf-git)
;;   (when (display-graphic-p)
;;     (require 'eaf-all-the-icons))

;;   (require 'eaf-evil)
;;   (define-key key-translation-map (kbd "SPC")
;;     (lambda (prompt)
;;       (if (derived-mode-p 'eaf-mode)
;;           (pcase eaf--buffer-app-name
;;             ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
;;                            (kbd "SPC")
;;                          (kbd eaf-evil-leader-key)))
;;             ("pdf-viewer" (kbd eaf-evil-leader-key))
;;             ("image-viewer" (kbd eaf-evil-leader-key))
;;             (_  (kbd "SPC")))
;;         (kbd "SPC")))))

;; (use-package! eaf-browser
;;   :after eaf)
;; (use-package! eaf-pdf-viewer
;;   :after eaf)

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
