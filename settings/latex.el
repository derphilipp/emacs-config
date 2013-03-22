;(setq TeX-engine 'XeLaTex)
;(setq TeX-PDF-mode t)
;
;(eval-after-load "tex"
;  '(add-to-list 'TeX-command-list
;            '("XeLaTeX" "xelatex -interaction=nonstopmode %s"
;          TeX-run-command t t :help "Run xelatex") t))
;jj
;
;
(require 'tex-site)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;(require 'predictive)
;(setq TeX-PDF-mode t)
(setq-default TeX-master nil)
(setq-default ispell-program-name "hunspell")
;(setq-default TeX-master "master")
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

(setq TeX-source-correlate-method 'synctex)

(setq reftex-plug-into-AUCTeX t)

(defun skim-make-url () (concat
                          (TeX-current-line)
                          " "
                          (expand-file-name (funcall file (TeX-output-extension) t)
                                            (file-name-directory (TeX-master-file)))
                          " "
                          (buffer-file-name)))


(add-hook 'LaTeX-mode-hook (lambda()
                             (add-to-list 'TeX-expand-list '("%q" skim-make-url))

                             (add-to-list 'TeX-output-view-style '("^pdf$" "." "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b"))




                             ;(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-background nil t)) 
                             (add-to-list 'TeX-command-list '("rubber" "rubber -qd %t" TeX-run-background nil t)) 

                             ;(setq TeX-command-default "rubber")
                             (setq TeX-save-query nil)
                             (setq TeX-show-compilation nil)

                            (setq reftex-toc-split-windows-horizontally t) ; horizontally split toc window
                            (setq reftex-toc-split-windows-fraction 0.3)   ; fraction of width of frame used

                             (setq-default show-trailing-whitespace t)


                             (add-to-list 'TeX-command-list '("XeLaTeX_SyncteX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run XeLaTeX"))

                             ; '(TeX-modes (quote (tex-mode plain-tex-mode texinfo-mode latex-mode doctex-mode)))
                             '(TeX-modes (quote (tex-mode plain-tex-mode texinfo-mode latex-mode doctex-mode)))

                             (add-to-list 'TeX-command-list '("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") )
                             (add-to-list 'TeX-command-list '("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX"))
                             ;("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command") ("Jump to PDF" "%V" TeX-run-discard-or-function nil t :help "Run Viewer"))))
                             (setq TeX-command-default "XeLaTeX_SyncteX")

                             (setq TeX-view-program-list '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %q")))
                             (setq TeX-view-program-selection '((output-pdf "Skim")))

                             (ispell-change-dictionary "american")
                             (setq TeX-open-quote "„")
                             (setq TeX-close-quote "“")

                             ; Flymake stuff
                             ;
                             ;
                             ;(defun flymake-get-tex-args (file-name)
                             ;      (list "chktex" (list "-q" "-v0" file-name)))

                             (defun flymake-get-tex-args (file-name)
                               (list "/opt/local/bin/chktex" (list "-g0" "-r" "-l" (expand-file-name "~/.chktexrc") "-I" "-q" "-v0" file-name)))
                             (push
                               '("^\\(\.+\.tex\\):\\([0-9]+\\):\\([0-9]+\\):\\(.+\\)"
                                 1 2 3 4) flymake-err-line-patterns)






                             ))  

(flymake-mode 1)
; ___-


(require 'tex-buf)


(defun demolish-tex-help ()
  (interactive)
  (if (get-buffer "*TeX Help*") ;; Tests if the buffer exists
    (progn ;; Do the following commands in sequence
      (if (get-buffer-window (get-buffer "*TeX Help*")) ;; Tests if the window exists
        (delete-window (get-buffer-window (get-buffer "*TeX Help*")))
        ) ;; That should close the window
      (kill-buffer "*TeX Help*") ;; This should kill the buffer
      )
    )
  )

(defun demolish-tex-help ()
  (interactive)
  (if (get-buffer "*TeX Help*") ;; Tests if the buffer exists
    (progn ;; Do the following commands in sequence
      (if (get-buffer-window (get-buffer "*TeX Help*")) ;; Tests if the window exists
        (delete-window (get-buffer-window (get-buffer "*TeX Help*")))
        ) ;; That should close the window
      (kill-buffer "*TeX Help*") ;; This should kill the buffer
      )
    )
  )
(defun run-latexmk ()
  (interactive)
  (
   let ((TeX-save-query nil)
        (TeX-process-asynchronous nil)
        (master-file (TeX-master-file)))
    (TeX-save-document "")
    (TeX-run-TeX "latexmk" (TeX-command-expand "latexmk -xelatex '%t' 2>/dev/null|grep -v 'MacPorts 2011_5'" 'TeX-master-file) master-file)
    (if (plist-get TeX-error-report-switches (intern master-file))
      (TeX-next-error t)
      (progn (demolish-tex-help) (minibuffer-message "latexmk done"))
      )
    )
  )

;    (if (plist-get TeX-error-report-switches (intern master-file))
;        (TeX-next-error t)
;      (minibuffer-message "latexmk done"))))
;

(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "C-0") #'run-latexmk)))

;(defun reftex-format-cref (label def-fmt)
;    (format "\\cref{%s}" label))
;(setq reftex-format-ref-function 'reftex-format-cref)
;
;

(custom-set-variables
      '(ispell-dictionary "american")
      '(ispell-program-name "/opt/local/bin/aspell"))

(set-default 'ispell-local-dictionary "en_US.multi")
(setq ispell-dictionary "english")




(setq ispell-program-name "/opt/local/bin/aspell")
(setq ispell-list-command "list")
(setq ispell-extra-args '("--dont-tex-check-comments"))

;(setq-default ispell-program-name "/opt/local/bin/hunspell")
;(setq ispell-dictionary "american"
;        ispell-extra-args '() ;; TeX mode "-t"
;          ispell-silently-savep t
;            )
;

;(setq-default ispell-program-name "/opt/local/bin/aspell")
;;(setq-default aspell-program-name "/opt/local/bin/aspell")
(setq sentence-end "[.?!][]\"’)}]*\\($\\| \\| \\)[ ;;]*") ;; Da ist ein "Newline in der Zeile!"
(setq sentence-end-double-space nil)


;(auto


(put 'LaTeX-mode 'flyspell-mode-predicate 'auctex-mode-flyspell-verify)
(defun auctex-mode-flyspell-verify ()
  "Function used for `flyspell-generic-check-word-predicate' in auctex mode."
  (save-excursion
    (forward-word -2)
    (not (looking-at "bibliographystyle{"))))

(add-hook 'LaTeX-mode-hook
  (lambda () (setq flyspell-generic-check-word-predicate    
    'auctex-mode-flyspell-verify))) 
