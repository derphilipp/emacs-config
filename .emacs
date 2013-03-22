(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/") 

;;(unless (require 'el-get nil t) (with-current-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el") (end-of-buffer) (eval-print-last-sexp))) (el-get 'sync)
;;(add-to-list 'load-path "~/.emacs.d/packages/predictive/") 

;;(unless (require 'el-get nil t) (with-current-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el") (end-of-buffer) (eval-print-last-sexp))) (el-get 'sync)

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "init.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/mn/Arbeitsaufteilung.org")))
 '(safe-local-variable-values (quote ((TeX-engine . xelatex)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
