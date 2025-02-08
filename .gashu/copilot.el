(defun copilot-complete ()
  (interactive)
  (let* ((spot (point))
         (inhibit-quit t)
         (curfile (buffer-file-name))
         (cash (concat curfile ".cache"))
         (hist (concat curfile ".prompt"))
         (lang (file-name-extension curfile))

         ;; extract current line, to left of caret
         ;; and the previous line, to give the llm
         (code (save-excursion
                 (dotimes (i 2)
                   (when (> (line-number-at-pos) 1)
                     (previous-line)))
                 (beginning-of-line)
                 (buffer-substring-no-properties (point) spot)))

         ;; create new prompt for this interaction
         (system "\
You are an Emacs code generator. \
Writing comments is forbidden. \
Writing test code is forbidden. \
Writing English explanations is forbidden. ")
         (prompt (format
                  "[INST]%sGenerate %s code to complete:[/INST]\n```%s\n%s"
                  (if (file-exists-p cash) "" system) lang lang code)))

    ;; iterate text deleted within editor then purge it from prompt
    (when kill-ring
      (save-current-buffer
        (find-file hist)
        (dotimes (i 10)
          (let ((substring (current-kill i t)))
            (when (and substring (string-match-p "\n.*\n" substring))
              (goto-char (point-min))
              (while (search-forward substring nil t)
                (delete-region (- (point) (length substring)) (point))))))
        (save-buffer 0)
        (kill-buffer (current-buffer))))

    ;; append prompt for current interaction to the big old prompt
    (write-region prompt nil hist 'append 'silent)

    ;; run llamafile streaming stdout into buffer catching ctrl-g
    (with-local-quit
      (call-process "/home/kenjigashu/Downloads/phi-2.Q5_K_M.llamafile"
                    nil (list (current-buffer) nil) t
                    "--prompt-cache" cash
                    "--prompt-cache-all"
                    "--silent-prompt"
                    "--temp" "0"
                    "-c" "1024"
                    "-ngl" "35"
                    "-r" "```"
                    "-r" "\n}"
                    "-f" hist))

    ;; get rid of most markdown syntax
    (let ((end (point)))
      (save-excursion
        (goto-char spot)
        (while (search-forward "\\_" end t)
          (backward-char)
          (delete-backward-char 1 nil)
          (setq end (- end 1)))
        (goto-char spot)
        (while (search-forward "```" end t)
          (delete-backward-char 3 nil)
          (setq end (- end 3))))

      ;; append generated code to prompt
      (write-region spot end hist 'append 'silent))))
