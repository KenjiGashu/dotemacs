
(elpaca
		(general :wait :t)
	(general-create-definer my-leader-def
    ;; :prefix my-leader
    :prefix "SPC")

  (general-create-definer my-local-leader-def
    ;; :prefix my-local-leader
    :prefix "SPC m")

  ;; (general-override-mode)
  ;; (my-leader-def
  ;;  :keymaps 'normal
  ;;  :keymaps 'override
  ;;  ;; bind "SPC a"
  ;;  "a" 'org-agenda
  ;;  "b" 'counsel-bookmark
  ;;  "c" 'org-capture)
  (general-define-key
   :states '(normal  visual insert emacs)
   :prefix "SPC"
   :keymaps '(override pdf-view-mode)
   :non-normal-prefix "C-SPC"

    ;; simple command
    "'"   '(iterm-focus :which-key "iterm")
    "?"   '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
    "/"   'counsel-ag
    "TAB" '(switch-to-other-buffer :which-key "prev buffer")
    "gc"  '(avy-goto-char-2  :which-key "go to char 2")

    "f" '(:ignore t :which-key "Files")
    "ff" 'find-file

    "s" '(:ignore t :which-key "Search")
    "ss" 'consult-line

    "b" '(:ignore t :which-key "Buffer")
    "bb" 'switch-to-buffer
    "bd" 'kill-buffer
    "bi" 'ibuffer

    "w" '(:ignore t :which-key "Window")
    "wmm" 'delete-other-windows
    "wv"  'split-window-horizontally
    "w-"  'split-window-vertically
    "wh"  'windmove-left
    "wl"  'windmove-right
    "wj"  'windmove-down
    "wk"  'windmove-up


    "o" '(:ignore t :which-key "toggle")

    ;; Applications
    "a" '(:ignore t :which-key "Applications")
    "ar" 'ranger
    "ad" 'dired)
  )

