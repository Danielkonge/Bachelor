(TeX-add-style-hook
 "Bachelor"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("csquotes" "autostyle" "german=guillemets" "english=british") ("babel" "danish" "english") ("enumitem" "shortlabels") ("biblatex" "citestyle=alphabetic" "bibstyle=alphabetic" "uniquename=init" "autolang=hyphen" "backend=biber" "sortcites" "sorting=ynt") ("ntheorem" "thmmarks" "amsmath") ("hyperref" "hidelinks" "pdfpagelabels") ("cleveref" "nameinlink") ("mathalfa" "scr=boondoxo")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "inputenc"
    "fontenc"
    "csquotes"
    "babel"
    ""
    "amsmath"
    "amssymb"
    "graphicx"
    "mathtools"
    "etoolbox"
    "microtype"
    "bm"
    "todonotes"
    "enumitem"
    "biblatex"
    "ntheorem"
    "varioref"
    "hyperref"
    "cleveref"
    "tikz"
    "mathalfa")
   (TeX-add-symbols
    '("SetSymbol" ["argument"] 0)
    '("Lie" 1)
    '("dd" 2)
    "N"
    "Z"
    "Q"
    "R"
    "C"
    "F"
    "given"
    "Mat"
    "M"
    "slpr"
    "slc")
   (LaTeX-add-bibliographies
    "ref")
   (LaTeX-add-mathtools-DeclarePairedDelimiters
    '("abs" "1")
    '("norm" "1")
    '("inner" "2")
    '("Set" "1")
    '("open" "2")
    '("lopen" "2")
    '("ropen" "2")
    '("closed" "2")
    '("lrangle" "1"))
   (LaTeX-add-ntheorem-newtheorems
    "theorem"
    "definition"
    "corollary"
    "proposition"
    "lemma"
    "remark"
    "example"
    "proof"
    "proofof"
    "theorembreak"
    "definitionbreak"
    "corollarybreak"
    "propositionbreak"
    "lemmabreak"
    "remarkbreak"
    "examplebreak"
    "proofbreak"
    "proofofbreak"))
 :latex)

