(setq TeX-engine 'XeLaTex)
(setq TeX-PDF-mode t)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
            '("XeLaTeX" "xelatex -interaction=nonstopmode %s"
          TeX-run-command t t :help "Run xelatex") t))
