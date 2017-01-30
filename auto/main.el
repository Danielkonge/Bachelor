(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-run-style-hooks
    "sections/titlepage"
    "sections/abstract"
    "sections/sec1-0"
    "kantlipsum")
   (LaTeX-add-labels
    "cha:first"
    "cha:second"))
 :latex)

