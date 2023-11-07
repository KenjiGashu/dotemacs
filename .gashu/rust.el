;; ===================================================
;;
;; rust config
;;
;; =================================================
;; (use-package rust-mode
;;   :mode "\\.rs")
;; (use-package cargo
;;   :after (rust-mode)
;;   :hook (rust-mode . cargo-minor-mode))
;; (use-package racer
;;   :after (rust-mode)
;;   :init
;;   (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
;;   (setq racer-rust-src-path "~/git/projetos/rust/src") ;; Rust source code PATH)
;;   :hook (rust-mode . racer-mode))
;; (use-package eldoc
;;   :after (rust-mode)
;;   :hook (racer-mode . eldoc-mode))
;; (use-package company-racer
;;   :after (rust-mode)
;;   :hook (racer-mode . company-mode))
;; (use-package flycheck-rust
;;   :after (rust-mode))
