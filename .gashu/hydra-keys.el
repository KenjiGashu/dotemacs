;;================================================================
;;
;; hydra keymap
;;
;;================================================================
;; (defhydra hydra-evil-normal (:color red
;; 			     :hint nil)
;;    "

;;    ^Avy^                     ^Misc^                   ^Window
;;     ^^^^^^------------------------------------------------------
;;   [_ac_] avy goto char  [_bk_] kill buffer        [_w TAB_] other window
;;   [_al_] avy goto line  [_gs_] git status toggle  [_w2_] split window below
;;   [_aw_] avy goto word0 [_ff_] helm-find-file  [_w1_]   delete other window
;;   [_an_] avy goto word1 [_bb_] helm-buffer        [_w0_]   delete window
;;                         [_fs_] save buffer        [_w3_] split right
;;   [_ss_] consult line   [_sm_] consult line multi

;;   [_m_] LSP             [_gg_] GGTAGS
;;   [_p_] Projectile
;; "  
;;   ;; Smart Parens:
;;   ;; [_C-M-f_] forward     [_C-M-b_] backward
;;   ;; [_C-d_] down        [_M-d_] back down
;;   ;; [_C-u_] up            [_M-u_] back up
;;   ;; [_C-M-n_] next        [_C-M-p_] previous
;;   ;; [_C-M-a_] beggining   [_C-M-e_] end
;;   ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
;;   ;; "
;;    ("ac" evil-avy-goto-char :exit t)
;;    ("al" evil-avy-goto-line :exit t)
;;    ("aw" evil-avy-goto-word-0 :exit t)
;;    ("an" evil-avy-goto-word-1 :exit t)
;;    ("gs" magit-status :exit t)
;;    ("ff" find-file :exit t)
;;    ("bb" switch-to-buffer :exit t)
;;    ("w TAB" other-window :exit t)
;;    ("bk" kill-buffer :exit t)
;;    ("w1" delete-other-windows :exit t)
;;    ("w0" delete-window :exit t)
;;    ("w2" split-window-below :exit t)
;;    ("w3" split-window-right :exit t)
;;    ("fs" save-buffer :exit t)
;;    ("m" hydra-lsp/body :exit t)
;;    ("p" hydra-projectile/body :exit t)
;;    ("gg" hydra-ggtags/body :exit t)
;;    ("ss" consult-line :exit t)
;;    ("sm" consult-line-multi :exit t)
;;    ;; ("C-M-f" sp-forward-sexp)
;;    ;; ("C-M-b" sp-backward-sexp)
;;    ;; ("C-d>" sp-down-sexp)
;;    ;; ("M-d>" sp-backward-down-sexp)
;;    ;; ("C-u>" sp-up-sexp)
;;    ;; ("M-u>" sp-backward-up-sexp)
;;    ;; ("C-M-n" sp-next-sexp)
;;    ;; ("C-M-p" sp-previous-sexp)
;;    ;; ("C-M-a" sp-beginning-of-sexp)
;;    ;; ("C-M-e" sp-end-of-sexp)
;;    ;; ("C-S-f" sp-forward-symbol)
;;    ;; ("C-S-b" sp-backward-symbol)
;;    )

