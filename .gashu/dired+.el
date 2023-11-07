;; ================= download custom el files from emacs wiki =================

(let ((custom-el-dir "~/.emacs.d/custom/other-el/")
      (emacswiki-base "https://www.emacswiki.org/emacs/download/")
      (custom-el-files '("dired+.el" "frame-fns.el" "frame-cmds.el" "zoom-frm.el")))
  (require 'url)
  (add-to-list 'load-path custom-el-dir)
  (make-directory custom-el-dir t)
  (mapcar (lambda (arg)
            (let ((local-file (concat custom-el-dir arg)))
              (unless (file-exists-p local-file)
                (url-copy-file (concat emacswiki-base arg) local-file t))))
          custom-el-files)
  (byte-recompile-directory custom-el-dir 0)
  (require 'dired+)
  )

