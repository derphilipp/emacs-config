;;; Set cmd-H to hide Emacs and cmd-shift-h to hide others, as usual in Mac OS
;;; ;;; X. Usually bound to mark-paragraph
(global-set-key "\M-h" 'ns-do-hide-emacs)
(global-set-key "\M-H" 'ns-do-hide-others)
(global-set-key "\C-z" 'kill-this-buffer)
