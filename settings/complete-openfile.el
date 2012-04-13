; Save history mode
(setq savehist-additional-variables         ;; also save...
      '(search-ring regexp-search-ring)     ;; ... my search entries
      savehist-file "~/.emacs.d/savehist")  ;; keep my home clean
(savehist-mode t)                           ;; do customization before activate


;Recent Files Mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)



;IDO completion
(setq ido-save-directory-list-file "~/ido.history")
(ido-mode t)
(ido-everywhere t)
(setq ido-max-work-file-list 40)
(setq ido-enable-flex-matching t)
(add-hook 'ido-define-mode-map-hook 'ido-my-keys)
(defun ido-my-keys ()
  (define-key ido-mode-map "\t" 'ido-complete)
  ;tab is better for completion lists
  ;(define-key ido-mode-map (kbd "tab")
  ; 'ido-complete)
  (define-key ido-mode-map "\C-t" 'ido-toggle-regexp) ; same as in isearch
  (define-key ido-mode-map "\C-d" 'ido-enter-dired)) ; cool
