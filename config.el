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


(use-package! sly-asdf
  :after sly
  :init
  (add-to-list 'sly-contribs 'sly-asdf 'append)

  :config
  (map!
   (:localleader
    :map lisp-mode-map
    (:prefix ("c" . "compile")
     :desc "Load System" "s" #'sly-asdf-load-system
     :desc "Open System" "o" #'sly-asdf-open-system))))

(use-package! ag)

(use-package! sly-asdf
  :after sly
  :init
  (add-to-list 'sly-contribs 'sly-asdf 'append)

  :config
  (map!
   (:localleader
    :map lisp-mode-map
    (:prefix ("c" . "compile")
     :desc "Load System" "s" #'sly-asdf-load-system
     :desc "Open System" "o" #'sly-asdf-open-system))))

;; centaur tabs
(map! (:when (featurep! :editor snippets)
       :i  [C-tab] nil
       :nv [C-tab] nil))
(map! :nv [C-tab]           #'centaur-tabs-forward-tab
      :nv [C-S-tab]         #'centaur-tabs-backward-tab
      :nv [C-S-iso-lefttab] #'centaur-tabs-backward-tab)