;; ;;(evil-define-key 'normal 'global (kbd "SPC") 'hydra-evil-normal/body)
;; (evil-define-key nil evil-normal-state-map (kbd "SPC") 'hydra-evil-normal/body)
;; (evil-define-key 'normal dired-mode-map (kbd "SPC") 'hydra-evil-normal/body)

;; (defhydra hydra-lsp (:color blue
;; 			    :hint nil)
;; "

;;    ^find^                     ^UI^                   ^Window
;;     ^^^^^^------------------------------------------------------
;;   [_gd_] find definition     [_pd_] peek find definition    
;;   [_ga_] find declaration    [_pr_] peek find reference   
;;   [_gs_] find implementation [_sd_] show doc
;;                              [_si_] show imenu
;; "  
;;   ;; Smart Parens:
;;   ;; [_C-M-f_] forward     [_C-M-b_] backward
;;   ;; [_C-d_] down        [_M-d_] back down
;;   ;; [_C-u_] up            [_M-u_] back up
;;   ;; [_C-M-n_] next        [_C-M-p_] previous
;;   ;; [_C-M-a_] beggining   [_C-M-e_] end
;;   ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
;;   ;; "
;;    ("gd" lsp-find-definition)
;;    ("ga" lsp-find-declaration)
;;    ("gs" lsp-find-implementation)
;;    ("pd" lsp-ui-peek-find-definitions)
;;    ("sd" lsp-ui-doc-show)
;;    ("si" lsp-ui-imenu)
;;    ;;("pa" lsp-ui-peek-find-declarations)
;;    ;;("ps" lsp-ui-peek-find-implementations)
;;    ("pr" lsp-ui-peek-find-references)
;;    )

;; (defhydra hydra-projectile (:color blue
;; 				   :hint nil)
;;    "
;;    ^find^  
;;     ^^^^^^------------------------------------------------------
;;   [_f_] find file                             
;;   [_s_] switch project
;; "  
;;   ;; Smart Parens:
;;   ;; [_C-M-f_] forward     [_C-M-b_] backward
;;   ;; [_C-d_] down        [_M-d_] back down
;;   ;; [_C-u_] up            [_M-u_] back up
;;   ;; [_C-M-n_] next        [_C-M-p_] previous
;;   ;; [_C-M-a_] beggining   [_C-M-e_] end
;;   ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
;;   ;; "
;;    ("f" projectile-find-file)
;;    ("s" projectile-switch-project)
;;    )

;; (defhydra hydra-ggtags (:color blue
;; 				   :hint nil)
;;    "
;;    ^find^  
;;     ^^^^^^------------------------------------------------------
;;   [_n_] next     [_g_] grep  [_ff_] find [_fh_] find-here  [_d_] delete-tag  [_r_] f-regex [_fs_] find-symbol
;;   [_p_] previous [_v_] f-dwim  [_1_] f-reference [_s_] show-definition [_fr_] find-reference
;;   [_SPC_] register [_hh_] history [_o_] f-other [_m_] search-history [_b_] browse-hypertext 
;;   [_hn_] next-history [_hp_] prev-history [_ts_] show-stack
;; " 
;;   ;; Smart Parens:
;;   ;; [_C-M-f_] forward     [_C-M-b_] backward
;;   ;; [_C-d_] down        [_M-d_] back down
;;   ;; [_C-u_] up            [_M-u_] back up
;;   ;; [_C-M-n_] next        [_C-M-p_] previous
;;   ;; [_C-M-a_] beggining   [_C-M-e_] end
;;   ;; [_C-S-f_] forward symb[_C-S-b_] backward symbol
;;   ;; "
;;    ("n" ggtags-next-mark)
;;    ("p" ggtags-prev-mark)
;;    ("ff" helm-gtags-find-tag)
;;    ("fh" helm-gtags-find-tag-from-here)
;;    ("fr" helm-gtags-find-rtag)
;;    ("fs" helm-gtags-find-symbol)
;;    ("g" ggtags-grep)
;;    ("d" ggtags-delete-tags)
;;    ("r" ggtags-find-tag-regexp)
;;    ("v" helm-gtags-dwim)
;;    ("1" ggtags-find-reference)
;;    ("s" ggtags-show-definition)
;;    ("SPC" ggtags-save-to-register)
;;    ("hh" ggtags-view-tag-history)
;;    ("hn" helm-gtags-next-history)
;;    ("hp" helm-gtags-previous-history)
;;    ("o" ggtags-find-other-symbol)
;;    ("m" ggtags-view-search-history)
;;    ("b" ggtags-browse-file-as-hypertext)
;;    ("ts" helm-gtags-show-stack)
;;    )

