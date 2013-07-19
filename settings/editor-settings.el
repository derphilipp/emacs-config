;#(setq visible-bell t)

  ;(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "/Volumes/Data/Users/phw/.emacs.d//elpa/evil-20130325.833")
     (require 'evil)
     (evil-mode 1)



(require 'key-chord)
(setq key-chord-two-keys-delay 1.4)
(add-to-list 'load-path "/Volumes/Data/Users/phw/.emacs.d//elpa/key-chord-20080915.2156/")
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)


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
