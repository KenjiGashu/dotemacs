;; ===================================================
;;
;; flutter config
;;
;; =================================================
;; Assuming usage with dart-mode
;; (use-package dart-mode
;;   :mode "\\.dart\\'"
;;   :ensure t)
;; (use-package lsp-dart
;;   :ensure t
;;   :init
;;   (setq lsp-dart-flutter-sdk-dir (concat (replace-regexp-in-string "\\\\" "/" (getenv "FLUTTER_HOME")) "/bin/"))
;;   (setq lsp-dart-sdk-dir (concat (replace-regexp-in-string "\\\\" "/" (getenv "FLUTTER_HOME")) "/bin/"))
;;   ;; :config
;;   ;; (or
;;   ;;  lsp-dart-server-command
;;   ;;  `(,(expand-file-name (f-join lsp-dart-sdk-dir "bin/dart"))
;;   ;;    ,(expand-file-name (f-join lsp-dart-sdk-dir "bin/snapshots/analysis_server.dart.snapshot"))
;;   ;;    "--lsp"))
;;   )

;; (use-package flutter
;;   :after dart-mode
;;   :bind (:map dart-mode-map
;;               ("C-M-x" . #'flutter-run-or-hot-reload)))


;; Optional Flutter packages
;; (use-package hover
;;   :after flutter
;;   :ensure t) 
;; run app from desktop without emulator


