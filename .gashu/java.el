;;===================================================================
;;
;; Java
;;
;;===================================================================
(add-hook 'java-mode (lambda () (lsp-bridge-mode)))

;; (use-package meghanada
;;   :hook (java-mode . meghanada-mode)
;;   :config
;;   (flycheck-mode +1)
;;   (cond
;;    ((eq system-type 'windows-nt)
;;     (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
;;     (setq meghanada-maven-path "mvn.cmd"))
;;    (t
;;     (setq meghanada-java-path "java")
;;     (setq meghanada-maven-path "mvn"))))

;; eclipse-java-style is the same as the "java" style (copied from
;; cc-styles.el) with the addition of (arglist-cont-nonempty . ++) to
;; c-offsets-alist to make it more like default Eclipse formatting -- function
;; arguments starting on a new line are indented by 8 characters
;; (++ = 2 x normal offset) rather than lined up with the arguments on the
;; previous line
;; (defconst eclipse-java-style
;;   '((c-basic-offset . 4)
;;     (c-comment-only-line-offset . (0 . 0))
;;     ;; the following preserves Javadoc starter lines
;;     (c-offsets-alist . ((inline-open . 0)
;;                         (topmost-intro-cont    . +)
;;                         (statement-block-intro . +)
;;                         (knr-argdecl-intro     . 5)
;;                         (substatement-open     . +)
;;                         (substatement-label    . +)
;;                         (label                 . +)
;;                         (statement-case-open   . +)
;;                         (statement-cont        . +)
;;                         (arglist-intro  . c-lineup-arglist-intro-after-paren)
;;                         (arglist-close  . c-lineup-arglist)
;;                         (access-label   . 0)
;;                         (inher-cont     . c-lineup-java-inher)
;;                         (func-decl-cont . c-lineup-java-throws)
;;                         (arglist-cont-nonempty . ++)
;;                         )))
;;   "Eclipse Java Programming Style")
;; (c-add-style "ECLIPSE" eclipse-java-style)
;; (customize-set-variable 'c-default-style (quote ((java-mode . "eclipse") (awk-mode . "awk") (other . "gnu"))))

;; optionally
;===================================================================

