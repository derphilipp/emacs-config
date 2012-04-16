(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(normal-erase-is-backspace-mode 1)



;(global-set-key [(alt x)] 'cua-cut-region)
;(global-set-key [(alt c)] 'cua-copy)
;(global-set-key [(alt v)] 'cua-paste)
;(global-set-key [(alt a)] 'mark-whole-buffer)
;(global-set-key [(alt s)] 'save-buffer)
;(global-set-key [(alt S)] 'write-file)
;(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)
; CUA Mode
;(require 'cua-base)
;    (cua-mode t)
;    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;    (transient-mark-mode 1) ;; No region when it is not highlighted
;    (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour



(global-set-key "\C-z" 'kill-this-buffer)
