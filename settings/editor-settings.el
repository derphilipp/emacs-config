;#(setq visible-bell t)


(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode 1)
(toggle-truncate-lines 0)


(setq speedbar-frame-parameters 
      '((minibuffer)
    (width . 15)
    (border-width . 0)
    (menu-bar-lines . 0)
    (too-bar-lines . 0)
    (unsplittable . nil)
    (left-fringe . 0)))
;; put speedbar in the right of main frame
(setq speedbar-default-position 'right)
;; show all files
(setq speedbar-show-unknown-files t)
;; turn on speed bar
;; (speedbar-frame-mode t)
