 #import "template.typ":  *
#show: project.with()

#include "Sections/title.typ"
#pagebreak()
#include "Sections/intro.typ"
#pagebreak()
#include "Sections/part1.typ"
#bibliography("Resources/Math IA.bib", style: "ieee", full: true)
