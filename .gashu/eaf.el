(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
) ;; unbind, see more in the Wiki

(elpaca eaf
	:host github :repo "thongpv87/rose-pine-emacs"
	:files (:defaults "*")
	;;:main "rose-pine-color-theme.el"
	)

(require 'eaf-browser)
(require 'eaf-pdf-viewer)
