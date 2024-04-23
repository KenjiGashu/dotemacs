;;
;; auto update
;;
;; =================================================================
(use-package auto-package-update
  :custom
  (auto-package-update-interval 1)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))


