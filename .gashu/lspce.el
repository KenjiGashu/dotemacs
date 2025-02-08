(straight-use-package
 `(lspce :type git :host github :repo "zbelial/lspce"
         :files (:defaults ,(pcase system-type
                              ('gnu/linux "lspce-module.so")
                              ('darwin "lspce-module.dylib")))
         :pre-build ,(pcase system-type
                       ('gnu/linux '(("cargo" "build" "--release") ("cp" "./target/release/liblspce_module.so" "./lspce-module.so")))
                       ('darwin '(("cargo" "build" "--release") ("cp" "./target/release/liblspce_module.dylib" "./lspce-module.dylib"))))))

(use-package lspce
  :load-path "~/.emacs.d/straight/build/lspce/"
  :config (progn
            (setq lspce-send-changes-idle-time 0.1)
            (setq lspce-show-log-level-in-modeline t) ;; show log level in mode line

            ;; You should call this first if you want lspce to write logs
            (lspce-set-log-file "/tmp/lspce.log")

            ;; By default, lspce will not write log out to anywhere. 
            ;; To enable logging, you can add the following line
            (lspce-enable-logging)
            ;; You can enable/disable logging on the fly by calling `lspce-enable-logging' or `lspce-disable-logging'.

						(setq lspce-connect-server-timeout 240)
						(setq lspce-jdtls-install-dir "~/.emacs.d/.cache/jdtls/")

            ;; enable lspce in particular buffers
            ;; (add-hook 'rust-mode-hook 'lspce-mode)

            ;; modify `lspce-server-programs' to add or change a lsp server, see document
            ;; of `lspce-lsp-type-function' to understand how to get buffer's lsp type.
            ;; Bellow is what I use
            (setq lspce-server-programs `(("rust"  "rust-analyzer" "" lspce-ra-initializationOptions)
                                          ("python" "pylsp" "" )
                                          ("C" "clangd" "--all-scopes-completion --clang-tidy --enable-config --header-insertion-decorators=0")
                                          ("java" "java" lspce-jdtls-cmd-args lspce-jdtls-initializationOptions)
																					;; ("csharp" "mono" " /home/kenjigashu/bin/omnisharp/OmniSharp.exe -lsp -stdio -s /mnt/c/git/smartupdate_Bin/")
																					("csharp" "csharp-ls" "-lsp -s //mnt/c/git/smartupdate_Bin/SmartUpdate.sln")
																					("zig" "zls")
																					("javascript" "typescript-language-server" "--stdio")
																					("js" "typescript-language-server" "--stdio")

                                          ))
            )
  )

(general-define-key
   :states '(normal visual insert emacs)
	 :prefix "SPC"
   :keymaps '(lspce-mode-map)
	 :non-normal-prefix "C-SPC"
   "ld" 'xref-find-definitions
	 "lr" 'xref-find-references
	 "la" 'lspce-code-actions)

