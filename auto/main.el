(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-run-style-hooks
    "sections/titlepage"
    "sections/abstract"
    "sections/sec1-0"
    "sections/sec1-1"
    "sections/sec1-2"
    "sections/sec1-3"
    "sections/sec1-4"
    "sections/app1-0"
    "sections/app1-1"
    "sections/app1-2"
    "sections/app1-3"
    "sections/app1-4"
    "sections/app1-5"
    "sections/app1-6"
    "sections/app1-7"
    "sections/app1-8"
    "sections/app2-0"
    "sections/app2-1"
    "sections/app2-2")
   (LaTeX-add-labels
    "cha:first"))
 :latex)

