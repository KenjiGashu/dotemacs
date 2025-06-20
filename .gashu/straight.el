(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

(async-bytecomp-package-mode 1)

(defun my-straight-pull-async ()
	(async-start
	 (lambda ()
		 (message "Starting straight pull! GASHU")
		 (straight-pull-all)
		 (message "Finished straight pull! GASHU"))))

(add-hook 'emacs-startup-hook 'my-straight-pull-async)
