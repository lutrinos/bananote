#import "@preview/pergamon:0.7.1": *
//#import "@preview/bananote:0.1.2": *
#import "lib.typ": *

#show: note.with(
  title: [My Research Note],
  authors: (
    ([Alexander Koller], [Saarland University]),
  ),
  highlight-by: "Koller",
  version: [1],
  equation-numbering: "(1)"
)

#abstract(title: "Abstract / Résumé")[
  #lorem(50)
]

#outline(depth: 1);
#pagebreak()

= Introduction

#lorem(50)

== Subsection

#lorem(50)

Here is some math:

$
cal(L)(theta) = sum_(u in cal(U)) sum_(g=1)^K (
  P(g|D^((u)); theta_((i-1))) dot.c (
    log P(g|pi) + sum_(d in D_u) log P(b_d|s_d; rho^((g)))
  )
) 
$ <eq:5>

Here is some =highlighted text= !

#lorem(20)

Here's an example citation: #citet("ehop2025").

Here's a reference to another section: @sec:2.

Here's a reference to a formula @eq:5.

#box(title: "Newton's second law")[
  If a body of mass $m$ experiments an acceleration $bold(a)$ due to a net force $sum bold(F)$, this acceleration is related to the mass and force by the following equation:

    $ bold(a) = frac(sum bold(F), m) $
]

#table(
  columns: (1fr, 1fr, 1fr),
  [*Nom*], [*Langage*], [*Année*],
  [Typst], [Typst], [2019],
  [Rust], [Rust], [2010],
  [Python], [Python], [1991],
)

=== A subsubsection

#lorem(50)

==== A paragraph
#lorem(50)



= Another Section
<sec:2>

#lorem(50)

#lorem(50)

#lorem(50)

#lorem(50)


= Another Section

#lorem(50)

= Another Section

#lorem(50) #cite("knuth1990")

= Another Section

#lorem(50)

= Another Section

#lorem(50)

= Another Section

#lorem(50)

= Another Section

#lorem(50)


= Another Section

#lorem(50)


= Another Section

#lorem(50)



#add-bib-resource(read("bibliography.bib"))
#print-bananote-bibliography()