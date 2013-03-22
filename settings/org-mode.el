(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-toggle-pretty-entities)
;"(add-hook 'org-mode-hook 'org-ident-mode)
(setq org-startup-indented 1)
(setq org-hide-leading-stars 1)

(add-hook 'org-mode-hook 
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
            ;; table
            (local-set-key "\M-\C-w" 'org-table-copy-region)
            (local-set-key "\M-\C-y" 'org-table-paste-rectangle)
            (local-set-key "\M-\C-l" 'org-table-sort-lines)
            ;; display images
            (local-set-key "\M-I" 'org-toggle-inline-images)
            ;;(local-set-key "\M-I" 'org-toggle-iimage-in-org)
            ;; fix tab
            (local-set-key "\C-y" 'yank)
            ;; yasnippet (allow yasnippet to do its thing in org files)
            ;;(org-set-local 'yas/trigger-key [tab])
            ;;(define-key yas/keymap [tab] 'yas/next-field-group)
))
