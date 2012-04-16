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
(setq TeX-PDF-mode t)
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
                             (setq-default show-trailing-whitespace t)


                            (add-to-list 'TeX-command-list '("XeLaTeX_SyncteX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run XeLaTeX"))
                            (add-to-list 'TeX-command-list '("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") )
                            (add-to-list 'TeX-command-list '("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX"))
                            ;("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command") ("Jump to PDF" "%V" TeX-run-discard-or-function nil t :help "Run Viewer"))))
                             (setq TeX-command-default "XeLaTeX_SyncteX")

                             (setq TeX-view-program-list '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %q")))
                             (setq TeX-view-program-selection '((output-pdf "Skim")))

                             (ispell-change-dictionary "deutsch")
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


;(custom-set-variables
; '(TeX-modes (quote (tex-mode plain-tex-mode texinfo-mode latex-mode doctex-mode)))
;)
