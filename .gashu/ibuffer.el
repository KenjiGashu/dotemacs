(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

(setq ibuffer-saved-filter-groups
 '(("MyList"
    ("Dired"   (mode          . dired-mode))    ; Filter by mode
    ("Org"     (filename      . "\.org$"))        ; By filename
		("C#"      (filename      . "\.cs$"))
		("ELisp"   (filename      . "\.el$")))))

;; Tell ibuffer to load the group automatically
(add-hook 'ibuffer-mode-hook
 (lambda ()
  (ibuffer-switch-to-saved-filter-groups "MyList")))

