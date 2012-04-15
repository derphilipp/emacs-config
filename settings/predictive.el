;(el-get-init 'predictive)
;
(require 'predictive)

(add-to-list 'load-path "~/.emacs.d/el-get/predictive")
;;(add-to-list 'load-path "~/.emacs.d/el-get/predictive/latex/")
;;(add-to-list 'load-path "~/.emacs.d/el-get/predictive/texinfo/")
;;(add-to-list 'load-path "~/.emacs.d/el-get/predictive/html/")
(add-to-list 'load-path "~/.emacs.d/dict/")
;(add-to-list 'load-path "~/elisp/predictive")
(autoload 'predictive-mode "predictive" "predictive" t)
(set-default 'predictive-auto-add-to-dict t)
(setq predictive-main-dict 'rpg-dictionary
      predictive-auto-learn t
      predictive-add-to-dict-ask nil
      predictive-use-auto-learn-cache nil
      predictive-which-dict t)

;(predictive-mode t)
