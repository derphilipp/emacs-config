(show-paren-mode 1)
(desktop-save-mode 1)

;(smex-initialize 1)
;smex

(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))


; Auto Complete
;
(require 'auto-complete-config)
(setq ac-modes '(c++-mode sql-mode LaTeX/MPS))
(global-auto-complete-mode t)
;(require 'auto-complete-mode)
