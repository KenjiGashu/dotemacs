;; ==================================================================
;;
;; scala config
;;
;; ==================================================================

;; Enable scala-mode and sbt-mode

;; (use-package scala-mode
;;   :mode "\\.s\\(cala\\|bt\\)$")

;; (use-package sbt-mode
;;   :commands sbt-start sbt-command
;;   :after (scala-mode)
;;   :config
;;   ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
;;   ;; allows using SPACE when in the minibuffer
;;   (substitute-key-definition
;;    'minibuffer-complete-word
;;    'self-insert-command
;;    minibuffer-local-completion-map))

;; Enable nice rendering of diagnostics like compile errors.

;; ;;ensime for scala
;; (use-package ensime :demand t)

;; ==================================================================

