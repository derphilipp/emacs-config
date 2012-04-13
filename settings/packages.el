(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(add-to-list 'package-archives
     '("melpa" . "http://melpa.milkbox.net/packages/") t)


